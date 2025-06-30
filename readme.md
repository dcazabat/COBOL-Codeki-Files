# Programas de Práctica COBOL

Este repositorio contiene varios programas COBOL y archivos relacionados para práctica y aprendizaje.

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

- `PGMDB210` - Programa básico de conexión y consultas DB2
- `PGMDB216` - Programa de consultas DB2 con joins
- `PGMDB22` - Programa de operaciones básicas DB2
- `PGMDB226` - Programa de actualizaciones DB2
- `PGMDB227` - Programa de manejo de cursores DB2
- `PGMDB228` - Programa de transacciones DB2
- `PGMDB229` - Programa de stored procedures DB2
- `PGMDB230` - Programa avanzado de DB2
- `PGMDB316` - Programa de administración DB2
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

- `PGM2CC7C` - Programa con copybooks de estructuras de datos
- `PGM3CC7C` - Programa con copybooks avanzados
- `PGMB2C7C` - Programa con copybooks de base de datos
- `PGMCCC7C` - Programa con copybooks de control
- `PGMDCC7C` - Programa con copybooks de validación de datos
- `PGMIMC7C` - Programa con copybooks de importación
- `PGMIMC7L` - Programa de importación con librerías
- `PGMIMP7C` - Programa de impresión con copybooks
- `PGMRUC7C` - Programa con copybooks de rutinas
- `PGMVAC7C` - Programa con copybooks de validación avanzada
- `PVAC7CV2` - Programa de validación versión 2

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

Documentación adicional sobre procesos de apareo de archivos

### `/Apareo`

Documentación y recursos para apareo/fusión de archivos:

- `ApareoEJ.pdf` - Documentación en formato PDF
- `pgmapar.html.htm` - Documentación HTML explicando el proceso de fusión
- `style1.css`, `style2.css`, `style3.css` - Hojas de estilo para documentación HTML
- Archivos de diagramas:
  - `deepseek_mermaid_20250510_1cf68b.mermaid`
  - `deepseek_mermaid_20250510_8b3a62.png`

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

Biblioteca de copybooks COBOL que contiene estructuras comunes:

- `CLICOB` - Copybook relacionado con clientes
- `CLIENTE` - Definiciones de estructura de clientes
- `CORTE` - Estructuras relacionadas con corte de control
- `CPCLIE` - Copybook de procesamiento de clientes
- `CPCLIENS` - Copybook de clientes múltiples
- `CPDATOCD` - Copybook de datos codificados
- `CPNCLIV` - Copybook de validación de clientes
- `CPNOVCLI` - Copybook de nuevos clientes
- `MOVIMCC` - Copybook relacionado con movimientos
- `PRODUC` - Copybook de productos
- `TBCLIENT` - Tabla de clientes
- `TBCURCLI` - Tabla de cursos de clientes
- `TBCURCTA` - Tabla de cuentas corrientes
- `TBVCLIEN` - Tabla de validación de clientes

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

## Documentación

La documentación detallada sobre el proceso de apareo de archivos se puede encontrar en el directorio Apareo, particularmente en `pgmapar.html.htm` que explica:

- Cómo se procesan los archivos de clientes y movimientos
- La lógica para comparar claves
- El proceso de lectura secuencial
- Cómo se emparejan y procesan los registros
