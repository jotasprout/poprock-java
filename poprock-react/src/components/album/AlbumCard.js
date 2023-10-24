import imageph from '../../img/image-ph.jpg';
import { Link } from "react-router-dom";

export default function AlbumCard({album}){

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
        <div key={album.albumId} className='col'>
            <div className='card h-100'>
                <div>
                    <img 
                    className='card-img-top'
                    style={{width: '100%', objectFit: 'cover'}}
                    src={`${phCheck(album.images[0].url)}`} />
                </div>
                <div className='card-body'>
                    <h3 className='card-title fs-4'>{album.name}</h3>
                    <p><strong>Spotify ID:</strong> {album.id}
                        <br />
                        <strong>Released:</strong> {album.release_date}
                        </p>
                </div>
                <div className='card-footer d-flex justify-content-end'>
                    <Link className='btn btn-outline-success me-2 btn-sm' to={`/albums/profile/${album.albumId}`}><strong>Profile</strong></Link>
                </div>
            </div>
        </div>
    );
}