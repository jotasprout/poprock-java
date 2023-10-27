import {useEffect, useState} from 'react';
import AlbumCard from './AlbumCard';

export default function AlbumList({albumsList, artistId}){

    const albums = albumsList.items;
    const xId = artistId;

    if (!albums){
        return null;
    };

    console.log(albums);

    return (
        <div>
            <div id="albums">
                <h2>Albums On Spotify</h2>
                <p>Add an Album by clicking the cover.</p>
                <div className='row row-cols-2 row-cols-md-3 row-cols-lg-4 g-5'>
                    {albums.map((album, index) => {
                        return <AlbumCard album={album} key={index} artistId={artistId} />
                    })}
                </div>            
            </div>
       </div>
    );
}