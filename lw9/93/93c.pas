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
  
 PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END
    END;    
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3, L2, L3: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  L2 := 'Y';
  L3 := 'Y';
  WHILE (L2 <> 'N') OR (L3 <> 'N')
  DO
    BEGIN
      IF (L2 <> 'N') AND (L3 <> 'N')
      THEN
        IF Ch2 < Ch3
        THEN 
          BEGIN
            WRITE(F1, Ch2);
            IF NOT EOLN(F2) 
            THEN
              READ(F2, Ch2)
            ELSE
              L2 := 'N'
          END
        ELSE
          BEGIN
            WRITE(F1, Ch3);
            IF NOT EOLN(F3) 
            THEN
              READ(F3, Ch3)
            ELSE  
              L3 := 'N'
          END
      ELSE
        IF L2 <> 'N'
        THEN
          BEGIN
            WRITE(F1, Ch2);
            IF NOT EOLN(F2) 
            THEN
              READ(F2, Ch2)
            ELSE
              L2 := 'N'
          END
        ELSE
          BEGIN
            WRITE(F1, Ch3);
            IF NOT EOLN(F3) 
            THEN
              READ(F3, Ch3)
            ELSE  
              L3 := 'N'
          END  
    END;
  WRITELN(F1)
END; {Merge}

BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT (EOLN(F1))
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT (EOLN(F1))
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
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
