create procedure НаименьшееКоличествоСтран as
begin
declare @min int = (select min([кол-во стран]) from 
	(
		select i.id_изделия,
		count(distinct ii.страна_изготовителя) as [кол-во стран]
		from изделия i
		join компонент k on k.id_изделия = i.id_изделия
		join изготовитель ii on ii.id_изготовитель = k.id_изготовитель
		group by i.id_изделия
	) a
)

select *
from 		(select i.id_изделия,
		count(distinct ii.страна_изготовителя) as [кол-во стран]
		from изделия i
		join компонент k on k.id_изделия = i.id_изделия
		join изготовитель ii on ii.id_изготовитель = k.id_изготовитель
		group by i.id_изделия) a
where [кол-во стран] = @min

end

--exec НаименьшееКоличествоСтран