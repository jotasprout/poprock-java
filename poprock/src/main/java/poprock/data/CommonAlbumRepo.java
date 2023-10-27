package poprock.data;

import poprock.models.CommonAlbum;

import java.util.List;

public interface CommonAlbumRepo {

    List<CommonAlbum> findCommonAlbumsByArtistId(int artistId);

}
