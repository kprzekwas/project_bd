--dr Robert Fidytek, 09.04.2014 r.
--(MSSQL) Usuwanie wszystkich tabel i widokow z bie��cej bazy danych

use kprzekwas

--Krok 1) Usuwanie wszystkich kluczy obcych z bie��cej bazy danych
DECLARE @sql NVARCHAR(300)
WHILE EXISTS(SELECT TOP 1 1 
             FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
             WHERE TABLE_CATALOG=DB_NAME() AND 
                   CONSTRAINT_TYPE='FOREIGN KEY')
BEGIN
  SELECT @sql='ALTER TABLE ' + TABLE_NAME + 
         ' DROP CONSTRAINT ' + CONSTRAINT_NAME 
  FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
  WHERE TABLE_CATALOG=DB_NAME() AND 
        CONSTRAINT_TYPE='FOREIGN KEY'
  EXEC sp_executesql @sql
END
GO

--Krok 2) Usuwanie wszystkich tabel z bie��cej bazy danych
DECLARE @sql NVARCHAR(300)
WHILE EXISTS(SELECT TOP 1 1 
             FROM INFORMATION_SCHEMA.TABLES
			 WHERE table_type='BASE TABLE')
BEGIN
  SELECT @sql='DROP TABLE ' + TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES 
  WHERE table_type='BASE TABLE'
  EXEC sp_executesql @sql
  --SELECT @sql
END
GO

--Krok 3) Usuwanie wszystkich widokow z bie��cej bazy danych
DECLARE @sql NVARCHAR(300)
WHILE EXISTS(SELECT TOP 1 1 
             FROM INFORMATION_SCHEMA.TABLES
			 WHERE table_type='VIEW')
BEGIN
  SELECT @sql='DROP VIEW ' + TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES 
  WHERE table_type='VIEW'
  EXEC sp_executesql @sql
  --SELECT @sql
END
GO

