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
    WRITELN('������� ������ �������� �������.')
  ELSE 
    BEGIN
      IF LMonth < RMonth 
      THEN 
        BEGIN
          WriteMonth(OUTPUT, LMonth);
          WRITE(' ������������ ');
          WriteMonth(OUTPUT, RMonth)
        END 
      ELSE
        IF LMonth > RMonth
        THEN
          BEGIN
            WriteMonth(OUTPUT, LMonth);
            WRITE(' ������� �� ');
            WriteMonth(OUTPUT, RMonth)
          END        
        ELSE
          IF RMonth = LMonth 
          THEN
            BEGIN
              WRITE('��� ������ ');
              WriteMonth(OUTPUT, RMonth)
            END
    END 
END.
