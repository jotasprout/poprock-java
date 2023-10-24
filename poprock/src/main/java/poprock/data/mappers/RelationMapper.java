package poprock.data.mappers;

import org.springframework.jdbc.core.RowMapper;
import poprock.models.Relation;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RelationMapper implements RowMapper<Relation> {

    @Override
    public Relation mapRow(ResultSet resultSet, int i) throws SQLException {
        Relation relation = new Relation();
        relation.setRelationId(resultSet.getInt("relation_id"));
        relation.setRelationName(resultSet.getString("relation_name"));
        relation.setRelationArtistMbid(resultSet.getString("relation_artist_id_mb"));
        relation.setRelationPrimaryMbid(resultSet.getString("relation_primary_id_mb"));
        relation.setRelationType(resultSet.getString("relation_type"));
        relation.setRelationAttribute(resultSet.getString("relation_attribute"));

        return relation;
    }
    
}
