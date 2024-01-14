UNIT DateIO;

INTERFACE
  TYPE
    Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);
    DayNum = 1 .. 31;
    Date = RECORD
             Mo: Month;
             Day: DayNum
           END;
  FUNCTION Read1Date(VAR InFile: TEXT): Date;
  PROCEDURE Write1Date(VAR OutFile: TEXT; VAR D: Date);
  FUNCTION Less(VAR D1, D2: Date): BOOLEAN;

IMPLEMENTATION

PROCEDURE ReadMonth(VAR InFile: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {ReadMonth}
  READ(InFile, Ch1, Ch2, Ch3);
  IF (Ch1 = 'J') AND (Ch2 = 'A') AND (Ch3 = 'N') THEN Mo := Jan ELSE
  IF (Ch1 = 'F') AND (Ch2 = 'E') AND (Ch3 = 'B') THEN Mo := Feb ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'R') THEN Mo := Mar ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'P') AND (Ch3 = 'R') THEN Mo := Apr ELSE
  IF (Ch1 = 'M') AND (Ch2 = 'A') AND (Ch3 = 'Y') THEN Mo := May ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'N') THEN Mo := Jun ELSE
  IF (Ch1 = 'J') AND (Ch2 = 'U') AND (Ch3 = 'L') THEN Mo := Jul ELSE
  IF (Ch1 = 'A') AND (Ch2 = 'U') AND (Ch3 = 'G') THEN Mo := Aug ELSE
  IF (Ch1 = 'S') AND (Ch2 = 'E') AND (Ch3 = 'P') THEN Mo := Sep ELSE
  IF (Ch1 = 'O') AND (Ch2 = 'C') AND (Ch3 = 'T') THEN Mo := Oct ELSE
  IF (Ch1 = 'N') AND (Ch2 = 'O') AND (Ch3 = 'V') THEN Mo := Nov ELSE
  IF (Ch1 = 'D') AND (Ch2 = 'E') AND (Ch3 = 'C') THEN Mo := Dec
    ELSE Mo := NoMonth
END; {ReadMonth}

FUNCTION Read1Date(VAR InFile: TEXT): Date;
VAR
  D: Date;
BEGIN {Read1Date}
  ReadMonth(InFile, D.Mo);
  READ(D.Day);
  Read1Date := D
END; {Read1Date}
 
PROCEDURE WriteMonth(VAR OutFile: TEXT; VAR Mo: Month);
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN {WriteMonth}
  IF Mo = Jan THEN WRITE(OutFile, 'JAN') ELSE
  IF Mo = Feb THEN WRITE(OutFile, 'FEB') ELSE
  IF Mo = Mar THEN WRITE(OutFile, 'MAR') ELSE
  IF Mo = Apr THEN WRITE(OutFile, 'APR') ELSE
  IF Mo = May THEN WRITE(OutFile, 'MAY') ELSE
  IF Mo = Jun THEN WRITE(OutFile, 'JUN') ELSE
  IF Mo = Jul THEN WRITE(OutFile, 'JUL') ELSE
  IF Mo = Aug THEN WRITE(OutFile, 'AUG') ELSE
  IF Mo = Sep THEN WRITE(OutFile, 'SEP') ELSE
  IF Mo = Oct THEN WRITE(OutFile, 'OCT') ELSE
  IF Mo = Nov THEN WRITE(OutFile, 'NOV') ELSE
  IF Mo = Dec THEN WRITE(OutFile, 'DEC')
    ELSE WRITE(OutFile, 'NoMonth')
END; {WriteMonth}

PROCEDURE Write1Date(VAR OutFile: TEXT; VAR D: Date);
BEGIN {Write1Date}
  WRITE(D.Day, ' ');
  WriteMonth(OutFile, D.Mo);
END; {Write1Date}
 
FUNCTION Less(VAR D1, D2: Date): BOOLEAN;
  {Less:= D1 < D2}
BEGIN {Less}
  IF D1.Mo < D2.Mo
  THEN
    Less := TRUE
  ELSE
    IF D1.Mo > D2.Mo
      THEN
        Less := FALSE
      ELSE {D1.Mo = D2.Mo}
        Less := (D1.Day < D2.Day)
END; {Less}

BEGIN
END.


