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
                // console.log(data);
            } else {
                setArtistRels([]);
            }
        };

        if (artist){
            fetchArtistRels();
        }
        
    }, [artist]);

    return (
        <RelationTable artistRels={artistRels}/>

//         <div>
//         <table className="table table-striped">
//             <thead>
//                 <tr>
//                     <th>id</th>
//                     <th>Name</th>
//                     <th>MBID</th>
//                     <th>Type</th>
//                 </tr>
//             </thead>
//             <tbody>
//                 {artistRels.map(artistRel => (

//                     <tr key={artistRel.artist.id}>
//                         <td>no id yet</td>
//                         <td>{artistRel.artist.name}</td>
//                         <td>{artistRel.artist.id}</td>
//                         <td>{artistRel.type}</td>
//                     </tr>
//                 ))}
//             </tbody>
//         </table >
//    </div>
    );
}
