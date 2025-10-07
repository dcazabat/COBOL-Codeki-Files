IDENTIFICATION DIVISION.
       PROGRAM-ID. Sumatoria.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(2) VALUE 1.
       01 SUMA PIC 9(4) VALUE 0.

       PROCEDURE DIVISION.
           PERFORM VARYING N FROM 1 BY 1 UNTIL N > 10
               ADD N TO SUMA
           END-PERFORM
           DISPLAY 'La sumatoria de los números entre 1 y 10 es: ' SUMA.
           STOP RUN.