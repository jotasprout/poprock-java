package poprock.data;

import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import poprock.data.mappers.AlbumMapper;
import poprock.models.Album;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import poprock.models.Album;
import poprock.models.Artist;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

@Repository
public class AlbumJdbcTemplateRepository implements AlbumRepo {

    private final JdbcTemplate jdbcTemplate;

    public AlbumJdbcTemplateRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Album> findAll() {
        final String sql = "select album_id, album_name, album_art_filename, album_id_mb, album_id_spot, album_followers, album_listeners, album_pop, album_art_filename "
                + "from album;";
        return jdbcTemplate.query(sql, new AlbumMapper());
    }

    @Override
    public boolean update(Album album) {
        final String sql = "update album set album_id_mb = ?, artist_id_spot = ? where artist_id = ?;";

        return jdbcTemplate.update(sql,
                album.getAlbumMbid(),
                album.getAlbumPopularity(),
                album.getAlbumId()) > 0;
    }

    @Override
    @Transactional
    public Album findById(int albumId) {

        final String sql = "select album_id, album_name, album_id_mb, album_id_spot, album_followers, album_listeners, album_pop, album_art_filename "
                + "from album "
                + "where album_id = ?;";

        Album album = jdbcTemplate.query(sql, new AlbumMapper(), albumId)
                .stream()
                .findFirst().orElse(null);

        return album;
    }

    @Override
    public Album add(Album album) {
        SimpleJdbcInsert insert = new SimpleJdbcInsert(jdbcTemplate)
                .withTableName("album")
                .usingGeneratedKeyColumns("album_id");

        HashMap<String, Object> args = new HashMap<>();
        args.put("album_id_spot", album.getAlbumSpotifyId());
        args.put("album_artist_id_spot", album.getAlbumArtistId());
        args.put("album_name", album.getAlbumName());
        args.put("album_pop", album.getAlbumPopularity());
        args.put("album_art_filename", album.getAlbumArtFilename());
        args.put("release_date", album.getAlbumReleaseDate());

        int albumId = insert.executeAndReturnKey(args).intValue();
        album.setAlbumId(albumId);

        return album;
    }

    @Override
    public boolean deleteById(int albumId) {
        return false;
    }
}
