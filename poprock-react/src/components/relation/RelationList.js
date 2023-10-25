import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import RelationTable from "./RelationTable";

export default function RelationList({artist}){

    const [artistRels, setArtistRels] = useState("");

    useEffect(() => {
        const fetchArtistRels = async () => {
            const response = await fetch("http://musicbrainz.org/ws/2/artist/" + artist.artistMbid + "?inc=artist-rels&fmt=json");

            if (response.ok) {
                const data = await response.json();
                setArtistRels(data);
                console.log(data);
                console.log("this is working");
            } else {
                setArtistRels([]);
            }
        };

        if (artist){
            fetchArtistRels();
        }
        
    }, [artist]);
// console.log(artistRels);
    return (
        <RelationTable artistRels={artistRels} primaryMbid={artist.artistMbid}/>
// <RelationTable artistRels={artistRels}/>

    );
}
