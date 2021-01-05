USE sklep_komputerowy;
CREATE TABLE pracownicy(
id_pracownika INT auto_increment PRIMARY KEY,
imie varchar(60) NOT NULL,
nazwisko varchar(60) NOT NULL,
pesel varchar(11) NOT NULL,
data_urodzenia DATE,
telefon VARCHAR(20) UNIQUE
);

CREATE TABLE produkty(
id_produktu INT auto_increment PRIMARY KEY,
nazwa_produktu VARCHAR (100) NOT NULL,
ilosc INT,
cena INT NOT NULL
);

CREATE TABLE wydzial(
id_wydzial INT auto_increment primary key,
numer_wydzialu INT NOT NULL,
nazwa_wydzialu varchar(60) NOT NULL,
id_pracownika INT,
FOREIGN KEY(id_pracownika) REFERENCES pracownicy (id_pracownika)
);

CREATE TABLE zamowienia(
id_zamowienia INT auto_increment PRIMARY KEY,
koszt_wysylki INT NOT NULL,
sposob_wysylki VARCHAR (40) NOT NULL,
id_produktu INT,
data_wysylki DATE,
id_pracownika INT,
FOREIGN KEY(id_produktu) REFERENCES produkty(id_produktu),
FOREIGN KEY(id_pracownika) REFERENCES pracownicy(id_pracownika)
);

CREATE TABLE zarobki(
id_zarobki INT auto_increment primary key,
wynagrodzenie_zasadnicze INT NOT NULL,
premie INT,
id_pracownika INT,
FOREIGN KEY(id_pracownika) REFERENCES pracownicy(id_pracownika)
);

INSERT INTO pracownicy(imie,nazwisko,pesel,data_urodzenia,telefon)
VALUES
('Karol','Krzyczak','95041634533','1995-04-16','695410690'),
('Martyna','Jedrzejczak','95041764544','1995-04-17','612132122'),
('Jakub','Krol','92030423121','1992-03-04','555434254'),
('Jakub','Kot','92050223321','1992-05-02','654543666'),
('Stefan','Sek','88111723133','1988-11-17','987567666'),
('Grzegorz','Bubek','76122454321','1976-12-24','777689700'),
('Anna','Lewandowska','98021765431','1998-02-17','974233765'),
('Robert','Witoldowski','96061254343','1996-06-12','798098754'),
('Wiktor','Warana','90070556432','1990-07-05','089696212'),
('Andrzej','Loczek','88080854356','1988-08-08','989864532'),
('Jakub','Wojtyla','92090954632','1992-09-09','674202341'),
('Robert','Krawczyk','92021634533','1992-02-16','292410690'),
('Matylda','Jedrzaczak','91011764544','1991-01-17','214162122'),
('Kuba','Krolek','98040623121','1998-04-06','552434244'),
('Jakub','Kotson','92060423321','1992-06-04','354553876');

INSERT INTO produkty (nazwa_produktu,ilosc,cena)
VALUES
('Karta graficzna ASUS GTX1660',450,2400),
('Karta graficzna ASUS GTX1660Ti',300,3000),
('Karta graficzna NVIDIA GeForce RTX2060',200,3500),
('Procesor Intel Core i7-9700k',1000,1200),
('Procesor AMD RYZEN 5',750,1150),
('Procesor Intel Core i5-10600f',600,1300),
('KINGSTON Pamiec RAM 8GB',2000,200),
('Monitor ASUS ROG 27 CALI',600,900),
('Monitor LENOVO LEGION 26 CALI',600,800),
('Monitor BENQ 32 CALE',300,1400),
('AirPods 4',300,2400),
('MiDots S',2000,300);

INSERT INTO wydzial(numer_wydzialu,nazwa_wydzialu,id_pracownika)
VALUES
(1,'sprzedawca',2),
(1,'sprzedawca',9),
(1,'sprzedawca',7),
(1,'sprzedawca',4),
(2,'stazysta',1),
(2,'stazysta',3),
(3,'ksiegowy',5),
(3,'ksiegowy',8),
(4,'informatyk',11),
(4,'informatyk',10),
(5,'kierownik',6),
(6,'kurier',12),
(6,'kurier',13),
(6,'kurier',14),
(6,'kurier',15);

INSERT INTO zamowienia(koszt_wysylki,sposob_wysylki,id_produktu,data_wysylki,id_pracownika)
VALUES
(12,'fedex',2,'2020-11-14',12),
(16,'dpd',1,'2020-12-19',12),
(10,'inpost',1,'2020-07-16',13),
(10,'inpost',7,'2020-11-19',13),
(10,'inpost',4,'2020-12-12',14),
(12,'fedex',6,'2020-12-11',15),
(12,'fedex',11,'2020-12-12',15),
(16,'dpd',12,'2020-11-10',15),
(12,'fedex',5,'2020-12-12',14),
(10,'inpost',4,'2020-12-14',14),
(10,'inpost',1,'2020-12-20',13),
(10,'inpost',8,'2020-12-21',12),
(10,'inpost',9,'2020-11-22',12),
(10,'inpost',8,'2020-11-01',14),
(12,'fedex',4,'2020-12-04',15),
(12,'fedex',9,'2020-12-20',12);

INSERT INTO zarobki(wynagrodzenie_zasadnicze,premie,id_pracownika)
VALUES
(2500,300,1),
(2800,300,2),
(2500,300,3),
(3600,700,4),
(4000,500,5),
(7600,1000,6),
(3300,300,7),
(4000,300,8),
(3100,200,9),
(5600,500,10),
(6100,600,11),
(3200,300,12),
(3300,300,13),
(3500,300,14),
(2500,300,15);


