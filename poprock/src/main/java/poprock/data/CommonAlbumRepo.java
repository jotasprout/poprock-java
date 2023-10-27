package poprock.data;

import poprock.models.Album;

import java.util.List;

public interface CommonAlbumRepo {

    List<Album> findCommonAlbumsByArtistId(int artistId);

}
