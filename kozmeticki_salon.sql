# C:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8  <C:\Users\Korisnik\Documents\GitHub\APP\kozmeticki_salon.sql

drop database if exists kozmeticki_salon;
create database kozmeticki_salon default charset utf8mb4;
use kozmeticki_salon;

create table djelatnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    iban  varchar(50)
);


create table korisnik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    lozinka varchar(50),
    usluga int not null,
    djelatnik int not null,
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
    korisnik int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(100),
    oib char(11)
);

alter table korisnik add foreign key (osoba) references osoba(sifra);
alter table djelatnik add foreign key (osoba) references osoba(sifra);
alter table korisnik add foreign key(djelatnik) references djelatnik(sifra);
alter table korisnik add foreign key (usluga) references usluga(sifra);
alter table termin add foreign key(korisnik) references korisnik(sifra);