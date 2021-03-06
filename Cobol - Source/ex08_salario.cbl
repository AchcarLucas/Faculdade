       identification division.
       program-id. Program1.

       environment division.
       configuration section.
           special-names.
               decimal-point is comma.

       data division.
       working-storage section.
           01 AREAS-DE-TRABALHO.
               02 WS-NOME                  PIC X(30) VALUE SPACES.
               02 WS-IDADE                 PIC 9(02) VALUE ZEROS.
                   88 IDADE VALUE 15 THRU 29.
               02 WS-SEXO                  PIC X VALUE SPACE.
                   88 FM VALUE "F" "M" "f" "m".
               02 WS-SALARIO               PIC 9(05)V99 VALUE ZEROS.
                   88 SALARIO VALUE 4999,00 THRU 50001,00.
               02 MASK-SALARIO             PIC ZZZZ9,99.
               02 WS-SAL-ATUAL             PIC ZZ.ZZ9,99 VALUE ZEROS.
               02 WS-CONT                  PIC X VALUE SPACE.
                   88 CONT VALUE 'N' 'n' 'S' 's'.
           01 MENSAGENS-DE-CRITICA.
               02 MSG01 PIC X(30) VALUE "NOME INVALIDO <REDIGITE>".
               02 MSG02 PIC X(30) VALUE "IDADE INVALIDO <REDIGITE>".
               02 MSG03 PIC X(30) VALUE "SEXO INVALIDO <REDIGITE>".
               02 MSG04 PIC X(30) VALUE "SALARIO INVALIDO <REDIGITE>".
               02 MSG05 PIC X(30) VALUE SPACES.
               02 MSG06 PIC X(30) VALUE "FIM DO PROGRAMA".
               02 MSG07 PIC X(30) VALUE "OPCAO INVALIDA <REDIGITE>".
       
           01 DATA-DO-SISTEMA.
               02 ANO              PIC 9(02).
               02 MES              PIC 9(02).
               02 DIA              PIC 9(02).
               
       screen section.
           01 TELA.
               02 BLANK SCREEN.
               02 LINE 02 COLUMN 05 PIC 9(02)/ USING DIA.
               02 LINE 02 COLUMN 08 PIC 9(02)/ USING MES.
               02 LINE 02 COLUMN 11 PIC 9(02) USING ANO.
               02 LINE 06 COLUMN 21 VALUE "EM".
               02 LINE 03 COLUMN 28 VALUE "CONSISTENCIA DE DADOS".
               02 LINE 04 COLUMN 25 VALUE "AUTOR: COLEGIO BRASIL - N: 00
               "0 SERIE: 2 - TU: X".
               02 LINE 08 COLUMN 21 VALUE "NOME: ".
               02 LINE 10 COLUMN 21 VALUE "IDADE: ".
               02 LINE 12 COLUMN 21 VALUE "SEXO: ".
               02 LINE 14 COLUMN 21 VALUE "SALARIO: ".
               02 LINE 16 COLUMN 21 VALUE "SALARIO ATUAL: ".
               02 LINE 19 COLUMN 21 VALUE "CONTINUA <S/N> < >".
               02 LINE 23 COLUMN 21 VALUE "MENSAGEM: ".
           01 OPTION-INVALID.
               02 LINE 23 COLUMN 31 VALUE "OPCAO INVALIDA".

       procedure division.
           INICIO.
               accept DATA-DO-SISTEMA from date.
               perform S-PROGRAM until WS-CONT equal 'N' or WS-CONT 
               equal 'n'.
               display MSG06 at 2331.
               stop " ".
               stop run.
               
           S-PROGRAM.
               perform RESET-STATS.
               display TELA.
               perform ROT-NOME until WS-NOME <> spaces.
               perform ROT-IDADE until IDADE.
               perform ROT-SEXO until FM.
               perform ROT-SALARIO until SALARIO.
               perform ROT-CALCULO.
               perform ROT-CONTINUE until CONT.
            
           RESET-STATS.
               move spaces to WS-NOME.
               move zeros to WS-IDADE.
               move space to WS-SEXO.
               move zeros to WS-SALARIO.
               
           ROT-NOME.
               accept WS-NOME at 0639 with prompt.
               display WS-NOME at 0839.
               display MSG05 at 2331.
               if WS-NOME = spaces
                   display MSG01 at 2331.
                   
           ROT-IDADE.
               accept WS-IDADE at 1039 with prompt.
               display MSG05 at 2331.
               if not IDADE
                   display MSG02 at 2331.
                   
           ROT-SEXO.
               accept WS-SEXO at 1239 with prompt auto.
               display MSG05 at 2331.
               if not FM
                   display MSG03 at 2331.
                   
           ROT-SALARIO.
               accept WS-SALARIO at 1439 with prompt.
               move WS-SALARIO to MASK-SALARIO.
               display MASK-SALARIO at 1447.
               display MSG05 at 2331.
               if not SALARIO
                   display MSG04 at 2331.
            
          ROT-CALCULO.
               *> WS-SALARIO + 25% (WS-SALARIO)
               compute WS-SAL-ATUAL = WS-SALARIO * 1,25
               display WS-SAL-ATUAL at 1639.
               
          ROT-CONTINUE.
               accept WS-CONT at 1937 with prompt.
               display MSG05 at 2331.
                   
               

       end program Program1.
       
       *> 1) Por que o programa anterior � um programa que n�o devemos 
       *> fazer. 
       *> R) O c�digo est� ileg�vel devida a indenta��o e n�o possui 
       *> divis�o de procedimento, tendo separa��o mas sendo inutil 
       *> (n�o sendo chamado em perform)
       *> 2) Fa�a o mesmo programa do jeito �mais correto� de fazer.
       *> R) To fazendo mestre.