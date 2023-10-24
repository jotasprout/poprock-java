package poprock.controllers;

import poprock.domain.RelationService;
import poprock.domain.RelationService;
import poprock.domain.Result;
import poprock.models.Relation;
import poprock.models.Relation;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/relation")
@CrossOrigin(origins={"http://127.0.0.1:5000", "http://localhost:3000"})
public class RelationController {

    private final RelationService service;

    public RelationController(RelationService service) {
        this.service = service;
    }

    @GetMapping
    public List<Relation> findAll() {
        return service.findAll();
    }
    @PostMapping
    public ResponseEntity<Object> add(@RequestBody Relation relation) {

        Result<Relation> result = service.add(relation);
        if (result.isSuccess()) {
            return new ResponseEntity<>(result.getPayload(), HttpStatus.CREATED);
        }
        return ErrorResponse.build(result);
    }
    
}
