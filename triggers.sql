-- Blokowanie dodawania dat przyjęcia pojadów z przyszłości

CREATE TRIGGER sprawdz_date_przyjecia
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

INSERT INTO pojazd VALUES (40, 2, 12, 2003, '32131J211231MN', 208938, '2022-05-01', 35900)

-- Dodanie premi dla pracownika który zaksięgował transakcje

ALTER TRIGGER dodaj_premie
ON transakcja 
FOR INSERT
AS
DECLARE
	@premia BIT
BEGIN
	SELECT @premia = premia FROM pracownik p 
	WHERE p.id_pracownika=(SELECT id_pracownika FROM inserted)
	
	IF @premia=0
		UPDATE pracownik SET premia=1 
		WHERE pracownik.id_pracownika=(SELECT id_pracownika FROM inserted)
END

INSERT INTO transakcja VALUES (2,15,28,'kupno', 19800, '2018-04-19')

