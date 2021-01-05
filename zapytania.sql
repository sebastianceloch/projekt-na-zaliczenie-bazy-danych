SELECT imie,nazwisko, wynagrodzenie_zasadnicze, premie, wynagrodzenie_zasadnicze+premie AS pełne_wynagrodzenie
FROM pracownicy INNER JOIN zarobki ON pracownicy.id_pracownika=zarobki.id_pracownika
ORDER BY nazwisko;

SELECT imie,nazwisko,nazwa_wydzialu,pesel
FROM pracownicy INNER JOIN wydzial ON pracownicy.id_pracownika=wydzial.id_pracownika
ORDER BY nazwisko;

SELECT avg(wynagrodzenie_zasadnicze) AS 'srednie_wynagrodzenie',nazwa_wydzialu
FROM wydzial INNER JOIN zarobki ON wydzial.id_pracownika=zarobki.id_pracownika
GROUP BY numer_wydzialu;

SELECT id_zamowienia, nazwa_produktu AS 'nazwa', cena+koszt_wysylki AS 'calkowity_koszt', sposob_wysylki
FROM produkty INNER JOIN zamowienia ON produkty.id_produktu=zamowienia.id_produktu
ORDER BY calkowity_koszt ASC;

SELECT imie, nazwisko, MAX(wynagrodzenie_zasadnicze+premie) AS 'wynagrodzenie_calkowite', nazwa_wydzialu
FROM pracownicy INNER JOIN wydzial ON pracownicy.id_pracownika=wydzial.id_pracownika INNER JOIN zarobki ON pracownicy.id_pracownika=zarobki.id_pracownika
GROUP BY nazwa_wydzialu;

SELECT nazwa_wydzialu, COUNT(id_pracownika) AS 'liczba_pracownikow' FROM wydzial
GROUP BY nazwa_wydzialu;

SELECT nazwa_produktu AS 'nazwa', cena, koszt_wysylki, sposob_wysylki, data_wysylki,CONCAT(imie," ", nazwisko) AS 'imie_nazwisko_dostawcy'
FROM produkty INNER JOIN zamowienia ON produkty.id_produktu=zamowienia.id_produktu INNER JOIN pracownicy ON zamowienia.id_pracownika=pracownicy.id_pracownika
WHERE data_wysylki BETWEEN '2020/12/01' AND '2020/12/31'
ORDER BY data_wysylki;

SELECT imie,nazwisko,wynagrodzenie_zasadnicze
FROM pracownicy INNER JOIN zarobki ON pracownicy.id_pracownika=zarobki.id_pracownika
WHERE wynagrodzenie_zasadnicze>(SELECT AVG(wynagrodzenie_zasadnicze) FROM zarobki);

SELECT id_produktu,nazwa_produktu,cena
FROM produkty
WHERE cena>(SELECT AVG(cena) FROM produkty);

SELECT ID,imie,nazwisko,pesel
FROM (SELECT id_pracownika as ID, imie, nazwisko, pesel,data_urodzenia FROM pracownicy) as tab1
WHERE data_urodzenia BETWEEN '1990/01/01' AND '2000/01/01';