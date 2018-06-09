CREATE FUNCTION dbo.pojazdy_z_roku (@rok_produkcji_arg int)
RETURNS TABLE
AS 
RETURN
(
	SELECT nazwa_marki, nazwa_modelu, rok_produkcji 
	FROM pojazd p
	JOIN model mo ON p.id_modelu=mo.id_modelu 
	JOIN marki ma ON mo.id_marki=ma.id_marki
	WHERE p.rok_produkcji=@rok_produkcji_arg
)

SELECT * FROM pojazdy_z_roku(2011)
