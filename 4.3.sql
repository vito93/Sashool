-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE УдалитьИзделияСКомпонентамиБольшеОднойСтраны
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

delete from
изделия
where id_изделия in(

select id_изделия
from(
select i.id_изделия,
		count(distinct ii.страна_изготовителя) as [кол-во стран]
		from издели¤ i
		join компонент k on k.id_издели¤ = i.id_изделия
		join изготовитель ii on ii.id_изготовитель = k.id_изготовитель
		group by i.id_изделия
		having count(distinct ii.страна_изготовителя) > 1

		) a
		)
END
GO
