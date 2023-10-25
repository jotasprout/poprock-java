package poprock.data.mappers;

import org.springframework.jdbc.core.RowMapper;
import poprock.models.Album;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AlbumMapper implements RowMapper<Album> {

    @Override
    public Album mapRow(ResultSet resultSet, int i) throws SQLException {
        Album album = new Album();
        album.setAlbumId(resultSet.getInt("album_id"));
        album.setAlbumName(resultSet.getString("album_name"));
        album.setAlbumSpotifyId(resultSet.getString("album_id_spot"));
        album.setAlbumArtistId(resultSet.getString("album_artist_id_spot"));
        album.setAlbumPopularity(resultSet.getInt("album_pop"));
        album.setAlbumArtFilename(resultSet.getString("album_art_filename"));
        album.setAlbumReleaseDate(resultSet.getString("release_date"));
        return album;
    }

}