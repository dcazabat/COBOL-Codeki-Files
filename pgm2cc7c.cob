 000100        IDENTIFICATION DIVISION.                                         
 000200        PROGRAM-ID PGM2CC7C.                                             
 000210        AUTHOR.        D. CAZABAT.                                       
 000220        INSTALLATION.  CURSO CODEKI.                                     
 000230        DATE-WRITTEN.  17/04/2025.                                       
 000240        DATE-COMPILED. 17/04/2025.                                       
 000300       **********************************************************        
 000400       *                                                        *        
 000500       *  PROGRAMA PARA EMITIR TOTAL CTAS ACTIVAS POR SUCURSAL  *        
 000600       *  ACTIVAS POR SUC Y  TOTAL CTAS ACTIVAS BCO             *        
 000700       *  LA ENTRADA CLASIFICADA X SUCURSAL                     *        
 000800       *                                                        *        
 000900       **********************************************************        
 001000       *      MANTENIMIENTO DE PROGRAMA                         *        
 001100       **********************************************************        
 001200       *  FECHA   *    DETALLE        * COD *                            
 001300       **************************************                            
 001400       *          *                   *     *                            
 001500       *          *                   *     *                            
 001600       **************************************                            
 001700        ENVIRONMENT DIVISION.                                            
 001800        INPUT-OUTPUT SECTION.                                            
 001900        FILE-CONTROL.                                                    
 002000              SELECT ENTRADA ASSIGN DDENTRA                              
 002100                     FILE STATUS IS WS-ENT-CODE.                         
 002200                                                                         
 002300              SELECT SALIDA  ASSIGN DDSALID                              
 002400                     FILE STATUS IS WS-SAL-CODE.                         
 002400                     FILE STATUS IS WS-SAL-CODE.                         
 002500                                                                         
 002600        DATA DIVISION.                                                   
 002700        FILE SECTION.                                                    
 002800        FD ENTRADA                                                       
 002900             BLOCK CONTAINS 0 RECORDS                                    
 003000             RECORDING MODE IS F.                                        
 003100                                                                         
 003200        01 REG-ENTRADA    PIC X(30).                                     
 003300                                                                         
 003400        FD SALIDA                                                        
 003500             BLOCK CONTAINS 0 RECORDS                                    
 003600             RECORDING MODE IS F.                                        
 003700                                                                         
 003800        01 REG-SALIDA     PIC X(80).                                     
 003900                                                                         
 004000       **************************************                            
 004100        WORKING-STORAGE SECTION.                                         
 004200       **************************************                            
 004300        77  FILLER        PIC X(26) VALUE '* INICIO WORKING-STORAGE *'.  
 004400        77  FILLER        PIC X(26) VALUE '* CODIGOS RETORNO FILES  *'.  
 004500        77  WS-ENT-CODE      PIC XX    VALUE SPACES.                     
 004600        77  WS-SAL-CODE      PIC XX    VALUE SPACES.                     
 004700                                                                         
 004800        01  WS-STATUS-FIN    PIC X.                                      
 004900            88  WS-FIN-LECTURA         VALUE 'Y'.                        
 005000            88  WS-NO-FIN-LECTURA      VALUE 'N'.                        
 005100                                                                         
 005200        77  FILLER       PIC X(26) VALUE '* LAYOUT ENTRADA MESES   *'.   
 005300       **************************************                            
 005400                COPY CPSUCU.                                             
 005500       **************************************                            
 005600                                                                         
 005700       **************************************                            
 005800       * LAY-OUT GENERAL REGISTRO DE SALIDA                              
 005900       **************************************                            
 006000        01  WS-REG-SALIDA.                                               
 006100            03  WS-SAL-SUCURSAL         PIC 99      VALUE ZEROS.         
 006200            03  WS-SAL-NOMBRE-SUC       PIC X(30)   VALUE SPACES.        
 006300            03  WS-SAL-CANT-CUENTAS     PIC ZZZ9    VALUE ZEROS.         
 006400            03  FILLER                  PIC X(44)   VALUE SPACES.        
 006500                                                                         
 006600       **************************************                            
 006700       * LAY-OUT ULTIMO REGISTRO DE SALIDA                               
 006800       **************************************                            
 006900                                                                         
 007000        01  FILLER        REDEFINES    WS-REG-SALIDA.                    
 007100            03  WS-REG-SALIDA-L.                                         
 007200              05  WS-SAL-FECHA.                                          
 007300                  07 WS-SAL-DD         PIC 99.                           
 007400                  07 WS-SAL-GUION-DD   PIC X.                            
 007500                  07 WS-SAL-MM         PIC 99.                           
 007600                  07 WS-SAL-GUION-MM   PIC X.                            
 007700                  07 WS-SAL-SIGLO      PIC   99.                         
 007800                  07 WS-SAL-AA         PIC   99.                         
 007900              05  WS-SAL-TITULO        PIC X(30).                        
 008000              05  WS-SAL-TOTAL         PIC ZZZ9.                         
 008100              05  FILLER               PIC X(36).                        
 008200                                                                         
 008300                                                                         
 008400       ********  TOTAL CTAS X SUCURSAL ******                            
 008500        77  WS-SUCURSAL-ANT      PIC 9(3)        VALUE     ZEROS.        
 008600        77  WS-NOMBRE-SUC-ANT    PIC X(30)       VALUE     SPACES.       
 008700        77  WS-CANT-CTAS-SUC     PIC 9(3)        VALUE     ZEROS.        
 008800        77  WS-EDIT-LEIDAS       PIC ZZZ9        VALUE     ZEROS.        
 008900        77  WS-CANT-LEIDAS       PIC 9(4)        VALUE     ZEROS.        
 009000       ********  TOTAL CTAS X BANCO    ******                            
 009100        77  WS-CANT-CTAS-BCO     PIC 9(4)        VALUE     ZEROS.        
 009200       ********     CONSTANTES       ***************                     
 009300        77  WS-TOTAL             PIC X(30)                               
 009400                       VALUE    ' TOTAL CUENTAS ACTIVAS BANCO'.          
 009500        77  WS-GUION             PIC X     VALUE '-'.                    
 009600                                                                         
 009700       ********     FECHA DE PROCESO ***************                     
 009800        01  WS-FECHA.                                                    
 009900            03  WS-FECHA-AA      PIC 99            VALUE ZEROS.          
 010000            03  WS-FECHA-MM      PIC 99            VALUE ZEROS.          
 010100            03  WS-FECHA-DD      PIC 99            VALUE ZEROS.          
 010200                                                                         
 010300        77  FILLER        PIC X(26) VALUE '* FINAL  WORKING-STORAGE *'.  
 010400                                                                         
 010500       ***************************************************************.  
 010600        PROCEDURE DIVISION.                                              
 010700       **************************************                            
 010800       *                                    *                            
 010900       *  CUERPO PRINCIPAL DEL PROGRAMA     *                            
 011000       *                                    *                            
 011100       **************************************                            
 011200        MAIN-PROGRAM.                                                    
 011300                                                                         
 011400            PERFORM 1000-INICIO  THRU   F-1000-INICIO.                   
 011500                                                                         
 011600            PERFORM 2000-PROCESO  THRU  F-2000-PROCESO                   
 011700                    UNTIL WS-FIN-LECTURA.                                
 011800                                                                         
 011900                                                                         
 012000            PERFORM 9999-FINAL    THRU  F-9999-FINAL.                    
 012100                                                                         
 012200        F-MAIN-PROGRAM. GOBACK.                                          
 012300                                                                         
 012300                                                                         
 012400       **************************************                            
 012500       *                                    *                            
 012600       *  CUERPO INICIO APERTURA ARCHIVOS   *                            
 012700       *                                    *                            
 012800       **************************************                            
 012900        1000-INICIO.                                                     
 013000            ACCEPT WS-FECHA FROM DATE.                                   
 013100            DISPLAY 'FECHA:    '  WS-FECHA                               
 013200                                                                         
 013300                                                                         
 013400            SET WS-NO-FIN-LECTURA TO TRUE.                               
 013500                                                                         
 013600            OPEN INPUT  ENTRADA.                                         
 013700            IF WS-ENT-CODE IS NOT EQUAL '00'                             
 013800               DISPLAY '* ERROR EN OPEN ENTRADA = ' WS-ENT-CODE          
 013900               MOVE 9999 TO RETURN-CODE                                  
 014000               SET  WS-FIN-LECTURA TO TRUE                               
 014100            END-IF.                                                      
 014200                                                                         
 014300            OPEN OUTPUT SALIDA.                                          
 014400            IF WS-SAL-CODE IS NOT EQUAL '00'                             
 014500               DISPLAY '* ERROR EN OPEN SALIDA  = ' WS-SAL-CODE          
 014600               MOVE 9999 TO RETURN-CODE                                  
 014700               SET  WS-FIN-LECTURA TO TRUE                               
 014800            END-IF.                                                      
 014900                                                                         
 015000       **************************************                            
 015100       *  PRIMER LECTURA PARA CORTE CONTROL *                            
 015200       **************************************                            
 015300                                                                         
 015400            READ ENTRADA INTO WS-REG-ENTRADA                             
 015500                         AT END SET WS-FIN-LECTURA TO TRUE.              
 015600                                                                         
 015600                                                                         
 015700            EVALUATE WS-ENT-CODE                                         
 015800              WHEN '00'                                                  
 015900                  MOVE WS-NRO-SUCURSAL     TO WS-SUCURSAL-ANT            
 016000                  MOVE WS-NOMBRE-SUC       TO WS-NOMBRE-SUC-ANT          
 016100                  ADD 1 TO WS-CANT-CTAS-SUC                              
 016200                           WS-CANT-LEIDAS                                
 016300                                                                         
 016400               WHEN '10'                                                 
 016500               DISPLAY '* ARCHIVO ENTRADA VACÍO      ' WS-ENT-CODE       
 016600               MOVE 9999 TO RETURN-CODE                                  
 016700               SET WS-FIN-LECTURA TO TRUE                                
 016800                                                                         
 016900            WHEN OTHER                                                   
 017000               DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       
 017100               MOVE 9999 TO RETURN-CODE                                  
 017200               SET WS-FIN-LECTURA TO TRUE                                
 017300                                                                         
 017400            END-EVALUATE.                                                
 017500                                                                         
 017600        F-1000-INICIO.   EXIT.                                           
 017700                                                                         
 017800       **************************************                            
 017900       *                                    *                            
 018000       *  CUERPO PRINCIPAL DE PROCESOS      *                            
 018100       *  LECTURA FILE INPUT CLASIFICADO    *                            
 018200       *  GRABACION SALIDA CON LOS CAMPOS   *                            
 018300       *  DE LAY-OUT GENERAL                *                            
 018400       *                                    *                            
 018500       **************************************                            
 018600        2000-PROCESO.                                                    
 018700                                                                         
 018800            EVALUATE  WS-ESTADO-CUENTA                                   
 018900                WHEN  ZERO                                               
 018900                WHEN  ZERO                                               
 019000                   ADD 1 TO WS-CANT-CTAS-SUC                             
 019100                                                                         
 019200                WHEN OTHER                                               
 019300                   CONTINUE                                              
 019400                                                                         
 019500            END-EVALUATE                                                 
 019600                                                                         
 019700            READ ENTRADA INTO WS-REG-ENTRADA                             
 019800                         AT END SET WS-FIN-LECTURA TO TRUE.              
 019900                                                                         
 020000            EVALUATE WS-ENT-CODE                                         
 020100              WHEN '00'                                                  
 020200                                                                         
 020300            ADD 1   TO     WS-CANT-LEIDAS                                
 020400            PERFORM 2200-SEGUIR-PROCESO                                  
 020500                       THRU F-2200-SEGUIR-PROCESO                        
 020600                                                                         
 020700               WHEN '10'                                                 
 020800               SET WS-FIN-LECTURA TO TRUE                                
 020900               PERFORM 2100-ULTIMO-REGISTRO                              
 021000                 THRU  F-2100-ULTIMO-REGISTRO                            
 021100                                                                         
 021200            WHEN OTHER                                                   
 021300               DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       
 021400               MOVE 9999 TO RETURN-CODE                                  
 021500               SET WS-FIN-LECTURA TO TRUE                                
 021600                                                                         
 021700            END-EVALUATE.                                                
 021800                                                                         
 021900                                                                         
 022000        F-2000-PROCESO. EXIT.                                            
 022100                                                                         
 022200       **************************************                            
 022300       *                                    *                            
 022400       *  WRITE ULTIMO REGISTRO DE SALIDA   *                            
 022500       *                                    *                            
 022600       **************************************                            
 022700        2100-ULTIMO-REGISTRO.                                            
 022800                                                                         
 022900            PERFORM 2230-CORTE-SUCURSAL                                  
 023000                      THRU F-2230-CORTE-SUCURSAL                         
 023100                                                                         
 023200       *CAMBIE WS-REG-SALIDA X WS-REG-SALIDA-L                           
 023300            INITIALIZE WS-REG-SALIDA-L.                                  
 023400                                                                         
 023500            MOVE   WS-GUION             TO WS-SAL-GUION-MM               
 023600                                           WS-SAL-GUION-DD.              
 023700            MOVE   20                   TO WS-SAL-SIGLO.                 
 023800            MOVE   WS-FECHA-AA          TO WS-SAL-AA.                    
 023900            MOVE   WS-FECHA-MM          TO WS-SAL-MM.                    
 024000            MOVE   WS-FECHA-DD          TO WS-SAL-DD.                    
 024100            MOVE   WS-TOTAL             TO WS-SAL-TITULO.                
 024200            MOVE   WS-CANT-CTAS-BCO     TO WS-SAL-TOTAL.                 
 024300                                                                         
 024400            WRITE REG-SALIDA FROM WS-REG-SALIDA-L                        
 024500               IF WS-SAL-CODE IS NOT EQUAL '00'                          
 024600                 DISPLAY '* ERROR EN WRITE LAST SALIDA  = '              
 024700                                             WS-SAL-CODE                 
 024800                 MOVE 9999 TO RETURN-CODE                                
 024900              END-IF.                                                    
 025000       *MUESTRA EL TOTAL GENERAL A SALIDA POR CONSOLA                    
 025100            DISPLAY '************************** '                        
 025200            DISPLAY 'TOTAL DE CUENTAS ACTIVAS:  ' WS-SAL-TOTAL.          
 025300            MOVE WS-CANT-LEIDAS        TO WS-EDIT-LEIDAS.                
 025400            DISPLAY "CANTIDAD CUENTAS LEIDAS :  "  WS-EDIT-LEIDAS.       
 025500                                                                         
 025600        F-2100-ULTIMO-REGISTRO. EXIT.                                    
 025700                                                                         
 025800        2200-SEGUIR-PROCESO.                                             
 025900                                                                         
 026000            IF WS-NRO-SUCURSAL EQUAL WS-SUCURSAL-ANT                     
 026100               NEXT SENTENCE                                             
 026200            ELSE                                                         
 026300                  PERFORM 2230-CORTE-SUCURSAL THRU                       
 026400                        F-2230-CORTE-SUCURSAL                            
 026500            END-IF.                                                      
 026600                                                                         
 026700        F-2200-SEGUIR-PROCESO. EXIT.                                     
 026800                                                                         
 026900       **************************************                            
 027000       *                                    *                            
 027100       *  PARRAFO QUE CONTROLA EL CORTE     *                            
 027200       *  DE SUCURSAL                       *                            
 027300       *                                    *                            
 027400       **************************************                            
 027500        2230-CORTE-SUCURSAL.                                             
 027600            MOVE SPACES             TO     WS-REG-SALIDA                 
 027700                                                                         
 027800            MOVE WS-SUCURSAL-ANT    TO     WS-SAL-SUCURSAL               
 027900            MOVE WS-NOMBRE-SUC-ANT  TO     WS-SAL-NOMBRE-SUC             
 028000            MOVE WS-CANT-CTAS-SUC   TO     WS-SAL-CANT-CUENTAS           
 028100                                                                         
 028200       ****************************************************              
 028300       *      MUESTRO TOTALES GRABADOS EN SALIDA          *              
 028400       ****************************************************              
 028500            DISPLAY "SUCURSAL:  " WS-SAL-SUCURSAL                        
 028600            DISPLAY "NOMBRE:    " WS-SAL-NOMBRE-SUC                      
 028700            DISPLAY "CANTIDAD CUENTAS ACTIVAS:  "  WS-SAL-CANT-CUENTAS   
 028800       *                                                                 
 028900       ****************************************************              
 029000       * GUARDO LA SUCURSAL PARA PRÓXIMO CORTE SUCURSAL                  
 029100       ****************************************************              
 029200                                                                         
 029300            MOVE WS-NRO-SUCURSAL   TO       WS-SUCURSAL-ANT              
 029400            MOVE WS-NOMBRE-SUC     TO       WS-NOMBRE-SUC-ANT            
 029500            ADD  WS-CANT-CTAS-SUC  TO       WS-CANT-CTAS-BCO             
 029600            MOVE ZEROS             TO       WS-CANT-CTAS-SUC             
 029700                                                                         
 029800            WRITE REG-SALIDA FROM WS-REG-SALIDA                          
 029900            IF WS-SAL-CODE IS NOT EQUAL '00'                             
 030000                 DISPLAY '* ERROR EN WRITE SALIDA  = '                   
 030100                                             WS-SAL-CODE                 
 030200                 MOVE 9999 TO RETURN-CODE                                
 030300                 SET WS-FIN-LECTURA TO TRUE                              
 030400            END-IF.                                                      
 030500                                                                         
 030600        F-2230-CORTE-SUCURSAL. EXIT.                                     
 030700                                                                         
 030800       **************************************                            
 030900       *                                    *                            
 031000       *  CUERPO FINAL CIERRE DE FILES      *                            
 031100       *                                    *                            
 031200       **************************************                            
 031300        9999-FINAL.                                                      
 031400                                                                         
 031500            CLOSE ENTRADA                                                
 031600               IF WS-ENT-CODE IS NOT EQUAL '00'                          
 031700                 DISPLAY '* ERROR EN CLOSE ENTRADA = '                   
 031800                                             WS-ENT-CODE                 
 031900                 MOVE 9999 TO RETURN-CODE                                
 032000                 SET WS-FIN-LECTURA TO TRUE                              
 032100              END-IF.                                                    
 032200                                                                         
 032300            CLOSE  SALIDA                                                
 032400               IF WS-SAL-CODE IS NOT EQUAL '00'                          
 032500                 DISPLAY '* ERROR EN CLOSE SALIDA   ='                   
 032600                                             WS-SAL-CODE                 
 032700                 MOVE 9999 TO RETURN-CODE                                
 032800                 SET WS-FIN-LECTURA TO TRUE                              
 032900            END-IF.                                                      
 033000                                                                         
 033100        F-9999-FINAL.                                                    
 033200            EXIT.                                                        
 033300       *                                                                 