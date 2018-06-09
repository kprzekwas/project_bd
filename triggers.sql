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
