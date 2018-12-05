create table изделия
(
  id_изделия int not null primary key identity(1,1),
  количество_дней_на_его_сборку int not null,
  тип nvarchar(10) not null
)

create table продажа
(
  id_продажа int not null primary key identity(1,1),
  цена_продажи_некоторого_изделия money not null,
  id_изделия int foreign key references изделия
)

create table изготовитель
(
  id_изготовитель int not null primary key identity(1,1),
  страна_изготовителя varchar(10) not null
)

create table компонент 
(
  id_компонент int not null primary key identity(1,1),
  наименование nvarchar(10) not null,
  тип nvarchar(10) not null,
  стоимость money not null,
  количество nvarchar(10) not null,
  id_изделия int foreign key references изделия,
  id_изготовитель int foreign key references изготовитель
)
  
