PROGRAM Dup(INPUT, OUTPUT);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN
  READ(Ch1, Ch2, Ch3);  {Считывается BOB}
  IF Ch1 = Ch2       {B не равно O}
  THEN
    WRITE(Ch1, Ch2, Ch3, '.');
  IF Ch1 = Ch3
  THEN
    WRITE(Ch1, Ch3, '.'); {программа выдаст Ch1, Ch3, '.' BB}
  IF Ch2 = Ch3
  THEN
    WRITE(Ch2, Ch3);
  WRITELN
END.
