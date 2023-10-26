import { useEffect, useState } from "react";
import AlbumCardLocal from "./AlbumCardLocal";

export default function AlbumGallery(){

    const [myAlbums, setMyAlbums] = useState([]);

    useEffect(() => {
        const fetchMyAlbums = async () => {
            const response = await fetch("http://localhost:8080/api/album");
            if (response.ok) {
                setMyAlbums(await response.json());
            } else {
                setMyAlbums([]);
            }
        };

        fetchMyAlbums();
    }, []);

    return (
        <div id="albums" className="container">
            <h1>Albums</h1>
            <div className='row row-cols-2 row-cols-md-3 row-cols-lg-4 g-5'>
                {myAlbums.map(album => {
                    // console.log(album);
                    return <AlbumCardLocal album={album} key={album.albumId}/>
                })}
            </div>            
        </div>

    );
}