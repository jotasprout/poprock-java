import { useEffect, useState } from "react";

export default function RelationTable({artistRels}){

    const [rels, setRels] = useState("");
    
    const data = artistRels.relations;
    // setRels(data);
    console.log(data);

    // 
    // const [artistRel, setArtistRel] = useState("");
    // setArtistRels(artistRels);

    return (
        <></> 
            // <table className="table table-striped">
            //     <thead>
            //         <tr>
            //             <th>id</th>
            //             <th>Name</th>
            //             <th>MBID</th>
            //             <th>Type</th>
            //         </tr>
            //     </thead>
            //     <tbody>
            //         {artistRels.map(artistRel => (

                        
            //             <tr key={artistRel.artist.id}>
            //                 {/* <td>
            //                     <Link to={`/agents/profile/${agent.agentId}`}>
            //                             {agent.firstName}{agent.middleName ? " " + agent.middleName : ""} {agent.lastName}
            //                     </Link>
            //                 </td> */}
            //                 <td>no id yet</td>
            //                 <td>{artistRel.artist.name}</td>
            //                 <td>{artistRel.artist.id}</td>

            //                 <td>{artistRel.type}</td>
            //             </tr>
            //         ))}
            //     </tbody>
            // </table >
       
    );
}