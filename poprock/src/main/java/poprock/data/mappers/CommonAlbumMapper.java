package poprock.data.mappers;

import org.springframework.jdbc.core.RowMapper;
import poprock.models.CommonAlbum;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommonAlbumMapper implements RowMapper<CommonAlbum> {

    @Override
    public CommonAlbum mapRow(ResultSet resultSet, int i) throws SQLException {
        CommonAlbum commonAlbum = new CommonAlbum();
        commonAlbum.setCommonId(resultSet.getInt("common_id"));
        commonAlbum.setAlbumName(resultSet.getString("album_name"));
        commonAlbum.setAlbumSpotifyId(resultSet.getString("album_id_spot"));
        commonAlbum.setAlbumArtistId(resultSet.getString("album_artist_id_spot"));
        commonAlbum.setAlbumPopularity(resultSet.getInt("album_pop"));
        commonAlbum.setAlbumArtFilename(resultSet.getString("album_art_filename"));
        commonAlbum.setAlbumReleaseDate(resultSet.getString("release_date"));
        return commonAlbum;
    }
}