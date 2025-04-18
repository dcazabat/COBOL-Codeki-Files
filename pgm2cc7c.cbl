       IDENTIFICATION DIVISION.                                         00010002
       PROGRAM-ID PGM2CC7C.                                             00020003
       AUTHOR.        D. CAZABAT.                                       00021003
       INSTALLATION.  CURSO CODEKI.                                     00022003
       DATE-WRITTEN.  17/04/2025.                                       00023003
       DATE-COMPILED. 17/04/2025.                                       00024003
      **********************************************************        00030002
      *                                                        *        00040002
      *  PROGRAMA PARA EMITIR TOTAL CTAS ACTIVAS POR SUCURSAL  *        00050002
      *  Y TOTAL DE IMPORTES POR SUCURSAL Y GENERAL            *        00060002
      *  LA ENTRADA CLASIFICADA X SUCURSAL                     *        00070002
      *                                                        *        00080002
      **********************************************************        00090002
      *      MANTENIMIENTO DE PROGRAMA                         *        00100002
      **********************************************************        00110002
      *  FECHA   *    DETALLE        * COD *                            00120002
      **************************************                            00130002
      *          *                   *     *                            00140002
      *          *                   *     *                            00150002
      **************************************                            00160002
       ENVIRONMENT DIVISION.                                            00170002
       INPUT-OUTPUT SECTION.                                            00180002
                                                                        00190004
             SELECT ENTRADA ASSIGN DDENTRA                              00200002
                    FILE STATUS IS WS-ENT-CODE.                         00210002
                                                                        00220002
             SELECT SALIDA  ASSIGN DDSALID                              00230002
                    FILE STATUS IS WS-SAL-CODE.                         00240002
                                                                        00250002
       DATA DIVISION.                                                   00260002
       FILE SECTION.                                                    00270002
       FD ENTRADA                                                       00280002
            BLOCK CONTAINS 0 RECORDS                                    00290002
            RECORDING MODE IS F.                                        00300002
                                                                        00310002
       01 REG-ENTRADA    PIC X(30).                                     00320002
                                                                        00330002
       FD SALIDA                                                        00340002
            BLOCK CONTAINS 0 RECORDS                                    00350002
            RECORDING MODE IS F.                                        00360002
                                                                        00370002
       01 REG-SALIDA     PIC X(80).                                     00380002
                                                                        00390002
      **************************************                            00400002
       WORKING-STORAGE SECTION.                                         00410002
      **************************************                            00420002
       77  FILLER        PIC X(26) VALUE '* INICIO WORKING-STORAGE *'.  00430002
       77  FILLER        PIC X(26) VALUE '* CODIGOS RETORNO FILES  *'.  00440002
       77  WS-ENT-CODE      PIC XX    VALUE SPACES.                     00450002
       77  WS-SAL-CODE      PIC XX    VALUE SPACES.                     00460002
                                                                        00470002
       01  WS-STATUS-FIN    PIC X.                                      00480002
           88  WS-FIN-LECTURA         VALUE 'Y'.                        00490002
           88  WS-NO-FIN-LECTURA      VALUE 'N'.                        00500002
                                                                        00510002
       77  FILLER       PIC X(26) VALUE '* LAYOUT ENTRADA MESES   *'.   00520002
      **************************************                            00530002
               COPY CPSUCU.                                             00540002
      **************************************                            00550002
                                                                        00560002
      **************************************                            00570002
      * LAY-OUT GENERAL REGISTRO DE SALIDA                              00580002
      **************************************                            00590002
       01  WS-REG-SALIDA.                                               00600002
           03  WS-SAL-SUCURSAL         PIC 99      VALUE ZEROS.         00610002
           03  WS-SAL-NOMBRE-SUC       PIC X(30)   VALUE SPACES.        00620002
           03  WS-SAL-CANT-CUENTAS     PIC ZZZ9    VALUE ZEROS.         00630002
           03  WS-SAL-IMPORTE-SUC      PIC ZZ,ZZZ,ZZ9.99 VALUE ZEROS.   00640002
           03  FILLER                  PIC X(32)   VALUE SPACES.        00650002
                                                                        00660002
      **************************************                            00670002
      * LAY-OUT ULTIMO REGISTRO DE SALIDA                               00680002
      **************************************                            00690002
                                                                        00700002
       01  FILLER        REDEFINES    WS-REG-SALIDA.                    00710002
           03  WS-REG-SALIDA-L.                                         00720002
             05  WS-SAL-FECHA.                                          00730002
                 07 WS-SAL-DD         PIC 99.                           00740002
                 07 WS-SAL-GUION-DD   PIC X.                            00750002
                 07 WS-SAL-MM         PIC 99.                           00760002
                 07 WS-SAL-GUION-MM   PIC X.                            00770002
                 07 WS-SAL-SIGLO      PIC   99.                         00780002
                 07 WS-SAL-AA         PIC   99.                         00790002
             05  WS-SAL-TITULO        PIC X(30).                        00800002
             05  WS-SAL-TOTAL-CTAS    PIC ZZZ9.                         00810002
             05  WS-SAL-TOTAL-IMP     PIC ZZ,ZZZ,ZZ9.99.                00820002
             05  FILLER               PIC X(27).                        00830002
                                                                        00840002
                                                                        00850002
      ********  TOTAL CTAS X SUCURSAL ******                            00860002
       77  WS-SUCURSAL-ANT      PIC 9(3)        VALUE     ZEROS.        00870002
       77  WS-NOMBRE-SUC-ANT    PIC X(30)       VALUE     SPACES.       00880002
       77  WS-CANT-CTAS-SUC     PIC 9(3)        VALUE     ZEROS.        00890002
       77  WS-IMPORTE-SUC       PIC 9(9)V99     VALUE     ZEROS.        00900002
       77  WS-EDIT-LEIDAS       PIC ZZZ9        VALUE     ZEROS.        00910002
       77  WS-CANT-LEIDAS       PIC 9(4)        VALUE     ZEROS.        00920002
      ********  TOTAL CTAS X BANCO    ******                            00930002
       77  WS-CANT-CTAS-BCO     PIC 9(4)        VALUE     ZEROS.        00940002
       77  WS-IMPORTE-TOTAL     PIC 9(9)V99     VALUE     ZEROS.        00950002
      ********     CONSTANTES       ***************                     00960002
       77  WS-TOTAL-CTAS        PIC X(30)                               00970002
                      VALUE    ' TOTAL CUENTAS ACTIVAS BANCO'.          00980002
       77  WS-TOTAL-IMP         PIC X(30)                               00990002
                      VALUE    ' TOTAL IMPORTE GENERAL      '.          01000002
       77  WS-GUION             PIC X     VALUE '-'.                    01010002
                                                                        01020002
      ********     FECHA DE PROCESO ***************                     01030002
       01  WS-FECHA.                                                    01040002
           03  WS-FECHA-AA      PIC 99            VALUE ZEROS.          01050002
           03  WS-FECHA-MM      PIC 99            VALUE ZEROS.          01060002
           03  WS-FECHA-DD      PIC 99            VALUE ZEROS.          01070002
                                                                        01080002
       77  FILLER        PIC X(26) VALUE '* FINAL  WORKING-STORAGE *'.  01090002
                                                                        01100002
      ***************************************************************.  01110002
       PROCEDURE DIVISION.                                              01120002
      **************************************                            01130002
      *                                    *                            01140002
      *  CUERPO PRINCIPAL DEL PROGRAMA     *                            01150002
      *                                    *                            01160002
      **************************************                            01170002
       MAIN-PROGRAM.                                                    01180002
                                                                        01190002
           PERFORM 1000-INICIO  THRU   F-1000-INICIO.                   01200002
                                                                        01210002
           PERFORM 2000-PROCESO  THRU  F-2000-PROCESO                   01220002
                   UNTIL WS-FIN-LECTURA.                                01230002
                                                                        01240002
           PERFORM 9999-FINAL    THRU  F-9999-FINAL.                    01250002
                                                                        01260002
       F-MAIN-PROGRAM. GOBACK.                                          01270002
                                                                        01280002
      **************************************                            01290002
      *                                    *                            01300002
      *  CUERPO INICIO APERTURA ARCHIVOS   *                            01310002
      *                                    *                            01320002
      **************************************                            01330002
       1000-INICIO.                                                     01340002
           ACCEPT WS-FECHA FROM DATE.                                   01350002
           DISPLAY 'FECHA:    '  WS-FECHA                               01360002
                                                                        01370002
           SET WS-NO-FIN-LECTURA TO TRUE.                               01380002
                                                                        01390002
           OPEN INPUT  ENTRADA.                                         01400002
           IF WS-ENT-CODE IS NOT EQUAL '00'                             01410002
              DISPLAY '* ERROR EN OPEN ENTRADA = ' WS-ENT-CODE          01420002
              MOVE 9999 TO RETURN-CODE                                  01430002
              SET  WS-FIN-LECTURA TO TRUE                               01440002
           END-IF.                                                      01450002
                                                                        01460002
           OPEN OUTPUT SALIDA.                                          01470002
           IF WS-SAL-CODE IS NOT EQUAL '00'                             01480002
              DISPLAY '* ERROR EN OPEN SALIDA  = ' WS-SAL-CODE          01490002
              MOVE 9999 TO RETURN-CODE                                  01500002
              SET  WS-FIN-LECTURA TO TRUE                               01510002
           END-IF.                                                      01520002
                                                                        01530002
           READ ENTRADA INTO WS-REG-ENTRADA                             01540002
                        AT END SET WS-FIN-LECTURA TO TRUE.              01550002
                                                                        01560002
           EVALUATE WS-ENT-CODE                                         01570002
             WHEN '00'                                                  01580002
                 MOVE WS-NRO-SUCURSAL     TO WS-SUCURSAL-ANT            01590002
                 MOVE WS-NOMBRE-SUC       TO WS-NOMBRE-SUC-ANT          01600002
                 ADD 1 TO WS-CANT-CTAS-SUC                              01610002
                          WS-CANT-LEIDAS                                01620002
                 ADD WS-SUC-IMPORTE TO WS-IMPORTE-SUC                   01630002
                                                                        01640002
              WHEN '10'                                                 01650002
              DISPLAY '* ARCHIVO ENTRADA VACÍO      ' WS-ENT-CODE       01660002
              MOVE 9999 TO RETURN-CODE                                  01670002
              SET WS-FIN-LECTURA TO TRUE                                01680002
                                                                        01690002
           WHEN OTHER                                                   01700002
              DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       01710002
              MOVE 9999 TO RETURN-CODE                                  01720002
              SET WS-FIN-LECTURA TO TRUE                                01730002
                                                                        01740002
           END-EVALUATE.                                                01750002
                                                                        01760002
       F-1000-INICIO.   EXIT.                                           01770002
                                                                        01780002
      **************************************                            01790002
      *                                    *                            01800002
      *  CUERPO PRINCIPAL DE PROCESOS      *                            01810002
      *  LECTURA FILE INPUT CLASIFICADO    *                            01820002
      *  GRABACION SALIDA CON LOS CAMPOS   *                            01830002
      *  DE LAY-OUT GENERAL                *                            01840002
      *                                    *                            01850002
      **************************************                            01860002
       2000-PROCESO.                                                    01870002
                                                                        01880002
           EVALUATE  WS-ESTADO-CUENTA                                   01890002
               WHEN  ZERO                                               01900002
                  ADD 1 TO WS-CANT-CTAS-SUC                             01910002
                  ADD WS-SUC-IMPORTE TO WS-IMPORTE-SUC                   01920002
                                                                        01930002
               WHEN OTHER                                               01940002
                  CONTINUE                                              01950002
                                                                        01960002
           END-EVALUATE                                                 01970002
                                                                        01980002
           READ ENTRADA INTO WS-REG-ENTRADA                             01990002
                        AT END SET WS-FIN-LECTURA TO TRUE.              02000002
                                                                        02010002
           EVALUATE WS-ENT-CODE                                         02020002
             WHEN '00'                                                  02030002
           ADD 1   TO     WS-CANT-LEIDAS                                02040002
           PERFORM 2200-SEGUIR-PROCESO                                  02050002
                      THRU F-2200-SEGUIR-PROCESO                        02060002
                                                                        02070002
              WHEN '10'                                                 02080002
              SET WS-FIN-LECTURA TO TRUE                                02090002
              PERFORM 2100-ULTIMO-REGISTRO                              02100002
                THRU  F-2100-ULTIMO-REGISTRO                            02110002
                                                                        02120002
           WHEN OTHER                                                   02130002
              DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       02140002
              MOVE 9999 TO RETURN-CODE                                  02150002
              SET WS-FIN-LECTURA TO TRUE                                02160002
                                                                        02170002
           END-EVALUATE.                                                02180002
                                                                        02190002
       F-2000-PROCESO. EXIT.                                            02200002
                                                                        02210002
      **************************************                            02220002
      *                                    *                            02230002
      *  WRITE ULTIMO REGISTRO DE SALIDA   *                            02240002
      *                                    *                            02250002
      **************************************                            02260002
       2100-ULTIMO-REGISTRO.                                            02270002
                                                                        02280002
           PERFORM 2230-CORTE-SUCURSAL                                  02290002
                     THRU F-2230-CORTE-SUCURSAL                         02300002
                                                                        02310002
           INITIALIZE WS-REG-SALIDA-L.                                  02320002
                                                                        02330002
           MOVE   WS-GUION             TO WS-SAL-GUION-MM               02340002
                                          WS-SAL-GUION-DD.              02350002
           MOVE   20                   TO WS-SAL-SIGLO.                 02360002
           MOVE   WS-FECHA-AA          TO WS-SAL-AA.                    02370002
           MOVE   WS-FECHA-MM          TO WS-SAL-MM.                    02380002
           MOVE   WS-FECHA-DD          TO WS-SAL-DD.                    02390002
           MOVE   WS-TOTAL-CTAS        TO WS-SAL-TITULO.                02400002
           MOVE   WS-CANT-CTAS-BCO     TO WS-SAL-TOTAL-CTAS.            02410002
           MOVE   WS-IMPORTE-TOTAL     TO WS-SAL-TOTAL-IMP.             02420002
                                                                        02430002
           WRITE REG-SALIDA FROM WS-REG-SALIDA-L                        02440002
              IF WS-SAL-CODE IS NOT EQUAL '00'                          02450002
                DISPLAY '* ERROR EN WRITE LAST SALIDA  = '              02460002
                                            WS-SAL-CODE                 02470002
                MOVE 9999 TO RETURN-CODE                                02480002
             END-IF.                                                    02490002
                                                                        02500002
           DISPLAY '************************** '                        02510002
           DISPLAY 'TOTAL DE CUENTAS ACTIVAS:  ' WS-SAL-TOTAL-CTAS.     02520002
           DISPLAY 'TOTAL IMPORTE GENERAL   :  ' WS-SAL-TOTAL-IMP.      02530002
           MOVE WS-CANT-LEIDAS        TO WS-EDIT-LEIDAS.                02540002
           DISPLAY "CANTIDAD CUENTAS LEIDAS :  "  WS-EDIT-LEIDAS.       02550002
                                                                        02560002
       F-2100-ULTIMO-REGISTRO. EXIT.                                    02570002
                                                                        02580002
       2200-SEGUIR-PROCESO.                                             02590002
                                                                        02600002
           IF WS-NRO-SUCURSAL EQUAL WS-SUCURSAL-ANT                     02610002
              NEXT SENTENCE                                             02620002
           ELSE                                                         02630002
                 PERFORM 2230-CORTE-SUCURSAL THRU                       02640002
                       F-2230-CORTE-SUCURSAL                            02650002
           END-IF.                                                      02660002
                                                                        02670002
       F-2200-SEGUIR-PROCESO. EXIT.                                     02680002
                                                                        02690002
      **************************************                            02700002
      *                                    *                            02710002
      *  PARRAFO QUE CONTROLA EL CORTE     *                            02720002
      *  DE SUCURSAL                       *                            02730002
      *                                    *                            02740002
      **************************************                            02750002
       2230-CORTE-SUCURSAL.                                             02760002
           MOVE SPACES             TO     WS-REG-SALIDA                 02770002
                                                                        02780002
           MOVE WS-SUCURSAL-ANT    TO     WS-SAL-SUCURSAL               02790002
           MOVE WS-NOMBRE-SUC-ANT  TO     WS-SAL-NOMBRE-SUC             02800002
           MOVE WS-CANT-CTAS-SUC   TO     WS-SAL-CANT-CUENTAS           02810002
           MOVE WS-IMPORTE-SUC     TO     WS-SAL-IMPORTE-SUC            02820002
                                                                        02830002
           DISPLAY "SUCURSAL:  " WS-SAL-SUCURSAL                        02840002
           DISPLAY "NOMBRE:    " WS-SAL-NOMBRE-SUC                      02850002
           DISPLAY "CUENTAS ACTIVAS:  "  WS-SAL-CANT-CUENTAS            02860002
           DISPLAY "IMPORTE TOTAL:    "  WS-SAL-IMPORTE-SUC             02870002
                                                                        02880002
           MOVE WS-NRO-SUCURSAL   TO       WS-SUCURSAL-ANT              02890002
           MOVE WS-NOMBRE-SUC     TO       WS-NOMBRE-SUC-ANT            02900002
           ADD  WS-CANT-CTAS-SUC  TO       WS-CANT-CTAS-BCO             02910002
           ADD  WS-IMPORTE-SUC    TO       WS-IMPORTE-TOTAL             02920002
           MOVE ZEROS             TO       WS-CANT-CTAS-SUC             02930002
                                          WS-IMPORTE-SUC                02940002
                                                                        02950002
           WRITE REG-SALIDA FROM WS-REG-SALIDA                          02960002
           IF WS-SAL-CODE IS NOT EQUAL '00'                             02970002
                DISPLAY '* ERROR EN WRITE SALIDA  = '                   02980002
                                            WS-SAL-CODE                 02990002
                MOVE 9999 TO RETURN-CODE                                03000002
                SET WS-FIN-LECTURA TO TRUE                              03010002
           END-IF.                                                      03020002
                                                                        03030002
       F-2230-CORTE-SUCURSAL. EXIT.                                     03040002
                                                                        03050002
      **************************************                            03060002
      *                                    *                            03070002
      *  CUERPO FINAL CIERRE DE FILES      *                            03080002
      *                                    *                            03090002
      **************************************                            03100002
       9999-FINAL.                                                      03110002
                                                                        03120002
           CLOSE ENTRADA                                                03130002
              IF WS-ENT-CODE IS NOT EQUAL '00'                          03140002
                DISPLAY '* ERROR EN CLOSE ENTRADA = '                   03150002
                                            WS-ENT-CODE                 03160002
                MOVE 9999 TO RETURN-CODE                                03170002
                SET WS-FIN-LECTURA TO TRUE                              03180002
             END-IF.                                                    03190002
                                                                        03200002
           CLOSE  SALIDA                                                03210002
              IF WS-SAL-CODE IS NOT EQUAL '00'                          03220002
                DISPLAY '* ERROR EN CLOSE SALIDA   ='                   03230002
                                            WS-SAL-CODE                 03240002
                MOVE 9999 TO RETURN-CODE                                03250002
                SET WS-FIN-LECTURA TO TRUE                              03260002
           END-IF.                                                      03270002
                                                                        03280002
       F-9999-FINAL.                                                    03290002
           EXIT.                                                        03300002