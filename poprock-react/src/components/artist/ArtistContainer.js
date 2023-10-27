import ArtistPopContainer from "./ArtistPopContainer";

export default function ArtistContainer (props) {

    const album = props.album;
    console.log(album);

    return (
        <div className="col columnContainer">
            {/* <div>
                
            </div> */}
            <ArtistPopContainer album={album}/>

                            
            <div className="imageHolder">
                <img style={{width: '70px', margin: 'auto', objectFit: 'cover'}}
                        src={`${album.albumArtFilename}`} />           
            </div>

                        
        </div>
    );
}