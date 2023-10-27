import imageph from '../../img/image-ph.jpg';
import { Link } from "react-router-dom";

export default function ArtistThumb({artist}){

    function phCheck(imgFileName){
        switch(imgFileName){
            case "image-ph.jpg":
                imgFileName = imageph;
                break;
            default:
                imgFileName = imgFileName;
        }
        return imgFileName;
    }

    return (
        <div key={artist.artistId} className='col'>

            {/* <div class="card text-white bg-primary mb-3" >
                <div class="card-header">{artist.artistName}</div>
                <div class="card-body"> */}
                    <div>
                        <img 
                        className='card-img-top'
                        style={{width: '100px', objectFit: 'cover'}}
                        src={`${phCheck(artist.artistArtFilename)}`} />
                    </div>
                {/* </div>
            </div> */}

        </div>
    );
}

{/* <div className='card h-100'>
<div>
    <img 
    className='card-img-top'
    style={{width: '100%', objectFit: 'cover'}}
    src={`${phCheck(artist.artistArtFilename)}`} />
</div>
<div className='card-body'>
    <h2 className='card-title fs-4'>{artist.artistName}</h2>
    <p><strong>Popularity:</strong> {artist.artistPopularity}
        <br />
        <strong>Followers:</strong> {artist.artistFollowers}
        <br />
        <strong>Spotify ID:</strong> {artist.artistSpotifyId}
        </p>
</div>
<div className='card-footer d-flex justify-content-end'>
    <Link className='btn btn-outline-success me-2 btn-sm' to={`/artists/profile/${artist.artistId}`}><strong>Profile</strong></Link>
    <Link className='btn btn-outline-warning me-2 btn-sm' to={`/artists/edit/${artist.artistId}`}><strong>Edit</strong></Link>
    <Link className='btn btn-outline-danger me-2 btn-sm' to={`/artists/delete/${artist.artistId}`}><strong>Delete</strong></Link>
</div>
</div> */}