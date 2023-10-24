import imageph from '../../img/image-ph.jpg';
import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import axios from 'axios';

import RelationList from '../relation/RelationList';

// const INITIAL_ARTIST = {
// 	artistId: 0,
//     artistName: "",
//     artistPopularity: "",
//     artistFollowers: "",
//     artistArtFilename: ""
// };

export default function ArtistProfile(){

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

    const {artistId} = useParams();
    const [artist, setArtist] = useState(null);
    const navigate = useNavigate();
    const [artistSpotifyAlbums, setArtistSpotifyAlbums] = useState([]);

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

    // const fetchSpotifyAlbums = async (e) => {
    //     e.preventDefault()
    //     const {data} = await axios.get("https://api.spotify.com/v1/search", {
    //         headers: {
    //             Authorization: `Bearer ${token}`
    //         }
    //     })
    
    //     setArtistSpotifyAlbums(data)
    //     console.log(data);
    // }

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
                {/* <div>
                    <Link className='btn btn-primary me-2 btn-sm' to={`/albums/${artist.artistSpotifyId}`}><strong>Get Albums</strong></Link>
                    <button onClick={fetchSpotifyAlbums}>Get Albums</button>
                </div>    */}
            <RelationList artist={artist}/>
        </div>
    );
}