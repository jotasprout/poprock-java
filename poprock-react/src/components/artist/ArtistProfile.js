import imageph from '../../img/image-ph.jpg';
import { useEffect, useState } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import axios from 'axios';

import RelationList from '../relation/RelationList';
import AlbumList from '../album/AlbumList';

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
    console.log(artistId);

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

    const fetchSpotifyAlbums = async () => {
        const response = await fetch("https://api.spotify.com/v1/artists/" + artist.artistSpotifyId + "/albums?include_groups=album&limit=50&market=US", {
            method: 'GET',
            headers: {
                Authorization: `Bearer ${token}`
            }
        });
        // console.log(response);

        if (response.ok) {
            const data = await response.json();
            setArtistSpotifyAlbums(data);
            // console.log(data);
        } else {
            setArtistSpotifyAlbums([]);
        }


    };

    // if (artistSpotifyAlbums){
    //     console.log(artistSpotifyAlbums);
    // };

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
                <div>
                    {/* <Link className='btn btn-primary me-2 btn-sm' to={`/albums/${artist.artistSpotifyId}`}><strong>Get Albums</strong></Link> */}

                    <button onClick={fetchSpotifyAlbums}>Get Albums</button>
                </div>   
                {artistSpotifyAlbums ? <AlbumList albumsList={artistSpotifyAlbums} artistId={artistId}/> : <p>no albums</p>}
            <RelationList artist={artist}/>
        </div>
    );
}