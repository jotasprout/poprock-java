import imageph from '../../img/image-ph.jpg';
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";

const INITIAL_ARTIST = {
	artistId: 0,
    artistName: "",
    artistPopularity: "",
    artistFollowers: "",
};

export default function ArtistProfile(){

    const {artistId} = useParams();
    const [artist, setArtist] = useState(INITIAL_ARTIST);
    const navigate = useNavigate();
    // const locationData = data.locations.find((item) => item.id == locationId);

    useEffect(() => {
        fetch(`http://localhost:8080/api/artist/${artistId}`)
            .then(res => {
                if(res.ok){
                    return res.json();
                }else if(res.status >= 500 ){
                    return res.json()
                                .then(error => Promise.reject(new Error(error.message())));
                }else{
                    return Promise.reject(
                        new Error(`Unexpected status code ${res.status}`)
                    );
                }
            })
            .then(setArtist)
            .catch(error => {
                console.error(error);
                navigate('/error', {state : {error}});
            })
    },[artistId]);

    return (
        <>
            <h1 className='card-title fs-4'>{artist.artistName}</h1>
            <p>
                <strong>Popularity:</strong> {artist.artistPopularity}
                <br />
                <strong>Listeners:</strong> {artist.artistListeners}
            </p>

        </>
    );
}