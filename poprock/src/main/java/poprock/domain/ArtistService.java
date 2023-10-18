package poprock.domain;

import org.springframework.stereotype.Service;
import poprock.models.Artist;
import poprock.data.ArtistRepo;

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
        return null;
    }

    public Artist findById(int artistId) {
        return null;
    }


}
