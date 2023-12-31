import { useEffect, useState } from "react";
import FormErrors from "../errors/FormErrors";
import { Link, useNavigate, useParams } from 'react-router-dom';

const INITIAL_ARTIST = {
	artistId: 0,
    artistName: "",
    artistSpotifyId: "",
    artistArtFilename: "",
    artistMbid: ""
};

// TODO Move image and mbid checks to component

export default function ArtistForm() {

    function mbidCheck(artistMbid){
        switch(artistMbid){
            case null:
                artistMbid = "none";
                break;
            default:
                artistMbid = artistMbid;
        }
        return artistMbid;
    }

    const [artist, setArtist] = useState(INITIAL_ARTIST);
	const navigate = useNavigate(); 
	const { artistId } = useParams();
    const [errors, setErrors] = useState([]);

	useEffect(() => {
		if (artistId) {
			fetch(`http://localhost:8080/api/artist/${artistId}`)
				.then(res => res.json())
				.then(setArtist)
				.catch(console.error);
		}
	}, [artistId]);

    function handleChange(event) {
		const updatedArtist = { ...artist };
		if (event.target.type === 'checkbox') {

			updatedArtist[event.target.name] = event.target.checked;
		} else {
			updatedArtist[event.target.name] = event.target.value;
		}
		setArtist(updatedArtist);

		console.log(updatedArtist);
    }

    function handleSubmit(event) {
        event.preventDefault();
        updateArtist();

    }

	function updateArtist() {

        const artistUpdateBody = {
            artistId: artist.artistId,
            artistSpotifyId: artist.artistSpotifyId,
            artistName: artist.artistName,
            artistArtFilename: artist.artistArtFilename,
            artistMbid: artist.artistMbid
        };

		fetch(`http://localhost:8080/api/artist/${artist.artistId}`, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(artistUpdateBody),
		})
			.then(res => {
				if (res.ok) {
					navigate(`/artists`);
                    return;
				} else if (res.status === 404) {
					navigate('/404');
				} else {
					return Promise.reject(
						new Error(`Unexpected status code: ${res.status}`)
					);
				}
			})
			.then(setErrors)
            .catch((error) => {
                console.error(error)
                navigate('/artists');
       });
	}    

    // TODO Copy lines 79-81 above to similar code in other components

    return (
        <div id="artists" className="container">
            {/* <h1>{artist.artistName > 0 ? 'Update' : 'Add'}</h1> */}
            <h1>Update {artist.artistName}</h1>
            <form onSubmit={handleSubmit}>
                <div className="row mb-3">
                    <div className="col">
                        <label className="form-label" htmlFor="artistName">Artist Name</label>
                        <input id="artistName" name="artistName" type="text" className="form-control" required
                            onChange={handleChange} value={artist.artistName} />
                    </div>
                </div>
                <div className="mb-3">
                    <label className="form-label" htmlFor="artistSpotifyId">Spotify ID</label>
                    <input id="artistSpotifyId" name="artistSpotifyId" type="text" className="form-control" required
                        onChange={handleChange} value={artist.artistSpotifyId} />
                </div>
                <div className="mb-3">
                    <label className="form-label" htmlFor="artistMbid">MusicBrainz ID</label>
                    <input id="artistMbid" name="artistMbid" type="text" className="form-control" required
                        onChange={handleChange} value={`${mbidCheck(artist.artistMbid)}`} />
                </div>
                <div className="row mb-3">
                    <div className="col">
                        <label className="form-label" htmlFor="artistArtFilename">Artist Art Filename</label>
                        <input id="artistArtFilename" name="artistArtFilename" type="text" className="form-control"
                            onChange={handleChange} value={artist.artistArtFilename} />
                    </div>
                </div>
                <div className="mb-3">
                    <button type="submit" className="btn btn-primary me-2">Save</button>
                    <Link className='btn btn-secondary' to='/artists'>Cancel</Link>
                </div>
                <FormErrors errors={errors} />
            </form>
        </div>
    );
}
