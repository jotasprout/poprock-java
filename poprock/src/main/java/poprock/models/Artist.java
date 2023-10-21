package poprock.models;

import java.util.List;

public class Artist {

    private int artistId;
    private String artistSpotifyId;
    private String artistArtFilename;
    private String artistName;
    private int artistPopularity;
    private int artistFollowers;
    private String artistMbid;
    private String artistType;
    private int artistListeners;
    private int artistPlaycount;
//    private List<String> artistGenres;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Artist artist)) return false;

        if (getArtistId() != artist.getArtistId()) return false;
        if (getArtistPopularity() != artist.getArtistPopularity()) return false;
        if (getArtistFollowers() != artist.getArtistFollowers()) return false;
        if (getArtistListeners() != artist.getArtistListeners()) return false;
        if (getArtistPlaycount() != artist.getArtistPlaycount()) return false;
        if (!getArtistSpotifyId().equals(artist.getArtistSpotifyId())) return false;
        if (getArtistArtFilename() != null ? !getArtistArtFilename().equals(artist.getArtistArtFilename()) : artist.getArtistArtFilename() != null)
            return false;
        if (!getArtistName().equals(artist.getArtistName())) return false;
        if (getArtistMbid() != null ? !getArtistMbid().equals(artist.getArtistMbid()) : artist.getArtistMbid() != null)
            return false;
        return getArtistType() != null ? getArtistType().equals(artist.getArtistType()) : artist.getArtistType() == null;
    }

    @Override
    public int hashCode() {
        int result = getArtistId();
        result = 31 * result + getArtistSpotifyId().hashCode();
        result = 31 * result + (getArtistArtFilename() != null ? getArtistArtFilename().hashCode() : 0);
        result = 31 * result + getArtistName().hashCode();
        result = 31 * result + getArtistPopularity();
        result = 31 * result + getArtistFollowers();
        result = 31 * result + (getArtistMbid() != null ? getArtistMbid().hashCode() : 0);
        result = 31 * result + (getArtistType() != null ? getArtistType().hashCode() : 0);
        result = 31 * result + getArtistListeners();
        result = 31 * result + getArtistPlaycount();
        return result;
    }

    public String getArtistArtFilename() {
        return artistArtFilename;
    }

    public void setArtistArtFilename(String artistArtFilename) {
        this.artistArtFilename = artistArtFilename;
    }

    public Artist(int artistId, String artistSpotifyId, String artistName, int artistPopularity, int artistFollowers, String artistMbid, String artistArtFilename) {
        this.artistId = artistId;
        this.artistSpotifyId = artistSpotifyId;
        this.artistName = artistName;
        this.artistPopularity = artistPopularity;
        this.artistFollowers = artistFollowers;
        this.artistMbid = artistMbid;
        this.artistArtFilename = artistArtFilename;
    }

    public Artist(int artistId, String artistMbid) {
        this.artistId = artistId;
        this.artistMbid = artistMbid;
    }

    public Artist(String artistName, String artistSpotifyId) {
        this.artistName = artistName;
        this.artistSpotifyId = artistSpotifyId;
    }

    public Artist(int artistId, String artistSpotifyId, String artistName, int artistPopularity, int artistFollowers, String artistArtFilename) {
        this.artistId = artistId;
        this.artistSpotifyId = artistSpotifyId;
        this.artistName = artistName;
        this.artistPopularity = artistPopularity;
        this.artistFollowers = artistFollowers;
        this.artistArtFilename = artistArtFilename;
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

    public int getArtistFollowers() {
        return artistFollowers;
    }

    public void setArtistFollowers(int artistFollowers) {
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

    public String getArtistType() {
        return artistType;
    }

    public void setArtistType(String artistType) {
        this.artistType = artistType;
    }

    public int getArtistListeners() {
        return artistListeners;
    }

    public void setArtistListeners(int artistListeners) {
        this.artistListeners = artistListeners;
    }

    public int getArtistPlaycount() {
        return artistPlaycount;
    }

    public void setArtistPlaycount(int artistPlaycount) {
        this.artistPlaycount = artistPlaycount;
    }



}
