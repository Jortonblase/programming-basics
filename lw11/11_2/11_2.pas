PROGRAM ReadNum(INPUT, OUTPUT); 
VAR
  Num: INTEGER; 

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Digit: INTEGER;
   
FUNCTION ReadDigit(VAR F: TEXT): INTEGER;
VAR 
  Ch: CHAR;
BEGIN
  ReadDigit := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN ReadDigit := 0 ELSE
      IF Ch = '1' THEN ReadDigit := 1 ELSE
      IF Ch = '2' THEN ReadDigit := 2 ELSE 
      IF Ch = '3' THEN ReadDigit := 3 ELSE
      IF Ch = '4' THEN ReadDigit := 4 ELSE
      IF Ch = '5' THEN ReadDigit := 5 ELSE
      IF Ch = '6' THEN ReadDigit := 6 ELSE
      IF Ch = '7' THEN ReadDigit := 7 ELSE
      IF Ch = '8' THEN ReadDigit := 8 ELSE
      IF Ch = '9' THEN ReadDigit := 9 
    END    
END;

BEGIN
  Digit := ReadDigit(F);
  N := 0;
  IF Digit = -1
  THEN
    N := -1;
  WHILE (Digit <> -1) AND (N > -1)
  DO
    BEGIN
      IF (N < (MAXINT DIV 10)) OR ((MAXINT DIV 10 = N) AND (MAXINT MOD 10 >= Digit))
      THEN
        BEGIN
          N := N * 10 + Digit;
          Digit := ReadDigit(F)
        END
      ELSE
        N := -2
    END
END;



BEGIN
  WRITELN(MAXINT);
  ReadNumber(INPUT, Num);
  WRITELN(OUTPUT, Num)          
END.
