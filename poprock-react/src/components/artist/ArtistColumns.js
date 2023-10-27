import ArtistContainer from "./ArtistContainer";
import ArtistThumb from "../artist/ArtistThumb";
import { useEffect, useState } from "react";

export default function ArtistColumns () {

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

    const [myArtists, setMyArtists] = useState([]);

    useEffect(() => {
        const fetchMyArtists = async () => {
            const response = await fetch('http://localhost:8080/api/artist');
            if (response.ok) {
                setMyArtists(await response.json());
            } else {
                setMyArtists([]);
            }
        };

        fetchMyArtists();
    }, []);

    function compareYears(a, b){
        if ( a.artistReleaseDate < b.artistReleaseDate ){
            return -1;
        }
        if ( a.artistReleaseDate > b.artistReleaseDate ){
            return 1;
        }
        return 0;
    }

    myArtists.sort(compareYears);

    return (
        <div id="columnContainer" className="container">
            {/* <h1>Column Chart</h1> */}

            <div className='row colsContainer'>

                {myArtists.map(artist => {
                    console.log(artist);
                    return <ArtistContainer artist={artist} key={artist.artistId}/>
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