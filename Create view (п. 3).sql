create view �������������������� as
select i.id_�������, i.���, sum(k.���������) as �������������
from ������� i
join ��������� k on k.id_������� = i.id_�������
group by i.id_�������, i.���

go

create view ���������������������� as 
select top 1 i.id_�������, i.���, max([���-�� ����������]) as [����. ���-��]
from ������� i
join ��������� k on k.id_������� = i.id_�������
join (
	select ii.id_�������, ii.���, count(*) as [���-�� ����������]
	from ������� ii
	join ��������� kk on kk.id_������� = ii.id_�������
	group by ii.id_�������, ii.���
) a on i.id_������� = a.id_�������
group by i.id_�������, i.���
order by [����. ���-��] desc

go

create view ������������������������ as
select top 1 k.������������, max([���-�� �������]) as [����. ���-��]
from ��������� k 
join ������� i on k.id_������� = i.id_�������
join (
	select kk.������������, count(*) as [���-�� �������]
	from ��������� kk 
	join ������� ii on kk.id_������� = ii.id_�������
	group by kk.������������
) a on k.������������ = a.������������
group by k.������������
order by [����. ���-��] desc

go

create view �������������� as
select s.id_�������,
		avg(s.����_�������_����������_�������) - ������������� as �������
from ������� s
join (
	select i.id_�������, sum(k.���������) as �������������
	from ������� i
	join ��������� k on k.id_������� = i.id_�������
	group by i.id_�������
) a on a.id_������� = s.id_�������
group by s.id_�������, a.�������������

go

create view �������������� as
select i.id_�������, i.����������_����_��_���_������,
(select avg([����������_����_��_���_������]) [�������_���-��]
		from �������) [�������_���-��]
from ������� i
where [����������_����_��_���_������] > (select avg([����������_����_��_���_������]) [�������_���-��]
		from �������)