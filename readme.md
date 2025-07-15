# Programas de Práctica COBOL

Este repositorio contiene diversos programas COBOL y archivos relacionados para práctica, aprendizaje y referencia en entornos mainframe. Incluye ejemplos de procesamiento batch, manejo de archivos, bases de datos DB2, CICS y más.

## Archivos de Programa

### Programas Principales

- `APAREO` - Programa de apareo de archivos que procesa clientes y movimientos
- `APAREO (Conflicto de mayúsculas y minúsculas)` - Versión del programa de apareo con conflicto de nombres
- `EJENOVKS` - Programa de ejemplo para manejo de archivos VSAM
- `EJESUIMP` - Programa de ejemplo para impresión de informes
- `HOLMUNDO` - Programa "Hola Mundo" - ejemplo básico de COBOL
- `PEPE` - Programa de prueba y ejemplo básico
- `PGMAPAR` - Programa de apareo que procesa archivos de clientes y movimientos secuencialmente
- `PGMSUMA` - Programa que realiza operaciones de suma y cálculos aritméticos
- `PGMTEST` - Programa de pruebas para validar funcionalidades
- `PGMVSAM` - Programa para manejo y acceso a archivos VSAM

### Programas de Corte de Control

- `PGM1CORT` - Programa de corte de control básico
- `PGM2CORT` - Programa de corte de control versión 2
- `PGMCORT2` - Programa de corte de control alternativo
- `PGMCORTE` - Programa de corte de control principal
- `PCORTLEO` - Programa de corte con lectura de archivos

### Programas de Procesamiento de Tablas

- `PGMTABL2` - Programa de procesamiento de tablas versión 2
- `PGMTABL3` - Programa de procesamiento de tablas versión 3
- `PGMTAC7C` - Programa de manejo de tablas con validaciones

### Programas de Base de Datos (DB2)

- `PGMB2C7C` - Programa DB2 con copybooks para estructura de datos
- `PGMB7C7C` - Programa DB2 con procesamiento de cursores y copybooks
- `PGMDB210` - Programa básico de conexión y consultas DB2
- `PGMDB216` - Programa de consultas DB2 con joins
- `PGMDB22` - Programa de operaciones básicas DB2
- `PGMDB226` - Programa de actualizaciones DB2
- `PGMDB227` - Programa de manejo de cursores DB2
- `PGMDB228` - Programa de transacciones DB2
- `PGMDB229` - Programa de stored procedures DB2
- `PGMDB230` - Programa avanzado de DB2
- `PGMDB231` - Programa de consultas complejas DB2
- `PGMDB233` - Programa de manejo de errores DB2
- `PGMDB316` - Programa de administración DB2
- `PGMDBDAC` - Programa de acceso a datos DB2 personalizado
- `JCLDB2XX` - JCL para ejecución de programas DB2

### Programas de Manejo de Archivos

- `PGMASN11` - Programa de asignación y lectura de archivos
- `PGMASN12` - Programa de asignación avanzada de archivos
- `PGMASIN9` - Programa de asignación y procesamiento
- `PGMLIS00` - Programa de listado y reportes
- `PGMSIN22` - Programa de procesamiento secuencial
- `PGMSIN27` - Programa de validación de archivos
- `PGMSIN28` - Programa de procesamiento de registros

### Programas con Copybooks (Compilación C7C)

Estos programas utilizan estructuras de datos reutilizables de la carpeta `/copylib`:

- `PGM2CC7C` - Programa con copybooks de estructuras de datos básicas
- `PGM3CC7C` - Programa con copybooks avanzados y procesamiento complejo
- `PGMB2C7C` - Programa con copybooks de base de datos (DB2)
- `PGMCCC7C` - Programa con copybooks de control y validación
- `PGMDCC7C` - Programa con copybooks para validación de datos
- `PGMIMC7C` - Programa con copybooks para importación de datos
- `PGMIMC7L` - Programa de importación con librerías extendidas
- `PGMIMP7C` - Programa de impresión con copybooks de formato
- `PGMRUC7C` - Programa con copybooks de rutinas reutilizables
- `PGMVAC7C` - Programa con copybooks para validación avanzada de datos
- `PVAC7CV2` - Programa de validación versión 2 optimizada

### Programas de Ejemplo y Pruebas

- `PGMAPA02` - Programa de ejemplo de apareo 02
- `PGMCCLEO` - Programa de ejemplo de lectura controlada
- `PGMEJEM1` - Programa de ejemplo número 1
- `PGMPRUAR` - Programa de pruebas de rutinas
- `PGMVAOLD` - Programa de validación antigua versión

### Programas SPUFI y SQL

- `SPUFIC7C` - Programa SPUFI para consultas SQL interactivas
- `VERTABLA` - Programa para visualización de estructuras de tablas

### Documentación Asociada

- `PAPAVSAM` - Documentación sobre archivos VSAM
- `PAPAVSAM.md` - Documentación VSAM en formato Markdown
- `PGMAPA02.md` - Documentación del programa de apareo 02

### Archivos de Configuración

- `mail.txt` - Archivo de configuración de correo electrónico
- `zapp.yaml` - Archivo de configuración YAML para aplicaciones z/OS
- `zowe.config.json` - Configuración del CLI de Zowe
- `zowe.schema.json` - Esquema de validación para configuración Zowe

## Directorios

### `/ApareoDocu`

Documentación y recursos para apareo/fusión de archivos:

- `ApareoEJ.pdf` - Documentación en formato PDF sobre ejemplos de apareo
- `pgmapar.html.htm` - Documentación HTML detallada explicando el proceso de fusión
- `style1.css`, `style2.css`, `style3.css` - Hojas de estilo para la documentación HTML
- Archivos de diagramas:
  - `deepseek_mermaid_20250510_1cf68b.mermaid` - Diagrama de flujo en formato mermaid
  - `deepseek_mermaid_20250510_8b3a62.png` - Representación visual del diagrama de flujo

### `/COMPILADOR`

Archivos relacionados con compilación:

- `BINDESTU` - Script de enlazado para estudiantes
- `BINDPLAN` - Plan de enlazado
- `COMPCDB2` - Compilador para programas con DB2
- `COMPDB2` - Compilador DB2 principal
- `COMPIDB2` - Compilador interactivo DB2
- `COMPILA` - Script/programa de compilación principal
- `COMPTEST` - Script de compilación para pruebas

### `/copylib`

Biblioteca de copybooks COBOL que contiene estructuras comunes reutilizables:

- `CLICOB` - Copybook con estructura de datos de clientes para COBOL
- `CLIENTE` - Definiciones de estructura detallada de clientes
- `CORTE` - Estructuras relacionadas con corte de control y procesamiento por lotes
- `CPCLIE` - Copybook de procesamiento de datos de clientes
- `CPCLIENS` - Copybook para manejo de múltiples registros de clientes
- `CPDATOCD` - Copybook de datos codificados y lookup tables
- `CPNCLIV` - Copybook para validación de nuevos clientes
- `CPNOVCLI` - Copybook para estructura de nuevos clientes
- `MOVIMCC` - Copybook relacionado con movimientos y transacciones
- `NOVCTA` - Copybook para nuevas cuentas
- `NOVECLIE` - Copybook para novedades de clientes
- `PRODUC` - Copybook con estructura de datos de productos
- `TBCLIENT` - Copybook para tabla de clientes
- `TBVCLIEN` - Copybook para tabla de validación de clientes

### `/data`

Contiene archivos de datos utilizados por los programas:

- `ARCHIVOS.CLIENTE` - Archivo maestro de clientes
- `ARCHIVOS.NOVCLIEN` - Archivo de nuevos clientes
- `ARCHIVOS.SUCURSAL` - Archivo de sucursales
- `CLICOB` - Datos de clientes COBOL
- `CORTE` - Datos para corte de control
- `CURSOS.SUCURSAL` - Datos de cursos por sucursal
- `NOVEDANI` - Archivo de novedades
- `SUCCORTE` - Datos de sucursales para corte

### `/DCLGEN`

Declaraciones generadas automáticamente para tablas DB2:

- `TBCURCLI` - Declaración para tabla de cursos de clientes
- `TBCURCTA` - Declaración para tabla de cuentas corrientes

### `/JCL`

Archivos de Lenguaje de Control de Trabajos para ejecución de programas:

- `EJEHOLA` - JCL para ejecutar programa Hola Mundo
- `EJELIS00` - JCL para ejecutar programa de listado
- `EJENOVKS` - JCL para ejecutar programa VSAM
- `EJESIN28` - JCL para ejecutar programa SIN28
- `EJESUIMP` - JCL para ejecutar programa de impresión
- `EJESUMA` - JCL para ejecutar programa de suma
- `EJEVSAM` - JCL para ejecutar programa VSAM
- `JCL1CORT`, `JCL2CORT` - JCL para programas de corte
- `JCLAPAR`, `JCLAPAR2` - JCL para programas de apareo
- `JCLASN12` - JCL para programa de asignación 12
- `JCLB2C7C` - JCL para programa B2C7C
- `JCLCCC7C` - JCL para programa CCC7C
- `JCLCORT1`, `JCLCORTE` - JCL para programas de corte
- `JCLDB216`, `JCLDB228` - JCL para programas DB2
- `JCLDCC7C` - JCL para programa DCC7C
- `JCLEJEM1` - JCL para programa de ejemplo 1
- `JCLIMC7C` - JCL para programa IMC7C
- `JCLIMP7C` - JCL para programa de impresión
- `JCLLIS00` - JCL para programa de listado
- `JCLSIN22` - JCL para programa SIN22
- `JCLTABLA` - JCL para programa de tablas
- `JCLVC7C`, `JCLVC7C2` - JCL para programas VC7C
- `JCLVSAM`, `JCLVSAM2` - JCL para programas VSAM
- `SPUFIJCL` - JCL para SPUFI

### `/MACROS`

Macros y rutinas reutilizables:

- `VENTANAS` - Macro para manejo de ventanas

### `/sqls`

Scripts y programas SQL:

- `SPUFIC7C` - Scripts SPUFI para consultas SQL interactivas
- `SPUFJOIN` - Scripts SPUFI para consultas con JOIN
- `VERTABLA` - Scripts para visualización de estructuras de tablas

### `/CICS`

Programas y recursos relacionados con CICS (Customer Information Control System):

- `PEPECICS` - Programa CICS de ejemplo para procesamiento de transacciones online

### `/.vscode`

Configuración para Visual Studio Code:

- `settings.json` - Configuración de extensiones y parámetros para trabajar con COBOL en VS Code

## Documentación

### Apareo de Archivos

La documentación detallada sobre el proceso de apareo de archivos se encuentra en el directorio `ApareoDocu`, particularmente en `pgmapar.html.htm` que explica:

- Cómo se procesan los archivos de clientes y movimientos secuencialmente
- La lógica para comparar claves y aparear registros relacionados
- El proceso de lectura secuencial y manejo de fin de archivos
- Cómo se emparejan y procesan los registros para obtener resultados consolidados
- Diagramas de flujo que ilustran el proceso completo

### Archivos VSAM

La documentación sobre archivos VSAM está disponible en:

- `PAPAVSAM` - Documentación técnica sobre la estructura y manejo de VSAM
- `PAPAVSAM.md` - Guía en formato Markdown sobre operaciones con VSAM

### Programa de Apareo 02

Documentación adicional sobre el programa de apareo mejorado:

- `PGMAPA02.md` - Documentación en formato Markdown con detalles de implementación

### Configuración Zowe

Los archivos `zowe.config.json` y `zowe.schema.json` proporcionan la configuración para interactuar con mainframe a través de la interfaz Zowe CLI.

## Resumen y Uso

Este repositorio sirve como una biblioteca completa de programas COBOL para diferentes aplicaciones en entornos mainframe:

1. **Programas de Apareo**: Procesamiento y fusión de archivos secuenciales
2. **Corte de Control**: Agrupación y procesamiento por lotes
3. **Acceso a DB2**: Ejemplos de conexión y manipulación de bases de datos
4. **VSAM**: Acceso y manejo de archivos virtuales
5. **CICS**: Programación para entornos de transacción online
6. **Copybooks**: Estructuras de datos reutilizables

Los programas están organizados por tipo y funcionalidad, con sus correspondientes JCL para ejecución. La documentación proporciona explicaciones detalladas sobre los procesos más importantes.

## Licencia y Uso

Este material está destinado para propósitos educativos y de práctica. Consulte los archivos individuales para información sobre licencias específicas.

---
Última actualización: Julio de 2025
