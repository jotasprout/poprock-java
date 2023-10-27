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
    album_artist_id_spot varchar(50),
    album_release_group_id_mb varchar(100),
    album_label_id_mb varchar(100),
    album_id_spot varchar(48),
    album_pop int,
    album_country varchar(2),
    album_status varchar(10),
    release_date varchar(10),
    album_art_filename varchar(144) DEFAULT NULL
);

CREATE TABLE album_common_lookup (
    common_id int primary key auto_increment,
	common_artist_id int,
    album_name varchar (255) NOT NULL,
    album_artist_id_spot varchar(50),
    album_id_spot varchar(48),
    album_pop int,
    release_date varchar(10),
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
    relation_primary_id_mb varchar(100),
    relation_artist_id_mb varchar(100),
    relation_name varchar(100),
    relation_type varchar(100),
    relation_attribute varchar(100),
    relation_begin varchar(4),
    relation_end varchar(4)
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
    
	delete from album_common_lookup;
    alter table album_common_lookup auto_increment = 1;
  
-- insert artists   
 
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (1,'Velvet Underground','1nJvji2KIlWSseXRSlNYsC',61,NULL,1790692,'94b0fb9d-a066-4823-b2ec-af1d324bcfcf',NULL,'https://i.scdn.co/image/d69c2cf10323bf08443c7d122f3a1824a760ab57');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (2,'David Bowie','0oSGxfWSnnOXhD2fKuz2Gy',76,NULL,9882298,'5441c29d-3602-4898-b1a1-b77fa23b8e50',NULL,'https://i.scdn.co/image/ab6761610000e5ebb78f77c5583ae99472dd4a49');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (3,'Tom Petty and the Heartbreakers','4tX2TplrkIP4v05BNC903e',67,NULL,2605720,'f93dbc64-6f08-4033-bcc7-8a0bb4689849',NULL,'https://i.scdn.co/image/ab6761610000e5ebfabc6315ae43968729ce9e36');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (4,'Tom Petty','2UZMlIwnkgAEDBsw1Rejkn',68,NULL,2350274,'5ca3f318-d028-4151-ac73-78e2b2d6cdcc',NULL,'https://i.scdn.co/image/ab6761610000e5eba56c2e176f0626e2a001431f');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (5,'Queen','1dfeR4HaWDbWqFHLkxsg1d',83,NULL,48511301,'0383dadf-2a4e-4d10-a46a-e9e041da8eb3',NULL,'https://i.scdn.co/image/b040846ceba13c3e9c125d68389491094e7f2982');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (6,'Black Sabbath','5M52tdBnJaKSvOpJGz8mfZ',72,NULL,7261020,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8',NULL,'https://i.scdn.co/image/5931700f9515dd6587230130beb615e0549e47dc');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (7,'Cure','7bu3H8JO7d0UbMoVzbo70s',74,NULL,4849178,'69ee3720-a7cb-4402-b48d-a02c366f2bcf',NULL,'https://i.scdn.co/image/7ca743e822b80133971ccf5c70fcbd77a4f4f508');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (8,'Dio','4CYeVo5iZbtYGBN4Isc3n6',60,NULL,2464061,'c55193fb-f5d2-4839-a263-4c044fca1456',NULL,'https://i.scdn.co/image/ab6761610000e5eb555c8199ba80168cfeafdfbc');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (9,'Judas Priest','2tRsMl4eGxwoNabM08Dm4I',66,NULL,3843241,'6b335658-22c8-485d-93de-0bc29a1d0349',NULL,'https://i.scdn.co/image/ab6761610000e5eb4b3cfc24737acb15e73e8bd6');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (10,'Grace Jones','2f9ZiYA2ic1r1voObUimdd',56,NULL,311905,'b1c124b3-cf60-41a6-8699-92728c8a3fe0',NULL,'https://i.scdn.co/image/ab6761610000e5ebc1c97da9c6326675e8c493cd');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (11,'Led Zeppelin','36QJpDe2go2KgaRleHCDTp',75,NULL,13785152,'678d88b2-87b0-403b-b63d-5da7465aecc3',NULL,'https://i.scdn.co/image/207803ce008388d3427a685254f9de6a8f61dc2e');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (12,'Lou Reed','42TFhl7WlMRXiNqzSrnzPL',60,NULL,1729889,'9d1ebcfe-4c15-4d18-95d3-d919898638a1',NULL,'https://i.scdn.co/image/2e1e9a6fe696b536a1f9e6a27fc1ed23d2c97099');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (13,'Prince','5a2EaR3hamoenG9rDuVn8j',69,NULL,7043049,'070d193a-845c-479f-980e-bef15710653e',NULL,'https://i.scdn.co/image/ab6761610000e5ebeaca358712b3fe4ed9814640');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (14,'KK\'s Priest','0bDUXDIVbwZC0NVw26b4D3',38,NULL,27379,'a1343989-0290-49a2-8b1c-313cb7bd46c9',NULL,'https://i.scdn.co/image/ab6772690000c46ce07f3c87caaee67057b4ec9b');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (15,'Traveling Wilburys','2hO4YtXUFJiUYS2uYFvHNK',58,NULL,1143394,'4387b544-e4d0-4f18-b74e-d4a5ba1582ab',NULL,'https://i.scdn.co/image/ab6761610000e5ebabde33de707730af52c01bb0');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (16,'Beatles','3WrFJ7ztbogyGnTHbHJFl2',82,NULL,26291181,'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d',NULL,'https://i.scdn.co/image/ab6761610000e5ebe9348cc01ff5d55971b22433');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (17,'Dick Wagner','6vdSr6XwvJkFUO9wnPKbAz',1,NULL,385,'f92d6bfd-76e7-4394-aaec-9490756eb50c',NULL,'https://i.scdn.co/image/a47e56b0225f3ab89e576758e10afa74378ca4cd');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (18,'Frost','50ykendPoJz3qNSbWQ70J8',5,NULL,677,'6ab0acff-51de-45db-95cc-bdf5a6dd8578',NULL,'https://i.scdn.co/image/ab67616d0000b273c1301bc6bd37b916170f7bfe');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (19,'Steve Hunter','3wueKF9YNupBFRjQfWoyAc',20,NULL,1650,'3d1aee55-e0c2-4f5e-b339-8252991fe9da',NULL,'https://i.scdn.co/image/ab6761610000e5eb1ceeaaebf2badb71ebf632ef');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (20,'Lady Gaga','1HY2Jd0NmPuamShAr6KMms',83,NULL,28212604,NULL,NULL,'https://i.scdn.co/image/ab6761610000e5ebc8d3d98a1bccbe71393dbfbf');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (21,'Joan Jett & the Blackhearts','1Fmb52lZ6Jv7FMWXXTPO3K',63,NULL,737975,'46e63d3b-d91b-4791-bb73-e9f638a45ea0',NULL,'https://i.scdn.co/image/ab6761610000e5eb358cc74a410c5476802f9fb9');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (22,'Elf','3RYdggbT5C9r4BsljokJ1Q',25,NULL,64101,NULL,NULL,'https://i.scdn.co/image/ab67616d0000b2732b38dd900110aee00b38f132');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (23,'Deep Purple','568ZhdwyaiCyOGJRtNYhWf',64,NULL,5226026,NULL,NULL,'https://i.scdn.co/image/ab6761610000e5eb607e7523c28dd40288a08df4');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (24,'Rainbow','6SLAMfhOi7UJI0fMztaK0m',58,NULL,1437310,NULL,NULL,'https://i.scdn.co/image/e0ad73e5231086142031094d86e8bef61576268c');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (25,'Heaven & Hell','4UjiBRkTw9VmvDZiJZKPJ7',31,NULL,270583,NULL,NULL,'https://i.scdn.co/image/efaf546ae3e4bcadcadff23508feb742dc469637');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (26,'Runaways','5eTq3PxbOh5vgeRXKNqPyV',51,NULL,377086,NULL,NULL,'https://i.scdn.co/image/bb558047dc042297754100e562e2c8add949b234');
INSERT INTO `artist` (`artist_id`,`artist_name`,`artist_id_spot`,`artist_pop`,`artist_listeners`,`artist_followers`,`artist_id_mb`,`artist_type`,`artist_art_filename`) VALUES (27,'Evil Stig','5NhjPre67qjeeQP4KHDHpe',6,NULL,869,NULL,NULL,'https://i.scdn.co/image/d6c144d7753f4b74dc195baf7a0b25c0f5b976bc');

-- insert albums

INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (1,'Earthling',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',NULL,NULL,'1LCF3So9B9X0xreRtYbYIr',24,NULL,NULL,'1997-01-30','https://i.scdn.co/image/ab67616d0000b273723c64767adfe781f0898f98');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (2,'1. Outside (The Nathan Adler Diaries: A Hyper Cycle)',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',NULL,NULL,'6lo9vk77R6NAzAg3tTcJxc',23,NULL,NULL,'1995-09-26','https://i.scdn.co/image/ab67616d0000b273640f7ad4ecaafb1816c98fd8');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (3,'Heathen',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',NULL,NULL,'34Uxe13FFYnUa5rvPYuYFK',40,NULL,NULL,'2002-06-10','https://i.scdn.co/image/ab67616d0000b27379d1c4596ddcb5c3121de342');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (4,'Reality',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',NULL,NULL,'13uBd1FnzOOHgWXmcgaYr6',41,NULL,NULL,'2003-09-15','https://i.scdn.co/image/ab67616d0000b27346934aab226096a59611a76b');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (5,'The Next Day',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',NULL,NULL,'2BW7T8PojNxH9RPq4WWa6h',44,NULL,NULL,'2013-03-08','https://i.scdn.co/image/ab67616d0000b273e44d42a8ef0c55130d184a30');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (6,'Blackstar',NULL,'0oSGxfWSnnOXhD2fKuz2Gy',NULL,NULL,'0vxg8oJKDu3i0bXQu7vEpi',51,NULL,NULL,'2016-01-08','https://i.scdn.co/image/ab67616d0000b2739f36ae76c31bcb368d9106da');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (7,'Hypnotic Eye',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'55dSc0Ry199sq95DwnHFFa',34,NULL,NULL,'2014-07-29','https://i.scdn.co/image/ab67616d0000b27301544c4984d4883499a278d0');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (8,'Mojo',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'1x0nxFkOWytBolK91qkUSJ',40,NULL,NULL,'2010-06-15','https://i.scdn.co/image/ab67616d0000b273d611c359261b67d0e5d5accc');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (9,'The Last DJ',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'3lS4vVIHslBZgLituEQz5i',35,NULL,NULL,'2002-10-08','https://i.scdn.co/image/ab67616d0000b2736671606dc8f66869a1070766');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (10,'Echo',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'1lsBEh2R9B39hWfEo4iZSW',40,NULL,NULL,'1999-04-13','https://i.scdn.co/image/ab67616d0000b2737f82a09dfb7a68b7ce539895');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (11,'Into The Great Wide Open',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'42G5ULkCRRl3crJMlg6eKd',65,NULL,NULL,'1991-01-01','https://i.scdn.co/image/ab67616d0000b27327bd7d234a31296df34b9a64');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (12,'She\'s the One (Songs and Music from the Motion Picture)',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'0FVwC6leDmim0EO68PjYto',46,NULL,NULL,'1996-08-06','https://i.scdn.co/image/ab67616d0000b273cba44c10e994e15a9668a911');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (13,'Let Me Up (I\'ve Had Enough)',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'1jti40LLiMKDuSci8PB2RZ',38,NULL,NULL,'1987-04-21','https://i.scdn.co/image/ab67616d0000b273c2e46decb356ecb67cc9baa7');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (14,'Southern Accents',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'2uslG8GJwri1ewdlK2Uuv4',49,NULL,NULL,'1985-03-26','https://i.scdn.co/image/ab67616d0000b273e4ecf4545405fb61706db860');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (15,'Long After Dark',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'2ztfSQWXGq5RKDItE9E3oQ',49,NULL,NULL,'1982-11-02','https://i.scdn.co/image/ab67616d0000b273783b5cd3b6384497bcf4bb4d');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (16,'Hard Promises',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'5OO8oMupaMhIZhMrEM8ja3',51,NULL,NULL,'1981-05-05','https://i.scdn.co/image/ab67616d0000b273cc5ff69ede344df741c46aea');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (17,'Damn The Torpedoes (Remastered)',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'0qKA3aqubD47jfFVoPfsiy',33,NULL,NULL,'1979-10-19','https://i.scdn.co/image/ab67616d0000b27341790be98b0b04beed520b34');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (18,'You\'re Gonna Get It!',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'5hULIIwBVNm3cinAAFmv1P',49,NULL,NULL,'1978-05-02','https://i.scdn.co/image/ab67616d0000b273542cbb9bc4b310479020223f');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (19,'Tom Petty & The Heartbreakers',NULL,'4tX2TplrkIP4v05BNC903e',NULL,NULL,'6TLTd0P2CUI0Q29AQ1LyFi',66,NULL,NULL,'1976-11-09','https://i.scdn.co/image/ab67616d0000b2737e42a53ea7f2ad4f36ab23a5');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (20,'Wildflowers',NULL,'2UZMlIwnkgAEDBsw1Rejkn',NULL,NULL,'3ZGUBwDiY5HPOcWv4SBPQg',65,NULL,NULL,'1994-10-21','https://i.scdn.co/image/ab67616d0000b27341be6d9cf0ec0067d095a072');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (21,'Highway Companion',NULL,'2UZMlIwnkgAEDBsw1Rejkn',NULL,NULL,'1CvE8Bp9CDOArk2aL3NuC4',48,NULL,NULL,'2006-07-21','https://i.scdn.co/image/ab67616d0000b27333ddc5c6cbcd5246b39fdac3');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (22,'Full Moon Fever',NULL,'2UZMlIwnkgAEDBsw1Rejkn',NULL,NULL,'5d71Imt5CIb7LpQwDMQ093',75,NULL,NULL,'1989-01-01','https://i.scdn.co/image/ab67616d0000b27336572e6726714544f5bed456');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (25,'13',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'5WXL9YjbNd4GIqWc9mZOOq',54,NULL,NULL,'2013-01-01','https://i.scdn.co/image/ab67616d0000b273a7e7bfdfd15d41435f17ba64');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (26,'Born Again (2004 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'13jNXpmYnLC5oOyKOeps5n',30,NULL,NULL,'1983-08-07','https://i.scdn.co/image/ab67616d0000b27305dbd31282f2112b5e1607df');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (27,'Seventh Star (2004 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'3Qa9feGeY1iEhkPpynb7EU',29,NULL,NULL,'1986-01-28','https://i.scdn.co/image/ab67616d0000b273d2f187bb2ea59d53e4f0a5b9');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (28,'The Eternal Idol (2005 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'60pKOzyxUzKpHbZvWu3nnx',26,NULL,NULL,'1987-11-23','https://i.scdn.co/image/ab67616d0000b27342df30ff762900ca33eea28d');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (29,'Dehumanizer (2008 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'3lVMkEf9WrH2mSl5Kojtzy',34,NULL,NULL,'1992-06-22','https://i.scdn.co/image/ab67616d0000b27326ae8c83d22a20bce31d2718');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (30,'Mob Rules (2008 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'2hGCBR6Xd1RuoYvwcfUhWq',41,NULL,NULL,'1981-11-04','https://i.scdn.co/image/ab67616d0000b273bc27808fc0a9252e64767979');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (31,'Technical Ecstasy (2013 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'7dpMnSxwpr2DSLrdywIYot',32,NULL,NULL,'1976-09-25','https://i.scdn.co/image/ab67616d0000b2730a24282b88935e16e7e7d732');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (32,'Never Say Die! (2013 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'15R0gte5kP6Bcrqyaf0j3v',36,NULL,NULL,'1978-09-28','https://i.scdn.co/image/ab67616d0000b273674d2b3abe79d0d74f688168');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (33,'Heaven and Hell (2008 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'1Wk2g7TV0adbUZ53ruvIdL',52,NULL,NULL,'1980-04-25','https://i.scdn.co/image/ab67616d0000b273eab13a1a01fb57d6e9e8ddaf');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (34,'Sabotage (2014 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'0Plh7fxBmx1Z2HrnVOoGkw',42,NULL,NULL,'1975-07-28','https://i.scdn.co/image/ab67616d0000b273becc5cad8e71cb01aac490f8');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (35,'Sabbath Bloody Sabbath (2014 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'1qQ2ig3pvig30zVyXLzij8',49,NULL,NULL,'1973-12-01','https://i.scdn.co/image/ab67616d0000b27347e9e769c9f540dd0464ba32');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (36,'Vol. 4 (2021 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'4wWi3uFdpNLF8rxJ1dBYrq',42,NULL,NULL,'1972-09-25','https://i.scdn.co/image/ab67616d0000b273298a43109f774a19ed7a0ad1');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (37,'Black Sabbath (2014 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'4ZLy3U2q17Yjw7jkjXPJQj',50,NULL,NULL,'1970-02-13','https://i.scdn.co/image/ab67616d0000b273975ae67d8fb422586b8e2f83');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (38,'Paranoid (Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'6r7LZXAVueS5DqdrvXJJK7',69,NULL,NULL,'1970-09-18','https://i.scdn.co/image/ab67616d0000b273d5fccf9ce08b6a1e7d12a222');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (39,'Master of Reality (2014 Remaster)',NULL,'5M52tdBnJaKSvOpJGz8mfZ',NULL,NULL,'7pGb2cOGVz6vLyaZaKOQ7D',58,NULL,NULL,'1971-07-21','https://i.scdn.co/image/ab67616d0000b273c199494ba9ea2b73e9208f91');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (40,'PLECTRUMELECTRUM',NULL,'5a2EaR3hamoenG9rDuVn8j',NULL,NULL,'675uV1x91y53JcI7elQN2b',27,NULL,NULL,'2014-09-26','https://i.scdn.co/image/ab67616d0000b273545d3e614788865be4013499');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (41,'Planet Earth',NULL,'5a2EaR3hamoenG9rDuVn8j',NULL,NULL,'0syG70oE22EOJDVlSmLic6',33,NULL,NULL,'2007-07-15','https://i.scdn.co/image/ab67616d0000b273af9a5e4085780a3da43eb6e5');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (42,'3121',NULL,'5a2EaR3hamoenG9rDuVn8j',NULL,NULL,'0GxSuS75qN3igpjycrPNxT',34,NULL,NULL,'2006-03-21','https://i.scdn.co/image/ab67616d0000b27377feb7c9e498a2dad5d0209b');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (43,'Musicology',NULL,'5a2EaR3hamoenG9rDuVn8j',NULL,NULL,'1jy9Nciz47PNHiUB7FxAjK',43,NULL,NULL,'2004-04-20','https://i.scdn.co/image/ab67616d0000b27328b476821e82d2ba009b0361');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (44,'Emancipation',NULL,'5a2EaR3hamoenG9rDuVn8j',NULL,NULL,'7CItFSiq0XApf0ZjBuo7fL',40,NULL,NULL,'1996-11-19','https://i.scdn.co/image/ab67616d0000b27315e719c1349b49156ffe3b74');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (45,'The Gold Experience',NULL,'5a2EaR3hamoenG9rDuVn8j',NULL,NULL,'7JdnQ7zCfqETcLgS94d3ks',51,NULL,NULL,'1995-09-26','https://i.scdn.co/image/ab67616d0000b2736a4175046856b90a9b5d67a1');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (46,'Killing the Dragon',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'2de1fHKLJ3o6bDkCjIwcJ6',44,NULL,NULL,'2002-05-21','https://i.scdn.co/image/ab67616d0000b273cc1a446fc923bca9d4cb5277');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (47,'Master of the Moon',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'2NvhE3lT86DOImyITbFgf0',36,NULL,NULL,'2004-09-07','https://i.scdn.co/image/ab67616d0000b2739caacdbccf4f71be3277d7b6');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (48,'Magica',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'2E457EiUG9l2rD1EaWcRM4',42,NULL,NULL,'2000-03-21','https://i.scdn.co/image/ab67616d0000b2731fe05a02e9d11a5ae560d0f0');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (49,'Angry Machines',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'3bhisfDx9nNSWtzA1rOnLt',26,NULL,NULL,'1996-10-04','https://i.scdn.co/image/ab67616d0000b2731c724f113d363703522e6934');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (50,'Strange Highways',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'21KzYnz40Z4mi3ya9EqPvb',29,NULL,NULL,'1993','https://i.scdn.co/image/ab67616d0000b27368c058d0c2c78e45a84a7bfd');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (51,'Lock Up the Wolves (2016 Remaster)',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'15UiNu0KzbdGcLgwHfQFgb',27,NULL,NULL,'1990-05-15','https://i.scdn.co/image/ab67616d0000b2732555e9a9639552aeb462e9ad');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (52,'The Last in Line (2016 Remaster)',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'3Q901ZdHO1d2LZhU8SJRXR',28,NULL,NULL,'1984','https://i.scdn.co/image/ab67616d0000b273930828e9d2448ee308fb5ef8');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (53,'Sacred Heart (2016 Remaster)',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'5PONHX8ojbwfRkBfukQ8aI',34,NULL,NULL,'1985','https://i.scdn.co/image/ab67616d0000b273b7a012c5091aecf07b37836e');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (54,'Dream Evil (2016 Remaster)',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'0QUmolaj5KZ4G7gkBEbGNw',24,NULL,NULL,'1987','https://i.scdn.co/image/ab67616d0000b2735cbe38c40a95cb526eb42ec7');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (55,'Holy Diver',NULL,'4CYeVo5iZbtYGBN4Isc3n6',NULL,NULL,'2ivNJLSx8Rbvnsvcn01Yt3',60,NULL,NULL,'1983','https://i.scdn.co/image/ab67616d0000b2732457ab409ae106f8ae1dff89');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (56,'The Devil You Know',NULL,'4UjiBRkTw9VmvDZiJZKPJ7',NULL,NULL,'3JmPp3x81f3Be5e3GIFbmq',29,NULL,NULL,'2009-04-28','https://i.scdn.co/image/ab67616d0000b273f924921a155d20c7bc630ff1');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (57,'Straight Between The Eyes',NULL,'6SLAMfhOi7UJI0fMztaK0m',NULL,NULL,'2TjkjpMXM0fsgmmVjmxNmI',43,NULL,NULL,'1982-06-10','https://i.scdn.co/image/ab67616d0000b273b1fec1b8d33de2842db64c87');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (58,'Long Live Rock \'n\' Roll',NULL,'6SLAMfhOi7UJI0fMztaK0m',NULL,NULL,'0abggihGZTIzf1GfHhrjwE',40,NULL,NULL,'1978-01-01','https://i.scdn.co/image/ab67616d0000b273bd88cb75225dfd3c4d7721c2');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (59,'Ritchie Blackmore\'s Rainbow',NULL,'6SLAMfhOi7UJI0fMztaK0m',NULL,NULL,'3LXOrVXLXwRiOguE446OZo',58,NULL,NULL,'1975-01-01','https://i.scdn.co/image/ab67616d0000b2733626f32e555553b537a6493f');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (60,'Rising',NULL,'6SLAMfhOi7UJI0fMztaK0m',NULL,NULL,'2MJ7kKTJM7zQJMFF83h71Y',36,NULL,NULL,'1976','https://i.scdn.co/image/ab67616d0000b27330995d2f0c2a732bffc54027');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (61,'ELF',NULL,'3RYdggbT5C9r4BsljokJ1Q',NULL,NULL,'77FZzNDlmNQkRtjjCh9nfs',32,NULL,NULL,'1972','https://i.scdn.co/image/ab67616d0000b2732b38dd900110aee00b38f132');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (62,'Carolina County Ball',NULL,'3RYdggbT5C9r4BsljokJ1Q',NULL,NULL,'0yB1c5Esy5PkxKjbvGwYyr',25,NULL,NULL,'1974-04-15','https://i.scdn.co/image/ab67616d0000b273a6aca043d5756c325b6b82d2');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (63,'Turning to Crime',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'0GJfQCiFblbnuWaoKKH51R',18,NULL,NULL,'2021-11-26','https://i.scdn.co/image/ab67616d0000b2731a3cccda729ca4853c9228fe');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (64,'Whoosh!',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'6gqzcKMZ178mqS5Bd51MDf',23,NULL,NULL,'2020-08-07','https://i.scdn.co/image/ab67616d0000b273fd1dcb03163ce799dc8b1313');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (65,'Infinite',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'5diPB2uChZUyaXyKUcEtio',17,NULL,NULL,'2017-04-07','https://i.scdn.co/image/ab67616d0000b273f6514bf44ef18f60e5181352');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (66,'Now What ?!',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'4OiFn20i3aTu2FsMgP1yB5',27,NULL,NULL,'2013-04-26','https://i.scdn.co/image/ab67616d0000b273605f06b5ac70e5dd9eb39837');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (67,'Perfect Strangers',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'1FOmatanDRxS9EGcxjXKuO',57,NULL,NULL,'1984-09-16','https://i.scdn.co/image/ab67616d0000b2731d742027836d2d03cb5e0c4b');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (68,'Nobody\'s Perfect (Remastered 1999)',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'0HCbfoyFr5e0ziYeAGDbXZ',23,NULL,NULL,'1987','https://i.scdn.co/image/ab67616d0000b2731e73264339ba97fdf05ab166');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (69,'The House Of Blue Light',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'3jb80uITBoKioTLmu8cqaC',33,NULL,NULL,'1987','https://i.scdn.co/image/ab67616d0000b2739bddf3d6e46c8331f4fca1d5');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (70,'Stormbringer',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'5v7E58jgi8CGlLlVtuxwVg',38,NULL,NULL,'1974-11','https://i.scdn.co/image/ab67616d0000b273f5a23bb1965c0b2d4b5bf9d7');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (71,'Come Taste the Band',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'6cShl77TjfWE5uC2Qv7ryb',27,NULL,NULL,'1975','https://i.scdn.co/image/ab67616d0000b2731acd649e1bb5bbbdee7a08e2');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (72,'When We Rock, We Rock and When We Roll, We Roll',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'1DFY26LwkZBaFnwNThfsKb',31,NULL,NULL,'1978','https://i.scdn.co/image/ab67616d0000b2739b05eadd2a35acc39328402c');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (73,'Burn (Expanded 2005 Remaster)',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'5mImvIZcP7Pc23RhSZajsC',39,NULL,NULL,'1974-02-15','https://i.scdn.co/image/ab67616d0000b2730eb4102d2d3d885fa44968e2');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (74,'Who Do We Think We Are',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'1RQWFGjiaPfoxuOt2YaVqA',33,NULL,NULL,'1973-01-13','https://i.scdn.co/image/ab67616d0000b2736811ba405490032f0308590e');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (75,'Machine Head',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'1EK3a0Yctg4d3nGQzE4Uty',58,NULL,NULL,'1972-03-25','https://i.scdn.co/image/ab67616d0000b273bc9b44e950d5440ff65ea926');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (76,'Fireball',NULL,'568ZhdwyaiCyOGJRtNYhWf',NULL,NULL,'3oitf8NRK5tSDhCRVcOewu',28,NULL,NULL,'1971','https://i.scdn.co/image/ab67616d0000b273d1490353b42775abce602368');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (77,'First Sessions',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'72grmzVPqrB4FnWtmGNqS9',23,NULL,NULL,'2015-12-22','https://i.scdn.co/image/ab67616d0000b2737147453cae8cc4e0c744a3ce');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (78,'Pure And Simple',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'1g2hOd2HF57h0xcagU14Lo',15,NULL,NULL,'1994','https://i.scdn.co/image/ab67616d0000b273f6fb573c98b2cef981a01833');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (79,'Fetish',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'4Cem7QWAoT6h5SfCeQpmSK',26,NULL,NULL,'1999-06-09','https://i.scdn.co/image/ab67616d0000b273c5e15cc8f80c5687b1f687dd');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (80,'Sinner',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'3SLCd2QfOJ1c1gqKZRWVI8',24,NULL,NULL,'2006-06-13','https://i.scdn.co/image/ab67616d0000b2732248c4ddfa5d91f18c243bec');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (81,'Unvarnished (Expanded Edition)',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'5zYm8Y47mCuyRHYsLk22sL',22,NULL,NULL,'2013-09-30','https://i.scdn.co/image/ab67616d0000b273cbf1e4fe9da6ef49859e57b1');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (82,'Flashback',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'6lw1mTt5OLU02aOwTp7NSk',35,NULL,NULL,'1993-11-15','https://i.scdn.co/image/ab67616d0000b2732f918406ef1b684e3d11b592');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (83,'Notorious',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'5KztrAgu5Q8ZbNhDyPvSxS',17,NULL,NULL,'1991-08-20','https://i.scdn.co/image/ab67616d0000b273e4fde0da40f7a5e3a9d67158');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (84,'Up Your Alley',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'2pkv3nrNrwtUdT8VNWwt5U',59,NULL,NULL,'1988-05-23','https://i.scdn.co/image/ab67616d0000b2735007b18ab5bd6a417ffa014f');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (85,'I Love Rock \'N\' Roll (Expanded Edition)',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'555qwe1qUgLdee80TZ2CQt',69,NULL,NULL,'1981-11-18','https://i.scdn.co/image/ab67616d0000b2733c73b2e0a6aa490736f19751');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (86,'Album (Expanded Edition)',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'3irKU7djdb8SnPPGBQr36G',32,NULL,NULL,'1983-07-01','https://i.scdn.co/image/ab67616d0000b2739c1aaf2c7a3d79d9402ca531');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (87,'Glorious Results of a Misspent Youth (Expanded Edition)',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'75T1W71zi6uGCXQPwodRQd',38,NULL,NULL,'1984-10-01','https://i.scdn.co/image/ab67616d0000b273bab4664783519f9fbb1c75c3');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (88,'Good Music',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'0fWUawe7KzToS4ayZmofOE',27,NULL,NULL,'1986-12-09','https://i.scdn.co/image/ab67616d0000b273b34dddf657eea43308f3a637');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (89,'Bad Reputation (Expanded Edition)',NULL,'1Fmb52lZ6Jv7FMWXXTPO3K',NULL,NULL,'1gB28ytYFQElaXngAfeYep',60,NULL,NULL,'1981-01-23','https://i.scdn.co/image/ab67616d0000b273649fa6da25444974c752db30');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (90,'The Runaways',NULL,'5eTq3PxbOh5vgeRXKNqPyV',NULL,NULL,'5DVNCzpvDrSEIFiU7hm8ey',60,NULL,NULL,'1976','https://i.scdn.co/image/ab67616d0000b273a1c553575418ca43404cb48b');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (91,'Waitin\' For The Night',NULL,'5eTq3PxbOh5vgeRXKNqPyV',NULL,NULL,'3ZF382bqWdCzkrsJSGEmkf',31,NULL,NULL,'1977','https://i.scdn.co/image/ab67616d0000b27343b01aa152c06e61c6e731e6');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (92,'And Now? The Runaways',NULL,'5eTq3PxbOh5vgeRXKNqPyV',NULL,NULL,'1J77kVsuOQ5rholQRmsQe8',25,NULL,NULL,'1993-01-01','https://i.scdn.co/image/ab67616d0000b273af00e26e400fb46a9b3808cc');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (93,'Queens Of Noise',NULL,'5eTq3PxbOh5vgeRXKNqPyV',NULL,NULL,'2PUPhJHGBmdiIjMQjM7Dgp',36,NULL,NULL,'2010-01-01','https://i.scdn.co/image/ab67616d0000b2736a6556bfb676868097069513');
INSERT INTO `album` (`album_id`,`album_name`,`album_id_mb`,`album_artist_id_spot`,`album_release_group_id_mb`,`album_label_id_mb`,`album_id_spot`,`album_pop`,`album_country`,`album_status`,`release_date`,`album_art_filename`) VALUES (94,'Evil Stig (feat. Joan Jett)',NULL,'5NhjPre67qjeeQP4KHDHpe',NULL,NULL,'4VIFQLdQqv2jbp59vtyzjy',13,NULL,NULL,'1995-12-01','https://i.scdn.co/image/ab67616d0000b273419b3d254f396f139e161831');

-- insert relations

INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (1,'a1343989-0290-49a2-8b1c-313cb7bd46c9','5d61bd85-d2d1-4945-8982-6f85cb206dbc','Tim “Ripper” Owens','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (2,'a1343989-0290-49a2-8b1c-313cb7bd46c9','e6fbb8f7-9545-4f3f-b835-2fed39022f89','Kenneth Downing','member of band','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (3,'6b335658-22c8-485d-93de-0bc29a1d0349','13b14a2e-470c-434c-8f89-c8763f849e2c','Glenn Tipton','member of band','guitar family',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (4,'6b335658-22c8-485d-93de-0bc29a1d0349','1a6624a1-324f-4b0e-98f2-6ff8e9c12310','Scott Travis','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (5,'6b335658-22c8-485d-93de-0bc29a1d0349','1bd61509-828b-4dff-9193-46bd20bf65ed','Les Binks','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (6,'6b335658-22c8-485d-93de-0bc29a1d0349','2d6566f2-08ca-482c-b3d9-d654a9190b19','John Ellis','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (7,'6b335658-22c8-485d-93de-0bc29a1d0349','49f4d882-cbeb-4e72-9b42-a043a64151ee','Richie Faulkner','member of band','electric guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (8,'6b335658-22c8-485d-93de-0bc29a1d0349','5d61bd85-d2d1-4945-8982-6f85cb206dbc','Tim “Ripper” Owens','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (9,'6b335658-22c8-485d-93de-0bc29a1d0349','6bfe5aa2-ef88-4001-8be0-c844cf5eb106','John Partridge','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (10,'6b335658-22c8-485d-93de-0bc29a1d0349','71b5852c-a359-4ca6-bcb1-219a2b3e68ea','John Hinch','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (11,'6b335658-22c8-485d-93de-0bc29a1d0349','852de41a-ae22-4cdd-b6e3-49c9ddef6df2','Al Atkins','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (12,'6b335658-22c8-485d-93de-0bc29a1d0349','9f0d5967-5b88-44d6-9fa1-7d4bb8b61ed0','Rob Halford','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (13,'6b335658-22c8-485d-93de-0bc29a1d0349','bfc2cbfb-8660-467d-acdd-0fe7f6904547','Alan Moore','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (14,'6b335658-22c8-485d-93de-0bc29a1d0349','c245dbe9-46e9-4ade-beee-38eb478adc09','Ian Hill','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (15,'6b335658-22c8-485d-93de-0bc29a1d0349','cc8a09ef-bd78-41dc-af3e-22a51cd0d09a','Simon Phillips','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (16,'6b335658-22c8-485d-93de-0bc29a1d0349','e6fbb8f7-9545-4f3f-b835-2fed39022f89','Kenneth Downing','member of band','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (17,'6b335658-22c8-485d-93de-0bc29a1d0349','f6aa5c4a-38d8-4967-b983-52bd039bce33','Dave Holland','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (18,'6b335658-22c8-485d-93de-0bc29a1d0349','f5db7c1a-9c46-464d-b067-5bd2113d0515','Bruno Stapenhill','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (19,'6b335658-22c8-485d-93de-0bc29a1d0349','df630e0a-c966-4f50-b7e5-c19ec20138f7','Chris Campbell','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (20,'5ca3f318-d028-4151-ac73-78e2b2d6cdcc','4387b544-e4d0-4f18-b74e-d4a5ba1582ab','Traveling Wilburys','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (21,'4387b544-e4d0-4f18-b74e-d4a5ba1582ab','0bbbc496-c7b5-4b3f-bb6d-bd312827d6e5','Roy Orbison','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (22,'4387b544-e4d0-4f18-b74e-d4a5ba1582ab','372304d0-5e6a-4030-bc2b-09bdb0ee8abb','Jeff Lynne','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (23,'4387b544-e4d0-4f18-b74e-d4a5ba1582ab','42a8f507-8412-4611-854f-926571049fa0','George Harrison','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (24,'4387b544-e4d0-4f18-b74e-d4a5ba1582ab','5ca3f318-d028-4151-ac73-78e2b2d6cdcc','Tom Petty','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (25,'4387b544-e4d0-4f18-b74e-d4a5ba1582ab','72c536dc-7137-4477-a521-567eeb840fa8','Bob Dylan','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (26,'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d','0d4ab0f9-bbda-4ab1-ae2c-f772ffcfbea9','Pete Best','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (27,'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d','300c4c73-33ac-4255-9d57-4e32627f5e13','Ringo Starr','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (28,'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d','42a8f507-8412-4611-854f-926571049fa0','George Harrison','member of band','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (29,'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d','4d5447d7-c61c-4120-ba1b-d7f471d385b9','John Lennon','member of band','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (30,'b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d','ba550d0e-adac-4864-b88b-407cab5e76af','Paul McCartney','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (31,'f92d6bfd-76e7-4394-aaec-9490756eb50c','6ab0acff-51de-45db-95cc-bdf5a6dd8578','The Frost','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (32,'3d1aee55-e0c2-4f5e-b339-8252991fe9da','ee58c59f-8e7f-4430-b8ca-236c4d3745ae','Alice Cooper','instrumental supporting musician','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (33,'3d1aee55-e0c2-4f5e-b339-8252991fe9da','31b09890-149a-4f7f-ad5c-9bdda1b29efa','The Neverland Express','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (34,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','0b406e6d-a81b-45ee-bef2-2df2a6c63859','Cozy Powell','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (35,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','123814ce-f7f7-44c9-b84d-0088b1e230a4','Geezer Butler','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (36,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','293c8348-b107-4c08-b7f5-eb2448b7610a','Eric Singer','member of band',NULL,NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (37,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','40d1ad2f-e190-4d1e-9f9b-ba88144ac017','Vinny Appice','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (38,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','43e9db57-4ac3-4979-9234-220ce711628f','Ray Gillen','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (39,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','491470ea-797d-4d33-b14c-1a6a72827274','Tony Martin','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (40,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','78692212-af57-402a-a291-3938ca356500','Glenn Hughes','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (41,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','7acef841-a0f1-408e-967c-37d8a3fa6481','David Donato','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (42,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','7d0b58b5-88ca-4424-a6e5-21202ac19147','Neil Murray','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (43,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','83cf78c3-c802-4d7e-aed6-65a354dbfdb0','Bev Bevan','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (44,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','899a92fe-7ee5-4bc4-9628-0eff26df09e5','Terry Chimes','member of band','membranophone',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (45,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','8aa5b65a-5b3c-4029-92bf-47a544356934','Ozzy Osbourne','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (46,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','8b03861e-468d-4694-a7c3-4d1cf5dfe2d2','Ron Keel','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (47,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','9082aea0-ee30-4175-8795-6540a8fd3605','Bill Ward','member of band','background vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (48,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','9ba762c5-91b7-4f58-bb04-adc26644078b','Geoff Nicholls','member of band','keyboard',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (49,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','9c2c5b32-ca3f-4280-a269-bf2430b5a16b','Mike Bordin','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (50,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','af49ecbb-a0b9-4805-9cec-f97eac794c81','Bob Daisley','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (51,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','a858b8c6-d0f7-413d-8b5e-511ea74013fc','Bob Rondinelli','member of band','drums (drum set)',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (52,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','d5bf671c-79e3-4be4-bd2f-61871125d6b8','Jo Burt','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (53,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','e5fa0175-2e93-4ca7-90c3-33f239381252','Tony Iommi','member of band','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (54,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','e5fad3fa-3956-4379-a73e-f7b0daceb587','David Spitz','member of band','bass guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (55,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','ed02d3d7-5cf5-4c78-a35e-cda9e7b91581','Dave Walker','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (56,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','fc4953aa-6bf4-4f1f-8e47-5ac79ca428e2','Ronnie James Dio','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (57,'5182c1d9-c7d2-4dad-afa0-ccfeada921a8','ff2a0e30-aec1-44dd-ae06-dc78877f512d','Ian Gillan','member of band','lead vocals',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (58,'070d193a-845c-479f-980e-bef15710653e','0c111654-2eb9-4729-8a27-7397d3db63e3','3rdEyeGirl','member of band','original',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (59,'070d193a-845c-479f-980e-bef15710653e','4c8ead39-b9df-4c56-a27c-51bc049cfd48','The Revolution','member of band','original',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (60,'070d193a-845c-479f-980e-bef15710653e','54ba1987-1dcf-4077-8216-31149f8650ff','Dez Dickerson','instrumental supporting musician','guitar',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (61,'070d193a-845c-479f-980e-bef15710653e','67ef1d82-f69c-44a8-bcf8-0ee848250d8a','Doctor Fink','instrumental supporting musician','keyboard',NULL,NULL);
INSERT INTO `relation_artist` (`relation_id`,`relation_primary_id_mb`,`relation_artist_id_mb`,`relation_name`,`relation_type`,`relation_attribute`,`relation_begin`,`relation_end`) VALUES (62,'46e63d3b-d91b-4791-bb73-e9f638a45ea0','f376828a-b438-4fda-bb2e-dcd5fbe81f83','Joan Jett','member of band','eponymous',NULL,NULL);

-- Insert Common Albums

INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (1,21,'First Sessions','1Fmb52lZ6Jv7FMWXXTPO3K','72grmzVPqrB4FnWtmGNqS9',23,'2015-12-22','https://i.scdn.co/image/ab67616d0000b2737147453cae8cc4e0c744a3ce');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (2,21,'Pure And Simple','1Fmb52lZ6Jv7FMWXXTPO3K','1g2hOd2HF57h0xcagU14Lo',15,'1994','https://i.scdn.co/image/ab67616d0000b273f6fb573c98b2cef981a01833');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (3,21,'Fetish','1Fmb52lZ6Jv7FMWXXTPO3K','4Cem7QWAoT6h5SfCeQpmSK',26,'1999-06-09','https://i.scdn.co/image/ab67616d0000b273c5e15cc8f80c5687b1f687dd');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (4,21,'Sinner','1Fmb52lZ6Jv7FMWXXTPO3K','3SLCd2QfOJ1c1gqKZRWVI8',24,'2006-06-13','https://i.scdn.co/image/ab67616d0000b2732248c4ddfa5d91f18c243bec');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (5,21,'Unvarnished (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','5zYm8Y47mCuyRHYsLk22sL',22,'2013-09-30','https://i.scdn.co/image/ab67616d0000b273cbf1e4fe9da6ef49859e57b1');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (6,21,'Flashback','1Fmb52lZ6Jv7FMWXXTPO3K','6lw1mTt5OLU02aOwTp7NSk',35,'1993-11-15','https://i.scdn.co/image/ab67616d0000b2732f918406ef1b684e3d11b592');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (7,21,'Notorious','1Fmb52lZ6Jv7FMWXXTPO3K','5KztrAgu5Q8ZbNhDyPvSxS',17,'1991-08-20','https://i.scdn.co/image/ab67616d0000b273e4fde0da40f7a5e3a9d67158');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (8,21,'Up Your Alley','1Fmb52lZ6Jv7FMWXXTPO3K','2pkv3nrNrwtUdT8VNWwt5U',59,'1988-05-23','https://i.scdn.co/image/ab67616d0000b2735007b18ab5bd6a417ffa014f');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (9,21,'I Love Rock \'N\' Roll (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','555qwe1qUgLdee80TZ2CQt',69,'1981-11-18','https://i.scdn.co/image/ab67616d0000b2733c73b2e0a6aa490736f19751');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (10,21,'Album (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','3irKU7djdb8SnPPGBQr36G',32,'1983-07-01','https://i.scdn.co/image/ab67616d0000b2739c1aaf2c7a3d79d9402ca531');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (11,21,'Glorious Results of a Misspent Youth (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','75T1W71zi6uGCXQPwodRQd',38,'1984-10-01','https://i.scdn.co/image/ab67616d0000b273bab4664783519f9fbb1c75c3');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (12,21,'Good Music','1Fmb52lZ6Jv7FMWXXTPO3K','0fWUawe7KzToS4ayZmofOE',27,'1986-12-09','https://i.scdn.co/image/ab67616d0000b273b34dddf657eea43308f3a637');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (13,21,'Bad Reputation (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','1gB28ytYFQElaXngAfeYep',60,'1981-01-23','https://i.scdn.co/image/ab67616d0000b273649fa6da25444974c752db30');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (14,21,'The Runaways','5eTq3PxbOh5vgeRXKNqPyV','5DVNCzpvDrSEIFiU7hm8ey',60,'1976','https://i.scdn.co/image/ab67616d0000b273a1c553575418ca43404cb48b');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (15,21,'Waitin\' For The Night','5eTq3PxbOh5vgeRXKNqPyV','3ZF382bqWdCzkrsJSGEmkf',31,'1977','https://i.scdn.co/image/ab67616d0000b27343b01aa152c06e61c6e731e6');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (16,21,'And Now? The Runaways','5eTq3PxbOh5vgeRXKNqPyV','1J77kVsuOQ5rholQRmsQe8',25,'1993-01-01','https://i.scdn.co/image/ab67616d0000b273af00e26e400fb46a9b3808cc');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (17,21,'Queens Of Noise','5eTq3PxbOh5vgeRXKNqPyV','2PUPhJHGBmdiIjMQjM7Dgp',36,'2010-01-01','https://i.scdn.co/image/ab67616d0000b2736a6556bfb676868097069513');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (18,21,'Evil Stig (feat. Joan Jett)','5NhjPre67qjeeQP4KHDHpe','4VIFQLdQqv2jbp59vtyzjy',13,'1995-12-01','https://i.scdn.co/image/ab67616d0000b273419b3d254f396f139e161831');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (19,8,'Dehumanizer (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','3lVMkEf9WrH2mSl5Kojtzy',34,'1992-06-22','https://i.scdn.co/image/ab67616d0000b27326ae8c83d22a20bce31d2718');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (20,8,'Mob Rules (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','2hGCBR6Xd1RuoYvwcfUhWq',41,'1981-11-04','https://i.scdn.co/image/ab67616d0000b273bc27808fc0a9252e64767979');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (21,8,'Heaven and Hell (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','1Wk2g7TV0adbUZ53ruvIdL',52,'1980-04-25','https://i.scdn.co/image/ab67616d0000b273eab13a1a01fb57d6e9e8ddaf');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (22,8,'Killing the Dragon','4CYeVo5iZbtYGBN4Isc3n6','2de1fHKLJ3o6bDkCjIwcJ6',44,'2002-05-21','https://i.scdn.co/image/ab67616d0000b273cc1a446fc923bca9d4cb5277');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (23,8,'Master of the Moon','4CYeVo5iZbtYGBN4Isc3n6','2NvhE3lT86DOImyITbFgf0',36,'2004-09-07','https://i.scdn.co/image/ab67616d0000b2739caacdbccf4f71be3277d7b6');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (24,8,'Magica','4CYeVo5iZbtYGBN4Isc3n6','2E457EiUG9l2rD1EaWcRM4',42,'2000-03-21','https://i.scdn.co/image/ab67616d0000b2731fe05a02e9d11a5ae560d0f0');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (25,8,'Angry Machines','4CYeVo5iZbtYGBN4Isc3n6','3bhisfDx9nNSWtzA1rOnLt',26,'1996-10-04','https://i.scdn.co/image/ab67616d0000b2731c724f113d363703522e6934');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (26,8,'Strange Highways','4CYeVo5iZbtYGBN4Isc3n6','21KzYnz40Z4mi3ya9EqPvb',29,'1993','https://i.scdn.co/image/ab67616d0000b27368c058d0c2c78e45a84a7bfd');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (27,8,'Lock Up the Wolves (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','15UiNu0KzbdGcLgwHfQFgb',27,'1990-05-15','https://i.scdn.co/image/ab67616d0000b2732555e9a9639552aeb462e9ad');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (28,8,'The Last in Line (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','3Q901ZdHO1d2LZhU8SJRXR',28,'1984','https://i.scdn.co/image/ab67616d0000b273930828e9d2448ee308fb5ef8');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (29,8,'Sacred Heart (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','5PONHX8ojbwfRkBfukQ8aI',34,'1985','https://i.scdn.co/image/ab67616d0000b273b7a012c5091aecf07b37836e');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (30,8,'Dream Evil (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','0QUmolaj5KZ4G7gkBEbGNw',24,'1987','https://i.scdn.co/image/ab67616d0000b2735cbe38c40a95cb526eb42ec7');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (31,8,'Holy Diver','4CYeVo5iZbtYGBN4Isc3n6','2ivNJLSx8Rbvnsvcn01Yt3',60,'1983','https://i.scdn.co/image/ab67616d0000b2732457ab409ae106f8ae1dff89');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (32,8,'The Devil You Know','4UjiBRkTw9VmvDZiJZKPJ7','3JmPp3x81f3Be5e3GIFbmq',29,'2009-04-28','https://i.scdn.co/image/ab67616d0000b273f924921a155d20c7bc630ff1');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (33,8,'Straight Between The Eyes','6SLAMfhOi7UJI0fMztaK0m','2TjkjpMXM0fsgmmVjmxNmI',43,'1982-06-10','https://i.scdn.co/image/ab67616d0000b273b1fec1b8d33de2842db64c87');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (34,8,'Long Live Rock \'n\' Roll','6SLAMfhOi7UJI0fMztaK0m','0abggihGZTIzf1GfHhrjwE',40,'1978-01-01','https://i.scdn.co/image/ab67616d0000b273bd88cb75225dfd3c4d7721c2');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (35,8,'Ritchie Blackmore\'s Rainbow','6SLAMfhOi7UJI0fMztaK0m','3LXOrVXLXwRiOguE446OZo',58,'1975-01-01','https://i.scdn.co/image/ab67616d0000b2733626f32e555553b537a6493f');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (36,8,'Rising','6SLAMfhOi7UJI0fMztaK0m','2MJ7kKTJM7zQJMFF83h71Y',36,'1976','https://i.scdn.co/image/ab67616d0000b27330995d2f0c2a732bffc54027');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (37,8,'ELF','3RYdggbT5C9r4BsljokJ1Q','77FZzNDlmNQkRtjjCh9nfs',32,'1972','https://i.scdn.co/image/ab67616d0000b2732b38dd900110aee00b38f132');
INSERT INTO `album_common_lookup` (`common_id`,`common_artist_id`,`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES (38,8,'Carolina County Ball','3RYdggbT5C9r4BsljokJ1Q','0yB1c5Esy5PkxKjbvGwYyr',25,'1974-04-15','https://i.scdn.co/image/ab67616d0000b273a6aca043d5756c325b6b82d2');

end //

delimiter ;