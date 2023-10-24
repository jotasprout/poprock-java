package poprock.data;

import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import poprock.data.mappers.RelationMapper;
import poprock.models.Relation;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import poprock.models.Relation;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;

@Repository
public class RelationJdbcTemplateRepository implements RelationRepo{

    private final JdbcTemplate jdbcTemplate;

    public RelationJdbcTemplateRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    @Override
    public List<Relation> findAll() {
        final String sql = "select relation_id, relation_name, relation_art_filename, relation_id_mb, relation_id_spot, relation_followers, relation_listeners, relation_pop, relation_art_filename "
                + "from relation;";
        return jdbcTemplate.query(sql, new RelationMapper());
    }

    @Override
    public Relation add(Relation relation) {
        SimpleJdbcInsert insert = new SimpleJdbcInsert(jdbcTemplate)
                .withTableName("relation")
                .usingGeneratedKeyColumns("relation_id");

        HashMap<String, Object> args = new HashMap<>();
        args.put("relation_name", relation.getRelationName());
        args.put("relation_primary_id_mb", relation.getRelationPrimaryMbid());
        args.put("relation_artist_id_mb", relation.getRelationArtistMbid());
        args.put("relation_type", relation.getRelationType());
        args.put("relation_attribute", relation.getRelationAttribute());

        int relationId = insert.executeAndReturnKey(args).intValue();
        relation.setRelationId(relationId);

        return relation;
    }
    
}
