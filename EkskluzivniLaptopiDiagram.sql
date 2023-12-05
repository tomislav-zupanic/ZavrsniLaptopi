use master;
go

drop database if exists EkskluzivniLaptopiApp;
go

create database EkskluzivniLaptopiApp;
go
alter database EkskluzivniLaptopiApp collate Croatian_CI_AS;
go
use EkskluzivniLaptopiApp;

create table laptopi(
sifra int not null primary key identity(1,1),
naziv varchar (50) not null,
proizvodac int not null,
cijena decimal (18,2) not null

);

create table proizvodaci (
sifra int not null primary key identity(1,1),
naziv varchar (50) not null,
zemlja varchar (50)
);

create table kupci (
sifra int not null primary key identity (1,1),
ime varchar (50) not null,
prezime varchar (50) not null,
email varchar (50) not null
);

create table racuni (
sifra int not null primary key identity (1,1),
kupac int ,
laptop int ,
datum datetime not null, 
brojracuna varchar (50) not null
);

alter table racuni add foreign key (kupac) references kupci(sifra);
alter table laptopi add foreign key (proizvodac) references proizvodaci(sifra);
alter table racuni add foreign key (laptop) references laptopi(sifra);


insert into proizvodaci (naziv) values
('Acer'),
('Asus'),
('Dell')
;

select * from proizvodaci;

insert into kupci (ime,prezime,email) values
('Tomislav','Županić','tomislav.zupanic333@gmail.com'),
('Ivan','Đanić','đani55@gmail.com'),
('Josip','Sanader','sandro23@gmail.com')
;

select * from kupci;

insert into laptopi (naziv,proizvodac,cijena) values
('Predator Helios 300',1,2000),
('Rog Strix g15',2,1670),
('Alienware',3,2800)
;
select * from laptopi;


insert into racuni ( datum, brojracuna) values
('2021-05-15 12:55:00','854-25-76'),
('2019-07-10 18:45:20','854-25-76'),
('2022-11-25 11:31:54','854-25-76')
;

select * from racuni;

