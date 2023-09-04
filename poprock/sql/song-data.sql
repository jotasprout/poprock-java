use poprock;

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


INSERT INTO song (song_name, album_id) VALUES
    ('Black Sabbath',2),
    ('Eat Me Alive',4),
    ('Love Bites',4),
    ('Freewheel Burning',4),
    ('Am I Going Insane',3),
    ('Symptom of the Universe',3);