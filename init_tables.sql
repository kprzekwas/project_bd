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


--dodawanie kluczy obcych do encji pojazd

ALTER TABLE pojazd ADD CONSTRAINT kolor_pojazd_fk FOREIGN KEY (id_koloru) REFERENCES kolor(id_koloru)

ALTER TABLE pojazd ADD CONSTRAINT model_pojazd_fk FOREIGN KEY (id_modelu) REFERENCES model(id_modelu)

ALTER TABLE pojazd ADD CONSTRAINT rodzaj_pojazd_fk FOREIGN KEY (id_rodzaju) REFERENCES rodzaj(id_rodzaju)

ALTER TABLE model ADD CONSTRAINT marki_model_fk FOREIGN KEY (id_marki) REFERENCES marki(id_marki)


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

ALTER TABLE klient add constraint adres_klient_fk foreign key (id_adres) references adres(id_adres)


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

ALTER TABLE pracownik ADD CONSTRAINT adres_pracownik_fk FOREIGN KEY (id_adres) REFERENCES adres(id_adres) ON DELETE CASCADE


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

ALTER TABLE transakcja ADD CONSTRAINT pracownik_transakcja_fk FOREIGN KEY (id_pracownika) REFERENCES pracownik(id_pracownika) ON DELETE CASCADE

ALTER TABLE transakcja ADD CONSTRAINT klient_transakcja_fk FOREIGN KEY (id_klienta) REFERENCES klient(id_klienta) ON DELETE CASCADE

ALTER TABLE transakcja ADD CONSTRAINT pojazd_transakcja_fk FOREIGN KEY (id_pojazdu) REFERENCES pojazd(id_pojazdu) ON DELETE CASCADE


--towrzenie encji faktura wraz z tworzeniem kluczy obcych 

CREATE TABLE faktura (
	id_faktury int IDENTITY(1,1) PRIMARY KEY,
	nr_faktury int UNIQUE not null,
	id_transakcji int CONSTRAINT transakcja_faktura_fk foreign key (id_transakcji) references transakcja(id_transakcji),
	data_wystawienia date, 
)

