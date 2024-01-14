PROGRAM TestCountVowels(INPUT, OUTPUT);
VAR
  Count: INTEGER;
CONST
  AllVowelsSet = ['a', 'e', 'i', 'o', 'u', 'y', 'A', 'E', 'I', 'O', 'U', 'Y'];    

PROCEDURE CountVowels(VAR F: TEXT; VAR VCount: INTEGER);
VAR
  Ch: CHAR;
BEGIN
  VCount := 0;
  WHILE NOT EOF(F)
  DO
    BEGIN
      IF NOT EOLN(F)
      THEN
        BEGIN
          READ(F, Ch);
          IF Ch IN AllVowelsSet
          THEN
            VCount := VCount + 1
        END
      ELSE
        READLN(F);
    END;
END;

BEGIN
  CountVowels(INPUT, Count);
  WRITELN(Count)
END.

