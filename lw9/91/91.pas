PROGRAM RunReverse(INPUT, OUTPUT);

PROCEDURE Reverse(VAR F1: TEXT);
VAR
  Ch: CHAR; 
BEGIN
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      Reverse(F1);
      WRITE(OUTPUT, Ch)
    END
END;

BEGIN
  Reverse(INPUT);
  WRITELN
END.
