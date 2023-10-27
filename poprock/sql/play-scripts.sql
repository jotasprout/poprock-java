use poprock;
use poprock_test;

update artist set artist_id_mb = '5441c29d-3602-4898-b1a1-b77fa23b8e50' where artist_id = 13;

select artist_id, artist_name from artist;
use fansite_test;
call set_known_good_state();

select artist_name from artist where artist_id = 5;
select * from artist;
select * from album;
select * from song;

select song.song_name, artist.artist_name, album.album_name, album.year_released from song
	join album on album.album_id = song.album_id
	join artist on artist.artist_id = album.artist_id
    where artist.artist_name = "Judas Priest";
    
delete from artist where artist_id > 12;
delete from album where album_id > 5;

-- get RJD albums
INSERT INTO album_common_lookup
SELECT * 
FROM poprock.album 
where album_artist_id_spot = ""
	or album_artist_id_spot = ""
    or album_artist_id_spot = ""
    or album_artist_id_spot = ""
    or album_artist_id_spot = "";