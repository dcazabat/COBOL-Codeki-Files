000100        IDENTIFICATION DIVISION.                                         
000200        PROGRAM-ID PGM2CC7C.                                             
000210        AUTHOR.        D. CAZABAT.                                       
000220        INSTALLATION.  CURSO CODEKI.                                     
000230        DATE-WRITTEN.  17/04/2025.                                       
000240        DATE-COMPILED. 17/04/2025.                                       
000300       **********************************************************        
000400       *                                                        *        
000500       *  PROGRAMA PARA EMITIR TOTAL CTAS ACTIVAS POR SUCURSAL  *        
000600       *  Y TOTAL DE IMPORTES POR SUCURSAL Y GENERAL            *        
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
006400            03  WS-SAL-IMPORTE-SUC      PIC ZZ.ZZZ.ZZ9 VALUE ZEROS.      
006500            03  FILLER                  PIC X(35)   VALUE SPACES.        
006600                                                                         
006700       **************************************                            
006800       * LAY-OUT ULTIMO REGISTRO DE SALIDA                               
006900       **************************************                            
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
008000              05  WS-SAL-TOTAL-CTAS    PIC ZZZ9.                         
008100              05  WS-SAL-TOTAL-IMP     PIC ZZ.ZZZ.ZZ9.                   
008200              05  FILLER               PIC X(27).                        
008300                                                                         
008400       ********  TOTAL CTAS X SUCURSAL ******                            
008500        77  WS-SUCURSAL-ANT      PIC 9(3)        VALUE     ZEROS.        
008600        77  WS-NOMBRE-SUC-ANT    PIC X(30)       VALUE     SPACES.       
008700        77  WS-CANT-CTAS-SUC     PIC 9(3)        VALUE     ZEROS.        
008800        77  WS-IMPORTE-SUC       PIC 9(9)V99     VALUE     ZEROS.        
008900        77  WS-EDIT-LEIDAS       PIC ZZZ9        VALUE     ZEROS.        
009000        77  WS-CANT-LEIDAS       PIC 9(4)        VALUE     ZEROS.        
009100       ********  TOTAL CTAS X BANCO    ******                            
009200        77  WS-CANT-CTAS-BCO     PIC 9(4)        VALUE     ZEROS.        
009300        77  WS-IMPORTE-TOTAL     PIC 9(9)V99     VALUE     ZEROS.        
009400       ********     CONSTANTES       ***************                     
009500        77  WS-TOTAL-CTAS        PIC X(30)                               
009600                       VALUE    ' TOTAL CUENTAS ACTIVAS BANCO'.          
009700        77  WS-TOTAL-IMP         PIC X(30)                               
009800                       VALUE    ' TOTAL IMPORTE GENERAL      '.          
009900        77  WS-GUION             PIC X     VALUE '-'.                    
010000                                                                         
010100       ********     FECHA DE PROCESO ***************                     
010200        01  WS-FECHA.                                                    
010300            03  WS-FECHA-AA      PIC 99            VALUE ZEROS.          
010400            03  WS-FECHA-MM      PIC 99            VALUE ZEROS.          
010500            03  WS-FECHA-DD      PIC 99            VALUE ZEROS.          
010600                                                                         
010700        77  FILLER        PIC X(26) VALUE '* FINAL  WORKING-STORAGE *'.  
010800                                                                         
010900       ***************************************************************.  
011000        PROCEDURE DIVISION.                                              
011100       **************************************                            
011200       *                                    *                            
011300       *  CUERPO PRINCIPAL DEL PROGRAMA     *                            
011400       *                                    *                            
011500       **************************************                            
011600        MAIN-PROGRAM.                                                    
011700                                                                         
011800            PERFORM 1000-INICIO  THRU   F-1000-INICIO.                   
011900                                                                         
012000            PERFORM 2000-PROCESO  THRU  F-2000-PROCESO                   
012100                    UNTIL WS-FIN-LECTURA.                                
012200                                                                         
012300            PERFORM 9999-FINAL    THRU  F-9999-FINAL.                    
012400                                                                         
012500        F-MAIN-PROGRAM. GOBACK.                                          
012600                                                                         
012700       **************************************                            
012800       *                                    *                            
012900       *  CUERPO INICIO APERTURA ARCHIVOS   *                            
013000       *                                    *                            
013100       **************************************                            
013200        1000-INICIO.                                                     
013300            ACCEPT WS-FECHA FROM DATE.                                   
013400            DISPLAY 'FECHA:    '  WS-FECHA                               
013500                                                                         
013600            SET WS-NO-FIN-LECTURA TO TRUE.                               
013700                                                                         
013800            OPEN INPUT  ENTRADA.                                         
013900            IF WS-ENT-CODE IS NOT EQUAL '00'                             
014000               DISPLAY '* ERROR EN OPEN ENTRADA = ' WS-ENT-CODE          
014100               MOVE 9999 TO RETURN-CODE                                  
014200               SET  WS-FIN-LECTURA TO TRUE                               
014300            END-IF.                                                      
014400                                                                         
014500            OPEN OUTPUT SALIDA.                                          
014600            IF WS-SAL-CODE IS NOT EQUAL '00'                             
014700               DISPLAY '* ERROR EN OPEN SALIDA  = ' WS-SAL-CODE          
014800               MOVE 9999 TO RETURN-CODE                                  
014900               SET  WS-FIN-LECTURA TO TRUE                               
015000            END-IF.                                                      
015100                                                                         
015200            READ ENTRADA INTO WS-REG-ENTRADA                             
015300                         AT END SET WS-FIN-LECTURA TO TRUE.              
015400                                                                         
015500            EVALUATE WS-ENT-CODE                                         
015600              WHEN '00'                                                  
015700                  MOVE WS-NRO-SUCURSAL     TO WS-SUCURSAL-ANT            
015800                  MOVE WS-NOMBRE-SUC       TO WS-NOMBRE-SUC-ANT          
015900                  ADD 1 TO WS-CANT-CTAS-SUC                              
016000                           WS-CANT-LEIDAS                                
016100                  ADD WS-SUC-IMPORTE TO WS-IMPORTE-SUC                   
016200                                                                         
016300               WHEN '10'                                                 
016400               DISPLAY '* ARCHIVO ENTRADA VACÍO      ' WS-ENT-CODE       
016500               MOVE 9999 TO RETURN-CODE                                  
016600               SET WS-FIN-LECTURA TO TRUE                                
016700                                                                         
016800            WHEN OTHER                                                   
016900               DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       
017000               MOVE 9999 TO RETURN-CODE                                  
017100               SET WS-FIN-LECTURA TO TRUE                                
017200                                                                         
017300            END-EVALUATE.                                                
017400                                                                         
017500        F-1000-INICIO.   EXIT.                                           
017600                                                                         
017700       **************************************                            
017800       *                                    *                            
017900       *  CUERPO PRINCIPAL DE PROCESOS      *                            
018000       *  LECTURA FILE INPUT CLASIFICADO    *                            
018100       *  GRABACION SALIDA CON LOS CAMPOS   *                            
018200       *  DE LAY-OUT GENERAL                *                            
018300       *                                    *                            
018400       **************************************                            
018500        2000-PROCESO.                                                    
018600                                                                         
018700            EVALUATE  WS-ESTADO-CUENTA                                   
018800                WHEN  ZERO                                               
018900                   ADD 1 TO WS-CANT-CTAS-SUC                             
019000                   ADD WS-SUC-IMPORTE TO WS-IMPORTE-SUC                  
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
020200            ADD 1   TO     WS-CANT-LEIDAS                                
020300            PERFORM 2200-SEGUIR-PROCESO                                  
020400                       THRU F-2200-SEGUIR-PROCESO                        
020500                                                                         
020600               WHEN '10'                                                 
020700               SET WS-FIN-LECTURA TO TRUE                                
020800               PERFORM 2100-ULTIMO-REGISTRO                              
020900                 THRU  F-2100-ULTIMO-REGISTRO                            
021000                                                                         
021100            WHEN OTHER                                                   
021200               DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       
021300               MOVE 9999 TO RETURN-CODE                                  
021400               SET WS-FIN-LECTURA TO TRUE                                
021500                                                                         
021600            END-EVALUATE.                                                
021700                                                                         
021800        F-2000-PROCESO. EXIT.                                            
021900                                                                         
022000       **************************************                            
022100       *                                    *                            
022200       *  WRITE ULTIMO REGISTRO DE SALIDA   *                            
022300       *                                    *                            
022400       **************************************                            
022500        2100-ULTIMO-REGISTRO.                                            
022600                                                                         
022700            PERFORM 2230-CORTE-SUCURSAL                                  
022800                      THRU F-2230-CORTE-SUCURSAL                         
022900                                                                         
023000            INITIALIZE WS-REG-SALIDA-L.                                  
023100                                                                         
023200            MOVE   WS-GUION             TO WS-SAL-GUION-MM               
023300                                           WS-SAL-GUION-DD.              
023400            MOVE   20                   TO WS-SAL-SIGLO.                 
023500            MOVE   WS-FECHA-AA          TO WS-SAL-AA.                    
023600            MOVE   WS-FECHA-MM          TO WS-SAL-MM.                    
023700            MOVE   WS-FECHA-DD          TO WS-SAL-DD.                    
023800            MOVE   WS-TOTAL-CTAS        TO WS-SAL-TITULO.                
023900            MOVE   WS-CANT-CTAS-BCO     TO WS-SAL-TOTAL-CTAS.            
024000            MOVE   WS-IMPORTE-TOTAL     TO WS-SAL-TOTAL-IMP.             
024100                                                                         
024200            WRITE REG-SALIDA FROM WS-REG-SALIDA-L                        
024300               IF WS-SAL-CODE IS NOT EQUAL '00'                          
024400                 DISPLAY '* ERROR EN WRITE LAST SALIDA  = '              
024500                                             WS-SAL-CODE                 
024600                 MOVE 9999 TO RETURN-CODE                                
024700              END-IF.                                                    
024800                                                                         
024900            DISPLAY '************************** '                        
025000            DISPLAY 'TOTAL DE CUENTAS ACTIVAS:  ' WS-SAL-TOTAL-CTAS.     
025100            DISPLAY 'TOTAL IMPORTE GENERAL   :  ' WS-SAL-TOTAL-IMP.      
025200            MOVE WS-CANT-LEIDAS        TO WS-EDIT-LEIDAS.                
025300            DISPLAY "CANTIDAD CUENTAS LEIDAS :  "  WS-EDIT-LEIDAS.       
025400                                                                         
025500        F-2100-ULTIMO-REGISTRO. EXIT.                                    
025600                                                                         
025700        2200-SEGUIR-PROCESO.                                             
025800                                                                         
025900            IF WS-NRO-SUCURSAL EQUAL WS-SUCURSAL-ANT                     
026000               NEXT SENTENCE                                             
026100            ELSE                                                         
026200                  PERFORM 2230-CORTE-SUCURSAL THRU                       
026300                        F-2230-CORTE-SUCURSAL                            
026400            END-IF.                                                      
026500                                                                         
026600        F-2200-SEGUIR-PROCESO. EXIT.                                     
026700                                                                         
026800       **************************************                            
026900       *                                    *                            
027000       *  PARRAFO QUE CONTROLA EL CORTE     *                            
027100       *  DE SUCURSAL                       *                            
027200       *                                    *                            
027300       **************************************                            
027400        2230-CORTE-SUCURSAL.                                             
027500            MOVE SPACES             TO     WS-REG-SALIDA                 
027600                                                                         
027700            MOVE WS-SUCURSAL-ANT    TO     WS-SAL-SUCURSAL               
027800            MOVE WS-NOMBRE-SUC-ANT  TO     WS-SAL-NOMBRE-SUC             
027900            MOVE WS-CANT-CTAS-SUC   TO     WS-SAL-CANT-CUENTAS           
028000            MOVE WS-IMPORTE-SUC     TO     WS-SAL-IMPORTE-SUC            
028100                                                                         
028200            DISPLAY "SUCURSAL:  " WS-SAL-SUCURSAL                        
028300            DISPLAY "NOMBRE:    " WS-SAL-NOMBRE-SUC                      
028400            DISPLAY "CUENTAS ACTIVAS:  "  WS-SAL-CANT-CUENTAS            
028500            DISPLAY "IMPORTE TOTAL:    "  WS-SAL-IMPORTE-SUC             
028600                                                                         
028700            MOVE WS-NRO-SUCURSAL   TO       WS-SUCURSAL-ANT              
028800            MOVE WS-NOMBRE-SUC     TO       WS-NOMBRE-SUC-ANT            
028900            ADD  WS-CANT-CTAS-SUC  TO       WS-CANT-CTAS-BCO             
029000            ADD  WS-IMPORTE-SUC    TO       WS-IMPORTE-TOTAL             
029100            MOVE ZEROS             TO       WS-CANT-CTAS-SUC             
029200                                          WS-IMPORTE-SUC                 
029300                                                                         
029400            WRITE REG-SALIDA FROM WS-REG-SALIDA                          
029500            IF WS-SAL-CODE IS NOT EQUAL '00'                             
029600                 DISPLAY '* ERROR EN WRITE SALIDA  = '                   
029700                                             WS-SAL-CODE                 
029800                 MOVE 9999 TO RETURN-CODE                                
029900                 SET WS-FIN-LECTURA TO TRUE                              
030000            END-IF.                                                      
030100                                                                         
030200        F-2230-CORTE-SUCURSAL. EXIT.                                     
030300                                                                         
030400       **************************************                            
030500       *                                    *                            
030600       *  CUERPO FINAL CIERRE DE FILES      *                            
030700       *                                    *                            
030800       **************************************                            
030900        9999-FINAL.                                                      
031000                                                                         
031100            CLOSE ENTRADA                                                
031200               IF WS-ENT-CODE IS NOT EQUAL '00'                          
031300                 DISPLAY '* ERROR EN CLOSE ENTRADA = '                   
031400                                             WS-ENT-CODE                 
031500                 MOVE 9999 TO RETURN-CODE                                
031600                 SET WS-FIN-LECTURA TO TRUE                              
031700              END-IF.                                                    
031800                                                                         
031900            CLOSE  SALIDA                                                
032000               IF WS-SAL-CODE IS NOT EQUAL '00'                          
032100                 DISPLAY '* ERROR EN CLOSE SALIDA   ='                   
032200                                             WS-SAL-CODE                 
032300                 MOVE 9999 TO RETURN-CODE                                
032400                 SET WS-FIN-LECTURA TO TRUE                              
032500            END-IF.                                                      
032600                                                                         
032700        F-9999-FINAL.                                                    
032800            EXIT.                                                        
032900       *                                                                 