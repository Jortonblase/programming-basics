PROGRAM CountReverseInString(INPUT, OUTPUT);
USES
  Count3;
VAR
  C100, C10, C1, Ch1, Ch2, Ch3: CHAR; 
BEGIN {CountReverseInString} 
  WRITE('Вход:');
  Start;
  IF NOT EOLN 
  THEN
    READ(Ch2);
  IF NOT EOLN
  THEN
    READ(Ch3);
  WHILE NOT EOLN(INPUT)
  DO
    BEGIN
      Ch1:= Ch2;
      Ch2:= Ch3;
      READ(INPUT, Ch3);       
      {проверить реверс}
      IF ((Ch1 < Ch2) AND (Ch3 < Ch2)) OR ((Ch1 > Ch2) AND (Ch3 > Ch2))
      THEN 
        Bump
    END;
  Value(C100, C10, C1);
  WRITELN('Количество реверсов:', C100, C10, C1)
END.{CountReverseInString}
