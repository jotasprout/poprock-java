package poprock.data;
import poprock.models.Album;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;
public interface AlbumRepo {

    List<Album> findAll();

    Album findById(int albumId);

    Album add(Album album);

    @Transactional
    boolean deleteById(int albumId);
}
