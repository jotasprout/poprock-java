package poprock.controllers;

import poprock.domain.AlbumService;
import poprock.domain.Result;
import poprock.models.Album;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/album")
@CrossOrigin(origins={"http://127.0.0.1:5000", "http://localhost:3000"})
public class AlbumController {

    private final AlbumService service;

    public AlbumController(AlbumService service) {
        this.service = service;
    }

    @GetMapping
    public List<Album> findAll() {
        return service.findAll();
    }

    @GetMapping("/{albumId}")
    public Album findById(@PathVariable int albumId) {
//        if (service.findById(albumId) == null) {
//            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
//        }
        return service.findById(albumId);
    }

    @PostMapping
    public ResponseEntity<Object> add(@RequestBody Album album) {

        Result<Album> result = service.add(album);
        if (result.isSuccess()) {
            return new ResponseEntity<>(result.getPayload(), HttpStatus.CREATED);
        }
        return ErrorResponse.build(result);
    }

    @PutMapping("/{albumId}")
    public ResponseEntity<Object> update(@PathVariable int albumId, @RequestBody Album album) {
        if (albumId != album.getAlbumId()) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }

        Result<Album> result = service.update(album);
        if (result.isSuccess()) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }

        return ErrorResponse.build(result);
    }

    @DeleteMapping("/{albumId}")
    public ResponseEntity<Void> deleteById(@PathVariable int albumId) {
        if (service.deleteById(albumId)) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

}
