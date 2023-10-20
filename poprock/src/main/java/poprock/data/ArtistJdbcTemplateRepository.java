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
    public Artist findById(int artistId) {
        
        final String sql = "select artist_id, artist_name, artist_art_filename, artist_id_mb, artist_id_spot "
                + "from artist "
                + "where artist_id = ?;";

        Artist artist = jdbcTemplate.query(sql, new ArtistMapper(), artistId)
                .stream()
                .findFirst().orElse(null);

//        if (artist != null) {
//            addAgencies(artist);
//            addAliases(artist);
//        }

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
        args.put("artistPopularity", artist.getArtistPopularity());
        args.put("artist_id_mb", artist.getArtistMbid());

        int artistId = insert.executeAndReturnKey(args).intValue();
        artist.setArtistId(artistId);

        return artist;
    }

//    @Override
//    public Artist add(Artist artist) {
//
////        final String sql = "insert into artist (artist_id_spot, artist_name, artistPopularity, artistFollowers, artist_id_mb) values (?,?,?,?,?);";
//        final String sql = "insert into artist (artist_id_spot, artist_name, artistPopularity, artist_id_mb) values (?,?,?,?);";
//        KeyHolder keyHolder = new GeneratedKeyHolder();
//        int rowsAffected = jdbcTemplate.update(connection -> {
//            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            ps.setString(1, artist.getArtistSpotifyId());
//            ps.setString(2, artist.getArtistName());
//            ps.setInt(3, artist.getArtistPopularity());
////            ps.setDouble(4, artist.getArtistFollowers());
//            ps.setString(4, artist.getArtistMbid());
//
//            return ps;
//        }, keyHolder);
//        if (rowsAffected <= 0) {
//            return null;
//        }
//        artist.setArtistId(keyHolder.getKey().intValue());
//        return artist;
//    }

//    @Override
//    public Artist add(Artist artist) {
//
//        final String sql = "insert into artist (" +
//                "artist_id_spot, " +
//                "artist_name, " +
//                "artistPopularity, " +
//                "artist_id_mb)" +
//                "values (?,?,?,?);";
//
//        return jdbcTemplate.update(sql,
//                artist.getArtistSpotifyId(),
//                artist.getArtistName(),
//                artist.getArtistPopularity(),
//                artist.getArtistMbid());
////                agent.getAgentId()) > 0;
//
//        final String sql = "insert into artist (artist_id_spot, artist_name, artistPopularity, artist_id_mb) values (?,?,?,?);";
//        KeyHolder keyHolder = new GeneratedKeyHolder();
//        int rowsAffected = jdbcTemplate.update(connection -> {
//            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            ps.setString(1, );
//            ps.setString(2, );
//            ps.setInt(3, );
////            ps.setDouble(4, artist.getArtistFollowers());
//            ps.setString(4, );
//
//            return ps;
//        }, keyHolder);
//        if (rowsAffected <= 0) {
//            return null;
//        }
//        artist.setArtistId(keyHolder.getKey().intValue());
//        return artist;
//    }

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
