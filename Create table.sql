create table �������
(
  id_������� int not null primary key identity(1,1),
  ����������_����_��_���_������ int not null,
  ��� nvarchar(10) not null
)

create table �������
(
  id_������� int not null primary key identity(1,1),
  ����_�������_����������_������� money not null,
  id_������� int foreign key references �������
)

create table ������������
(
  id_������������ int not null primary key identity(1,1),
  ������_������������ varchar(10) not null
)

create table ��������� 
(
  id_��������� int not null primary key identity(1,1),
  ������������ nvarchar(10) not null,
  ��� nvarchar(10) not null,
  ��������� money not null,
  ���������� nvarchar(10) not null,
  id_������� int foreign key references �������,
  id_������������ int foreign key references ������������
)
  
