import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import { Link } from "react-router-dom";

export default function RelationTable(props){

    const artistId = props.artistId;
    const rels = props.artistRels.relations;
    const primaryMbid = props.primaryMbid;

    const navigate = useNavigate();
    const [errors, setErrors] = useState([]);

    function compareRels(a, b){
        if ( a.artist.id < b.artist.id ){
            return -1;
        }
        if ( a.artist.id > b.artist.id ){
            return 1;
        }
        return 0;
    }

    rels.sort(compareRels);

    if (!props){
        return null;
    }

    if (!rels){
        return null;
    }

    
    // console.log(props);
    // console.log(rels);
    // console.log(primaryMbid);

    function addArtistRel(artistRel, primaryMbid){

        const artistRelRequestBody = {
            relationId: 0,
            relationPrimaryMbid: primaryMbid,
            relationArtistMbid: artistRel.artist.id,
            relationName: artistRel.artist.name,
            relationType: artistRel.type,
            relationAttribute: artistRel.attributes[0]
        };

		fetch(`http://localhost:8080/api/relation`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(artistRelRequestBody),
		})
			.then(res => {
				if (res.ok) {
					// navigate(`/artists/profile/${artistId}`);
                    console.log(`added ${artistRelRequestBody.relationName}`);
				} else if (res.status === 400) {

					return res.json();
				} else {
					return Promise.reject(
						new Error(`Unexpected status code: ${res.status}`)
					);
				}
			})
			.then(setErrors)
			.catch(console.error); 
	}


    return (
        <div>
            <table className="table table-striped">
                <thead>
                    <tr>
                        
                        <th>Name</th>
                        {/* <th>MBID</th> */}
                        <th>Type</th>
                        <th>Attribute</th>
                    </tr>
                </thead>
                <tbody>
                    {rels.map((artistRel, index) => (

                        <tr key={index}>
                            
                            <td>
                            <Link onClick={(e) => addArtistRel(artistRel, primaryMbid)}>
                            {artistRel.artist.name}
                            </Link>
                            </td>
                            {/* <td>{artistRel.artist.id}</td> */}
                            <td>{artistRel.type}</td>
                            <td>{artistRel.attributes[0]}</td>
                        </tr>
                    ))}
                </tbody>
            </table >
       </div>

    );

//     <Link onClick={(e) => addArtistRel(artistRel, primaryMbid)}>
//     {artistRel.artist.name}
// </Link>

// {artistRel.artist.name}
}