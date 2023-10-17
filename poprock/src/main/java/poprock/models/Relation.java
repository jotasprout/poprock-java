package poprock.models;

public class Relation {

    private int relationId;
    private String relationPrimaryType; /* Is it an 'artist' or 'track' */
    private String relationPrimaryMbid;
    private String relationBegin;
    private Double relationEnd;
    private String relationArtistMbid; /* Artist related to the 'artist' or 'track' */
    private String relationType; /* 'member of band' or whatever */
    private String relationAttribute;

    public int getRelationId() {
        return relationId;
    }

    public void setRelationId(int relationId) {
        this.relationId = relationId;
    }

    public String getRelationPrimaryType() {
        return relationPrimaryType;
    }

    public void setRelationPrimaryType(String relationPrimaryType) {
        this.relationPrimaryType = relationPrimaryType;
    }

    public String getRelationPrimaryMbid() {
        return relationPrimaryMbid;
    }

    public void setRelationPrimaryMbid(String relationPrimaryMbid) {
        this.relationPrimaryMbid = relationPrimaryMbid;
    }

    public String getRelationBegin() {
        return relationBegin;
    }

    public void setRelationBegin(String relationBegin) {
        this.relationBegin = relationBegin;
    }

    public Double getRelationEnd() {
        return relationEnd;
    }

    public void setRelationEnd(Double relationEnd) {
        this.relationEnd = relationEnd;
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
