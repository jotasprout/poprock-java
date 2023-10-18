use poprock;
use poprock_test;

select artist_id, artist_name from artist;

call set_known_good_state();

select * from artist;
select * from album;
select * from song;

select song.song_name, artist.artist_name, album.album_name, album.year_released from song
	join album on album.album_id = song.album_id
	join artist on artist.artist_id = album.artist_id
    where artist.artist_name = "Judas Priest";
    
delete from artist where artist_id > 12;
delete from album where album_id > 5;