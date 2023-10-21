package poprock.domain;

import org.springframework.stereotype.Service;
import poprock.models.Artist;
import poprock.data.ArtistRepo;

import java.time.LocalDate;
import java.util.List;

@Service
public class ArtistService {

    private final ArtistRepo repo;
    public ArtistService(ArtistRepo repo) {
        this.repo = repo;
    }

    public List<Artist> findAll() {
        return repo.findAll();
    }

    public Result<Artist> update(Artist artist) {
        return null;
    }

    public boolean deleteById(int artistId) {
        return false;
    }

    public Result<Artist> add(Artist artist) {
        Result<Artist> result = validate(artist);
        if (!result.isSuccess()) {
            return result;
        }

        if (artist.getArtistId() != 0) {
            result.addMessage("artistId cannot be set for `add` operation", ResultType.INVALID);
            return result;
        }

        artist = repo.add(artist);
        result.setPayload(artist);
        return result;
    }

    public Artist findById(int artistId) {
        return repo.findById((artistId));
    }

    private Result<Artist> validate(Artist artist) {
        Result<Artist> result = new Result<>();
        if (artist == null) {
            result.addMessage("artist cannot be null", ResultType.INVALID);
            return result;
        }

        if (Validations.isNullOrBlank(artist.getArtistName())) {
            result.addMessage("Artist Name is required", ResultType.INVALID);
        }

//        if (Validations.isNullOrBlank(artist.getArtistMbid())) {
//            result.addMessage("Artist Followers is required", ResultType.INVALID);
//        }

        if (Validations.isNullOrBlank(artist.getArtistSpotifyId())) {
            result.addMessage("Spotify ID is required", ResultType.INVALID);
        }

//        if (Validations.isNullOrBlank(artist.getArtistPopularity())) {
//            result.addMessage("Artist popularity is required", ResultType.INVALID);
//        }

        return result;
    }

}
