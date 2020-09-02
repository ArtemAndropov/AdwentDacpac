CREATE TABLE [dbo].[TestTable2]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[jump_count] INT NULL,
	[person] nvarchar(400) NOT NULL,
	[cvalification] nvarchar(50) DEFAULT 'junior'

)
