-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION ВыдатьПопулярнейшееИзделие
(
)
RETURNS int
AS
BEGIN

	RETURN (select top 1 id_изделия
from (
select id_изделия, count(*) as kolvo
from продажа
group by id_изделия) a
order by kolvo desc)

END
GO

