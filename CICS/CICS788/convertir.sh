#!/bin/bash

# =============================================
# SCRIPT PARA CONVERTIR ARCHIVOS MAINFRAME
# =============================================
# Convierte todos los archivos de SinConvertir/ a Convertido/
# Formato: EBCDIC (CP1047) -> UTF-8 con líneas de 80 caracteres

# Configuración
SOURCE_DIR="./SinConvertir"
TARGET_DIR="./Convertido"
LINE_WIDTH=80
CHARSET_FROM="CP1047"
CHARSET_TO="UTF-8"

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
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

log_process() {
    echo -e "${BLUE}[PROC]${NC} $1"
}

# Verificar directorios
check_directories() {
    if [ ! -d "$SOURCE_DIR" ]; then
        log_error "Directorio fuente no existe: $SOURCE_DIR"
        exit 1
    fi
    
    if [ ! -d "$TARGET_DIR" ]; then
        log_info "Creando directorio destino: $TARGET_DIR"
        mkdir -p "$TARGET_DIR"
    fi
    
    log_info "Directorio fuente: $SOURCE_DIR"
    log_info "Directorio destino: $TARGET_DIR"
}

# Convertir un archivo individual
convert_file() {
    local source_file="$1"
    local target_file="$2"
    
    log_process "Convirtiendo: $(basename "$source_file")"
    
    if iconv -f "$CHARSET_FROM" -t "$CHARSET_TO" "$source_file" | fold -w "$LINE_WIDTH" > "$target_file"; then
        log_info "✅ Convertido: $(basename "$source_file")"
        return 0
    else
        log_error "❌ Error convirtiendo: $(basename "$source_file")"
        return 1
    fi
}

# Procesar todos los archivos
process_all_files() {
    local total_files=0
    local converted_files=0
    local failed_files=0
    
    log_info "Iniciando conversión de archivos..."
    echo "========================================"
    
    # Contar archivos totales
    total_files=$(find "$SOURCE_DIR" -maxdepth 1 -type f | wc -l)
    
    if [ "$total_files" -eq 0 ]; then
        log_warn "No se encontraron archivos en $SOURCE_DIR"
        return 0
    fi
    
    log_info "Archivos encontrados: $total_files"
    echo ""
    
    # Procesar cada archivo
    for source_file in "$SOURCE_DIR"/*; do
        if [ -f "$source_file" ]; then
            local filename=$(basename "$source_file")
            local target_file="$TARGET_DIR/$filename"
            
            if convert_file "$source_file" "$target_file"; then
                ((converted_files++))
            else
                ((failed_files++))
            fi
        fi
    done
    
    echo ""
    echo "========================================"
    log_info "Proceso completado"
    log_info "Total archivos: $total_files"
    log_info "Convertidos: $converted_files"
    if [ "$failed_files" -gt 0 ]; then
        log_warn "Fallidos: $failed_files"
    fi
    
    # Mostrar archivos convertidos
    if [ "$converted_files" -gt 0 ]; then
        echo ""
        log_info "Archivos convertidos en $TARGET_DIR:"
        ls -la "$TARGET_DIR"
    fi
}

# Función principal
main() {
    echo "========================================"
    echo "  CONVERSOR DE ARCHIVOS MAINFRAME"
    echo "  EBCDIC (CP1047) -> UTF-8"
    echo "========================================"
    
    check_directories
    process_all_files
    
    echo "========================================"
    log_info "🎉 Conversión completada"
}

# Ejecutar función principal
main "$@"