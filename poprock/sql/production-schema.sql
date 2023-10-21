drop database if exists poprock;
create database poprock;
use poprock;

create table artist (
    artist_id int primary key auto_increment,
    artist_name varchar(100),
    artist_id_spot varchar(50),
    artist_pop int,
    artist_listeners int,
    artist_followers int,
    artist_id_mb varchar(100),
    artist_type varchar(10),
    artist_art_filename varchar(255) DEFAULT NULL
);

create table artist_popularity (
    pop_artist_id int primary key auto_increment,
    pop_artist_id_spot varchar(50),
    pop_artist_pop int,
    pop_artist_date date NOT NULL default (CURRENT_DATE)
);

create table artist_followers (
    followers_artist_id int primary key auto_increment,
    followers_artist_id_spot varchar(50),
    followers_artist_followers int,
    followers_artist_date date NOT NULL default (CURRENT_DATE)
);

create table artist_listeners (
    listeners_artist_id int primary key auto_increment,
    listeners_artist_id_mb varchar(100),
    listeners_artist_listeners int,
    listeners_artist_date date NOT NULL default (CURRENT_DATE)
);

create table artist_playcount (
    playcount_artist_id int primary key auto_increment,
    playcount_artist_id_mb varchar(100),
    playcount_artist_playcount int,
    playcount_artist_date date NOT NULL default (CURRENT_DATE)
);

CREATE TABLE album (
    album_id int primary key auto_increment,
    album_name varchar (255) NOT NULL,
    album_id_mb varchar(100),
    album_release_group_id_mb varchar(100),
    album_label_id_mb varchar(100),
    album_id_spot varchar(48),
    album_country varchar(2),
    album_status varchar(10),
    artist_id int,
    constraint fk_album_artist_id
        foreign key (artist_id)
        references artist(artist_id),
    year_released int NOT NULL,
    album_art_filename varchar(144) DEFAULT NULL
);

create table album_popularity (
    pop_album_id int primary key auto_increment,
    pop_album_id_spot varchar(50),
    pop_album_pop int,
    pop_album_date date NOT NULL default (CURRENT_DATE)
);

create table album_listeners (
    listeners_album_id int primary key auto_increment,
    listeners_album_id_mb varchar(100),
    listeners_album_listeners int,
    listeners_album_date date NOT NULL default (CURRENT_DATE)
);

create table album_playcount (
    playcount_album_id int primary key auto_increment,
    playcount_album_id_mb varchar(100),
    playcount_album_playcount int,
    playcount_album_date date NOT NULL default (CURRENT_DATE)
);

CREATE TABLE track (
    track_id int primary key auto_increment,
    track_name varchar (255) NOT NULL,
    track_id_mb varchar(100),
    track_id_spot varchar(48),
    track_album_id int,
    constraint fk_track_album_id
        foreign key (track_album_id)
        references album(album_id)
);

create table track_popularity (
    pop_track_id int primary key auto_increment,
    pop_track_id_spot varchar(50),
    pop_track_pop int,
    pop_track_date date NOT NULL default (CURRENT_DATE)
);

create table track_listeners (
    listeners_track_id int primary key auto_increment,
    listeners_track_id_mb varchar(100),
    listeners_track_listeners int,
    listeners_track_date date NOT NULL default (CURRENT_DATE)
);

create table track_playcount (
    playcount_track_id int primary key auto_increment,
    playcount_track_id_mb varchar(100),
    playcount_track_playcount int,
    playcount_track_date date NOT NULL default (CURRENT_DATE)
);

CREATE TABLE relation_artist (
    relation_id int primary key auto_increment,
    relation_primary_id int,
    relation_artist_id int,
    relation_artist_type varchar(100),
    relation_type varchar(100),
    relation_attributes JSON,
    relation_begin varchar(4),
    relation_end varchar(4),
    constraint fk_primary_id
        foreign key (relation_primary_id)
        references artist(artist_id),
    constraint fk_artist_artist_id
        foreign key (relation_artist_id)
        references artist(artist_id)
);

CREATE TABLE relation_track (
    relation_id int primary key auto_increment,
    relation_primary_id int,
    relation_artist_id int,
    relation_artist_type varchar(100),
    constraint fk_primary_id_mb
        foreign key (relation_primary_id)
        references artist(artist_id),
    constraint fk_track_artist_id
        foreign key (relation_artist_id)
        references artist(artist_id)
);

CREATE TABLE genre (
    genre_id int primary key auto_increment,
    genre_artist_id int,
    genre_type varchar(20),
    constraint fk_genre_artist_id
        foreign key (genre_artist_id)
        references artist(artist_id)
);


delimiter //
create procedure set_known_good_state()
begin
	delete from relation_artist;
    alter table relation_artist auto_increment = 1;
	delete from relation_track;
	alter table relation_track auto_increment = 1;
    
    delete from genre;
    alter table genre auto_increment = 1;

	delete from track_popularity;
    alter table track_popularity auto_increment = 1;
--     delete from track_followers;
--     alter table track_followers auto_increment = 1;
    delete from track_listeners;
    alter table track_listeners auto_increment = 1;
    delete from track_playcount;
    alter table track_playcount auto_increment = 1;
    delete from track;
	alter table track auto_increment = 1;

	delete from album_popularity;
    alter table album_popularity auto_increment = 1;
--     delete from album_followers;
--     alter table album_followers auto_increment = 1;
    delete from album_listeners;
    alter table album_listeners auto_increment = 1;
    delete from album_playcount;
    alter table album_playcount auto_increment = 1;
    delete from album;
    alter table album auto_increment = 1;
    
    delete from artist_popularity;
    alter table artist_popularity auto_increment = 1;
--     delete from artist_followers;
--     alter table artist_followers auto_increment = 1;
    delete from artist_listeners;
    alter table artist_listeners auto_increment = 1;
    delete from artist_playcount;
    alter table artist_playcount auto_increment = 1;
    delete from artist;
	alter table artist auto_increment = 1;
    
	INSERT INTO artist (artist_name,artist_id_mb,artist_id_spot,artist_pop,artist_followers,artist_art_filename) VALUES
		('The Velvet Underground',NULL,'1nJvji2KIlWSseXRSlNYsC',61,1790692,'https://i.scdn.co/image/d69c2cf10323bf08443c7d122f3a1824a760ab57'),
		('David Bowie',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',76,9882298,'https://i.scdn.co/image/ab6761610000e5ebb78f77c5583ae99472dd4a49'),
		('Tom Petty and the Heartbreakers','f93dbc64-6f08-4033-bcc7-8a0bb4689849','4tX2TplrkIP4v05BNC903e',67,2605720,'https://i.scdn.co/image/ab6761610000e5ebfabc6315ae43968729ce9e36'),
		('Tom Petty','5ca3f318-d028-4151-ac73-78e2b2d6cdcc','2UZMlIwnkgAEDBsw1Rejkn',68,2350274,'https://i.scdn.co/image/ab6761610000e5eba56c2e176f0626e2a001431f'),
		('Queen','0383dadf-2a4e-4d10-a46a-e9e041da8eb3','1dfeR4HaWDbWqFHLkxsg1d',83,48511301,'https://i.scdn.co/image/b040846ceba13c3e9c125d68389491094e7f2982'),
		('Black Sabbath','5182c1d9-c7d2-4dad-afa0-ccfeada921a8','5M52tdBnJaKSvOpJGz8mfZ',72,7261020,'https://i.scdn.co/image/5931700f9515dd6587230130beb615e0549e47dc'),
		('The Cure','69ee3720-a7cb-4402-b48d-a02c366f2bcf','7bu3H8JO7d0UbMoVzbo70s',74,4849178,'https://i.scdn.co/image/7ca743e822b80133971ccf5c70fcbd77a4f4f508'),
		('Dio','c55193fb-f5d2-4839-a263-4c044fca1456','4CYeVo5iZbtYGBN4Isc3n6',60,2464061,'https://i.scdn.co/image/ab6761610000e5eb555c8199ba80168cfeafdfbc'),
		('Judas Priest','6b335658-22c8-485d-93de-0bc29a1d0349','2tRsMl4eGxwoNabM08Dm4I',66,3843241,'https://i.scdn.co/image/ab6761610000e5eb4b3cfc24737acb15e73e8bd6'),
		('Grace Jones','b1c124b3-cf60-41a6-8699-92728c8a3fe0','2f9ZiYA2ic1r1voObUimdd',56,311905,'https://i.scdn.co/image/ab6761610000e5ebc1c97da9c6326675e8c493cd'),
		('Led Zeppelin','678d88b2-87b0-403b-b63d-5da7465aecc3','36QJpDe2go2KgaRleHCDTp',75,13785152,'https://i.scdn.co/image/207803ce008388d3427a685254f9de6a8f61dc2e'),
		('Lou Reed','9d1ebcfe-4c15-4d18-95d3-d919898638a1','42TFhl7WlMRXiNqzSrnzPL',60,1729889,'https://i.scdn.co/image/2e1e9a6fe696b536a1f9e6a27fc1ed23d2c97099'),
		('Prince','070d193a-845c-479f-980e-bef15710653e','5a2EaR3hamoenG9rDuVn8j',69,7043049,'https://i.scdn.co/image/ab6761610000e5ebeaca358712b3fe4ed9814640');

end //

delimiter ;