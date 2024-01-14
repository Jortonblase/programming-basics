PROGRAM PrintWords(INPUT, OUTPUT);
VAR
  WordStr: STRING;
   
FUNCTION GetWord(VAR FIn: TEXT): STRING;
VAR
  W: STRING;
  Ch, State: CHAR;
CONST
  PunctMarks = ['.', ',', ':', ' ', '/'];
BEGIN
  State := 'S';
  W := '';
  WHILE State <> 'E'
  DO    
    BEGIN
      IF NOT EOLN(FIn) AND NOT EOF(FIn)
      THEN
        BEGIN
          READ(FIn, Ch);
          IF NOT (Ch IN PunctMarks)
          THEN
            BEGIN 
              W := W + Ch;
              IF State = 'S'
              THEN 
                State := 'W'
            END
          ELSE                     
            IF State = 'W'
            THEN
              State := 'E' 
        END;
      IF EOLN(FIn) OR EOF(FIn)
      THEN
        State := 'E';
      IF EOLN(FIn)
      THEN 
        READLN
    END;
  GetWord := W
END;    

BEGIN //printwords        
  WordStr := '0';
  WHILE WordStr <> ''
  DO
    BEGIN
      WordStr := GetWord(INPUT);
      WRITELN(WordStr)
    END
END.
