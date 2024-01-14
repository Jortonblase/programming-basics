PROGRAM SortMonth(INPUT, OUTPUT);
USES
  DateIO;
VAR
  LMonth, RMonth: Month; 
BEGIN
  ReadMonth(INPUT, LMonth);
  ReadMonth(INPUT, RMonth);
  IF (LMonth = NoMonth) OR (RMonth = NoMonth)
  THEN
    WRITELN('¬ходные данные записаны неверно.')
  ELSE 
    BEGIN
      IF LMonth < RMonth 
      THEN 
        BEGIN
          WriteMonth(OUTPUT, LMonth);
          WRITE(' предшествует ');
          WriteMonth(OUTPUT, RMonth)
        END 
      ELSE
        IF LMonth > RMonth
        THEN
          BEGIN
            WriteMonth(OUTPUT, LMonth);
            WRITE(' следует за ');
            WriteMonth(OUTPUT, RMonth)
          END        
        ELSE
          IF RMonth = LMonth 
          THEN
            BEGIN
              WRITE('ќба мес€ца ');
              WriteMonth(OUTPUT, RMonth)
            END
    END 
END.
