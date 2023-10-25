import {useEffect, useState} from 'react';
import AlbumCard from './AlbumCard';

export default function AlbumList({albumsList}, {artistId}){

    const albums = albumsList.items;

    // const albums = props.albumsList.items;
    
    // if (!props){
    //     return null;
    // }

    if (!albums){
        return null;
    };

    console.log(albums);

    return (
        <div>

            <div id="albums">
                <h2>Albums</h2>
                <div className='row row-cols-2 row-cols-md-3 row-cols-lg-4 g-5'>
                    {albums.map((album, index) => {
                        // console.log(artist);
                        return <AlbumCard album={album} key={index} artistId={artistId} />
                    })}
                </div>            
            </div>
            {/* <table className="table table-striped">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Name</th>
                        <th>Spotify ID</th>
                        <th>Art URL</th>
                    </tr>
                </thead>
                <tbody>
                    {albums.map((album, index) => (

                        <tr key={index}>
                            <td>no id yet</td>
                            <td>{album.name}</td>
                            <td>{album.id}</td>
                            <td>{album.images[0].url}</td>
                        </tr>
                    ))}
                </tbody>
            </table > */}
       </div>
    );
}