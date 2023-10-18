package poprock.models;

public class Artist {

    private int artistId;
    private String artistName;
    private String artistMbid;
    private String artistSpotifyId;
    private String artistType;
    private Double artistListeners;
    private Double artistPlaycount;
    private int artistPopularity;

    public int getArtistPopularity() {
        return artistPopularity;
    }

    public void setArtistPopularity(int artistPopularity) {
        this.artistPopularity = artistPopularity;
    }

    public int getArtistId() {
        return artistId;
    }

    public void setArtistId(int artistId) {
        this.artistId = artistId;
    }

    public String getArtistName() {
        return artistName;
    }

    public void setArtistName(String artistName) {
        this.artistName = artistName;
    }

    public String getArtistMbid() {
        return artistMbid;
    }

    public void setArtistMbid(String artistMbid) {
        this.artistMbid = artistMbid;
    }

    public String getArtistSpotifyId() {
        return artistSpotifyId;
    }

    public void setArtistSpotifyId(String artistSpotifyId) {
        this.artistSpotifyId = artistSpotifyId;
    }

    public String getArtistType() {
        return artistType;
    }

    public void setArtistType(String artistType) {
        this.artistType = artistType;
    }

    public Double getArtistListeners() {
        return artistListeners;
    }

    public void setArtistListeners(Double artistListeners) {
        this.artistListeners = artistListeners;
    }

    public Double getArtistPlaycount() {
        return artistPlaycount;
    }

    public void setArtistPlaycount(Double artistPlaycount) {
        this.artistPlaycount = artistPlaycount;
    }


}
