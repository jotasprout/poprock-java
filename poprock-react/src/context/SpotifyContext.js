import { createContext, useReducer } from 'react'
import axios from 'axios'

import spotifyReducer from './SpotifyReducer'

const SpotifyContext = createContext();
const client_id = process.env.REACT_APP_SPOTIFY_CLIENT_ID;
const client_secret = process.env.REACT_APP_CLIENT_SECRET;
const auth_endpoint = process.env.REACT_APP_SPOTIFY_AUTH_ENDPOINT;
const response_type = process.env.REACT_APP_SPOTIFY_RESPONSE_TYPE;
const redirect_uri = process.env.REACT_APP_SPOTIFY_REDIRECT_URI;

export const SpotifyProvider = ({children}) => {
    const initialState = {
        token: '',
        artist: '',
    }

    const [state, dispatch] = useReducer(spotifyReducer, initialState);

    const authOptions = {
        url: `${auth_endpoint}`,
        headers: {
          'Content-Type' : 'application/x-www-form-urlencoded',
          'Authorization': 'Basic ' + btoa(client_id + ':' + client_secret)
        },
        form: {
          grant_type: 'client_credentials'
        },
        data: 'grant_type=client_credentials',
        method: 'POST',
        json: true
    }

    const getToken = async () => {
        setLoading();
        const data = await axios(authOptions);
        if(data) {
            dispatch({
              type: 'GET_TOKEN',
              payload: data.data.access_token,
            });
          } else {
            console.log('Token not available. Please check Spotify Developer Settings.')
          }
    };

    const setLoading = () => dispatch({type: 'SET_LOADING'})
  
    return <SpotifyContext.Provider value={{
      token: state.token,
    //   genres: state.genres,
    //   playlists: state.playlists,
      getToken,
    //   getGenres,
    //   getPlaylists,
    }}>
      {children}
    </SpotifyContext.Provider>
};

export default SpotifyContext;