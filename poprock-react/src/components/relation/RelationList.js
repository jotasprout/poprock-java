import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import RelationTable from "./RelationTable";

export default function RelationList({artist}){

    const [artistRels, setArtistRels] = useState("");
    // console.log(artist);

    // console.log("the artist mbid is " + artist.artistMbid);

    // const baseUrl = "http:musicbrainz.org/ws/2/artist/";
    // const mbid = artist.artistMbid;
    // const urlParams = "?inc=artist-rels&fmt=json";

    // const relsUrl = baseUrl + mbid + urlParams;
    // console.log(relsUrl);

    useEffect(() => {
        const fetchArtistRels = async () => {
            const response = await fetch("http://musicbrainz.org/ws/2/artist/" + artist.artistMbid + "?inc=artist-rels&fmt=json");
            // const response = await fetch(`${relsUrl}`);
            // const response = await fetch("http:musicbrainz.org/ws/2/artist/5182c1d9-c7d2-4dad-afa0-ccfeada921a8?inc=artist-rels&fmt=json");
            if (response.ok) {
                const data = await response.json();
                setArtistRels(data);
                console.log(data);
            } else {
                setArtistRels([]);
            }
        };

        if (artist){
            fetchArtistRels();
        }
        
    }, [artist]);


    return (
        <></>
    );
}
