create procedure Ќаименьшее оличество—тран as
begin
declare @min int = (select min([кол-во стран]) from 
	(
		select i.id_издели€,
		count(distinct ii.страна_изготовител€) as [кол-во стран]
		from издели€ i
		join компонент k on k.id_издели€ = i.id_издели€
		join изготовитель ii on ii.id_изготовитель = k.id_изготовитель
		group by i.id_издели€
	) a
)

select *
from 		(select i.id_издели€,
		count(distinct ii.страна_изготовител€) as [кол-во стран]
		from издели€ i
		join компонент k on k.id_издели€ = i.id_издели€
		join изготовитель ii on ii.id_изготовитель = k.id_изготовитель
		group by i.id_издели€) a
where [кол-во стран] = @min

end

--exec Ќаименьшее оличество—тран