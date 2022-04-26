

USE master; 
GO 

CREATE DATABASE TURISMO 
ON ( 
	NAME = TURIMO, 
	FILENAME = 'E:\SQLServerDB\TURISMO.mdf', 
	SIZE = 10, 
	MAXSIZE = 50, 
	FILEGROWTH = 5 
) 
LOG ON ( 
	NAME = TURISMOLOG, 
	FILENAME = 'E:\SQLServerDB\TURISMOLOG.ldf', 
	SIZE = 5MB, 
	MAXSIZE = 25MB, 
	FILEGROWTH = 5MB 
); 
GO

