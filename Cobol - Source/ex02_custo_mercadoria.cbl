IDENTIFICATION DIVISION.
*> Comment
PROGRAM-ID. CUSTO-MERCADORIA.	
ENVIRONMENT DIVISION.
	CONFIGURATION SECTION.
		SPECIAL-NAMES.
			DECIMAL-POINT IS COMMA.
DATA DIVISION.
	WORKING-STORAGE SECTION.
	01 DATE-TIME.
		02 DAYS 		PIC 9(02).
		02 MONTHS 		PIC 9(02).
		02 YEARS 		PIC 9(02).
	01 DATA-MERCADORIA.
        02 W-NAME               PIC X(20).
		02 QTD					PIC 9(04).
		02 QTD-MASK				PIC ZZZ9.
        02 CUSTO-UNIT			PIC 9(04)V99.
		02 CUSTO-UNIT-MASK	    PIC ZZZ9,99.
        02 PRICE                PIC 9(06)V99.
        02 PRICE-MASK           PIC ZZZZZ9,99.
	SCREEN SECTION.
	01 MAIN-SCREEN.
		02 LINE 01 COLUMN 04 PIC 9(02)/ USING DAYS FOREGROUND-COLOR 2.
		02 LINE 01 COLUMN 07 PIC 9(02)/ USING MONTHS FOREGROUND-COLOR 2.
		02 LINE 01 COLUMN 10 PIC 9(02) USING YEARS FOREGROUND-COLOR 2.
		02 LINE 01 COLUMN 20 VALUE "CUSTO MERCADORIA" FOREGROUND-COLOR 2.
		02 LINE 06 COLUMN 10 VALUE "NOME : ".
        02 LINE 08 COLUMN 10 VALUE "QTD  : ".
		02 LINE 10 COLUMN 10 VALUE "CUSTO: ".
        02 LINE 12 COLUMN 10 VALUE "TOTAL: ".
        02 LINE 14 COLUMN 10 VALUE "VENDA: ".
	01 CLEAR-SCREEN.
		02 BLANK SCREEN.
PROCEDURE DIVISION.
	INIT.
		ACCEPT DATE-TIME FROM DATE.
		DISPLAY CLEAR-SCREEN.
		DISPLAY MAIN-SCREEN AT 0101.
		
		PERFORM ENTRADA.
        perform CALCULAR.
		
        STOP " ".
		STOP RUN.
	
	ENTRADA.
        ACCEPT W-NAME at 0617.
        
		ACCEPT QTD AT 0817.
		MOVE QTD TO QTD-MASK.
		DISPLAY QTD-MASK AT 0830.
		
		ACCEPT CUSTO-UNIT AT 1017.
		MOVE CUSTO-UNIT TO CUSTO-UNIT-MASK.
		DISPLAY CUSTO-UNIT-MASK AT 1030.
        
    CALCULAR.
        MULTIPLY QTD BY CUSTO-UNIT GIVING PRICE.
        MOVE PRICE TO PRICE-MASK.
        DISPLAY PRICE-MASK AT 1217.
        
        *> pre�o 30% maior
        MULTIPLY PRICE BY 1,3 GIVING PRICE.
        MOVE PRICE TO PRICE-MASK.
        DISPLAY PRICE-MASK AT 1417.
        DISPLAY " (+30%)".