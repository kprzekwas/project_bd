use kprzekwas

--tworzenie encji pojazd
 
CREATE TABLE pojazd (
id_pojazdu int IDENTITY(1,1) PRIMARY KEY,
id_modelu int,
id_rodzaju int,
id_koloru int, 
rok_produkcji int,
nr_vin varchar(25) UNIQUE not null,
przebieg BIGINT not null,
data_przyjecia date not null,
cena MONEY not null,
)


CREATE TABLE marki (
id_marki int IDENTITY(1,1) PRIMARY KEY,
nazwa_marki VARCHAR(30) not NULL,
kraj_pochodzenia VARCHAR (30) not null, 
)

CREATE TABLE kolor (
id_koloru int IDENTITY(1,1) PRIMARY KEY,
nazwa_koloru VARCHAR(20) not NULL,
)

CREATE TABLE model (
id_modelu int IDENTITY(1,1) PRIMARY KEY,
nazwa_modelu VARCHAR(30) not NULL,
id_marki int, --klucz obcy marki 
)

CREATE TABLE rodzaj (
id_rodzaju int IDENTITY(1,1) PRIMARY KEY,
rodzaj_pojazdu VARCHAR(30) not NULL,
)



--dodawanie kluczów obcych do encji pojazd
ALTER TABLE pojazd
ADD CONSTRAINT kolor_pojazd_fk FOREIGN KEY (id_koloru) REFERENCES kolor(id_koloru)
ALTER TABLE pojazd
add constraint model_pojazd_fk foreign key (id_modelu) references model(id_modelu)
ALTER TABLE pojazd
add constraint rodzaj_pojazd_fk foreign key (id_rodzaju) references rodzaj(id_rodzaju)
ALTER TABLE model
ADD CONSTRAINT marki_model_fk FOREIGN KEY (id_marki) REFERENCES marki(id_marki)

-- dodawanie rekordów do tabel model, marki, rodzaj, kolor

--dodanie rodzajow pojazdow
insert into rodzaj VALUES
('Motocykl'),
('Samochód osobowy'),
('Samochód dostawczy do 3,5t'),
('Samochód ciężarowy'),
('Skuter'),
('Czołg'),
('Ciągnik')


--dodanie marek pojazdow
insert into marki VALUES
('BMW', 'Niemcy'),
('Opel', 'Niemcy'),
('Mercedes', 'Niemcy'),
('KIA','Korea Południowa'),
('Hyundai','Korea Południowa'),
('Fiat','Włochy'),
('Volvo','Szwecja'),
('Saab','Szwecja'),
('Nissan','Japonia'),
('Toyota','Japonia'),
('Lexus','Japonia'),
('Subaru','Japonia'),
('Honda','Japonia'),
('Tata','Indie'),
('Ferrari','Włochy'),
('Alfa Romeo','Włochy'),
('Volkswagen','Niemcy'),
('Audi','Niemcy'),
('Ford','USA'),
('Renault','Francja'),
('Peugeot','Francja'),
('Citroën','Francja'),
('Skoda','Czechy')

--dodanie rekordow do tabeli kolor
INSERT INTO kolor VALUES
('czarny'),
('biały'),
('różowy'),
('szary'),
('srebny'),
('czerowny'),
('niebieski'),
('brązowy'),
('zółty'),
('pomarańczowy'),
('zielony'),
('fioletowy'),
('butelkowa zieleń'),
('krystaliczny błękit'),
('śliwka węgierka'),
('łososiowy'),
('seledynowy'),
('siwy'),
('kameleon'),
('głębia morza'),
('saharyjski piasek'),
('piaskowy'),
('beżowy'),
('pudrowy'),
('błękitny'),
('fuksja'),
('buraczkowy'),
('moro'),
('różny')


--dodanie rekordow do modeli aut
insert into model VALUES
--modele BMW
('seria 1', 1),
('seria 2', 1),
('seria 3', 1),
('seria 4', 1),
('seria 5', 1),
('seria 6', 1),
('seria 7', 1),
('seria 8', 1),
('X1', 1),
('X2', 1),
('X3', 1),
('X4', 1),
('X5', 1),
('X6', 1),
--modele Opla
('Adam', 2),
('Astra', 2),
('Insignia', 2),
('Vectra', 2),
('Corsa', 2),
('Combo', 2),
('Mokka', 2),
('Zafira', 2),
('Vivaro', 2),
--modele Mercedesa
('A', 3),
('B', 3),
('C', 3),
('CLA', 3),
('CLS', 3),
('E', 3),
('GL', 3),
('GLA', 3),
('GLC', 3),
('G', 3),
('GLS', 3),
('S', 3),
('SL', 3),
('SLC', 3),
('SLS', 3),
('AMG GT', 3),
('V', 3),
('X', 3),
('Sprinter', 3),
('Vito' , 3),
--modele KIA
('Rio', 4),
('Ceed', 4),
('Stinger', 4),
('Picanto', 4),
('Sportage', 4),
--modele Hyundai 
('i10', 5),
('i20', 5),
('i30', 5),
('i30N', 5),
('i40', 5),
('Tuscon', 5),
('Santa Fe', 5),
('ix35', 5),
('H350', 5),
('KONA', 5),
-- modele Fiata
('126p', 6),
('125p', 6),
('Punto', 6),
('Doblo', 6),
('Panda', 6),
('500', 6),
('Croma', 6),
('Bravo', 6),
('Coupe', 6),
-- Modele Volvo
('V30', 7),
('XC90', 7),
('XC60', 7),
('XC40', 7),
('V90', 7),
('S90', 7),
('S40', 7),
('S60', 7),
--Modele Saaba
('9-3', 8),
('9-5', 8),
('9000', 8),
-- Modele Nissana
('Micra', 9),
('Primera', 9),
('Qashqai', 9),
('350Z', 9),
('370Z', 9),
('Navara', 9),
('X-Trail', 9),
('GTR', 9),
--Modele Toyota
('Yaris', 10),
('Auris', 10),
('Avensis', 10),
('Prius', 10),
('Hilux', 10),
--Modele Lexus
('IS', 11),
('RX', 11),
('GS', 11),
('LS', 11),
('NX', 11),
('LC', 11),
('RX L', 11),
--modele Subaru
('Impreza', 12),
('Legacy', 12),
('XV', 12),
('Forester', 12),
('BRZ', 12),
--modele Hondy
('Civic', 13),
('CR-V', 13),
('CH-R', 13),
('Accord', 13),
('Prelude', 13),
('Jazz', 13),
--modele TATA

--modele Ferrari
('F430', 15),
('LaFerrari', 15),
('360 Modena', 15),
('Enzo', 15),
('F12', 15),
('F40', 15),
 -- modele alfa romeo 
('156', 16),
('147', 16),
('164', 16),
('4C', 16),
 -- modele marki Volkswagen
('Up!', 17),
('Polo', 17),
('Tiguan', 17),
('Tuareg', 17),
('Golf', 17),
('T-roc', 17),
('Transporter', 17),
('Passat', 17),
-- modele marki AUDI
('A3', 18),
('A4', 18),
('A5', 18),
('A6', 18),
('A7', 18),
('A8', 18),
('Q7', 18),
('Q5', 18),
('R8', 18),
--  modele marki Ford
('Escort', 19),
('Focus', 19),
('Mondeo', 19),
('Transit', 19),
('Fiesta', 19),
('Kuga', 19),
('Mustang', 19),
-- modele marki Renault
('Twingo', 20),
('Clio', 20),
('Megane', 20),
('Talisman', 20),
('Laguna', 20),
('Trafic', 20),
('Koleos', 20),
-- modele marki Peugeot
('206', 21),
('207', 21),
('3008', 21),
('5008', 21),
('607', 21),
('308', 21),
('106', 21),
('307', 21),
-- modele marki citroen 
('Saxo', 22),
('C3', 22),
('C4', 22),
('Xsara', 22),
('DS3', 22),
('DS4', 22),
('C5', 22),
('C6', 22),								
-- modele marki skoda
('Rapid', 23),
('Octavia', 23),
('Roomster', 23),
('Superb', 23),
('Fabia', 23),
('Karoq', 23),
('Kodiaq', 23)

select * from rodzaj

--dodawanie rekordow encji pojazd
INSERT INTO pojazd VALUES
(40,2,12,2003, '32131J211231MNJ41K', 208938, '2018-05-01', 35900),
(5,2,1,2011, '21JKMK3K2N4K2J42NJ', 158943, '2017-12-10', 21900),
(170,2,24,2004, '2K4MNJ3K12K3M', 319847, '2018-03-12', 13200),
(94,2,11,2016, 'DF8D9SK3J485J', 12987, '2018-01-23', 138900),
(62,3,3,1994, 'DF43GB93K4D8E', 587904, '2018-02-20', 3700),
(127,2,21,2000, 'FKD8FJSNM2IEJD', 169999, '2018-04-09', 7840),
(157,2,27,2008, 'FK829DH5J39DKMEN', 99840 , '2017-11-11', 4990),
(134,2,2,2013, 'F405JK4DJ4MFK', 76500, '2016-04-13', 119000),
(140,4,16,1996, 'FK95JFK4WMK4534', 123423, '2018-05-06', 5350),
(57,4,20,2013,'FF3L4KSM2KP09AN', 199000, '2018-01-30', 37500),
(16,2,9, 1999, 'FLL1039SSJM4NEJ', 298400, '2018-02-18', 5900),
(104,2,7,2002, 'HD7H2JDS92KD', 113490, '2018-03-16', 12900),
(119,2,28,2010, 'HD82JDKS92J', 90400, '2016-09-23', 39800),
(4,2,4,2008, 'DAJ826GWBS76SG' , 75989, '2018-04-14', 65900),
(39,2,5,2018, 'D7F265DS627D', 1900, '2018-05-20' ,698940),
(33,3,23,2015,'3439FJJK39SJ34', 47500, '2017-04-14', 245960),
(76,2,1,2004, 'FH73764GFD673', 216700, '2017-11-25', 23900),
(82,2,14,2006, 'H76152FGD6526', 69300, '2018-03-08',37700),
(91,3,20,2011, '12J9403JDKSMNR', 139820, '2018-02-02', 48500),
(99,2,4,1999, 'HD7765S6T2SY7', 317450, '2017-07-26', 9400),
(164,2,9,2013,'4JKDJ8762563G6' , 49800, '2018-03-11', 63400),
(170, 2,2,2007, '782873HDJSJHDB3', 156400, '2018-05-03', 24600 ),
(110,2,14,2004, '78H3JHD63784H7FG', 36000, '2017-04-29', 469000),
(73,2,1,2017, '7893JHF627D2773', 1690, '2017-11-24', 450000),
(66,2,6,1996, '747HDJ8736YEH', 190300, '2018-01-24', 6400),
(106,3,5,2012, 'J74883DHDHDFF', 140500, '2017-06-26', 87500),
(149,3,13,2009, 'JSK3I4J958FU', 243900, '2018-04-22', 43400),
(50,2,4,2012,'48FJ4K958J432', 24543, '2018-04-19', 29500)


--Tworzenie encji klient 
CREATE TABLE klient (
id_klienta int IDENTITY(1,1) PRIMARY KEY,
id_adres int,
imie varchar(30) not null,
Nazwisko varchar(50) not null,
PESEL char(11) not null, 
NIP varchar(20),
telefon varchar(20) not null, 
email varchar(50), 
)
--tworzenie encji adres

CREATE TABLE adres (
id_adres int IDENTITY(1,1) PRIMARY KEY,
ulica VARCHAR(25) not null, 
numer_budynku int not null,
numer_mieszkania int,
kod VARCHAR(10) not null,
miasto VARCHAR (30)
)

--tworzenie klucza obcego encji klient  (jeden do wielu, ponieważ dwóch lub wiecej klientów/pracowników mogą mieć ten sam adres)
ALTER TABLE klient
add constraint adres_klient_fk foreign key (id_adres) references adres(id_adres)

--tworzenie encji pracownik 
CREATE TABLE pracownik (
id_pracownika int IDENTITY(1,1) PRIMARY KEY,
id_adres int,
imie varchar(30) not null,
nazwisko varchar(50) not null,
PESEL char(11) not null, 
telefon varchar(20) not null, 
wyplata MONEY,
email varchar(50), 
data_przyjecia DATE, 
)

-- klucz obcy dla adresu pracownika (jeden do wielu, ponieważ dwóch lub wiecej klientów/pracowników mogą mieć ten sam adres)
ALTER TABLE pracownik
ADD CONSTRAINT adres_pracownik_fk FOREIGN KEY (id_adres) REFERENCES adres(id_adres) ON DELETE CASCADE


--towrzenie encji transakcja 
CREATE TABLE transakcja(
id_transakcji int IDENTITY(1,1) PRIMARY KEY,
id_pracownika int,
id_klienta int,
id_pojazdu int,
rodzaj_transakcji VARCHAR(15) not null,
kwota MONEY,
data_transakcji DATE,
)

--zakładanie klucza obcego dla encji transakcja 
ALTER TABLE transakcja
ADD CONSTRAINT pracownik_transakcja_fk FOREIGN KEY (id_pracownika) REFERENCES pracownik(id_pracownika) ON DELETE CASCADE
ALTER TABLE transakcja
ADD CONSTRAINT klient_transakcja_fk FOREIGN KEY (id_klienta) REFERENCES klient(id_klienta) ON DELETE CASCADE
ALTER TABLE transakcja
ADD CONSTRAINT pojazd_transakcja_fk FOREIGN KEY (id_pojazdu) REFERENCES pojazd(id_pojazdu) ON DELETE CASCADE

--towrzenie encji faktura wraz z tworzeniem kluczy obcych 

CREATE TABLE faktura (
id_faktury int IDENTITY(1,1) PRIMARY KEY,
nr_faktury int UNIQUE not null,
id_transakcji int CONSTRAINT transakcja_faktura_fk foreign key (id_transakcji) references transakcja(id_transakcji),
data_wystawienia date, 
)

--Dodawanie rekordow do tabeli adres

INSERT INTO adres VALUES
('Warszawska', '10', '13' , '82-530', 'Kwiatkowo'),
('Warszawska', '1', null, '82-500', 'Kwidzyn'),
('Szeroka', '1', '13' , '81-530', 'Warszawa'),
('Duza', '122', '23' , '32-330', 'Gdańsk'),
('Sztumska', '2', '9' , '11-220', 'Piła'),
('Pocztowa', '1', '1' , '81-000', 'Malbork'),
('Prosta', '101', '3' , '13-222', 'Olsztyn'),
('Piękna', '9', null , '13-222', 'Olsztyn'),
('Chopina', '8', '1' , '82-530', 'Kwiatkowo'),
('Mickiewicza', '34', '43' , '28-330', 'Warszawa'),
('Hallera', '4', '9' , '76-321', 'Kraków'),
('Storczykowa', '10', null , '82-500', 'Dankowo'),
('Chrobrego', '6' , null , '23-000', 'Rejna'),
('Chlodna', '104', '133' , '12-234', 'Sztum'),
('Niepodleglosci', '192', '43' , '81-000', 'Malbork'),
('Diamentowa', '3', '1' , '21-530', 'Ełk'),
('Nowa', '12', '13' , '12-520', 'Ruda'),
('Jana Pawła II', '10', '55' , '32-532', 'Zakopane'),
('Warszawska', '10', '13' , '82-530', 'Kwiatkowo')

-- dodanie rekordów do encji pracownik 
INSERT INTO pracownik VALUES
(19,'Klaudia', 'Klawinska', '84071102923' , '724105147', 7000, 'Blabla@gmial.com','2010-05-03'),
(18,'Jan', 'Kowalski','11111111111', '5433444005', 4000, 'bubu@wp.pl','1998-04-03'),
(17,'Janusz', 'Kowal', '12345678910' , '333444555', 3000, 'Baba@onet.pl','2017-03-12'),
(16,'Ewa', 'Suchanka', '12336859401' , '509881818', 9000, 'milonakow12@wp.pl','2001-12-19'),
(15,'Patryk', 'Lubelski', '98483920123' , '512342202', 6000, 'Patryk1233@o2.pl','2014-01-04')

--dodanie rekordów do encji klient
INSERT INTO klient VALUES
(16,'Klaudia', 'Kominek', '84071111923' ,'234-432-43', '744105147', 'Blabla12@gmial.com'),
(13,'Paweł', 'Lichwa', '84071134923' ,'211-234-43', '724325147', 'Blsa21@gmial.com'),
(12,'Alicja', 'Drewo', '82271105523' ,'111-112-13', '624445333', 'hahaah123@gmial.com'),
(4,'Marcin', 'Lusterko', '11171101921' ,'898-112-33', '123105147', 'Bladsad@yahdj.com'),
(10,'Elzia', 'Deska', '11111144444' ,'224-422-22', '224122144', 'Bl13233@gmial.com'),
(9,'Krzysztof', 'Gonciarz', '34534340984' ,'234-453-43', '501109049', 'Bsdbdasdala@o2.pl'),
(5,'Waldemar', 'Czarnota', '28407110999' ,'143-002-03', '111105449', 'jakismail@wp.pl'),
(7,'Mariusz', 'Koralewski', '70071304423' ,'199-499-99', '501131447', 'drugimail@gmial.com'),
(6,'Jakub', 'Jakubowski', '84434343434' ,'214-434-45', '5051349203', 'trzecimail@onet.pl'),
(8,'Dawid', 'Rusznik', '10984593829' ,'234-434-43', '5122334421', 'Gonicus13@gmial.com'),
(11,'Piotr', 'Piotrowski', '72075102922' ,'333-111-11', '724322433', 'hahaha123@gmial.com'),
(14,'Grażyna', 'Kalawala', '85051152955' ,'534-555-55', '929105149', 'Bla4323@gmial.com'),
(18,'Adrian', 'Adrianowski', '41711027823' ,'114-132-73', '507728394', 'Bl2bla@gwp.com'),
(1,'Halina', 'Stromecka', '98930490102' ,'354-444-99', '721107148', 'dobra_nazwa@gmial.com'),
(2,'Aleksandra', 'Pawluch', '96020239109' ,'234-000-43', '60704515', 'zla_nazwa@dal.com')

-- dodawanie rekordów do endji transakcja
INSERT INTO transakcja VALUES 
(5,15,28,'kupno', 19800, '2018-04-19'),
(3,13,20,'sprzedaz', 9000, '2018-05-21'),
(2,1,1,'kupno', 30000, '2018-05-01'),
(5,9,3, 'kupno', 12000,'2018-03-12'),
(1,2,2 , 'sprzedaz', 20000, '2018-05-20'),
(4,11,21,'kupno', 56799, '2018-03-11' ),
(1,3,20, 'sprzedaz', 9000, '2018-05-23') ,
(4,6,4, 'kupno', 130000, '2018-01-22'),
(3,7,26, 'kupno', 80000, '2017-06-26'),
(1,8,10, 'sprzedaz', 37500, '2018-02-21'),
(5,10,15, 'kupno' , 665000, '2018-05-20'),
(4,12,19, 'kupno' , 48000, '2018-02-02'),
(2,14,27, 'sprzedaz' , 43400, '2018-05-28'),
(4,4,25, 'kupno', 4000, '2018-01-24'),
(3,5,5,'sprzedaz', 3500, '2018-04-23'),
(2,3,6, 'kupno' , 6000, '2018-04-09'),
(1,11,7, 'sprzedaz', 4990, '2018-01-12'),
(2,15,8, 'kupno', 100000, '2016-04-13'),
(5,13,9, 'kupno', 5200, '2018-05-06'),
(2,4,11,'sprzedaz', 5400,'2018-05-23'),
(4,5,12, 'kupno' , 9000, '2018-03-16'),
(1,1,13, 'kupno' , 37000, '2016-09-23')


INSERT INTO faktura VALUES
(123, 2, '2018-05-30'),
(132, 1, '2018-06-01'),
(12, 22, '2018-02-03'),
(432, 7, '2018-03-05'),
(99, 11, '2018-05-11'),
(1, 18, '2018-01-01'),
(2, 3, '2018-05-08'),
(4, 13, '2018-04-28'),
(154, 9, '2018-03-22'),
(354, 10, '2018-06-02'),
(431, 14, '2018-04-01'),
(512, 8, '2018-06-03')



ALTER TRIGGER sprawdz_date_przyjecia
ON pojazd 
FOR INSERT, UPDATE
AS
DECLARE
	@data_przyjecia DATE;
BEGIN
	SELECT @data_przyjecia = data_przyjecia FROM pojazd;
	IF @data_przyjecia > GETDATE()
		RAISERROR('Niewłaściwa data przyjęcia!', 1, 2)
END
ROLLBACK


INSERT INTO pojazd VALUES
(40, 2, 12, 2033, '321311MNJ41K', 208938, '2019-05-01', 35900)

