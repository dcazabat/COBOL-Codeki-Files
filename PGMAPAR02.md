# Explicación del Programa PGMAPA02

Este documento explica el programa COBOL PGMAPA02, que realiza un proceso de apareo (matching) entre dos archivos usando VSAM KSDS (Virtual Storage Access Method - Key Sequenced Data Set).

## Estructura General del Programa

### 1. IDENTIFICATION DIVISION
Esta es la primera división del programa donde se identifica el programa:
```cobol
PROGRAM-ID PGMAPA02.
```
- Define el nombre del programa como PGMAPA02
- Incluye comentarios sobre el propósito del programa (VSAM KSDS)

### 2. ENVIRONMENT DIVISION
Esta división describe el entorno de ejecución del programa:

#### CONFIGURATION SECTION
- Define que el punto decimal será una coma (DECIMAL-POINT IS COMMA)

#### INPUT-OUTPUT SECTION
Define los archivos que el programa utilizará:

1. FILE1 (Archivo VSAM KSDS):
   - Organización indexada
   - Acceso secuencial
   - Tiene una clave principal (KEY-CLAVE)
   - Estado del archivo almacenado en WS-FIL1-CODE

2. FILE2 (Archivo secuencial):
   - Acceso secuencial
   - Estado del archivo almacenado en WS-FIL2-CODE

### 3. DATA DIVISION
Define la estructura de los datos que el programa manejará:

#### FILE SECTION
Define la estructura de los registros de los archivos:

1. REG-FILE1:
   - KEY-CLAVE (13 caracteres)
   - CLI-CLAVE (3 dígitos numéricos)
   - Incluye campos FILLER para espacios no utilizados

2. REG-FILE2:
   - Registro de 50 caracteres

#### WORKING-STORAGE SECTION
Define las variables de trabajo del programa:
- Códigos de retorno para los archivos
- Indicadores de fin de archivo
- Contadores para estadísticas
- Campos para manejo de claves
- Campos para fecha de proceso

### 4. PROCEDURE DIVISION
Contiene la lógica del programa, dividida en varias secciones:

#### MAIN-PROGRAM
Es el punto de entrada principal que controla el flujo del programa:
1. Ejecuta la inicialización (1000-INICIO)
2. Ejecuta el proceso principal (2000-PROCESO) hasta que termina la lectura
3. Ejecuta la finalización (9999-FINAL)

#### 1000-INICIO
Rutina de inicialización:
- Obtiene la fecha actual
- Inicializa variables
- Abre los archivos de entrada
- Realiza las primeras lecturas de ambos archivos

#### 2000-PROCESO
Rutina principal de proceso que realiza el apareo:
- Compara las claves de ambos archivos
- Si son iguales: 
  - Incrementa contador de encontrados
  - Lee siguiente registro de FILE2
- Si CLAVE1 > CLAVE2:
  - Incrementa contador de no encontrados
  - Lee siguiente registro de FILE2
- Si CLAVE1 < CLAVE2:
  - Lee siguiente registro de FILE1

#### 3000-LEER-FILE1 y 4000-LEER-FILE2
Rutinas de lectura para cada archivo:
- Leen un registro
- Manejan códigos de retorno
- Actualizan contadores
- Manejan fin de archivo

#### 9999-FINAL
Rutina de finalización:
- Cierra los archivos
- Muestra estadísticas finales:
  - Cantidad de registros leídos de cada archivo
  - Cantidad de registros encontrados
  - Cantidad de registros no encontrados

## Propósito del Programa

Este programa realiza un proceso de apareo (matching) entre dos archivos:
1. Un archivo maestro de clientes (FILE1) organizado como VSAM KSDS
2. Un archivo de novedades (FILE2) organizado secuencialmente

El programa compara los registros de ambos archivos basándose en sus claves y:
- Identifica registros que coinciden
- Identifica registros que existen en el archivo de novedades pero no en el maestro
- Lleva un control estadístico del proceso

## Conceptos Clave

1. **VSAM KSDS**: Es un tipo de organización de archivo que permite acceso directo a los registros mediante una clave.
2. **Apareo**: Proceso de comparar registros de dos archivos ordenados por una clave común.
3. **File Status**: Códigos que indican el resultado de operaciones sobre archivos:
   - '00': Operación exitosa
   - '10': Fin de archivo
   - Otros códigos indican errores

## Buenas Prácticas Demostradas

1. Control de errores exhaustivo en operaciones de archivo
2. Uso de variables de estado (88-level) para control de flujo
3. Estructura modular con secciones bien definidas
4. Comentarios descriptivos que facilitan el mantenimiento
5. Contadores para validación y control del proceso
6. Mensajes informativos para seguimiento del proceso
