package poprock.domain;

import org.springframework.stereotype.Service;
import poprock.data.CommonAlbumRepo;
import poprock.models.Album;
import poprock.models.CommonAlbum;

import java.util.List;

@Service
public class CommonAlbumService {

    private final CommonAlbumRepo repo;
    public CommonAlbumService(CommonAlbumRepo repo) {
        this.repo = repo;
    }

    public List<CommonAlbum> findCommonAlbumsByArtistId(int artistId){
        return repo.findCommonAlbumsByArtistId(artistId);
    }

}
