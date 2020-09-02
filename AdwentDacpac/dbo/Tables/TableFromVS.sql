CREATE TABLE [dbo].[TableFromVS]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[text] nvarchar(255) NULL,
	[Date] date  DEFAULT GetDate() NULL, 
)
