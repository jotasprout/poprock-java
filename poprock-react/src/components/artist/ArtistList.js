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
            <div className='row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4'>
                {artists.map(artist => {
                    // console.log(artist);
                    return <ArtistCard artist={artist} key={artist.id}/>
                })}
            </div>
    );
}