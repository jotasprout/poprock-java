import {useContext, useEffect, useState} from 'react';
// import SpotifyContext from '../../context/SpotifyContext';
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

    // const {getToken} = useContext(SpotifyContext);

    // const token = useContext(SpotifyContext);
// console.log(token);
    // useEffect(() => {
    //     getToken();
    // }, [])

    // useEffect(() => {
    //     let localToken = getToken();
    //     setToken(localToken);
    // }, [])

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

    function grabFollowers(artist){
        let newFollowers = artist.followers.total;
        // console.log(newFollowers);
        return newFollowers;
    }

    const renderArtists = () => {
        return artists.map(artist => (

            // let artistFollowers = artist.followers.total;

            <div key={artist.id}>
                <Link onClick={(e) => addArtist(artist)}>
                    {artist.images.length ? <img width={"50%"} src={artist.images[0].url} alt=""/> : <div>No Image</div>}
                    <p>
                        <strong>Artist: </strong>{artist.name}<br />
                        {/* <strong>Spotify ID: </strong>{artist.id}<br /> */}
                        <strong>Followers: </strong>{grabFollowers(artist)}<br />
                        <strong>Popularity: </strong>{artist.popularity}
                    </p>
                </Link>
            </div>
        ))
    }

    const navigate = useNavigate();
    const [errors, setErrors] = useState([]);
    
    function addArtist(artist){

        const artistRequestBody = {
            artistId: 0,
            artistSpotifyId: artist.id,
            artistName: artist.name,
            artistPopularity: artist.popularity,
            artistFollowers: grabFollowers(artist),
            artistArtFilename: artist.images[0].url
            // artistMbid: "",
        };

        // console.log(artist);
        console.log(artistRequestBody);
        //artistRequestBody.followers = grabFollowers(artist);
        // console.log(artist);
		fetch(`http://localhost:8080/api/artist`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(artistRequestBody),
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
        <>
        <section className="jumbotron text-center">
        <div className="container">
        
            {/* <p>
                <a href="#" class="btn btn-primary my-2">Main call to action</a>
                <a href="#" class="btn btn-secondary my-2">Secondary action</a>
            </p> */}
            <div className="App">
                <header className="App-header">
                    <h1>Spotify Search</h1>
                    <p className="lead text-muted">Search for an Artist on Spotify.<br />
                    Click the desired artist among the results to add it.</p>
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
        </div>
    </section>

       
        </>

    );
}