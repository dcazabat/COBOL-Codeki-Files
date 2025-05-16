# COBOL Practice Programs

This repository contains various COBOL programs and related files for practice and learning purposes.

## Program Files

### Main Programs
- `EJESUIMP` - COBOL program (purpose unknown)
- `HOLMUNDO` - COBOL program, likely "Hello World" example
- `HOLMUNDO.cbl` - COBOL source file for Hello World program
- `PEPE` - COBOL program (purpose unknown)
- `PGMAPAR` - File matching/merging program that processes clients and movements
- `PGMASIN9` - COBOL program (purpose unknown)
- `PGMSUMA` - COBOL program likely for performing additions
- `PGMTEST` - Test program

### Corte Control Programs
- `PGM1CORT` - Corte control program
- `PGMCORT2` - Corte control program version 2
- `PGMCORTE` - Another corte control program

### Table Processing Programs
- `PGMTABL2` - Table processing program version 2
- `PGMTABL3` - Table processing program version 3

### Other Programs
- `PGM2CC7C`, `PGM3CC7C` - Related programs (purpose unknown)
- `PGMAPA02` - Additional program (purpose unknown)
- `PGMEJEM1` - Example program 1
- `PGMPRUAR` - Program (purpose unknown)
- `PGMSIN11` - Program (purpose unknown)
- `PGMTAC7C` - Program (purpose unknown)
- `PGMVAC7C`, `PGMVAOLD`, `PVAC7CV2` - Related version programs

## Directories

### `/Apareo`
Documentation and resources for file matching/merging:
- `ApareoEJ.pdf` - Documentation in PDF format
- `pgmapar.html.htm` - HTML documentation explaining the merging process
- `style1.css`, `style2.css`, `style3.css` - Stylesheets for HTML documentation
- Diagram files:
  - `deepseek_mermaid_20250510_1cf68b.mermaid`
  - `deepseek_mermaid_20250510_8b3a62.png`

### `/COMPILADOR`
Compilation related files:
- `COMPILA` - Compilation script/program
- `COMPTEST` - Test compilation script/program

### `/copylib`
COBOL copybook library containing common structures:
- `CLICOB` - Client related copybook
- `CLIENTE` - Client structure definitions
- `CORTE` - Control break related structures
- `CPNCLIV` - Client validation copybook
- `CPNOVCLI` - New client copybook
- `MOVIMCC` - Movement related copybook

### `/data`
Contains data files used by the programs

### `/JCL`
Job Control Language files for program execution

## Documentation
Detailed documentation about the file matching (apareo) process can be found in the Apareo directory, particularly in `pgmapar.html.htm` which explains:
- How client and movement files are processed
- The logic for comparing keys
- The sequential reading process
- How records are matched and processed