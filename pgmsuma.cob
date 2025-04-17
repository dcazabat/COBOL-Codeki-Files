            IDENTIFICATION DIVISION.                                         
            PROGRAM-ID.    PGMSUMA.                                          
            AUTHOR.        D. CAZABAT.                                       
            INSTALLATION.  CURSO CODEKI.                                     
            DATE-WRITTEN.  04/11/2025.                                       
            DATE-COMPILED. 04/11/2025.                                       
                                                                             
            DATA DIVISION.                                                   
            WORKING-STORAGE SECTION.                                         
            77 CONTADOR  PIC 9(2) VALUE 1.                                   
            77 TOTAL-SUMA PIC 9(3) VALUE 0.                                  
            77 TOTAL-MOSTAR PIC Z(3).
                                                                             
            PROCEDURE DIVISION.                                              
            MAIN-LOGIC.                                                      
                DISPLAY 'SUMA DE 1 A 10, BY KC03C7C'                         
                PERFORM SUMAR-NUMEROS VARYING CONTADOR FROM 1 BY 1           
                    UNTIL CONTADOR > 10.                                     
                MOVE TOTAL-SUMA TO TOTAL-MOSTAR.
                DISPLAY 'LA SUMA DE LOS NUMEROS DE 1 A 10 ES: ' TOTAL-MOSTAR.
                STOP RUN.                                                    
                                                                             
            SUMAR-NUMEROS.                                                   
                ADD CONTADOR TO TOTAL-SUMA.                                  
 