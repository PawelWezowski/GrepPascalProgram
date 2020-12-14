program FirstPASCALprogram;
uses crt;
var
   textWar:text;
   label repeatPoint;
procedure WordCounter;  {procedura liczaca slowa}
var
   wordiIter:integer;
   iterator:integer;
   lastCharIter:integer;
   charScan:char;
 begin
      iterator:=0;            {wyzerowanie wykorzystanych zmiennych}
      wordiIter:=0;
      lastCharIter:=0;
      assign(textWar,'D:\projekt111.txt'); {scieżka do pliku wejsciowego}
      reset(textWar);
         repeat
               read(textWar,charScan);       {zakres w tablicy ASCI w ktorym znajduja sie male i duze litery }
               if (((charScan>=chr(97)) and (charScan<=chr(122))) or ((charScan>=chr(65)) and (charScan<=chr(90))))
               then
                  begin {instrukcja wykonywana gdy zmienna jest litera}
                       if(iterator = 0) then iterator:=1;
                       wordiIter:=iterator;   {licznik slow wzrasta po nowym slowie}
                       lastCharIter:=1;{dzięki temu przypisaniu wordiIter zwiekszana jest tylko po literze}
                  end
               else
                   begin   {jesli zmienna nie jest litera wykonywana jest ta }
                        if(lastCharIter =1)
                        then
                            begin
                                 inc(iterator);
                                 lastCharIter:=0;{ lastCharIter tylko raz po znaku innym niz litera}
                            end;

                   end;

         until eof (textWar);
         writeln('ilosc slow wynosi : ',wordiIter);
         readln;
         readln;
         close(textWar);
         end;
procedure Charcounter;    {procedura liczaca znaki}
          var
             textRow:string;
             charCounter:integer;

begin
     clrscr;
     assign(textWar,'D:\projekt111.txt');
     reset(textWar);
     charCounter:=0;
     repeat  {petla zliczajaca ilosc znakow w linijkach}
             readln(textWar,textRow);
             charCounter:=charCounter+length(textRow); {i sumujaca ich ilosc}
     until eof(textWar) ;
     close(textWar);
     writeln('w pliku jest ',charCounter,' wszystkich znakow');
     readln;
     readln;
end;
var
   menuChoice:char;
begin{glowny blok programu wysylajacy do okreslonej procedury}
             repeatPoint:
             clrscr;
             writeln('nacisnij:');
             writeln('S - by zliczyc ilosc slow');
             writeln('Z - by zliczyc ilosc znakow');
             writeln('lub');
             writeln('H - by wyjsc');
             read(menuChoice);
             menuChoice:=upcase(menuChoice);
         if (menuChoice)='S' then WordCounter;
         if (menuChoice)='Z' then Charcounter;
         if (menuChoice)='H' then halt
         else goto repeatPoint;
  end.

