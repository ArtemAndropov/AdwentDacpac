/*
 Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут исполнены перед скриптом построения.	
 Используйте синтаксис SQLCMD для включения файла в скрипт, выполняемый перед развертыванием.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте перед развертыванием.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if OBJECT_ID('tempdb..##FromVS') is null
	BEGIN
		CREATE TABLE ##FromVS
(
	[Id] INT NOT NULL PRIMARY KEY,
	[text] nvarchar(255) NULL,
	[Date] date  DEFAULT GetDate() NULL, 
)


INSERT into ##FromVS (id,text)
VALUES (1,'one'),(2,'two'),(3,'three')
	END
ELSE
	BEGIN
		TRUNCATE TABLE dbo.Address
	END