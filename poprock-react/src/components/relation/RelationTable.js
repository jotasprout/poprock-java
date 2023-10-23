import { useEffect, useState } from "react";

export default function RelationTable({artistRels}){

    const rels = artistRels.relations;

    if (!artistRels){
        return null;
    }

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
                    {rels.map((artistRel, index) => (

                        <tr key={index}>
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