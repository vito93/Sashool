create procedure СамыйДешевыйПоКатегориямВышеСреднего as
begin
declare @avg float = (select avg([количество_дней_на_его_сборку])
from изделия)

select s.id_изделия, ii.тип, s.цена_продажи_некоторого_изделия
from
продажа s
join издели¤ ii on ii.id_изделия = s.id_изделия
join (
select min(цена) min_price, тип from
(
select i.*, s.цена_продажи_некоторого_изделия as цена
from изделия i
join продажа s on s.id_издели¤ = i.id_изделия
where [количество_дней_на_его_сборку] > @avg
) a
group by тип
) b on b.тип = ii.тип and b.min_price = s.цена_продажи_некоторого_изделия
end