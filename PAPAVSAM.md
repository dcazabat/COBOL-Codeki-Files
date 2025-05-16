# ocumentación del Programa PAPAVSAM

## Objetivo

El programa PAPAVSAM implementa la Actividad Nro 1 del documento de especificación, realizando un proceso de apareo entre:

- Un archivo maestro de clientes (VSAM KSDS)
- Un archivo de novedades (secuencial)
- Generando un archivo de salida con los registros encontrados

## Estructura de Archivos

### FILE1: Archivo Maestro de Clientes (VSAM KSDS)

- Nombre físico: KC02788.ALU9999.CLIENT1.KSDS.VSAM
- Organización: VSAM KSDS
- Acceso: Secuencial
- Layout: CPCLIE (50 bytes)
- Clave primaria: CLI-TIP-DOC + CLI-NRO-DOC

### FILE2: Archivo de Novedades (QSAM)

- Nombre físico: KC02788.ALU9999.NOVCLIEN
- Organización: Secuencial
- Layout: CPNOVCLI (50 bytes)

### FILE3: Archivo de Salida (QSAM)

- Nombre físico: KC03XXX.CLIENTES.ENCONTRADOS
- Organización: Secuencial
- Layout: CPCLIENS (50 bytes)

## Secciones Principales del Programa

### Working Storage

#### Variables de Control

- Códigos de File Status para los tres archivos (WS-FILx-CODE)
- Indicadores de fin de archivo (WS-FIN-FILEx)
- Contadores principales:
  - WS-CONT-CLIENTES: Total de clientes leídos
  - WS-CONT-NOVEDADES: Total de novedades leídas
  - WS-CONT-ENCONTRADOS: Coincidencias encontradas
  - WS-CONT-NO-ENCONTRADOS: Novedades sin cliente correspondiente

#### Área de Trabajo

- Variables de control de proceso
- Indicadores de estado
- Áreas para manejo de claves

### Rutinas Principales

#### 0000-MAIN

- Control principal del flujo del programa
- Secuencia:
  1. Inicialización (1000-INICIO)
  2. Proceso principal (2000-PROCESO)
  3. Finalización (9000-FINAL)
  4. Terminación del programa

#### 1000-INICIO

- Inicialización del entorno:
  - Puesta a cero de contadores
  - Inicialización de indicadores
- Apertura de archivos:
  - FILE1: Archivo maestro (INPUT)
  - FILE2: Archivo de novedades (INPUT)
  - FILE3: Archivo de salida (OUTPUT)
- Control de errores en apertura
- Lectura inicial de ambos archivos

#### 2000-PROCESO

- Implementación del algoritmo de apareo
- Lógica de comparación de claves:
  1. Claves iguales:
     - Procesamiento de coincidencia
     - Avance en ambos archivos
  2. Clave cliente menor:
     - Avance en archivo de clientes
  3. Clave novedad menor:
     - Contabilización de no encontrado
     - Avance en archivo de novedades

#### 3000-LEER-FILE1

- Lectura secuencial del archivo maestro
- Control de fin de archivo mediante AT END
- Actualización del contador de clientes
- Manejo de indicador de fin de archivo

#### 4000-LEER-FILE2

- Lectura secuencial del archivo de novedades
- Puntos de ejecución:
  - Primera lectura al inicio
  - Después de procesar coincidencia
  - Cuando novedad es menor que cliente actual
- Actualización de contador de novedades
- Control de fin de archivo
- No requiere ordenamiento previo del archivo

#### 5000-PROCESAR-COINCIDENCIA

- Proceso detallado de coincidencias:
  1. Incremento del contador de encontrados
  2. Inicialización del área de salida
  3. Mapeo de campos:
     - Documentación (tipo y número)
     - Datos de sucursal
     - Conversión de tipo de cuenta:
       - CC → 01 (Cuenta Corriente)
       - CA → 02 (Caja de Ahorro)
       - Otros → 03 (Plazo Fijo)
     - Información financiera
     - Datos personales
  4. Escritura del registro de salida
  5. Validación de la escritura

#### 9000-FINAL

- Cierre ordenado del proceso:
  1. Cierre de archivos:
     - Control individual de cada cierre
     - Validación de estado final
  2. Generación de reporte estadístico:
     - Encabezado identificativo
     - Totales de proceso:
       - Clientes procesados
       - Novedades leídas
       - Coincidencias encontradas
       - Registros no encontrados
     - Formato estructurado y claro
  3. Validación final del proceso completo

## Proceso de Apareo

1. Lectura inicial de ambos archivos
2. Ciclo principal mientras hay datos:
   - Comparación de claves
   - Procesamiento según resultado
   - Avance en archivos correspondientes
3. Generación de salida para coincidencias
4. Contabilización de resultados

## Estadísticas Finales

El programa mantiene y muestra al final:

- Total de registros del maestro procesados
- Total de novedades leídas
- Total de coincidencias encontradas
- Total de novedades sin cliente correspondiente

## Requisitos de JCL

Para la ejecución se requiere JCL que defina:

- DDFILE1: Asignación del VSAM de clientes
- DDFILE2: Asignación del archivo de novedades
- DDFILE3: Definición del archivo de salida

## Consideraciones Operativas

- El archivo maestro debe estar correctamente definido como VSAM KSDS
- Los archivos de entrada deben existir y ser accesibles
- Se requieren permisos de lectura y escritura apropiados
- Es importante mantener backup de los archivos antes del proceso
