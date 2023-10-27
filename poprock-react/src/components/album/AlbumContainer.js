import AlbumPopContainer from "./AlbumPopContainer";

export default function AlbumContainer (props) {

    const album = props.album;
    console.log(album);

    return (
        <div className="col columnContainer">

            <AlbumPopContainer album={album}/>
                            
            <div className="imageHolder">
                <img style={{width: '70px', margin: 'auto', objectFit: 'cover'}}
                        src={`${album.albumArtFilename}`} />           
            </div>

                        
        </div>
    );
}