package poprock.data;

import poprock.models.Artist;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE)
public class ArtistJdbcTemplateRepositoryTest {

    final static int NEXT_ID = 13;

    @Autowired
    ArtistJdbcTemplateRepository repo;

    @Autowired
    KnownGoodState knownGoodState;

    @BeforeEach
    void setup() {
        knownGoodState.set();
    }

    @Test
    void shouldFindAll() {
        List<Artist> artists = repo.findAll();
        assertNotNull(artists);

        // can't predict order
        // if delete is first, we're down to 7
        // if add is first, we may go as high as 10
        assertTrue(artists.size() >= 12 && artists.size() <= 14);
    }

    @Test
    void shouldFindPriest() {
        Artist priest = repo.findById(5);
        assertEquals(5, priest.getArtistId());
        assertEquals("Judas Priest", priest.getArtistName());
    }

    @Test
    void shouldAdd() {
        // all fields
        Artist artist = makeArtist();
        Artist actual = repo.add(artist);
        assertNotNull(actual);
        assertEquals(NEXT_ID, actual.getArtistId());
    }

    @Test
    void shouldUpdate() {
        Artist artist = makeBowie();
        assertTrue(repo.update(artist));
    }

    private Artist makeArtist() {
        Artist artist = new Artist();
        artist.setArtistName("Lady GaGa");
        artist.setArtistMbid("650e7db6-b795-4eb5-a702-5ea2fc46c848");
        artist.setArtistSpotifyId("1HY2Jd0NmPuamShAr6KMms");
        return artist;
    }

    private Artist makeBowie() {
        Artist artist = new Artist();
        artist.setArtistId(1);
        artist.setArtistSpotifyId("0oSGxfWSnnOXhD2fKuz2Gy");
        artist.setArtistMbid("5441c29d-3602-4898-b1a1-b77fa23b8e50");
        return artist;
    }

}