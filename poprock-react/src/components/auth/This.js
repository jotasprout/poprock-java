import { Link } from "react-router-dom";

export default function This(){

    const client_id = ''; 
    const client_secret = ''; 
    const auth_endpoint = 'https://accounts.spotify.com/authorize';
    const response_type = 'token';
    const redirect_uri = 'http://localhost:3000/callback';

    return (
        <>
            <div>
                <Link to={`${auth_endpoint}?client_id=${client_id}&redirect_uri=${redirect_uri}&response_type=${response_type}`}>Get AuthToken</Link>
            </div>
        </>
    );

}