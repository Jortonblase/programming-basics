PROGRAM TestPrintStorage(INPUT, OUTPUT);

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
  S: STRING;

FUNCTION RegisterChange (Letter1: CHAR): CHAR;
CONST
  BigLetters = 'јЅ¬√ƒ≈®∆«»… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№ЁёяABCDEFGHLJKLMNOPQRSTUVWXYZ';
  SmallLetters = 'абвгдеЄжзийклмнопрстуфхцчшщъыьэю€abcdefghljklmnopqrstuvwxyz';
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
  LetterSet = ['a'..'z', 'а'..'€', 'A'..'Z', 'ј'..'я', '®', 'Є', '0'..'9'];
BEGIN
  State := 'S';
  W := '';
  WHILE State <> 'E'
  DO  
    IF (NOT EOLN(FIn)) AND (NOT EOF(FIn))
    THEN
      BEGIN
        READ(FIn, Ch);
        //вызов функции дл€ уменьшени€ буквы
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

  
PROCEDURE AddToStorage(VAR S: STRING; VAR WordStorage: WordsArray; VAR TotalWordsCount: INTEGER);
VAR
  K: INTEGER;
  I: INTEGER;
BEGIN {AddToStorage}
  K := 0;
  {определить, куда добавить слово K-номер позиции}
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
    {определить, куда добавить слово K-номер позиции}
    FOR I := 1 TO TotalWordsCount
    DO
      IF WordStorage[I].Word1 = S
      THEN
        K := I;  
END;

PROCEDURE PrintStorage(VAR OutFile: TEXT; VAR CurrentWords: WordsArray; VAR TotalWordsCount: INTEGER);
VAR 
  I: INTEGER;
BEGIN {PrintStorage}
  FOR I := 1 TO TotalWordsCount
  DO
    WRITELN(CurrentWords[I].Word1, ' Ч ', CurrentWords[I].Count)  
END; {PrintStorage}
 
BEGIN//“естPrintStorage
  TotalWordsCount := 0;
  S := GetWord(INPUT);
  WHILE S <> ''
  DO
    BEGIN
      {добавить в хранилище}
      AddToStorage(S, WordStorage, TotalWordsCount);
      S := GetWord(INPUT)
    END;  
  PrintStorage(OUTPUT, WordStorage, TotalWordsCount)
END.
