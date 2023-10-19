import {useEffect, useState} from 'react';
import axios from 'axios';

export default function Auth(){

    const client_id = process.env.REACT_APP_SPOTIFY_CLIENT_ID; 
    const auth_endpoint = process.env.REACT_APP_SPOTIFY_AUTH_ENDPOINT;
    const response_type = process.env.REACT_APP_SPOTIFY_RESPONSE_TYPE;
    const redirect_uri = process.env.REACT_APP_SPOTIFY_REDIRECT_URI ;

    const [token, setToken] = useState("");
    const [searchKey, setSearchKey] = useState("");
    const [artists, setArtists] = useState([]);

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
                {artist.images.length ? <img width={"50%"} src={artist.images[0].url} alt=""/> : <div>No Image</div>}
                <p>
                    {artist.name}<br />
                    {artist.id}
                </p>
            </div>
        ))
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