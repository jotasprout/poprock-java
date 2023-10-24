package poprock.models;

public class Relation {

    private int relationId;
    private String relationName;

    private String relationPrimaryMbid;
    private String relationArtistMbid; /* Artist related to the 'artist' or 'track' */
    private String relationType; /* 'member of band' or whatever */
    private String relationAttribute;

    public String getRelationName() {
        return relationName;
    }

    public void setRelationName(String relationName) {
        this.relationName = relationName;
    }

    public int getRelationId() {
        return relationId;
    }

    public void setRelationId(int relationId) {
        this.relationId = relationId;
    }

    public String getRelationPrimaryMbid() {
        return relationPrimaryMbid;
    }

    public void setRelationPrimaryMbid(String relationPrimaryMbid) {
        this.relationPrimaryMbid = relationPrimaryMbid;
    }

    public String getRelationArtistMbid() {
        return relationArtistMbid;
    }

    public void setRelationArtistMbid(String relationArtistMbid) {
        this.relationArtistMbid = relationArtistMbid;
    }

    public String getRelationType() {
        return relationType;
    }

    public void setRelationType(String relationType) {
        this.relationType = relationType;
    }

    public String getRelationAttribute() {
        return relationAttribute;
    }

    public void setRelationAttribute(String relationAttribute) {
        this.relationAttribute = relationAttribute;
    }


    
}
