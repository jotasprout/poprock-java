use poprock;

create table artist (
    artist_id int primary key auto_increment,
    artist_name varchar(72),
    artist_id_spot varchar(48),
    artist_id_mb varchar(72),
    artist_art_filename varchar(144) DEFAULT NULL
);

INSERT INTO artist (artist_id_spot, artist_id_mb, artist_name) VALUES
('5M52tdBnJaKSvOpJGz8mfZ', '5182c1d9-c7d2-4dad-afa0-ccfeada921a8', 'Black Sabbath'),
('7bu3H8JO7d0UbMoVzbo70s', '69ee3720-a7cb-4402-b48d-a02c366f2bcf', 'The Cure'),
('4CYeVo5iZbtYGBN4Isc3n6', 'c55193fb-f5d2-4839-a263-4c044fca1456', 'Dio'),
('2tRsMl4eGxwoNabM08Dm4I', '6b335658-22c8-485d-93de-0bc29a1d0349', 'Judas Priest'),
('2f9ZiYA2ic1r1voObUimdd', 'b1c124b3-cf60-41a6-8699-92728c8a3fe0', 'Grace Jones'),
('36QJpDe2go2KgaRleHCDTp', '678d88b2-87b0-403b-b63d-5da7465aecc3', 'Led Zeppelin'),
('42TFhl7WlMRXiNqzSrnzPL', '9d1ebcfe-4c15-4d18-95d3-d919898638a1', 'Lou Reed'),
('6v8FB84lnmJs434UJf2Mrm', '75167b8b-44e4-407b-9d35-effe87b223cf', 'Neil Young'),
('5a2EaR3hamoenG9rDuVn8j', '070d193a-845c-479f-980e-bef15710653e', 'Prince'),
('1dfeR4HaWDbWqFHLkxsg1d', '0383dadf-2a4e-4d10-a46a-e9e041da8eb3', 'Queen'),
('2UZMlIwnkgAEDBsw1Rejkn', '5ca3f318-d028-4151-ac73-78e2b2d6cdcc', 'Tom Petty'),
('4tX2TplrkIP4v05BNC903e', 'f93dbc64-6f08-4033-bcc7-8a0bb4689849', 'Tom Petty and the Heartbreakers');





