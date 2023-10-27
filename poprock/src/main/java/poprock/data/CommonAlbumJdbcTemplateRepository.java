package poprock.data;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import poprock.data.mappers.CommonAlbumMapper;
import poprock.models.CommonAlbum;

import java.util.List;

@Repository
public class CommonAlbumJdbcTemplateRepository implements CommonAlbumRepo {

    private final JdbcTemplate jdbcTemplate;

    public CommonAlbumJdbcTemplateRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<CommonAlbum> findCommonAlbumsByArtistId(int artistId) {
        final String sql = "select common_id, album_artist_id_spot, album_name, album_art_filename, release_date, album_id_spot, album_pop "
                + "from album_common_lookup where common_artist_id = ?;";
        return jdbcTemplate.query(sql, new CommonAlbumMapper(), artistId);
    }

}
