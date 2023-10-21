package poprock.data.mappers;

import poprock.models.Artist;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;
public class ArtistMapper implements RowMapper<Artist> {

    @Override
    public Artist mapRow(ResultSet resultSet, int i) throws SQLException {
        Artist artist = new Artist();
        artist.setArtistId(resultSet.getInt("artist_id"));
        artist.setArtistName(resultSet.getString("artist_name"));
        artist.setArtistMbid(resultSet.getString("artist_id_mb"));
        artist.setArtistSpotifyId(resultSet.getString("artist_id_spot"));
        artist.setArtistFollowers(resultSet.getInt("artist_followers"));
//        artist.setArtistPlaycount(resultSet.getInt("artistPlaycount"));
        artist.setArtistListeners(resultSet.getInt("artist_listeners"));
        artist.setArtistPopularity(resultSet.getInt("artist_pop"));

        return artist;
    }
}