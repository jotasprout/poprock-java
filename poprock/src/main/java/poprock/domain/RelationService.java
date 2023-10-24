package poprock.domain;

import org.springframework.stereotype.Service;
import poprock.models.Relation;
import poprock.data.RelationRepo;

import java.util.List;

@Service
public class RelationService {

    private final RelationRepo repo;
    public RelationService(RelationRepo repo) {
        this.repo = repo;
    }

    public List<Relation> findAll() {
        return repo.findAll();
    }

    public Result<Relation> add(Relation relation) {
        Result<Relation> result = validate(relation);
        if (!result.isSuccess()) {
            return result;
        }

        if (relation.getRelationId() != 0) {
            result.addMessage("relationId cannot be set for `add` operation", ResultType.INVALID);
            return result;
        }

        relation = repo.add(relation);
        result.setPayload(relation);
        return result;
    }

    private Result<Relation> validate(Relation relation) {
        Result<Relation> result = new Result<>();
        if (relation == null) {
            result.addMessage("relation cannot be null", ResultType.INVALID);
            return result;
        }

        if (Validations.isNullOrBlank(relation.getRelationName())) {
            result.addMessage("Relation Name is required", ResultType.INVALID);
        }

        return result;
    }
    
}
