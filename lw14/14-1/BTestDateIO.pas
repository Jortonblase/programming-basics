PROGRAM BTestDateIO(INPUT, OUTPUT);
USES
  DateIO;
VAR
  D1, D2: Date;
BEGIN
  D1 := Read1Date(INPUT);
  D2 := Read1Date(INPUT);
  
  Write1Date(OUTPUT, D2);
  WRITELN(OUTPUT);
  Write1Date(OUTPUT, D1);
  WRITELN(OUTPUT);
  IF Less(D1, D2)
  THEN 
    WRITELN('Первая дата меньше второй')
  ELSE
    WRITELN('Первая дата не меньше второй') 
END.
