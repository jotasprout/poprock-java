use poprock;

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

INSERT INTO album (album_name, album_id_spot, album_id_mb, year_released, artist_id) VALUES
    ('Seventh Star (2009 Remastered Version)', '063yAlYkVpYB4t7kxS3wl0', 'cdf74e55-0a63-42f6-bf96-26360ccb51d2',1986,1),
    ('Black Sabbath','0dcakg8IGrksoofbSCCeTB','d4d6b8d9-413f-3aa6-9f4b-d51be1eb740c',1970,1),
    ('Sabotage', '6ZLTlhejhndI4Rh53vYhrY', '024e45a1-ea0f-4f31-8f06-f0c4fa1e403b',1987,1),
    ('Defenders of the Faith', '','85f98f87-9653-40e9-bfed-035447e78785',1984,4),
    ('Ram It Down', '','868f688b-e53d-4974-a0ad-cf343e123f47',1988,4);