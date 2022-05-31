# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  <C:\Users\Korisnik\Documents\GitHub\APP\kozmeticki_salon.sql

drop database if exists kozmeticki_salon;
create database kozmeticki_salon default charset utf8mb4;
use kozmeticki_salon;

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100) not null,
    iban  varchar(50),
    korisnik int not null 
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100),
    lozinka varchar(50),
    termin datetime 
);

create table termin(
    sifra int not null primary key auto_increment,
    usluga int not null,
    datum datetime,
    korisnik int not null,
    djelatnik int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    trajanje int,
    cijena decimal(18,6),
    djelatnik  int not null,
    korisnik int not null,
    termin datetime
);

alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key(djelatnik) references djelatnik(sifra);
alter table usluga add foreign key(korisnik) references korisnik(sifra);
alter table djelatnik add foreign key(korisnik) references korisnik(sifra);


select *from djelatnik;
insert into djelatnik (sifra,ime,prezime,email,iban,korisnik)
values (null,'Maja','Perić','pericmaja@gmail.com','HR2425000095981288512',1);

select *from korisnik;
insert into korisnik (sifra,ime,prezime,email,lozinka,termin)
values(null,'Marina','Marijanović','marijanam@gmail.com',null,null);

select *from usluga;
insert into usluga (sifra,naziv,trajanje,cijena,djelatnik,korisnik,termin)
values(null,'Manikura','60','150.00',3,1,,'2022-10-06 15:30:00');