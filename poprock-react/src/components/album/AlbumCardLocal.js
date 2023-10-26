import imageph from '../../img/image-ph.jpg';
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { useEffect, useState } from "react";

export default function AlbumCardLocal({album, artistId}){

    let token = window.localStorage.getItem('token');

    function phCheck(imgFileName){
        switch(imgFileName){
            case "image-ph.jpg":
                imgFileName = imageph;
                break;
            default:
                imgFileName = imgFileName;
        }
        return imgFileName;
    }

    const navigate = useNavigate();
    const [errors, setErrors] = useState([]);
    const [albumFacts, setAlbumFacts] = useState(null);

    // https://api.spotify.com/v1/albums/{id}/tracks
    // above gets album tracks

    // useEffect(() => {
        const fetchSpotifyAlbumFacts = async () => {
            const response = await fetch("https://api.spotify.com/v1/albums/" + album.albumSpotifyId, {
                method: 'GET',
                headers: {
                    Authorization: `Bearer ${token}`
                }
            });
            if (response.ok) {
                const data = await response.json()
                updateAlbum(album, data);
                // setAlbumFacts(data);
                // console.log(data);
            } else {
                setAlbumFacts([]);
            }
        };
        if (albumFacts){
            console.log(albumFacts);
        }
    // });

    function updateAlbum(album, data){

        // fetchSpotifyAlbumFacts(album.albumSpotifyId);

        // if (albumFacts){
        //     console.log(albumFacts);
        // }
        
        const updatedAlbumRequestBody = {
            albumId: album.albumId,
            albumSpotifyId: album.albumSpotifyId,
            albumName: album.albumName,
            albumSpotifyId: album.albumArtistId,
            albumReleaseDate: album.albumReleaseDate,
            albumArtFilename: album.albumArtFilename,
            albumPopularity: data.popularity
        };

        console.log(updatedAlbumRequestBody);

		fetch(`http://localhost:8080/api/album/${album.albumId}`, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(updatedAlbumRequestBody),
		})
			.then(res => {
				if (res.ok) {
					navigate(`/albums`);
				} else if (res.status === 400) {

					return res.json();
				} else {
					return Promise.reject(
						new Error(`Unexpected status code: ${res.status}`)
					);
				}
			})
			.then(setErrors)
			.catch(console.error); 
	}

    return (
        <div key={album.albumId} className='col'>
            {/* <Link onClick={(e) => addAlbum(album)}> */}
            <div className='card h-100'>
                <div>
                    <img 
                    className='card-img-top'
                    style={{width: '100%', objectFit: 'cover'}}
                    src={`${phCheck(album.albumArtFilename)}`} />
                </div>
                <div className='card-body'>
                    <h3 className='card-title fs-4'>{album.albumName}</h3>
                    <p>
                        <strong>Spotify ID:</strong> {album.albumSpotifyId}
                        <br />
                        <strong>Spotify Popularity:</strong> {album.albumPopularity}
                        <br />
                        <strong>Released:</strong> {album.albumReleaseDate}
                    </p>
                </div>
                <div className='card-footer d-flex justify-content-end'>
                    <button onClick={(e) => fetchSpotifyAlbumFacts(album)}>Update Album</button>
                </div>
            </div>
            {/* </Link> */}
        </div>
    );
}