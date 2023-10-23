import { useEffect, useState } from "react";

export default function RelationTable({artistRels}){

    // const [rels, setRels] = useState(null);
    
    const rels = artistRels.relations;

    // if (data){
    //     setRels(data);
    // }

    // setRels(await data);
    // console.log(data);
    // console.log(artistRels);
    console.log(rels);

    // 
    // const [rel, setRel] = useState("");
    // setArtistRels(artistRels);

    return (
        <div>
            <table className="table table-striped">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Name</th>
                        <th>MBID</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    {rels.map(artistRel => (

                        <tr key={artistRel.artist.id}>
                            <td>no id yet</td>
                            <td>{artistRel.artist.name}</td>
                            <td>{artistRel.artist.id}</td>
                            <td>{artistRel.type}</td>
                        </tr>
                    ))}
                </tbody>
            </table >
       </div>
    );
}