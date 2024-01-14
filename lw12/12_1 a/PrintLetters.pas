PROGRAM TestPrintLetters(INPUT, OUTPUT);
TYPE
  LetterSet = SET OF CHAR;
CONST
  AllVowelsSet = ['a', 'e', 'i', 'o', 'u', 'y'];
VAR
  Vowels: LetterSet;
  
PROCEDURE FindVowels(VAR FIn: TEXT; VAR Vowels: LetterSet);
VAR 
  Ch: CHAR;
BEGIN
  Vowels := [];
  WHILE NOT EOF(FIn)
  DO
    IF NOT EOLN(FIn)
    THEN 
      BEGIN 
        READ(FIn, Ch);                                         
        IF Ch IN AllVowelsSet
        THEN 
          Vowels := [Ch] + Vowels
        ELSE
          READLN(FIn)
      END
        
END;


PROCEDURE PrintLetters(VAR FOut: TEXT; VAR Letters: LetterSet);
VAR
  Ch: CHAR;
BEGIN
  {перебрать все буквы от 'a' до 'z' и напечатать только те, что есть в Letters}                                                                   
  FOR Ch := 'a' TO 'z'
  DO
    IF Ch IN Letters
    THEN 
      WRITE(FOut, Ch)
END;

BEGIN
  FindVowels(INPUT, Vowels);
  PrintLetters(OUTPUT, Vowels)          
END.
