package poprock.controllers;

import poprock.domain.ArtistService;
import poprock.domain.Result;
import poprock.models.Artist;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/artist")
@CrossOrigin(origins={"http://127.0.0.1:5000", "http://localhost:3000"})
public class ArtistController {

    private final ArtistService service;

    public ArtistController(ArtistService service) {
        this.service = service;
    }

    @GetMapping
    public List<Artist> findAll() {
        return service.findAll();
    }

    @GetMapping("/{artistId}")
    public Artist findById(@PathVariable int artistId) {
        return service.findById(artistId);
    }

    @PostMapping
    public ResponseEntity<Object> add(@RequestBody Artist artist) {

        Result<Artist> result = service.add(artist);
        if (result.isSuccess()) {
            return new ResponseEntity<>(result.getPayload(), HttpStatus.CREATED);
        }
        return ErrorResponse.build(result);
    }

    @PutMapping("/{artistId}")
    public ResponseEntity<Object> update(@PathVariable int artistId, @RequestBody Artist artist) {
        if (artistId != artist.getArtistId()) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }

        Result<Artist> result = service.update(artist);
        if (result.isSuccess()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return ErrorResponse.build(result);
    }

    @DeleteMapping("/{artistId}")
    public ResponseEntity<Void> deleteById(@PathVariable int artistId) {
        if (service.deleteById(artistId)) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

}
