import imageph from '../../img/image-ph.jpg';
import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";

import RelationList from '../relation/RelationList';

// const INITIAL_ARTIST = {
// 	artistId: 0,
//     artistName: "",
//     artistPopularity: "",
//     artistFollowers: "",
//     artistArtFilename: ""
// };

export default function ArtistProfile(){

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

    const {artistId} = useParams();
    const [artist, setArtist] = useState(null);
    const navigate = useNavigate();

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

    if (!artist){
        return null;
    }

    return (
        <div id="profile" className="container">
            <h1>{artist?.artistName}</h1>
            <div>
                <img 
                        // className='card-img-top'
                        // style={{width: '100%'}}
                        src={`${phCheck(artist.artistArtFilename)}`} 
                        style={{height: '360px'}}
                        />
                <p>
                <strong>Spotify ID:</strong> {artist.artistSpotifyId}
                    <br />
                    <strong>MusicBrainz ID:</strong> {artist.artistMbid}
                    <br />
                    <strong>Popularity:</strong> {artist.artistPopularity}
                    <br />
                    {/* <strong>Listeners:</strong> {artist.artistListeners}
                    <br /> */}
                    <strong>Followers:</strong> {artist.artistFollowers}
                    {/* <br />
                    <strong>Artist Art:</strong> {artist.artistArtFilename} */}
                    </p>                
            </div>
                
            <RelationList artist={artist}/>
        </div>
    );
}