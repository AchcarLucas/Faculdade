IDENTIFICATION DIVISION.
PROGRAM-ID. CIRCLE-CODE.
ENVIRONMENT DIVISION.
	CONFIGURATION SECTION.
		special-names.
			DECIMAL-POINT IS COMMA.
			
DATA DIVISION.
	WORKING-STORAGE SECTION.
		01 DATA-VAR.
			02 W-RADIUS-INT								PIC 9(07).
			02 W-RADIUS-DEC	REDEFINES W-RADIUS-INT		PIC 9(05)V99.
			02 W-AREA									PIC 9(08)V99.
		01 SYSTEM-DATE.
			02 YEARS									PIC 9(02) VALUE ZEROS.
			02 MONTHS									PIC 9(02) VALUE ZEROS.
			02 DAYS										PIC 9(02) VALUE ZEROS.
		
	SCREEN SECTION.
		01 MAIN-SCREEN.
			02 LINE 02 COLUMN 05	PIC 9(02)/ USING DAYS.
			02 LINE 02 COLUMN 08	PIC 9(02)/ USING MONTHS.
			02 LINE 02 COLUMN 11	PIC 9(02) USING YEARS.
			02 LINE 02 COLUMN 28 VALUE "*** CIRCLE AREA ***".
			02 LINE 08 COLUMN 15 VALUE "RADIUS: ".
			02 LINE 10 COLUMN 15 VALUE "AREA: ".
		01 CLEAR-SCREEN.
			02 BLANK SCREEN.
		
PROCEDURE DIVISION.
	INIT.
		ACCEPT SYSTEM-DATE FROM DATE.
		
		DISPLAY CLEAR-SCREEN.
		DISPLAY MAIN-SCREEN AT 0101.
		
		PERFORM INPUT-RADIUS UNTIL W-RADIUS-INT > 0
		DISPLAY W-RADIUS-INT AT 0831.
		
		PERFORM COMPUTE-AREA.
		
		DISPLAY W-AREA AT 1023
		
		STOP " ".
		STOP RUN.
		
	INPUT-RADIUS.
		ACCEPT W-RADIUS-INT AT 0823.
	COMPUTE-AREA.
		COMPUTE W-AREA = 3,1416*(W-RADIUS-DEC**2).