       IDENTIFICATION DIVISION.                                         
        PROGRAM-ID PGMDB201.                                            
      **************************************                            
      *                                    *                            
      *  PROGRAMA DE PRUEBA DE COMPILADOR  *                            
      *  A SU VEZ SIRVE COMO MODELO DB2    *                            
      *                                    *                            
      **************************************                            
       ENVIRONMENT DIVISION.                                            
       INPUT-OUTPUT SECTION.                                            
       FILE-CONTROL.                                                    
             SELECT SALIDA  ASSIGN DDSALID                              
                    FILE STATUS IS WS-SAL-CODE.                         
       DATA DIVISION.                                                   
       FILE SECTION.                                                    
       FD SALIDA                                                        
            BLOCK CONTAINS 0 RECORDS                                    
            RECORDING MODE IS F.                                        
       01 REG-SALIDA     PIC X(40).                                     
                                                                        
       WORKING-STORAGE SECTION.                                         
                                                                        
       77  FILLER        PIC X(26) VALUE '* INICIO WORKING-STORAGE *'.  
       77  FILLER        PIC X(26) VALUE '* CODIGOS RETORNO FILES  *'.  
       77  NOT-FOUND     PIC S9(9) COMP VALUE  +100.                    
       77  WS-SAL-CODE   PIC XX    VALUE SPACES.                        
       77  FILLER        PIC X(26) VALUE '* DESCRIPCION SQLCA      *'.  
       77  SQLCODE       PIC S9(9) COMP VALUE +0. *> Agregado para DB2
                                                                        
      *****************************************************             
      * LAYOUT DEL REGISTRO PROYECTO                      *             
      *****************************************************             
       01  PROYECTO.                                                    
           02  PROYNO    PIC X(5).
           02  PROYNAME  PIC X(30).
           02  PROYHORA  PIC X(3).

       77  FILLER        PIC X(26) VALUE '* LAYOUT SALIDA TITULOS  *'.

       01  WS-TITULOS.                                                  
           02 FILLER     PIC X(6)   VALUE 'PROYNO'.                     
           02 FILLER     PIC X(26)  VALUE '   DESCRIPCION PROYECTO   '. 
           02 FILLER     PIC X(8)   VALUE '    HORA'.                   

       77  FILLER        PIC X(26) VALUE '* LAYOUT SALIDA DETALLE  *'.

       01  WS-DETALLE.                                                  
           02 WS-SAL-NUM PIC X(5)   VALUE SPACES.                       
           02 FILLER     PIC X      VALUE SPACES.                       
           02 WS-SAL-DES PIC X(30)  VALUE SPACES.                       
           02 FILLER     PIC X      VALUE SPACES.                       
           02 WS-SAL-HOR PIC X(3)   VALUE SPACES.                    

       77  WS-REG-SALIDA PIC X(40).                                  

      *****************************************************             
      * SQLCA COMMUNICATION AREA CON EL DB2               *             
      *****************************************************             
      *    EXEC SQL INCLUDE SQLCA  END-EXEC.                            

            EXEC SQL                                                    
              INCLUDE SQLCA                                             
            END-EXEC.                                                   

      *****************************************************             
      * DEFINICION DE TABLA DB2 A LA CUAL SE ACCEDE       *             
      *****************************************************             
            EXEC SQL                                                    
              INCLUDE TBCURCTA                                          
            END-EXEC.                                                   

       77  FILLER        PIC X(26) VALUE '* FINAL  WORKING-STORAGE *'.  

       PROCEDURE DIVISION.                                              
      **************************************                            
      *                                    *                            
      *  CUERPO PRINCIPAL DEL PROGRAMA     *                            
      *                                    *                            
      **************************************                            
       0000-MAIN-PROCESS.                                               
                                                                        
           PERFORM 1000-INICIO  THRU F-1000-INICIO.                     
                                                                        
           PERFORM 2000-PROCESO THRU F-2000-PROCESO.                    
                                                                        
           PERFORM 9999-FINAL   THRU F-9999-FINAL.                      
                                                                        
           GOBACK.                                                      
                                                                        
      **************************************                            
      *                                    *                            
      *  CUERPO INICIO APERTURA FILES      *                            
      *                                    *                            
      **************************************                            
       1000-INICIO.                                                     
           OPEN OUTPUT SALIDA.                                          
                                                                        
           IF WS-SAL-CODE IS NOT EQUAL '00'                             
              DISPLAY '* ERROR EN OPEN SALIDA  = ' WS-SAL-CODE          
              MOVE 3333 TO RETURN-CODE                                  
              PERFORM 9999-FINAL THRU F-9999-FINAL                      
           END-IF.                                                      
                                                                        
           MOVE WS-TITULOS TO WS-REG-SALIDA.                            
           WRITE REG-SALIDA FROM WS-REG-SALIDA.                         
                                                                        
           IF WS-SAL-CODE IS NOT EQUAL '00'                             
              DISPLAY '* ERROR EN WRITE SALIDA TITULOS  = ' WS-SAL-CODE 
              MOVE 3333 TO RETURN-CODE                                  
              PERFORM 9999-FINAL THRU F-9999-FINAL                      
           END-IF.                                                      
                                                                        
       F-1000-INICIO. EXIT.                                             
                                                                        
      **************************************                            
      *                                    *                            
      *  CUERPO PRINCIPAL DE PROCESOS      *                            
      *  LECTURA TABLA PROYECTOS TBAL99PR  *                            
      *  GRABACION SALIDA CON LOS CAMPOS   *                            
      *            PROYNO NUMERO DE PROY   *                            
      *            PROYNAME NOMBRE DEL PROY*                            
      *            PROYHORA CANT. HORAS    *                            
      *                                    *                            
      **************************************                            
       2000-PROCESO.                                                    
      *****************************************************             
      * LISTAR EL PRIMER PROYECTO DE LA INSTALACION       *             
      *****************************************************             
      *         EXEC SQL SELECT PROYNO, PROYNAME, PROYHORA              
      *              INTO :PROYECTO.PROYNO, :PROYECTO.PROYNAME,         
      *                   :PROYECTO.PROYHORA                            
      *              FROM OWNER.TBAL99PR                                
      *                                ONLY 1                           
      *         END-EXEC.                                               
                                                                        
                EXEC SQL SELECT PROYNO, PROYNAME, PROYHORA                      
                     INTO :PROYECTO.PROYNO, :PROYECTO.PROYNAME,
                          :PROYECTO.PROYHORA
                     FROM KC02787.TBCURCTA
                     FETCH FIRST 1 ROW ONLY                           
                END-EXEC.                                               
                                                                        
                IF SQLCODE = NOT-FOUND                                  
                   DISPLAY 'PROYECTO VACIO: '                           
                ELSE                                                    
                    IF SQLCODE = 0                                      
                      DISPLAY 'PROYNO   = '    PROYNO                   
                      DISPLAY 'PROYNAME = '    PROYNAME                 
                      DISPLAY 'PROYHORA = '    PROYHORA                   
                      MOVE PROYNO   TO WS-SAL-NUM                       
                      MOVE PROYNAME TO WS-SAL-DES                       
                      MOVE PROYHORA TO WS-SAL-HOR                       
                      MOVE WS-DETALLE  TO WS-REG-SALIDA                 
                      WRITE REG-SALIDA FROM WS-REG-SALIDA               
                    ELSE                                                
                         DISPLAY 'ERROR DB2'                            
                    END-IF                                                  
                END-IF.                                                 
                                                                        
       F-2000-PROCESO. EXIT.                                            
                                                                        
      **************************************                            
      *                                    *                            
      *  CUERPO FINAL CIERRE DE SALIDA     *                            
      *                                    *                            
      **************************************                            
       9999-FINAL.                                                      
           CLOSE SALIDA.                                                
                                                                        
           IF WS-SAL-CODE IS NOT EQUAL '00'                             
              DISPLAY '* ERROR EN CLOSE SALIDA  = ' WS-SAL-CODE         
              MOVE 9999 TO RETURN-CODE                                  
           END-IF.                                                      
                                                                        
       F-9999-FINAL.  EXIT.

