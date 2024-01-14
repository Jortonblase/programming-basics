PROGRAM CountWords(INPUT, OUTPUT);

FUNCTION CountWordsInString(inputString: STRING): INTEGER;
VAR
  i, count: INTEGER;
  inWord: Boolean;
  delimiters: SET OF Char;
BEGIN
  count := 0;  { Инициализируем переменную wordCount }
  inWord := False;

  delimiters := [' ', '.', ',', '!', '?', '-'];

  FOR i := 1 TO Length(inputString)
  DO
  BEGIN
    IF NOT (inputString[i] IN delimiters)
    THEN
      BEGIN
        IF NOT inWord 
        THEN
          BEGIN
            inWord := True;
            count := count + 1; { Увеличиваем счетчик слов }
          END;
      END
    ELSE
      BEGIN
        inWord := False;
      END;
  END;
    CountWordsInString := count; { Возвращаем результат }
END;

VAR
  inputString: STRING;
  wordCount: Integer;
BEGIN
  Write('Введите текст: ');
  ReadLn(inputString);
  wordCount := CountWordsInString(inputString);
  WriteLn('Количество слов во введенном тексте: ', wordCount);
END.

