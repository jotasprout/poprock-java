package poprock.data;

import poprock.data.mappers.ArtistMapper;
import poprock.models.Artist;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import poprock.models.Artist;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

@Repository
public class ArtistJdbcTemplateRepository implements ArtistRepo {

    private final JdbcTemplate jdbcTemplate;

    public ArtistJdbcTemplateRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Artist> findAll() {
        final String sql = "select artist_id, artist_name, artist_art_filename, artist_id_mb, artist_id_spot "
                + "from artist;";
        return jdbcTemplate.query(sql, new ArtistMapper());
    }

    @Override
    public Artist findById(int artistId) {
        return null;
    }

    @Override
    public Artist add(Artist artist) {
        return null;
    }

    @Override
    public boolean update(Artist artist) {
        return false;
    }

    @Override
    public boolean deleteById(int artistId) {
        return false;
    }
}
