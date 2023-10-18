package poprock.data;
import poprock.models.Artist;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;
public interface ArtistRepo {

    List<Artist> findAll();

    Artist findById(int artistId);

    Artist add(Artist artist);

    boolean update(Artist artist);

    @Transactional
    boolean deleteById(int artistId);
}
