package poprock.domain;

import org.springframework.stereotype.Service;
import poprock.data.AlbumRepo;
import poprock.models.Album;

import java.time.LocalDate;
import java.util.List;

@Service
public class AlbumService {

    private final AlbumRepo repo;
    public AlbumService(AlbumRepo repo) {
        this.repo = repo;
    }

    public List<Album> findAll() {
        return repo.findAll();
    }

    public Result<Album> update(Album album) {
        return null;
    }

    public boolean deleteById(int albumId) {
        return false;
    }

    public Result<Album> add(Album album) {
        Result<Album> result = validate(album);
        if (!result.isSuccess()) {
            return result;
        }

        if (album.getAlbumId() != 0) {
            result.addMessage("albumId cannot be set for `add` operation", ResultType.INVALID);
            return result;
        }

        album = repo.add(album);
        result.setPayload(album);
        return result;
    }

    public Album findById(int albumId) {
        return repo.findById((albumId));
    }

    private Result<Album> validate(Album album) {
        Result<Album> result = new Result<>();
        if (album == null) {
            result.addMessage("album cannot be null", ResultType.INVALID);
            return result;
        }

        if (Validations.isNullOrBlank(album.getAlbumName())) {
            result.addMessage("Album Name is required", ResultType.INVALID);
        }

//        if (Validations.isNullOrBlank(album.getAlbumMbid())) {
//            result.addMessage("Album Followers is required", ResultType.INVALID);
//        }

        if (Validations.isNullOrBlank(album.getAlbumSpotifyId())) {
            result.addMessage("Spotify ID is required", ResultType.INVALID);
        }

//        if (Validations.isNullOrBlank(album.getAlbumPopularity())) {
//            result.addMessage("Album popularity is required", ResultType.INVALID);
//        }

        return result;
    }

}
