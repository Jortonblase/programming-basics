PROGRAM SumReadDigit(INPUT, OUTPUT);
VAR
  S, I: INTEGER;
  
FUNCTION ReadDigit(VAR F: TEXT): INTEGER;
VAR
  Ch: CHAR;         
BEGIN
  ReadDigit := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN ReadDigit := 0;
      IF Ch = '1' THEN ReadDigit := 1;                                
      IF Ch = '2' THEN ReadDigit := 2;
      IF Ch = '3' THEN ReadDigit := 3;
      IF Ch = '4' THEN ReadDigit := 4;
      IF Ch = '5' THEN ReadDigit := 5;
      IF Ch = '6' THEN ReadDigit := 6;
      IF Ch = '7' THEN ReadDigit := 7;
      IF Ch = '8' THEN ReadDigit := 8;
      IF Ch = '9' THEN ReadDigit := 9
    END;  
END;

BEGIN//SUM
  S := 0;
  I := ReadDigit(INPUT);
  WHILE I <> -1
  DO
    BEGIN
      S := S + I;
      I := ReadDigit(INPUT);
    END;
  WRITELN(S)
END.
