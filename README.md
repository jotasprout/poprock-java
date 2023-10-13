# PopRock - Java

Not merely creating the old app using Java and React. RE-creating it meticulously, using software development principles and design patterns with specific improvements in mind -- new features and increased quality.

Also: Using superhuman strength to keep it simple, meeting the requirements and mastering the content -- in particular, Testing and Security.

## Summary

An interactive, customizable data visualization website using APIs for Spotify, ListenBrainz, and MusicBrainz.

## Description

### Data Visualization

- For a given artist, album, or track, display statistics for popularity and streaming.
- For a given artist, display all albums (filtering down to US releases)
- For a given album, display all tracks
- **BackEnd:** cron jobs will gather statistics using ListenBrainz and Spotify APIs, storing that data in a MySQL database.
- **FrontEnd:** Using a React library TBD, display charts comparing statistics for artists, albums, and tracks

### Fun with Data

- For a given artist, display lineup(s) of members
- For a given album or track, display contributors such as songwriters, producers, musicians

### Combining Above

- Show relationships:
    - artist(s) to artist
    - artist(s) to albums
    - artist(s) to tracks

## CRUD and Security

- Authorized User can add, edit, or delete artists, albums, tracks
- User can search by name for artists to add via MusicBrainz and/or Spotify API
- User can upload images and associate them with an artist