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
CREATE FUNCTION ��������������������������������
(
)
RETURNS nvarchar(20)
AS
BEGIN
	-- Return the result of the function
	RETURN (select top 1 [���]--, avg([����������_����_��_���_������]) as avg_days
			from �������
			group by [���]
			order by avg([����������_����_��_���_������])
			)

END
GO

--select [dbo].[��������������������������������]()