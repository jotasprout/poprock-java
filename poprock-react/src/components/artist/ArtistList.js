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

    return (
            <div className='row row-cols-2 row-cols-md-3 row-cols-lg-4 g-5'>
                {artists.map(artist => {
                    console.log(artist);
                    return <ArtistCard artist={artist} key={artist.id}/>
                })}
            </div>
    );
}