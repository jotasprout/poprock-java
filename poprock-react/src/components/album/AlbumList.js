import {useEffect, useState} from 'react';

export default function AlbumList({artistSpotifyId}){

    let token = window.localStorage.getItem('token');
    const [artistSpotifyAlbums, setArtistSpotifyAlbums] = useState([]);

    // const fetchSpotifyAlbumsByArtist = async (e) => {
    //     e.preventDefault()
    //     const {data} = await axios.get("https://api.spotify.com/v1/search", {
    //         headers: {
    //             Authorization: `Bearer ${token}`
    //         }
    //     })
    
    //     setArtists(data.artists.items)
    //     console.log(data.artists);
    // }

    useEffect(() => {
        const fetchArtistSpotifyAlbums = async () => {
            const response = await fetch("https://api.spotify.com/v1/artists/" + artistSpotifyId + "/albums?include_groups=album&limit=40&market=US", {
                method: 'GET',
			    headers: {
				    Authorization: `Bearer ${token}`
			    }
            });
            console.log("is this working");

            if (response.ok) {
                const data = await response.json();
                setArtistSpotifyAlbums(data);
                console.log(data);
            } else {
                setArtistSpotifyAlbums([]);
            }
        };

        if (artistSpotifyId){
            fetchArtistSpotifyAlbums();
        }
        
    }, [artistSpotifyId]);

    // function addArtist(artist){

    //     console.log(artist);
    //     console.log(artistRequestBody);
    //     //artistRequestBody.followers = grabFollowers(artist);
    //     console.log(artist);
	// 	fetch(`https://api.spotify.com/v1/artists/${artistSpotifyId}/albums?include_groups=album&limit=40&market=US`, {
	// 		method: 'GET',
	// 		headers: {
	// 			Authorization: `Bearer ${token}`
	// 		},
	// 		body: JSON.stringify(artistRequestBody),
	// 	})
	// 		.then(res => {
	// 			if (res.ok) {
	// 				navigate(`/albums`);
	// 			} else if (res.status === 400) {

	// 				return res.json();
	// 			} else {
	// 				return Promise.reject(
	// 					new Error(`Unexpected status code: ${res.status}`)
	// 				);
	// 			}
	// 		})
	// 		.then(setErrors)
	// 		.catch(console.error); 
	// }

    return (
        <>
            <div>
                AlbumList component.
            </div>
        </>
    );
}