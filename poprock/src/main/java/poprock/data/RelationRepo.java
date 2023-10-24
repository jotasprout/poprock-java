package poprock.data;
import poprock.models.Relation;

import java.util.List;

public interface RelationRepo {

    List<Relation> findAll();

    Relation add(Relation relation);
}
