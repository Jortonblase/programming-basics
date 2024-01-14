PROGRAM Split(INPUT, OUTPUT);
VAR 
  Ch, Next: CHAR;
BEGIN
  Next := 'O';
  READ(INPUT, Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Next = 'O'
      THEN
        BEGIN
          WRITELN(Next, Ch);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITELN(Next, Ch);
          Next := 'O'
        END;
      READ(INPUT, Ch)
    END;  
END.
