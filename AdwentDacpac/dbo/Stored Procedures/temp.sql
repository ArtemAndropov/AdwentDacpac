-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE temp

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
declare @VAL nvarchar(max)
	SET @VAL=REPLACE((@VAL+'!'),',!','')
DECLARE @PIVOT nvarchar(MAX)
SET @PIVOT='SELECT Год, '+@VAL+
' FROM (SELECT     dbo.Трудозатраты.Трудоемкость, dbo.Отделы.Аббревиатура, dbo.Месячный_план_отдела.Год
FROM         dbo.Трудозатраты INNER JOIN
                      dbo.Месячный_план_отдела ON dbo.Трудозатраты.Код_задания = dbo.Месячный_план_отдела.Код_задания INNER JOIN
                      dbo.Годовой_план_отдела ON dbo.Месячный_план_отдела.Код_пункта_плана_отдела = dbo.Годовой_план_отдела.Код_пункта_плана_отдела INNER JOIN
                      dbo.Отделы ON dbo.Годовой_план_отдела.Код_отдела = dbo.Отделы.Код_отдела) MyTable
PIVOT (
 sum(Трудоемкость) FOR Аббревиатура IN ('+@VAL+')
) MyReport'

EXEC (@PIVOT)
END