/*
Шаблон скрипта после развертывания							
--------------------------------------------------------------------------------------
 В данном файле содержатся инструкции SQL, которые будут добавлены в скрипт построения.		
 Используйте синтаксис SQLCMD для включения файла в скрипт после развертывания.			
 Пример:      :r .\myfile.sql								
 Используйте синтаксис SQLCMD для создания ссылки на переменную в скрипте после развертывания.		
 Пример:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if OBJECT_ID('dbo.Address') is null
	BEGIN
		CREATE TABLE [dbo].[Address](
			[AddressID] [int] NOT NULL,
			[AddressLine] [nvarchar](255) NULL,
			[City] [nvarchar](30) NOT NULL,
		)
	END
ELSE
	BEGIN
		TRUNCATE TABLE dbo.Address
	END

INSERT INTO dbo.Address (AddressID,AddressLine,[City])
	SELECT distinct [AddressID]
      ,[AddressLine1] + ' ' + ISNULL([AddressLine2],'') as  AddressLine
      ,[City]    
	FROM [AdventureWorks2016].[Person].[Address]

if OBJECT_ID('tempdb..##FromVS') is not null
	insert into TableFromVS(Id,text,Date)
	SELECT * FROM ##FromVS