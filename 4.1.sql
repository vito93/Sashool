create procedure ������������������������� as
begin
declare @min int = (select min([���-�� �����]) from 
	(
		select i.id_�������,
		count(distinct ii.������_������������) as [���-�� �����]
		from ������� i
		join ��������� k on k.id_������� = i.id_�������
		join ������������ ii on ii.id_������������ = k.id_������������
		group by i.id_�������
	) a
)

select *
from 		(select i.id_�������,
		count(distinct ii.������_������������) as [���-�� �����]
		from ������� i
		join ��������� k on k.id_������� = i.id_�������
		join ������������ ii on ii.id_������������ = k.id_������������
		group by i.id_�������) a
where [���-�� �����] = @min

end

--exec �������������������������