package poprock.models;

import java.util.List;

public class Artist {

    private int artistId;
    private String artistSpotifyId;
    private String artistName;
    private int artistPopularity;
    private Double artistFollowers;
    private String artistMbid;

//    private String artistType;
//    private Double artistListeners;
//    private Double artistPlaycount;
//    private List<String> artistGenres;

    public Artist(int artistId, String artistSpotifyId, String artistName, int artistPopularity, Double artistFollowers, String artistMbid) {
        this.artistId = artistId;
        this.artistSpotifyId = artistSpotifyId;
        this.artistName = artistName;
        this.artistPopularity = artistPopularity;
        this.artistFollowers = artistFollowers;
        this.artistMbid = artistMbid;
    }

    public Artist(int artistId, String artistMbid) {
        this.artistId = artistId;
        this.artistMbid = artistMbid;
    }

    public Artist(String artistName, String artistSpotifyId) {
        this.artistName = artistName;
        this.artistSpotifyId = artistSpotifyId;
    }

    public Artist(){
    }

//    public List<String> getArtistGenres() {
//        return artistGenres;
//    }
//
//    public void setArtistGenres(List<String> artistGenres) {
//        this.artistGenres = artistGenres;
//    }

    public int getArtistPopularity() {
        return artistPopularity;
    }

    public void setArtistPopularity(int artistPopularity) {
        this.artistPopularity = artistPopularity;
    }

    public Double getArtistFollowers() {
        return artistFollowers;
    }

    public void setArtistFollowers(Double artistFollowers) {
        this.artistFollowers = artistFollowers;
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

//    public String getArtistType() {
//        return artistType;
//    }
//
//    public void setArtistType(String artistType) {
//        this.artistType = artistType;
//    }
//
//    public Double getArtistListeners() {
//        return artistListeners;
//    }
//
//    public void setArtistListeners(Double artistListeners) {
//        this.artistListeners = artistListeners;
//    }
//
//    public Double getArtistPlaycount() {
//        return artistPlaycount;
//    }
//
//    public void setArtistPlaycount(Double artistPlaycount) {
//        this.artistPlaycount = artistPlaycount;
//    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Artist artist)) return false;

        if (getArtistId() != artist.getArtistId()) return false;
        if (getArtistPopularity() != artist.getArtistPopularity()) return false;
        if (!getArtistSpotifyId().equals(artist.getArtistSpotifyId())) return false;
        if (!getArtistName().equals(artist.getArtistName())) return false;
        if (getArtistFollowers() != null ? !getArtistFollowers().equals(artist.getArtistFollowers()) : artist.getArtistFollowers() != null)
            return false;
        return getArtistMbid() != null ? getArtistMbid().equals(artist.getArtistMbid()) : artist.getArtistMbid() == null;
    }

    @Override
    public int hashCode() {
        int result = getArtistId();
        result = 31 * result + getArtistSpotifyId().hashCode();
        result = 31 * result + getArtistName().hashCode();
        result = 31 * result + getArtistPopularity();
        result = 31 * result + (getArtistFollowers() != null ? getArtistFollowers().hashCode() : 0);
        result = 31 * result + (getArtistMbid() != null ? getArtistMbid().hashCode() : 0);
        return result;
    }
}
