PROGRAM RunRecursiveSort(INPUT, OUTPUT);
VAR
  F1: TEXT;

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;  
BEGIN  
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch);
    END;
  WRITELN(OutFile)
END;

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;
{PROCEDURE Split(VAR F1, F2, F3: TEXT)
 ��������� F1 �� F2 � F3}
{PROCEDURE Merge(VAR F1, F2, F3: TEXT)
 ������� F2 � F3 � F1}
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      IF NOT (EOLN(F1))
      THEN {���� ����� ��� ������� 2 �������}
        BEGIN
          {Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3);}
        END
    END
END;   {RecursiveSort}

BEGIN
  REWRITE(F1);
  CopyFile(INPUT, F1);
  RecursiveSort(F1);
  RESET(F1);
  CopyFile(F1, OUTPUT)
END.
