PROGRAM TestFindVowels(INPUT, OUTPUT);
TYPE
  LetterSet = SET OF CHAR;
CONST
  AllVowels = ['a', 'e', 'i', 'o', 'u', 'y', 'A', 'E', 'I', '0', 'U', 'Y'];

VAR
  MyLetters: LetterSet;
  
PROCEDURE FindVowels(VAR F: TEXT; VAR Vowels: LetterSet);
VAR
  Ch: CHAR;
BEGIN
  Vowels := [];
  WHILE NOT EOF(F)
  DO
  begin
    while NOT EOLN(F)
    do
      BEGIN
        READ(F, Ch);
        IF Ch IN AllVowels
        THEN
          BEGIN
            IF Ch = 'A'
            THEN
              Ch := 'a';
            
            IF Ch = 'E'
            THEN
              Ch := 'e';
            
            IF Ch = 'I'
            THEN
              Ch := 'i';
            
            IF Ch = 'O'
            THEN
              Ch := 'o';
            
            IF Ch = 'U'
            THEN
              Ch := 'u';
          
            IF Ch = 'Y'
            THEN
              Ch := 'y';
            
            Vowels := Vowels + [Ch]
          END
      END;
      READLN(F)
      end
END;


PROCEDURE PrintLetters(VAR FOut: TEXT; VAR Letters: LetterSet);
VAR
  Ch: CHAR;
BEGIN
  FOR Ch := 'A' TO 'z'
  DO
    IF Ch IN Letters
    THEN
      WRITE(FOut, Ch, ' ')
END;

BEGIN
  FindVowels(INPUT, MyLetters);
  PrintLetters(OUTPUT, MyLetters)
END.                    
