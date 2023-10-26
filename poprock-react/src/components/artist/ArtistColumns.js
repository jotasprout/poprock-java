import ArtistContainer from "./ArtistContainer";
import { useEffect, useState } from "react";

export default function ArtistColumns () {

    const bowie = "0oSGxfWSnnOXhD2fKuz2Gy";
    const sabbath = "5M52tdBnJaKSvOpJGz8mfZ";
    const dio = "4CYeVo5iZbtYGBN4Isc3n6";
    const prince = "5a2EaR3hamoenG9rDuVn8j";
    const priest = "2tRsMl4eGxwoNabM08Dm4I";

    const [myAlbums, setMyAlbums] = useState([]);
    let myArtist = `${sabbath}`;

    useEffect(() => {
        const fetchMyAlbums = async () => {
            const response = await fetch(`http://localhost:8080/api/album/artist/${sabbath}`);
            if (response.ok) {
                setMyAlbums(await response.json());
            } else {
                setMyAlbums([]);
            }
        };

        fetchMyAlbums();
    }, []);

    return (
        <div id="columnContainer" className="container">
            <h1>Column Chart</h1>
            <div className='row'>

                {myAlbums.map(album => {
                    console.log(album);
                    return <ArtistContainer album={album} key={album.albumId}/>
                })}
            </div>            
        </div>
    );
}