package poprock.data;

import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
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
import java.util.HashMap;
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
    @Transactional
    public Artist findById(int artistId) {

        final String sql = "select artist_id, artist_name, artist_id_mb, artist_id_spot "
                + "from artist "
                + "where artist_id = ?;";

        Artist artist = jdbcTemplate.query(sql, new ArtistMapper(), artistId)
                .stream()
                .findFirst().orElse(null);

        return artist;
    }

    @Override
    public Artist add(Artist artist) {
        SimpleJdbcInsert insert = new SimpleJdbcInsert(jdbcTemplate)
                .withTableName("artist")
                .usingGeneratedKeyColumns("artist_id");

        HashMap<String, Object> args = new HashMap<>();
        args.put("artist_id_spot", artist.getArtistSpotifyId());
        args.put("artist_name", artist.getArtistName());
        args.put("artist_popularity", artist.getArtistPopularity());
        args.put("artist_listeners", artist.getArtistListeners());
        args.put("artist_id_mb", artist.getArtistMbid());

        int artistId = insert.executeAndReturnKey(args).intValue();
        artist.setArtistId(artistId);

        return artist;
    }


    @Override
    public boolean update(Artist artist) {
        final String sql = "update artist set artist_id_mb = ?, artist_id_spot = ? where artist_id = ?;";

        return jdbcTemplate.update(sql,
                artist.getArtistMbid(),
                artist.getArtistSpotifyId(),
                artist.getArtistId()) > 0;
    }

    @Override
    public boolean deleteById(int artistId) {
        return false;
    }
}
