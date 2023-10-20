import {useEffect, useState} from 'react';
import axios from 'axios';
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";

export default function Auth(){

    const client_id = process.env.REACT_APP_SPOTIFY_CLIENT_ID; 
    const auth_endpoint = process.env.REACT_APP_SPOTIFY_AUTH_ENDPOINT;
    const response_type = process.env.REACT_APP_SPOTIFY_RESPONSE_TYPE;
    const redirect_uri = process.env.REACT_APP_SPOTIFY_REDIRECT_URI ;

    const [token, setToken] = useState("");
    const [searchKey, setSearchKey] = useState("");
    const [artists, setArtists] = useState([]);
    const [artist, setArtist] = useState([]);

    const INITIAL_ARTIST = {
        artistId: 0,
        artistSpotifyId: "",
        artistName: "",
        artistPopularity: "",
        artistFollowers: "",
        artistMbid: "",
    };

    useEffect(() => {
        const hash = window.location.hash;
        let token = window.localStorage.getItem('token');

        if (!token && hash) {
            token = hash.substring(1).split('&').find(elem => elem.startsWith("access_token")).split("=")[1];

            window.location.hash = '';
            window.localStorage.setItem('token', token);
        }

        setToken(token);

    }, []);

    const logout = () => {
        setToken("")
        window.localStorage.removeItem("token")
    }

    const searchArtists = async (e) => {
        e.preventDefault()
        const {data} = await axios.get("https://api.spotify.com/v1/search", {
            headers: {
                Authorization: `Bearer ${token}`
            },
            params: {
                q: searchKey,
                type: "artist"
            }
        })
    
        setArtists(data.artists.items)
        console.log(data.artists);
    }

    const renderArtists = () => {
        return artists.map(artist => (
            <div key={artist.id}>
                <Link onClick={(e) => addArtist(artist)}>
                    {artist.images.length ? <img width={"50%"} src={artist.images[0].url} alt=""/> : <div>No Image</div>}
                    <p>
                        {artist.name}<br />
                        {artist.id}
                    </p>
                </Link>
            </div>
        ))
    }

    const navigate = useNavigate();
    const [errors, setErrors] = useState([]);
    
    function addArtist(artist){
        console.log(artist);
		fetch(`http://localhost:8080/api/artist`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(artist),
		})
			.then(res => {
				if (res.ok) {
					navigate(`/artists`);
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
        <div className="App">
            <header className="App-header">
                <h1>Spotify Search</h1>
                <h2></h2>
                <form onSubmit={searchArtists}>
                    <input type="text" onChange={e => setSearchKey(e.target.value)}/>
                    <button type={"submit"}>Search</button>
                </form>

                {renderArtists()}

                {!token ?
                    <a href={`${auth_endpoint}?client_id=${client_id}&redirect_uri=${redirect_uri}&response_type=${response_type}`}>Get Auth Token</a>
                    : <button onClick={logout}>Logout</button>}
            </header>
        </div>
    );
}