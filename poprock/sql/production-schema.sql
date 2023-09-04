drop database if exists poprock;
create database poprock;
use poprock;

create table artist (
    artist_id int primary key auto_increment,
    artist_name varchar(72),
    artist_id_spot varchar(48),
    artist_id_mb varchar(72),
    artist_art_filename varchar(144) DEFAULT NULL
);

CREATE TABLE album (
    album_id int primary key auto_increment,
    album_name varchar (255) NOT NULL,
    album_id_mb varchar(100),
    album_id_spot varchar(48),
    artist_id int,
    constraint fk_album_artist_id
        foreign key (artist_id)
        references artist(artist_id),
    year_released int NOT NULL,
    album_art_filename varchar(144) DEFAULT NULL
);

CREATE TABLE song (
    song_id int primary key auto_increment,
    song_name varchar (255) NOT NULL,
    song_id_mb varchar(100),
    song_id_spot varchar(48),
    album_id int,
    constraint fk_song_album_id
        foreign key (album_id)
        references album(album_id)
);