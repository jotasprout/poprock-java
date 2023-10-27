use poprock;

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


INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('First Sessions','1Fmb52lZ6Jv7FMWXXTPO3K','72grmzVPqrB4FnWtmGNqS9',23,'2015-12-22','https://i.scdn.co/image/ab67616d0000b2737147453cae8cc4e0c744a3ce');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Pure And Simple','1Fmb52lZ6Jv7FMWXXTPO3K','1g2hOd2HF57h0xcagU14Lo',15,'1994','https://i.scdn.co/image/ab67616d0000b273f6fb573c98b2cef981a01833');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Fetish','1Fmb52lZ6Jv7FMWXXTPO3K','4Cem7QWAoT6h5SfCeQpmSK',26,'1999-06-09','https://i.scdn.co/image/ab67616d0000b273c5e15cc8f80c5687b1f687dd');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Sinner','1Fmb52lZ6Jv7FMWXXTPO3K','3SLCd2QfOJ1c1gqKZRWVI8',24,'2006-06-13','https://i.scdn.co/image/ab67616d0000b2732248c4ddfa5d91f18c243bec');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Unvarnished (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','5zYm8Y47mCuyRHYsLk22sL',22,'2013-09-30','https://i.scdn.co/image/ab67616d0000b273cbf1e4fe9da6ef49859e57b1');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Flashback','1Fmb52lZ6Jv7FMWXXTPO3K','6lw1mTt5OLU02aOwTp7NSk',35,'1993-11-15','https://i.scdn.co/image/ab67616d0000b2732f918406ef1b684e3d11b592');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Notorious','1Fmb52lZ6Jv7FMWXXTPO3K','5KztrAgu5Q8ZbNhDyPvSxS',17,'1991-08-20','https://i.scdn.co/image/ab67616d0000b273e4fde0da40f7a5e3a9d67158');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Up Your Alley','1Fmb52lZ6Jv7FMWXXTPO3K','2pkv3nrNrwtUdT8VNWwt5U',59,'1988-05-23','https://i.scdn.co/image/ab67616d0000b2735007b18ab5bd6a417ffa014f');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('I Love Rock \'N\' Roll (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','555qwe1qUgLdee80TZ2CQt',69,'1981-11-18','https://i.scdn.co/image/ab67616d0000b2733c73b2e0a6aa490736f19751');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Album (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','3irKU7djdb8SnPPGBQr36G',32,'1983-07-01','https://i.scdn.co/image/ab67616d0000b2739c1aaf2c7a3d79d9402ca531');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Glorious Results of a Misspent Youth (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','75T1W71zi6uGCXQPwodRQd',38,'1984-10-01','https://i.scdn.co/image/ab67616d0000b273bab4664783519f9fbb1c75c3');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Good Music','1Fmb52lZ6Jv7FMWXXTPO3K','0fWUawe7KzToS4ayZmofOE',27,'1986-12-09','https://i.scdn.co/image/ab67616d0000b273b34dddf657eea43308f3a637');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Bad Reputation (Expanded Edition)','1Fmb52lZ6Jv7FMWXXTPO3K','1gB28ytYFQElaXngAfeYep',60,'1981-01-23','https://i.scdn.co/image/ab67616d0000b273649fa6da25444974c752db30');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('The Runaways','5eTq3PxbOh5vgeRXKNqPyV','5DVNCzpvDrSEIFiU7hm8ey',60,'1976','https://i.scdn.co/image/ab67616d0000b273a1c553575418ca43404cb48b');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Waitin\' For The Night','5eTq3PxbOh5vgeRXKNqPyV','3ZF382bqWdCzkrsJSGEmkf',31,'1977','https://i.scdn.co/image/ab67616d0000b27343b01aa152c06e61c6e731e6');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('And Now? The Runaways','5eTq3PxbOh5vgeRXKNqPyV','1J77kVsuOQ5rholQRmsQe8',25,'1993-01-01','https://i.scdn.co/image/ab67616d0000b273af00e26e400fb46a9b3808cc');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Queens Of Noise','5eTq3PxbOh5vgeRXKNqPyV','2PUPhJHGBmdiIjMQjM7Dgp',36,'2010-01-01','https://i.scdn.co/image/ab67616d0000b2736a6556bfb676868097069513');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Evil Stig (feat. Joan Jett)','5NhjPre67qjeeQP4KHDHpe','4VIFQLdQqv2jbp59vtyzjy',13,'1995-12-01','https://i.scdn.co/image/ab67616d0000b273419b3d254f396f139e161831');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Dehumanizer (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','3lVMkEf9WrH2mSl5Kojtzy',34,'1992-06-22','https://i.scdn.co/image/ab67616d0000b27326ae8c83d22a20bce31d2718');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Mob Rules (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','2hGCBR6Xd1RuoYvwcfUhWq',41,'1981-11-04','https://i.scdn.co/image/ab67616d0000b273bc27808fc0a9252e64767979');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Heaven and Hell (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','1Wk2g7TV0adbUZ53ruvIdL',52,'1980-04-25','https://i.scdn.co/image/ab67616d0000b273eab13a1a01fb57d6e9e8ddaf');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Killing the Dragon','4CYeVo5iZbtYGBN4Isc3n6','2de1fHKLJ3o6bDkCjIwcJ6',44,'2002-05-21','https://i.scdn.co/image/ab67616d0000b273cc1a446fc923bca9d4cb5277');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Master of the Moon','4CYeVo5iZbtYGBN4Isc3n6','2NvhE3lT86DOImyITbFgf0',36,'2004-09-07','https://i.scdn.co/image/ab67616d0000b2739caacdbccf4f71be3277d7b6');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Magica','4CYeVo5iZbtYGBN4Isc3n6','2E457EiUG9l2rD1EaWcRM4',42,'2000-03-21','https://i.scdn.co/image/ab67616d0000b2731fe05a02e9d11a5ae560d0f0');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Angry Machines','4CYeVo5iZbtYGBN4Isc3n6','3bhisfDx9nNSWtzA1rOnLt',26,'1996-10-04','https://i.scdn.co/image/ab67616d0000b2731c724f113d363703522e6934');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Strange Highways','4CYeVo5iZbtYGBN4Isc3n6','21KzYnz40Z4mi3ya9EqPvb',29,'1993','https://i.scdn.co/image/ab67616d0000b27368c058d0c2c78e45a84a7bfd');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Lock Up the Wolves (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','15UiNu0KzbdGcLgwHfQFgb',27,'1990-05-15','https://i.scdn.co/image/ab67616d0000b2732555e9a9639552aeb462e9ad');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('The Last in Line (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','3Q901ZdHO1d2LZhU8SJRXR',28,'1984','https://i.scdn.co/image/ab67616d0000b273930828e9d2448ee308fb5ef8');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Sacred Heart (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','5PONHX8ojbwfRkBfukQ8aI',34,'1985','https://i.scdn.co/image/ab67616d0000b273b7a012c5091aecf07b37836e');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Dream Evil (2016 Remaster)','4CYeVo5iZbtYGBN4Isc3n6','0QUmolaj5KZ4G7gkBEbGNw',24,'1987','https://i.scdn.co/image/ab67616d0000b2735cbe38c40a95cb526eb42ec7');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Holy Diver','4CYeVo5iZbtYGBN4Isc3n6','2ivNJLSx8Rbvnsvcn01Yt3',60,'1983','https://i.scdn.co/image/ab67616d0000b2732457ab409ae106f8ae1dff89');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('The Devil You Know','4UjiBRkTw9VmvDZiJZKPJ7','3JmPp3x81f3Be5e3GIFbmq',29,'2009-04-28','https://i.scdn.co/image/ab67616d0000b273f924921a155d20c7bc630ff1');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Straight Between The Eyes','6SLAMfhOi7UJI0fMztaK0m','2TjkjpMXM0fsgmmVjmxNmI',43,'1982-06-10','https://i.scdn.co/image/ab67616d0000b273b1fec1b8d33de2842db64c87');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Long Live Rock \'n\' Roll','6SLAMfhOi7UJI0fMztaK0m','0abggihGZTIzf1GfHhrjwE',40,'1978-01-01','https://i.scdn.co/image/ab67616d0000b273bd88cb75225dfd3c4d7721c2');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Ritchie Blackmore\'s Rainbow','6SLAMfhOi7UJI0fMztaK0m','3LXOrVXLXwRiOguE446OZo',58,'1975-01-01','https://i.scdn.co/image/ab67616d0000b2733626f32e555553b537a6493f');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Rising','6SLAMfhOi7UJI0fMztaK0m','2MJ7kKTJM7zQJMFF83h71Y',36,'1976','https://i.scdn.co/image/ab67616d0000b27330995d2f0c2a732bffc54027');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('ELF','3RYdggbT5C9r4BsljokJ1Q','77FZzNDlmNQkRtjjCh9nfs',32,'1972','https://i.scdn.co/image/ab67616d0000b2732b38dd900110aee00b38f132');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Carolina County Ball','3RYdggbT5C9r4BsljokJ1Q','0yB1c5Esy5PkxKjbvGwYyr',25,'1974-04-15','https://i.scdn.co/image/ab67616d0000b273a6aca043d5756c325b6b82d2');


-- Add RJD as common artist
update album_common_lookup set common_artist_id = 8 
	where album_artist_id_spot = "4CYeVo5iZbtYGBN4Isc3n6"
	or album_artist_id_spot = "6SLAMfhOi7UJI0fMztaK0m"
    or album_artist_id_spot = "3RYdggbT5C9r4BsljokJ1Q"
    or album_artist_id_spot = "4UjiBRkTw9VmvDZiJZKPJ7"
    or album_artist_id_spot = "5M52tdBnJaKSvOpJGz8mfZ";

-- Add JJ as common artist
update album_common_lookup set common_artist_id = 21 
where album_artist_id_spot = "1Fmb52lZ6Jv7FMWXXTPO3K"
	or album_artist_id_spot = "5eTq3PxbOh5vgeRXKNqPyV"
    or album_artist_id_spot = "5NhjPre67qjeeQP4KHDHpe";
    
-- get RJD albums

-- SELECT album_name, album_artist_id_spot, album_id_spot, album_pop, release_date, album_art_filename 
-- FROM poprock.album 
-- where album_id_spot = "1Wk2g7TV0adbUZ53ruvIdL"
-- 	or album_id_spot = "2hGCBR6Xd1RuoYvwcfUhWq"
--     or album_id_spot = "3lVMkEf9WrH2mSl5Kojtzy";
    
-- get JJ albums

-- SELECT album_name, album_artist_id_spot, album_id_spot, album_pop, release_date, album_art_filename 
-- FROM poprock.album 
-- where album_artist_id_spot = "1Fmb52lZ6Jv7FMWXXTPO3K"
-- 	or album_artist_id_spot = "5eTq3PxbOh5vgeRXKNqPyV"
--     or album_artist_id_spot = "5NhjPre67qjeeQP4KHDHpe";
    
    
-- INSERT INTO album_common_lookup
-- SELECT album_name, album_artist_id_spot, album_id_spot, album_pop, release_date, album_art_filename 
-- FROM poprock.album 
-- where album_artist_id_spot = "4CYeVo5iZbtYGBN4Isc3n6"
-- 	or album_artist_id_spot = "6SLAMfhOi7UJI0fMztaK0m"
--     or album_artist_id_spot = "3RYdggbT5C9r4BsljokJ1Q"
--     or album_artist_id_spot = "4UjiBRkTw9VmvDZiJZKPJ7";