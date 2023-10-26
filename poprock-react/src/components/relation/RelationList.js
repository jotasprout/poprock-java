import { Link } from "react-router-dom";
import { useEffect, useState } from "react";
import RelationTable from "./RelationTable";

export default function RelationList({artist}){

    const [artistRels, setArtistRels] = useState(null);

    useEffect(() => {
        const fetchArtistRels = async () => {
            const response = await fetch("http://musicbrainz.org/ws/2/artist/" + artist.artistMbid + "?inc=artist-rels&fmt=json");

            if (response.ok) {
                const data = await response.json();
                setArtistRels(data);
                // console.log(data);
                // console.log("this is working");
            } else {
                setArtistRels(null);
            }
        };

        if (artist){
            fetchArtistRels();

        }
        
    }, [artist]);

    if(!artistRels){
        return null;
    }
    return (
        <div>
            <div id="albums">
                <h2>Related Artists from MusicBrainz</h2>
                <p><strong><em>Add a related artist by clicking their name.</em></strong></p>

                <RelationTable artistRels={artistRels} primaryMbid={artist.artistMbid} artistId={artist.artistId}/>
                </div>
       </div>
    );
}
