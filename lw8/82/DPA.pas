PROGRAM Split(INPUT,OUTPUT);
{�������� INPUT � OUTPUT,������� ��������,� ����� ������
 ��������}
VAR
  Ch: CHAR;
  F1: TEXT;

PROCEDURE CopyIn(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  {���������� �� INPUT � F1}
  REWRITE(F1);
  WHILE NOT EOF(INPUT)
  DO
  BEGIN
    WHILE NOT EOLN(INPUT)
    DO
      BEGIN
        READ(INPUT, Ch);
        WRITE(F1, Ch)
      END;
    READLN(INPUT)
  END
END;

PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  {�������� F1 � OUTPUT}
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(OUTPUT, Ch)
    END
END;

BEGIN
  {��������� ��������� CopyOut ����� CopyIn}
  CopyIn(F1, Ch);
  CopyOut(F1, Ch);
  WRITELN
END.

