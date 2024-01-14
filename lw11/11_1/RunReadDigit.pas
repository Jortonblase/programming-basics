PROGRAM RunReadDigit(INPUT, OUTPUT);
VAR
  x: INTEGER;
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

BEGIN //RunReadDigit
  x := ReadDigit(INPUT);
  WRITELN(x)
END.
