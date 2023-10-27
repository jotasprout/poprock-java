/*
-- Query: SELECT album_name, album_artist_id_spot, album_id_spot, album_pop, release_date, album_art_filename 
FROM poprock.album 
where album_id_spot = "1Wk2g7TV0adbUZ53ruvIdL"
	or album_id_spot = "2hGCBR6Xd1RuoYvwcfUhWq"
    or album_id_spot = "3lVMkEf9WrH2mSl5Kojtzy"
LIMIT 0, 5000

-- Date: 2023-10-27 02:21
*/
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Dehumanizer (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','3lVMkEf9WrH2mSl5Kojtzy',34,'1992-06-22','https://i.scdn.co/image/ab67616d0000b27326ae8c83d22a20bce31d2718');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Mob Rules (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','2hGCBR6Xd1RuoYvwcfUhWq',41,'1981-11-04','https://i.scdn.co/image/ab67616d0000b273bc27808fc0a9252e64767979');
INSERT INTO `album_common_lookup` (`album_name`,`album_artist_id_spot`,`album_id_spot`,`album_pop`,`release_date`,`album_art_filename`) VALUES ('Heaven and Hell (2008 Remaster)','5M52tdBnJaKSvOpJGz8mfZ','1Wk2g7TV0adbUZ53ruvIdL',52,'1980-04-25','https://i.scdn.co/image/ab67616d0000b273eab13a1a01fb57d6e9e8ddaf');
