PROGRAM CountWords(INPUT, OUTPUT);

FUNCTION CountWordsInString(inputString: STRING): INTEGER;
VAR
  i, count: INTEGER;
  inWord: Boolean;
  delimiters: SET OF Char;
BEGIN
  count := 0;  { �������������� ���������� wordCount }
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
            count := count + 1; { ����������� ������� ���� }
          END;
      END
    ELSE
      BEGIN
        inWord := False;
      END;
  END;
    CountWordsInString := count; { ���������� ��������� }
END;

VAR
  inputString: STRING;
  wordCount: Integer;
BEGIN
  Write('������� �����: ');
  ReadLn(inputString);
  wordCount := CountWordsInString(inputString);
  WriteLn('���������� ���� �� ��������� ������: ', wordCount);
END.

