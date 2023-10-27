import AlbumContainer from "./AlbumContainer";
import ArtistThumb from "../artist/ArtistThumb";
import { useEffect, useState } from "react";

export default function AlbumColumns () {

    const bowie = "0oSGxfWSnnOXhD2fKuz2Gy";         // 6
    const beatles = "3WrFJ7ztbogyGnTHbHJFl2";       // 
    const sabbath = "5M52tdBnJaKSvOpJGz8mfZ";       // 15
    const dio = "4CYeVo5iZbtYGBN4Isc3n6";           // 10
    const prince = "5a2EaR3hamoenG9rDuVn8j";        // 6
    const priest = "2tRsMl4eGxwoNabM08Dm4I";        // 
    const purple = "568ZhdwyaiCyOGJRtNYhWf";        // 14
    const rainbow = "6SLAMfhOi7UJI0fMztaK0m";       // 4
    const elf = "3RYdggbT5C9r4BsljokJ1Q";           // 2
    const hnh = "4UjiBRkTw9VmvDZiJZKPJ7";           // 1
    const heartbreakers = "4tX2TplrkIP4v05BNC903e"; // 13
    const tompettysolo = "2UZMlIwnkgAEDBsw1Rejkn";  // 3
    const blackhearts = "1Fmb52lZ6Jv7FMWXXTPO3K";   // 13
    const runaways = "5eTq3PxbOh5vgeRXKNqPyV";      // 4
    const evilstig = "5NhjPre67qjeeQP4KHDHpe";      // 1

    const [myAlbums, setMyAlbums] = useState([]);

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

    function compareYears(a, b){
        if ( a.albumReleaseDate < b.albumReleaseDate ){
            return -1;
        }
        if ( a.albumReleaseDate > b.albumReleaseDate ){
            return 1;
        }
        return 0;
    }

    myAlbums.sort(compareYears);

    return (
        <div id="columnContainer" className="container">
            {/* <h1>Column Chart</h1> */}

            <div className='row colsContainer'>

                {myAlbums.map(album => {
                    console.log(album);
                    return <AlbumContainer album={album} key={album.albumId}/>
                })}
            </div>    
            <hr />
            <p> <br /></p>
            {/* <div className='thumbs row row-cols-4 row-cols-md-6 row-cols-lg-8 g-12'>
            <ArtistThumb />

            </div>         */}
        </div>
    );
}