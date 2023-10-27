import ColumnContainer from "./ColumnContainer";
import ArtistThumb from "../artist/ArtistThumb";
import { useEffect, useState } from "react";

export default function ColumnCharts () {

    const bowie = "0oSGxfWSnnOXhD2fKuz2Gy";         // 6
    const sabbath = "5M52tdBnJaKSvOpJGz8mfZ";       // 15
    const dio = "4CYeVo5iZbtYGBN4Isc3n6";
    const prince = "5a2EaR3hamoenG9rDuVn8j";        // 6
    const priest = "2tRsMl4eGxwoNabM08Dm4I";
    const purple = "568ZhdwyaiCyOGJRtNYhWf";        // 14
    const rainbow = "6SLAMfhOi7UJI0fMztaK0m";
    const elf = "3RYdggbT5C9r4BsljokJ1Q";
    const hnh = "4UjiBRkTw9VmvDZiJZKPJ7";
    const heartbreakers = "4tX2TplrkIP4v05BNC903e"; // 13
    const tompettysolo = "2UZMlIwnkgAEDBsw1Rejkn";  // 3
    const joanjett = "";
    const blackhearts = "1Fmb52lZ6Jv7FMWXXTPO3K";   // 13
    const runaways = "5eTq3PxbOh5vgeRXKNqPyV";      // 4
    const evilstig = "5NhjPre67qjeeQP4KHDHpe";      // 1

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

    const [myAlbums, setMyAlbums] = useState([]);
    let myArtist = `${sabbath}`;

    useEffect(() => {
        const fetchMyAlbums = async () => {
            const response = await fetch(`http://localhost:8080/api/album/artist/${heartbreakers}`);
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
                    return <ColumnContainer album={album} key={album.albumId}/>
                })}
            </div>    
            <hr />
            <p> <br /></p>
            <div className='thumbs row row-cols-4 row-cols-md-6 row-cols-lg-8 g-12'>
            <ArtistThumb />

            </div>        
        </div>
    );
}

// {artists.map(artist => {
//     return <ArtistThumb artist={artist} key={artist.artistId}/>
// })}