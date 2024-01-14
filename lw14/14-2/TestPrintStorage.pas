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
  
PROCEDURE Write1Word(VAR OutFile: TEXT; VAR Stat: WordStat);
BEGIN {WriteWords}
  WRITELN(Stat.Word1, '�', Stat.Count)  
END; {WriteWords}

PROCEDURE PrintStorage(VAR OutFile: TEXT; VAR Words: WordsArray; WordsCount: AvailableIndex);
VAR
  I: AvailableIndex;
BEGIN {PrintStorage}
  {������� ���� �� ������� ���, �������� ����������
   ������ N, � ���� OutFile}
  FOR I := 1 TO WordsCount 
  DO
    BEGIN
      Write1Word(OutFile, Words[I]);
      WRITELN(OutFile)
    END   
END; {WriteWords} 
  

BEGIN//����PrintStorage
  CurrentWords[1].Word1 := '����';
  CurrentWords[1].Count := 5;
  CurrentWords[2].Word1 := '����';
  CurrentWords[2].Count := 2;
  CurrentWords[3].Word1 := '������';
  CurrentWords[3].Count := 4;
  TotalWordsCount := 3;
  PrintStorage(OUTPUT, CurrentWords, TotalWordsCount)
END.
