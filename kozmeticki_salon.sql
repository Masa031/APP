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
    usluga int not null,
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
    cijena decimal(18,3),
    djelatnik  int not null,
    korisnik int not null,
    termin datetime
);

alter table termin add foreign key (korisnik) references korisnik(sifra);
alter table termin add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key(usluga) references usluga(sifra);
alter table usluga add foreign key(korisnik) references korisnik(sifra);
alter table djelatnik add foreign key(korisnik) references korisnik(sifra);