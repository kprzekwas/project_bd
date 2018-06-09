--widok na auta , które posiadał lub posiada komis

SELECT 
	id_pojazdu, nazwa_marki, 
	nazwa_modelu, rok_produkcji, 
	nr_vin, przebieg, cena, data_przyjecia
FROM 
	pojazd p
INNER JOIN 
	model mo ON p.id_modelu=mo.id_modelu 
INNER JOIN 
	marki ma ON mo.id_marki=ma.id_marki
	
--widok wszystkich marek oraz modeli 

SELECT 
	nazwa_marki, nazwa_modelu, kraj_pochodzenia
FROM 
	marki ma 
LEFT JOIN 
	model mo ON ma.id_marki=mo.id_marki

-- widok aut obecnych w komisie na sprzedaz posorotoawne wedlug ceny rosnaco

SELECT 
	nazwa_marki, nazwa_modelu, rok_produkcji, 
	przebieg, cena, nazwa_koloru, nr_vin, rodzaj_transakcji   
FROM 
	pojazd p 
INNER JOIN 
	model mo ON p.id_modelu=mo.id_modelu 
INNER JOIN 
	marki ma ON mo.id_marki=ma.id_marki
INNER JOIN 
	transakcja t ON p.id_pojazdu=t.id_pojazdu 
INNER JOIN 
	kolor k on k.id_koloru=p.id_koloru
WHERE 
	rodzaj_transakcji not like 'sprzedaz'
ORDER BY 
	cena DESC  

--widok pracowników według ilości transakcji (ranking pracowników) 

SELECT 
	count(*) as ilosc_transakcji, imie, nazwisko
FROM 
	pracownik p 
INNER JOIN 
	transakcja t on p.id_pracownika=t.id_pracownika
GROUP BY 
	p.id_pracownika, imie, nazwisko
ORDER BY 
	ilosc_transakcji DESC
