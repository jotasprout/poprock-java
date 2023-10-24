package poprock.models;

public class Album {
    private int albumId;
    private int albumArtistId;
    private String albumName;
    private String albumReleaseGroup;
    private String albumMbid;
    private String albumSpotifyId;
    private String albumCountry;
    private String albumReleaseDate;
    private String albumLabel;
    private String albumStatus;
    private String albumArtFilename;

    private int albumPopularity;

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

    public int getAlbumId() {
        return albumId;
    }

    public void setAlbumId(int albumId) {
        this.albumId = albumId;
    }

    public int getAlbumArtistId() {
        return albumArtistId;
    }

    public void setAlbumArtistId(int albumArtistId) {
        this.albumArtistId = albumArtistId;
    }

    public String getAlbumName() {
        return albumName;
    }

    public void setAlbumName(String albumName) {
        this.albumName = albumName;
    }

    public String getAlbumReleaseGroup() {
        return albumReleaseGroup;
    }

    public void setAlbumReleaseGroup(String albumReleaseGroup) {
        this.albumReleaseGroup = albumReleaseGroup;
    }

    public String getAlbumMbid() {
        return albumMbid;
    }

    public void setAlbumMbid(String albumMbid) {
        this.albumMbid = albumMbid;
    }

    public String getAlbumSpotifyId() {
        return albumSpotifyId;
    }

    public void setAlbumSpotifyId(String albumSpotifyId) {
        this.albumSpotifyId = albumSpotifyId;
    }

    public String getAlbumCountry() {
        return albumCountry;
    }

    public void setAlbumCountry(String albumCountry) {
        this.albumCountry = albumCountry;
    }

    public String getAlbumReleaseDate() {
        return albumReleaseDate;
    }

    public void setAlbumReleaseDate(String albumReleaseDate) {
        this.albumReleaseDate = albumReleaseDate;
    }


    public String getAlbumLabel() {
        return albumLabel;
    }

    public void setAlbumLabel(String albumLabel) {
        this.albumLabel = albumLabel;
    }

    public String getAlbumStatus() {
        return albumStatus;
    }

    public void setAlbumStatus(String albumStatus) {
        this.albumStatus = albumStatus;
    }


}
