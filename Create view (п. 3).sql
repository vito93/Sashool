create view СебестоимостьИзделия as
select i.id_изделия, i.тип, sum(k.стоимость) as Себестоимость
from изделия i
join компонент k on k.id_изделия = i.id_изделия
group by i.id_изделия, i.тип

go

create view БольшеВсегоКомпонентов as 
select top 1 i.id_изделия, i.тип, max([кол-во компонетов]) as [макс. кол-во]
from изделия i
join компонент k on k.id_изделия = i.id_изделия
join (
	select ii.id_изделия, ii.тип, count(*) as [кол-во компонетов]
	from изделия ii
	join компонент kk on kk.id_изделия = ii.id_изделия
	group by ii.id_изделия, ii.тип
) a on i.id_изделия = a.id_изделия
group by i.id_изделия, i.тип
order by [макс. кол-во] desc

go

create view СамыйПопулярныйКомпонент as
select top 1 k.наименование, max([кол-во изделий]) as [макс. кол-во]
from компонент k 
join изделия i on k.id_изделия = i.id_изделия
join (
	select kk.наименование, count(*) as [кол-во изделий]
	from компонент kk 
	join изделия ii on kk.id_изделия = ii.id_изделия
	group by kk.наименование
) a on k.наименование = a.наименование
group by k.наименование
order by [макс. кол-во] desc

go

create view НаценкаИзделий as
select s.id_изделия,
		avg(s.цена_продажи_некоторого_изделия) - Себестоимость as Наценка
from продажа s
join (
	select i.id_изделия, sum(k.стоимость) as Себестоимость
	from изделия i
	join компонент k on k.id_изделия = i.id_изделия
	group by i.id_изделия
) a on a.id_изделия = s.id_изделия
group by s.id_изделия, a.Себестоимость

go

create view БольшеСреднего as
select i.id_изделия, i.количество_дней_на_его_сборку,
(select avg([количество_дней_на_его_сборку]) [среднее_кол-во]
		from изделия) [среднее_кол-во]
from изделия i
where [количество_дней_на_его_сборку] > (select avg([количество_дней_на_его_сборку]) [среднее_кол-во]
		from изделия)