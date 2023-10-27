package poprock.data;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import poprock.data.mappers.AlbumMapper;
import poprock.models.Album;

import java.util.List;

@Repository
public class CommonAlbumJdbcTemplateRepository implements CommonAlbumRepo {

    private final JdbcTemplate jdbcTemplate;

    public CommonAlbumJdbcTemplateRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Album> findCommonAlbumsByArtistId(int artistId) {
        final String sql = "select album_id, album_artist_id_spot, album_name, album_art_filename, release_date, album_id_mb, album_id_spot, album_pop, album_art_filename "
                + "from album where album_artist_id_spot = ?;";
        return jdbcTemplate.query(sql, new AlbumMapper(), artistId);
    }

}
