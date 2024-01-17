PROGRAM TestGetWord(INPUT, OUTPUT);

CONST
  Max = 10000;
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
  WordStorage: WordsArray;
  S: STRING; {����� ������� � ���� �������� � ���������}
  
//������� ������� �� ����� �������� �� ���. �����
FUNCTION RegisterChange (Letter1: CHAR): CHAR;
CONST
  BigLetters = '�����Ũ��������������������������ABCDEFGHLJKLMNOPQRSTUVWXYZ';
  SmallLetters = '��������������������������������abcdefghljklmnopqrstuvwxyz';
BEGIN
  RegisterChange := Letter1;
  IF POS(Letter1, BigLetters) <> 0
  THEN
    RegisterChange := SmallLetters[POS(Letter1, BigLetters)]
END;
    
FUNCTION GetWord(VAR FIn: TEXT): STRING;
VAR
  W: STRING;
  Ch, State: CHAR;
CONST
  LetterSet = ['a'..'z', '�'..'�', 'A'..'Z', '�'..'�', '�', '�', '0'..'9'];
BEGIN
  State := 'S';
  W := '';
  WHILE State <> 'E'
  DO  
    IF (NOT EOLN(FIn)) AND (NOT EOF(FIn))
    THEN
      BEGIN
        READ(FIn, Ch);
        //����� ������� ��� ���������� �����
        Ch := RegisterChange(Ch);
        IF  (Ch IN LetterSet)
        THEN
          BEGIN 
            W := W + Ch;
              IF State = 'S'
              THEN 
                State := 'W'
          END
        ELSE                     
          IF State = 'W'
          THEN
            State := 'E' 
      END
    ELSE
      BEGIN
        IF State = 'W'
        THEN
          State := 'E';
        IF  State = 'S'
        THEN  
          IF EOF(FIn)
          THEN
            State := 'E'
          ELSE
            READLN(FIn)
      END;
  GetWord := W
END;    

PROCEDURE PrintStorage(VAR OutFile: TEXT; VAR WordStorage: WordsArray; VAR TotalWordsCount: INTEGER);
VAR 
  I: INTEGER;
BEGIN {PrintStorage}
  FOR I := 1 TO TotalWordsCount
  DO
    WRITELN(WordStorage[I].Word1, ' � ', WordStorage[I].Count)  
END; {PrintStorage}

PROCEDURE AddToStorage(VAR S: STRING; VAR WordStorage: WordsArray; VAR TotalWordsCount: INTEGER);
VAR
  K: INTEGER;
  I: INTEGER;
BEGIN {AddToStorage}
  K := 0;
  {����������, ���� �������� ����� K-����� �������}
  FOR I := 1 TO TotalWordsCount
  DO
    IF WordStorage[I].Word1 = S
    THEN
      K := I;  
  IF (K = 0) AND (TotalWordsCount < Max)
  THEN
    BEGIN
      TotalWordsCount := TotalWordsCount + 1;
      WordStorage[TotalWordsCount].Word1 := S;
      WordStorage[TotalWordsCount].Count := 1;
    END;
  IF K <> 0
  THEN
    WordStorage[K].Count := WordStorage[K].Count + 1;
    K := 0;
    {����������, ���� �������� ����� K-����� �������}
    FOR I := 1 TO TotalWordsCount
    DO
      IF WordStorage[I].Word1 = S
      THEN
        K := I;  
END;

PROCEDURE SortWords(VAR WordStorage: WordsArray; N: INTEGER);
  {������������� ������ ���� ������� ��������, 
  ������������ ������}
VAR
  Temp: WordStat; {��������� ���������}
  Sorted: BOOLEAN;
  I, LookN: INTEGER;
BEGIN
  Sorted := FALSE;
  LookN := N - 1;
  WHILE NOT Sorted
  DO
    BEGIN
      Sorted := TRUE;
      FOR I := 1 TO LookN 
      DO
        IF WordStorage[I].Word1 > WordStorage[I + 1].Word1
        THEN {���������� ������� ������ �������}
          BEGIN
            Temp := WordStorage[I];
            WordStorage[I] := WordStorage[I + 1];
            WordStorage[I + 1] := Temp;
            Sorted := FALSE
          END; 
      LookN := LookN - 1
    END
END;

BEGIN //TestGetWord 
  TotalWordsCount := 0;
  S := GetWord(INPUT);
  WHILE S <> ''
  DO
    BEGIN
      {�������� � ���������}
      AddToStorage(S, WordStorage, TotalWordsCount);
      S := GetWord(INPUT)
    END;  
  SortWords(WordStorage, TotalWordsCount);
  PrintStorage(OUTPUT, WordStorage, TotalWordsCount)    
END.
