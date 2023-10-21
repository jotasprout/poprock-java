import imageph from '../../img/image-ph.jpg';
import { Link } from "react-router-dom";

export default function ArtistCard({artist}){

    return (
        <div key={artist.artistId} className='col'>
            <div className='card h-100'>
                <div>
                    <img 
                    className='card-img-top'
                    style={{height: '250px', objectFit: 'cover'}}
                    src={imageph} />
                </div>
                <div className='card-body'>
                    <h1 className='card-title fs-4'>{artist.artistName}</h1>
                    <p><strong>Popularity:</strong> {artist.artistPopularity}
                        <br />
                        <strong>Followers:</strong> {artist.artistFollowers}</p>
                </div>
                <div className='card-footer d-flex justify-content-end'>
                    <Link className='btn btn-primary me-2 btn-sm' to={`/artists/profile/${artist.artistId}`}>Profile</Link>
                </div>
            </div>
        </div>
    );
}