#!/bin/bash

# =============================================
# SCRIPT PARA DESCARGAR Y CONVERTIR PDS COMPLETO
# =============================================

# Habilitar modo debug (descomenta para debugging)
# set -x

# Configuración - EDITAR ESTOS VALORES
HOST="zos.kctr.marist.edu"
USER="KC03C7C"
PASS="fcl1109"
PDS_NAME="KC03C7C.CURSOS.CICS788"
LOCAL_DIR="./pds_descargado"
LRECL=80                  # Longitud de registro (ajustar si es necesario)
DEBUG_MODE=false          # Cambiar a true para más información

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mostrar mensajes
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verificar si lftp está instalado
check_dependencies() {
    if ! command -v lftp &> /dev/null; then
        log_error "lftp no está instalado. Instalar con:"
        log_error "sudo dnf install lftp"
        exit 1
    fi
    
    log_info "lftp está disponible: $(which lftp)"
}

# Probar conexión FTP
test_connection() {
    log_info "Probando conexión FTP..."
    
    local test_result=$(timeout 30 lftp -e "
    set net:timeout 15;
    set cmd:fail-exit true;
    set ftp:list-options -a;
    open $HOST;
    user $USER '$PASS';
    pwd;
    quit;
    " 2>&1)
    
    if echo "$test_result" | grep -q "Login failed\|Connection failed\|Name or service not known\|buffer overflow"; then
        log_error "Error de conexión FTP:"
        echo "$test_result"
        log_error "Verifica usuario, contraseña y conectividad"
        exit 1
    else
        log_info "✅ Conexión FTP exitosa"
    fi
}

# Crear directorio de destino
create_directory() {
    if [ ! -d "$LOCAL_DIR" ]; then
        mkdir -p "$LOCAL_DIR"
        log_info "Directorio creado: $LOCAL_DIR"
    else
        log_warn "El directorio $LOCAL_DIR ya existe"
    fi
}

# Descargar todos los miembros del PDS
download_pds() {
    log_info "Iniciando descarga del PDS: $PDS_NAME"
    log_info "Conectando a: $HOST"
    log_info "Usuario: $USER"
    
    # Verificar conectividad básica
    log_info "Verificando conectividad con el host..."
    if ! ping -c 3 "$HOST" &>/dev/null; then
        log_warn "No se puede hacer ping al host $HOST (esto puede ser normal en algunos servidores)"
    fi

    log_info "Iniciando descarga con lftp..."
    
    # Crear comando lftp con configuración más robusta
    local lftp_output
    lftp_output=$(lftp -e "
    set ftp:charset IBM-1047;
    set file:charset UTF-8;
    set net:timeout 30;
    set net:max-retries 2;
    set net:reconnect-interval-base 5;
    set ftp:auto-sync-mode off;
    set xfer:clobber on;
    set cmd:fail-exit true;
    set ftp:list-options -a;
    open $HOST;
    user $USER '$PASS';
    echo 'Conectado al servidor';
    pwd;
    echo 'Intentando acceder al PDS: $PDS_NAME';
    cd '$PDS_NAME';
    echo 'Acceso al PDS exitoso';
    local $LOCAL_DIR;
    echo 'Listando archivos del PDS...';
    ls;
    echo 'Iniciando descarga...';
    mget -O $LOCAL_DIR *;
    echo 'Descarga completada';
    quit;
    " 2>&1)
    
    local lftp_exit_code=$?
    
    # Guardar log completo
    echo "$lftp_output" > "$LOCAL_DIR/transfer_log.txt"
    
    # Mostrar información de debug si está habilitado
    if [ "$DEBUG_MODE" = true ]; then
        log_info "Salida completa de lftp:"
        echo "$lftp_output"
    fi

    if [ $lftp_exit_code -eq 0 ]; then
        log_info "Descarga FTP completada"
    else
        log_error "Error en la descarga FTP (código: $lftp_exit_code)"
        log_error "Ver log completo en: $LOCAL_DIR/transfer_log.txt"
        log_error "Últimas líneas del error:"
        tail -10 "$LOCAL_DIR/transfer_log.txt"
        exit 1
    fi
}

# Procesar archivos: agregar saltos de línea
process_files() {
    log_info "Procesando archivos (agregando saltos de línea cada $LRECL caracteres)..."

    local count=0
    local processed=0

    cd "$LOCAL_DIR" || exit 1

    for file in *; do
        if [ -f "$file" ] && [ "$file" != "transfer_log.txt" ]; then
            ((count++))
            log_info "Procesando: $file"

            # Agregar saltos de línea y eliminar espacios finales
            if fold -w $LRECL "$file" | sed 's/ *$//' > "temp_$file"; then
                mv "temp_$file" "$file"
                ((processed++))
            else
                log_error "Error procesando: $file"
                [ -f "temp_$file" ] && rm "temp_$file"
            fi
        fi
    done

    log_info "Procesados $processed de $count archivos"
}

# Verificar resultados
verify_download() {
    log_info "Verificando descarga..."

    cd "$LOCAL_DIR" || exit 1

    local file_count=$(find . -maxdepth 1 -type f -not -name "transfer_log.txt" | wc -l)
    local total_size=$(du -sh . | cut -f1)

    if [ "$file_count" -gt 0 ]; then
        log_info "✅ Descarga completada exitosamente!"
        log_info "   📁 Archivos descargados: $file_count"
        log_info "   💾 Tamaño total: $total_size"
        log_info "   📍 Ubicación: $LOCAL_DIR"

        # Mostrar primeros 5 archivos
        log_info "   📋 Primeros archivos:"
        ls -la | grep -v "transfer_log.txt" | head -6
    else
        log_error "❌ No se descargaron archivos"
        exit 1
    fi
}

# Función principal
main() {
    echo "========================================"
    echo "  DESCARGADOR DE PDS PARA MAINFRAME"
    echo "========================================"

    check_dependencies
    create_directory
    test_connection
    download_pds
    process_files
    verify_download

    echo "========================================"
    log_info "Proceso completado 🎉"
}

# Ejecutar función principal
main "$@"
