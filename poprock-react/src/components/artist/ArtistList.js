import { useEffect, useState } from "react";
import ArtistCard from "./ArtistCard";

export default function ArtistList(){

    const [artists, setArtists] = useState([]);

    useEffect(() => {
        const fetchArtists = async () => {
            const response = await fetch("http://localhost:8080/api/artist");
            if (response.ok) {
                setArtists(await response.json());
            } else {
                setArtists([]);
            }
        };

        fetchArtists();
    }, []);

    function compareArtists(a, b){
        if ( a.artistName < b.artistName ){
            return -1;
        }
        if ( a.artistName > b.artistName ){
            return 1;
        }
        return 0;
    }

    artists.sort(compareArtists);

    return (
        <div id="artists" className="container">
            <h1>Artists</h1>
            <div className='row row-cols-2 row-cols-md-3 row-cols-lg-4 g-5'>
                {artists.map(artist => {
                    return <ArtistCard artist={artist} key={artist.artistId}/>
                })}
            </div>            
        </div>

    );
}