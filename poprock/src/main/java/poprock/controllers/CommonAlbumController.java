package poprock.controllers;

import org.springframework.web.bind.annotation.*;
import poprock.domain.CommonAlbumService;
import poprock.models.CommonAlbum;

import java.util.List;

@RestController
@RequestMapping("/api/commonalbum")
@CrossOrigin(origins={"http://127.0.0.1:5000", "http://localhost:3000"})
public class CommonAlbumController {

    private final CommonAlbumService service;

    public CommonAlbumController(CommonAlbumService service) {
        this.service = service;
    }

    @GetMapping("/{artistId}")
    public List<CommonAlbum> findCommonAlbumsByArtistId(@PathVariable int artistId) {
        return service.findCommonAlbumsByArtistId(artistId);
    }

}
