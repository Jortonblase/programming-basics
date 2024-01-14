PROGRAM SortDates(INPUT, OUTPUT);
USES
  DateIO;
  
CONST
  Max = 100;
TYPE
  DateArray = ARRAY [1 .. Max] OF Date;
  Index = 0 .. Max;
VAR
  Dates: DateArray;
  D: Date;
  N: Index;

{�������� �������� � �������}
PROCEDURE ReadDates(VAR InFile: TEXT; VAR Dates: DateArray; VAR N: Index);
VAR
  I: Index;
BEGIN {ReadDates}
  {��������� ���� �� InFile � ������ ���, �������� ����������
   ������ � N, ����������� ������}  
  I := 0;
  WHILE NOT EOF(InFile) AND (I < Max)
  DO
    BEGIN
      I := I + 1;
      Dates[I] := Read1Date(InFile);
      IF EOLN(InFile)
      THEN
        READLN(InFile) 
    END;
  N := I    
END; {ReadDates}

PROCEDURE WriteDates(VAR OutFile: TEXT; VAR Dates: DateArray; N: Index);
VAR
  I: Index;
BEGIN {WriteDates}
  {������� ���� �� ������� ���, �������� ����������
   ������ N, � ���� OutFile}
   FOR I := 1 TO N 
   DO
     BEGIN
       Write1Date(OutFile, Dates[I]);
       WRITELN(OutFile)
     END   
END; {WriteDates}

PROCEDURE SortDates(VAR Dates: DateArray; N: Index);
  {������������� ������ ��� ������� ��������, 
  ������������ ������}
VAR
  Temp: Date;
  Sorted: BOOLEAN;
  I, LookN: Index;
BEGIN
  Sorted := FALSE;
  LookN := N - 1;
  WHILE NOT Sorted
  DO
    BEGIN
      Sorted := TRUE;
      FOR I := 1 TO LookN 
        DO
          IF NOT Less(Dates[I], Dates[I + 1])
          THEN
            {����������� ������� ����, Sorted := FALSE}
            BEGIN {����������� ������� ����, Sorted := FALSE}
              Temp := Dates[I];
              Dates[I] := Dates[I + 1];
              Dates[I + 1] := Temp;
              Sorted := FALSE
            END;
      LookN := LookN - 1 
    END
END;
     
BEGIN
  ReadDates(INPUT, Dates, N);   
  SortDates(Dates, N);
  WriteDates(OUTPUT, Dates, N)  
END.

