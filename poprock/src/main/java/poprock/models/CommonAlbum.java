package poprock.models;

public class CommonAlbum {

    private int commonId;
    private String albumArtistId;
    private String albumName;
    private String albumSpotifyId;
    private String albumReleaseDate;
    private String albumArtFilename;
    private int albumPopularity;


    public int getCommonId() {
        return commonId;
    }

    public void setCommonId(int commonId) {
        this.commonId = commonId;
    }

    public String getAlbumArtistId() {
        return albumArtistId;
    }

    public void setAlbumArtistId(String albumArtistId) {
        this.albumArtistId = albumArtistId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public String getAlbumSpotifyId() {
        return albumSpotifyId;
    }

    public void setAlbumSpotifyId(String albumSpotifyId) {
        this.albumSpotifyId = albumSpotifyId;
    }

    public String getAlbumReleaseDate() {
        return albumReleaseDate;
    }

    public void setAlbumReleaseDate(String albumReleaseDate) {
        this.albumReleaseDate = albumReleaseDate;
    }

    public String getAlbumArtFilename() {
        return albumArtFilename;
    }

    public void setAlbumArtFilename(String albumArtFilename) {
        this.albumArtFilename = albumArtFilename;
    }

    public int getAlbumPopularity() {
        return albumPopularity;
    }

    public void setAlbumPopularity(int albumPopularity) {
        this.albumPopularity = albumPopularity;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof CommonAlbum that)) return false;

        if (getCommonId() != that.getCommonId()) return false;
        if (getAlbumPopularity() != that.getAlbumPopularity()) return false;
        if (!getAlbumArtistId().equals(that.getAlbumArtistId())) return false;
        if (!getAlbumName().equals(that.getAlbumName())) return false;
        if (!getAlbumSpotifyId().equals(that.getAlbumSpotifyId())) return false;
        if (!getAlbumReleaseDate().equals(that.getAlbumReleaseDate())) return false;
        return getAlbumArtFilename().equals(that.getAlbumArtFilename());
    }

    @Override
    public int hashCode() {
        int result = getCommonId();
        result = 31 * result + getAlbumArtistId().hashCode();
        result = 31 * result + getAlbumName().hashCode();
        result = 31 * result + getAlbumSpotifyId().hashCode();
        result = 31 * result + getAlbumReleaseDate().hashCode();
        result = 31 * result + getAlbumArtFilename().hashCode();
        result = 31 * result + getAlbumPopularity();
        return result;
    }

}
