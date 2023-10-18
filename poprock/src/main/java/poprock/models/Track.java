package poprock.models;

public class Track {

    private int trackId;
    private int albumTrackId;
    private String trackName;
    private String trackMbid;
    private String trackSpotifyId;
    private Double trackListeners;
    private Double trackPlaycount;
    private int trackPopularity;
    public int getTrackPopularity() {
        return trackPopularity;
    }

    public void setTrackPopularity(int trackPopularity) {
        this.trackPopularity = trackPopularity;
    }

    public int getTrackId() {
        return trackId;
    }

    public void setTrackId(int trackId) {
        this.trackId = trackId;
    }

    public int getAlbumTrackId() {
        return albumTrackId;
    }

    public void setAlbumTrackId(int albumTrackId) {
        this.albumTrackId = albumTrackId;
    }

    public String getTrackName() {
        return trackName;
    }

    public void setTrackName(String trackName) {
        this.trackName = trackName;
    }

    public String getTrackMbid() {
        return trackMbid;
    }

    public void setTrackMbid(String trackMbid) {
        this.trackMbid = trackMbid;
    }

    public String getTrackSpotifyId() {
        return trackSpotifyId;
    }

    public void setTrackSpotifyId(String trackSpotifyId) {
        this.trackSpotifyId = trackSpotifyId;
    }

    public Double getTrackListeners() {
        return trackListeners;
    }

    public void setTrackListeners(Double trackListeners) {
        this.trackListeners = trackListeners;
    }

    public Double getTrackPlaycount() {
        return trackPlaycount;
    }

    public void setTrackPlaycount(Double trackPlaycount) {
        this.trackPlaycount = trackPlaycount;
    }


}
