000100        IDENTIFICATION DIVISION.                                         
000110        PROGRAM-ID PGMCORTE.                                             
000120       **********************************************************        
000130       *                                                        *        
000140       *  PROGRAMA PARA EMITIR TOTAL CTAS ACTIVAS POR SUCURSAL  *        
000150       *  ACTIVAS POR SUC Y  TOTAL CTAS ACTIVAS BCO             *        
000151       *  LA ENTRADA CLASIFICADA X SUCURSAL                     *        
000160       *                                                        *        
000170       **********************************************************        
000180       *      MANTENIMIENTO DE PROGRAMA                         *        
000190       **********************************************************        
000191       *  FECHA   *    DETALLE        * COD *                            
000192       **************************************                            
000193       *          *                   *     *                            
000194       *          *                   *     *                            
000195       **************************************                            
000200        ENVIRONMENT DIVISION.                                            
000202        INPUT-OUTPUT SECTION.                                            
000203        FILE-CONTROL.                                                    
000204              SELECT ENTRADA ASSIGN DDENTRA                              
000205                     FILE STATUS IS WS-ENT-CODE.                         
000206                                                                         
000207              SELECT SALIDA  ASSIGN DDSALID                              
000208                     FILE STATUS IS WS-SAL-CODE.                         
000209                                                                         
000390        DATA DIVISION.                                                   
000391        FILE SECTION.                                                    
000392        FD ENTRADA                                                       
000393             BLOCK CONTAINS 0 RECORDS                                    
000394             RECORDING MODE IS F.                                        
000395                                                                         
000396        01 REG-ENTRADA    PIC X(30).                                     
000397                                                                         
000398        FD SALIDA                                                        
000399             BLOCK CONTAINS 0 RECORDS                                    
000400             RECORDING MODE IS F.                                        
000401                                                                         
000402        01 REG-SALIDA     PIC X(80).                                     
000403                                                                         
000404       **************************************                            
000405        WORKING-STORAGE SECTION.                                         
000406       **************************************                            
000407        77  FILLER        PIC X(26) VALUE '* INICIO WORKING-STORAGE *'.  
000408        77  FILLER        PIC X(26) VALUE '* CODIGOS RETORNO FILES  *'.  
000409        77  WS-ENT-CODE      PIC XX    VALUE SPACES.                     
000410        77  WS-SAL-CODE      PIC XX    VALUE SPACES.                     
000411                                                                         
000412        01  WS-STATUS-FIN    PIC X.                                      
000413            88  WS-FIN-LECTURA         VALUE 'Y'.                        
000414            88  WS-NO-FIN-LECTURA      VALUE 'N'.                        
000415                                                                         
000416        77  FILLER       PIC X(26) VALUE '* LAYOUT ENTRADA MESES   *'.   
000417       **************************************                            
000419        01  WS-REG-ENTRADA.                                              
000420            03  WS-NRO-SUCURSAL     PIC 9(02)   VALUE ZEROS.             
000421            03  WS-NOMBRE-SUC       PIC X(14)   VALUE SPACES.            
000422            03  WS-TIPO-CUENTA      PIC 9(01)   VALUE ZEROS.             
000424            03  WS-ESTADO-CUENTA    PIC 9       VALUE ZEROS.             
000425                88 WS-ACTIVA         VALUE  0.                           
000426                88 WS-BAJA           VALUE  1.                           
000427                88 WS-EMBARGO        VALUE  2.                           
000428            03  WS-NRO-CUENTA       PIC 9(08)   VALUE ZEROS.             
000429            03  FILLER              PIC X(03)   VALUE SPACES.            
000430       **************************************                            
000431       *        COPY WSSUCU.                                             
000432       **************************************                            
000433                                                                         
000434       **************************************                            
000435       * LAY-OUT GENERAL REGISTRO DE SALIDA                              
000436       **************************************                            
000437        01  WS-REG-SALIDA.                                               
000438            03  WS-SAL-SUCURSAL         PIC 99      VALUE ZEROS.         
000439            03  WS-SAL-NOMBRE-SUC       PIC X(30)   VALUE SPACES.        
000440            03  WS-SAL-CANT-CUENTAS     PIC ZZZ9    VALUE ZEROS.         
000441            03  FILLER                  PIC X(44)   VALUE SPACES.        
000442                                                                         
000443       **************************************                            
000444       * LAY-OUT ULTIMO REGISTRO DE SALIDA                               
000445       **************************************                            
000446                                                                         
000447        01  FILLER        REDEFINES    WS-REG-SALIDA.                    
000448            03  WS-REG-SALIDA-L.                                         
000449              05  WS-SAL-FECHA.                                          
000450                  07 WS-SAL-DD         PIC 99.                           
000451                  07 WS-SAL-GUION-DD   PIC X.                            
000452                  07 WS-SAL-MM         PIC 99.                           
000453                  07 WS-SAL-GUION-MM   PIC X.                            
000454                  07 WS-SAL-SIGLO      PIC   99.                         
000455                  07 WS-SAL-AA         PIC   99.                         
000456              05  WS-SAL-TITULO        PIC X(30).                        
000458              05  WS-SAL-TOTAL         PIC ZZZ9.                         
000459              05  FILLER               PIC X(36).                        
000460                                                                         
000461                                                                         
000462       ********  TOTAL CTAS X SUCURSAL ******                            
000463        77  WS-SUCURSAL-ANT      PIC 9(2)        VALUE     ZEROS.        
000464        77  WS-NOMBRE-SUC-ANT    PIC X(30)       VALUE     SPACES.       
000465        77  WS-CANT-CTAS-SUC     PIC 9(3)        VALUE     ZEROS.        
000466       ********  TOTAL CTAS X BANCO    ******                            
000467        77  WS-CANT-CTAS-BCO     PIC 9(4)        VALUE     ZEROS.        
000468       ********     CONSTANTES       ***************                     
000469        77  WS-TOTAL             PIC X(30)                               
000470                       VALUE    ' TOTAL CUENTAS ACTIVAS BANCO'.          
000471        77  WS-GUION             PIC X     VALUE '-'.                    
000472                                                                         
000473       ********     FECHA DE PROCESO ***************                     
000474        01  WS-FECHA.                                                    
000475            03  WS-FECHA-AA      PIC 99            VALUE ZEROS.          
000478            03  WS-FECHA-MM      PIC 99            VALUE ZEROS.          
000479            03  WS-FECHA-DD      PIC 99            VALUE ZEROS.          
000490                                                                         
000508        77  FILLER        PIC X(26) VALUE '* FINAL  WORKING-STORAGE *'.  
000509                                                                         
000510       ***************************************************************.  
000511        PROCEDURE DIVISION.                                              
000520       **************************************                            
000530       *                                    *                            
000540       *  CUERPO PRINCIPAL DEL PROGRAMA     *                            
000560       *                                    *                            
000570       **************************************                            
000600        MAIN-PROGRAM.                                                    
000601                                                                         
000602            PERFORM 1000-INICIO  THRU   F-1000-INICIO.                   
000603                                                                         
000604            PERFORM 2000-PROCESO  THRU  F-2000-PROCESO                   
000607                    UNTIL WS-FIN-LECTURA.                                
000608                                                                         
000611                                                                         
000612            PERFORM 9999-FINAL    THRU  F-9999-FINAL.                    
000613                                                                         
000614        F-MAIN-PROGRAM. GOBACK.                                          
000615                                                                         
000616       **************************************                            
000617       *                                    *                            
000618       *  CUERPO INICIO APERTURA ARCHIVOS   *                            
000619       *                                    *                            
000620       **************************************                            
000621        1000-INICIO.                                                     
000630            ACCEPT WS-FECHA FROM DATE.                                   
000631            DISPLAY 'FECHA:    '  WS-FECHA                               
000632                                                                         
000650                                                                         
000702            SET WS-NO-FIN-LECTURA TO TRUE.                               
000703                                                                         
000710            OPEN INPUT  ENTRADA.                                         
000711            IF WS-ENT-CODE IS NOT EQUAL '00'                             
000712               DISPLAY '* ERROR EN OPEN ENTRADA = ' WS-ENT-CODE          
000713               MOVE 9999 TO RETURN-CODE                                  
000714               SET  WS-FIN-LECTURA TO TRUE                               
000715            END-IF.                                                      
000716                                                                         
000719            OPEN OUTPUT SALIDA.                                          
000720            IF WS-SAL-CODE IS NOT EQUAL '00'                             
000721               DISPLAY '* ERROR EN OPEN SALIDA  = ' WS-SAL-CODE          
000722               MOVE 9999 TO RETURN-CODE                                  
000723               SET  WS-FIN-LECTURA TO TRUE                               
000724            END-IF.                                                      
000732                                                                         
000733       **************************************                            
000734       *  PRIMER LECTURA PARA CORTE CONTROL *                            
000735       **************************************                            
000736                                                                         
000737            READ ENTRADA INTO WS-REG-ENTRADA                             
000738                         AT END SET WS-FIN-LECTURA TO TRUE.              
000739                                                                         
000740            EVALUATE WS-ENT-CODE                                         
000741              WHEN '00'                                                  
000742                  MOVE WS-NRO-SUCURSAL     TO WS-SUCURSAL-ANT            
000743                  MOVE WS-NOMBRE-SUC       TO WS-NOMBRE-SUC-ANT          
000744                                                                         
000745               WHEN '10'                                                 
000746               DISPLAY '* ARCHIVO ENTRADA VACÍO      ' WS-ENT-CODE       
000747               MOVE 9999 TO RETURN-CODE                                  
000748               SET WS-FIN-LECTURA TO TRUE                                
000749                                                                         
000750            WHEN OTHER                                                   
000751               DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       
000752               MOVE 9999 TO RETURN-CODE                                  
000753               SET WS-FIN-LECTURA TO TRUE                                
000754                                                                         
000755            END-EVALUATE.                                                
000756                                                                         
000757        F-1000-INICIO.   EXIT.                                           
000758                                                                         
000759       **************************************                            
000760       *                                    *                            
000761       *  CUERPO PRINCIPAL DE PROCESOS      *                            
000762       *  LECTURA FILE INPUT CLASIFICADO    *                            
000763       *  GRABACION SALIDA CON LOS CAMPOS   *                            
000764       *  DE LAY-OUT GENERAL                *                            
000765       *                                    *                            
000766       **************************************                            
000767        2000-PROCESO.                                                    
000768                                                                         
000769            EVALUATE  WS-ESTADO-CUENTA                                   
000770                WHEN  ZERO                                               
000772                   ADD 1 TO WS-CANT-CTAS-SUC                             
000773                                                                         
000774                WHEN OTHER                                               
000775                   CONTINUE                                              
000776                                                                         
000777            END-EVALUATE                                                 
000778                                                                         
000779            READ ENTRADA INTO WS-REG-ENTRADA                             
000780                         AT END SET WS-FIN-LECTURA TO TRUE.              
000781                                                                         
000782            EVALUATE WS-ENT-CODE                                         
000783              WHEN '00'                                                  
000784                                                                         
000785            PERFORM 2200-SEGUIR-PROCESO                                  
000786                       THRU F-2200-SEGUIR-PROCESO                        
000787                                                                         
000788               WHEN '10'                                                 
000789               SET WS-FIN-LECTURA TO TRUE                                
000790               PERFORM 2100-ULTIMO-REGISTRO                              
000791                 THRU  F-2100-ULTIMO-REGISTRO                            
000792                                                                         
000793            WHEN OTHER                                                   
000794               DISPLAY '* ERROR EN LECTURA ENTRADA = ' WS-ENT-CODE       
000795               MOVE 9999 TO RETURN-CODE                                  
000796               SET WS-FIN-LECTURA TO TRUE                                
000797                                                                         
000798            END-EVALUATE.                                                
000799                                                                         
000800                                                                         
000801        F-2000-PROCESO. EXIT.                                            
000802                                                                         
000803       **************************************                            
000804       *                                    *                            
000805       *  WRITE ULTIMO REGISTRO DE SALIDA   *                            
000806       *                                    *                            
000807       **************************************                            
000808        2100-ULTIMO-REGISTRO.                                            
000809                                                                         
000810            PERFORM 2230-CORTE-SUCURSAL                                  
000811                      THRU F-2230-CORTE-SUCURSAL                         
000812                                                                         
000813            INITIALIZE WS-REG-SALIDA.                                    
000814                                                                         
000815            MOVE   WS-GUION             TO WS-SAL-GUION-MM               
000816                                           WS-SAL-GUION-DD.              
000817            MOVE   20                   TO WS-SAL-SIGLO.                 
000818            MOVE   WS-FECHA-AA          TO WS-SAL-AA.                    
000819            MOVE   WS-FECHA-MM          TO WS-SAL-MM.                    
000820            MOVE   WS-FECHA-DD          TO WS-SAL-DD.                    
000821            MOVE   WS-TOTAL             TO WS-SAL-TITULO.                
000822            MOVE   WS-CANT-CTAS-BCO     TO WS-SAL-TOTAL.                 
000823                                                                         
000824            WRITE REG-SALIDA FROM WS-REG-SALIDA                          
000825               IF WS-SAL-CODE IS NOT EQUAL '00'                          
000826                 DISPLAY '* ERROR EN WRITE LAST SALIDA  = '              
000827                                             WS-SAL-CODE                 
000828                 MOVE 9999 TO RETURN-CODE                                
000829              END-IF.                                                    
000830                                                                         
000831        F-2100-ULTIMO-REGISTRO. EXIT.                                    
000832                                                                         
000833        2200-SEGUIR-PROCESO.                                             
000834                                                                         
000835            IF WS-NRO-SUCURSAL EQUAL WS-SUCURSAL-ANT                     
000836               NEXT SENTENCE                                             
000837            ELSE                                                         
000838                  PERFORM 2230-CORTE-SUCURSAL THRU                       
000839                        F-2230-CORTE-SUCURSAL                            
000840            END-IF.                                                      
000841                                                                         
000842        F-2200-SEGUIR-PROCESO. EXIT.                                     
000843                                                                         
000844       **************************************                            
000845       *                                    *                            
000846       *  PARRAFO QUE CONTROLA EL CORTE     *                            
000847       *  DE SUCURSAL                       *                            
000848       *                                    *                            
000849       **************************************                            
000850        2230-CORTE-SUCURSAL.                                             
000851            MOVE SPACES             TO     WS-REG-SALIDA                 
000852                                                                         
000853            MOVE WS-SUCURSAL-ANT    TO     WS-SAL-SUCURSAL               
000854            MOVE WS-NOMBRE-SUC-ANT  TO     WS-SAL-NOMBRE-SUC             
000855            MOVE WS-CANT-CTAS-SUC   TO     WS-SAL-CANT-CUENTAS           
000856                                                                         
000857       ****************************************************              
000858       *      MUESTRO TOTALES GRABADOS EN SALIDA          *              
000859       ****************************************************              
000860            DISPLAY "SUCURSAL:  " WS-SAL-SUCURSAL                        
000861            DISPLAY "NOMBRE:    " WS-SAL-NOMBRE-SUC                      
000862            DISPLAY "CANTIDAD CUENTAS:  "  WS-SAL-CANT-CUENTAS           
000863       *                                                                 
000870       ****************************************************              
001666       * GUARDO LA SUCURSAL PARA PRÓXIMO CORTE SUCURSAL                  
001667       ****************************************************              
001668                                                                         
001669            MOVE WS-NRO-SUCURSAL   TO       WS-SUCURSAL-ANT              
001670            MOVE WS-NOMBRE-SUC     TO       WS-NOMBRE-SUC-ANT            
001671            ADD  WS-CANT-CTAS-SUC  TO       WS-CANT-CTAS-BCO             
001672            MOVE ZEROS             TO       WS-CANT-CTAS-SUC             
001673                                                                         
001674            WRITE REG-SALIDA FROM WS-REG-SALIDA                          
001675            IF WS-SAL-CODE IS NOT EQUAL '00'                             
001676                 DISPLAY '* ERROR EN WRITE SALIDA  = '                   
001677                                             WS-SAL-CODE                 
001678                 MOVE 9999 TO RETURN-CODE                                
001679                 SET WS-FIN-LECTURA TO TRUE                              
001680            END-IF.                                                      
001681                                                                         
001682        F-2230-CORTE-SUCURSAL. EXIT.                                     
001683                                                                         
001714       **************************************                            
001715       *                                    *                            
001716       *  CUERPO FINAL CIERRE DE FILES      *                            
001717       *                                    *                            
001718       **************************************                            
001719        9999-FINAL.                                                      
001720                                                                         
001721            CLOSE ENTRADA                                                
001722               IF WS-ENT-CODE IS NOT EQUAL '00'                          
001723                 DISPLAY '* ERROR EN CLOSE ENTRADA = '                   
001724                                             WS-ENT-CODE                 
001725                 MOVE 9999 TO RETURN-CODE                                
001726                 SET WS-FIN-LECTURA TO TRUE                              
001727              END-IF.                                                    
001728                                                                         
001729            CLOSE  SALIDA                                                
001730               IF WS-SAL-CODE IS NOT EQUAL '00'                          
001731                 DISPLAY '* ERROR EN CLOSE SALIDA   ='                   
001732                                             WS-SAL-CODE                 
001733                 MOVE 9999 TO RETURN-CODE                                
001734                 SET WS-FIN-LECTURA TO TRUE                              
001735            END-IF.                                                      
001736                                                                         
001740        F-9999-FINAL.                                                    
001800            EXIT.                                                        
002000       *                                                                 
 
