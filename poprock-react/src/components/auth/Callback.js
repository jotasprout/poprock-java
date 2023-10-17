import {useEffect, useState} from 'react';
import { Link } from "react-router-dom";
import axios from 'axios';

export default function Callback(){

    const client_id = ''; 
    const client_secret = ''; 
    const auth_endpoint = 'https://accounts.spotify.com/authorize';
    const response_type = 'token';
    const redirect_uri = 'http://localhost:3000/callback';

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
        console.log(token);

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
    }

    const renderArtists = () => {
        return artists.map(artist => (
            <div key={artist.id}>
                {artist.images.length ? <img width={"100%"} src={artist.images[0].url} alt=""/> : <div>No Image</div>}
                {artist.name}
            </div>
        ))
    }

    return (
        <div className="App">
            <header className="App-header">
                <h1>Spotify React</h1>

                <form onSubmit={searchArtists}>
                    <input type="text" onChange={e => setSearchKey(e.target.value)}/>
                    <button type={"submit"}>Search</button>
                </form>

                {renderArtists()}

                {!token ?
                    <Link to={`${auth_endpoint}?client_id=${client_id}&redirect_uri=${redirect_uri}&response_type=${response_type}`}>Get Auth Token</Link>
                    : <button onClick={logout}>Logout</button>}
            </header>
        </div>
    );

}