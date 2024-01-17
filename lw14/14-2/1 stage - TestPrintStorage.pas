PROGRAM TestPrintStorage(INPUT, OUTPUT);

CONST
  Max = 100;
  MaxWordLength = 30;
TYPE
  WordStat = RECORD
               Word1: STRING[MaxWordLength];
               Count: INTEGER 
             END;
  WordsArray = ARRAY [1 .. Max] OF WordStat;
  AvailableIndex = 0 .. Max;  
VAR
  TotalWordsCount: INTEGER;
  CurrentWords: WordsArray;
  
PROCEDURE PrintStorage(VAR OutFile: TEXT; VAR CurrentWords: WordsArray; VAR TotalWordsCount: INTEGER);
VAR 
  I: INTEGER;
BEGIN {PrintStorage}
  FOR I := 1 TO TotalWordsCount
  DO
    WRITELN(CurrentWords[I].Word1, ' ó ', CurrentWords[I].Count)  
END; {PrintStorage} 
  

BEGIN//“ÂÒÚPrintStorage
  CurrentWords[1].Word1 := 'Ï‡Ï‡';
  CurrentWords[1].Count := 5;
  CurrentWords[2].Word1 := 'Ô‡Ô‡';
  CurrentWords[2].Count := 2;
  CurrentWords[3].Word1 := 'ÒÓ·‡Í‡';
  CurrentWords[3].Count := 4;
  TotalWordsCount := 3;
  PrintStorage(OUTPUT, CurrentWords, TotalWordsCount)
END.
