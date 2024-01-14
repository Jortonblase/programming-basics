PROGRAM ATestDateIO(INPUT, OUTPUT);
USES
  DateIO;
VAR
  D: Date;
BEGIN
  D := Read1Date(INPUT);
  Write1Date(OUTPUT, D); 
END.
