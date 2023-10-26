import PopContainer from "./PopContainer";

export default function ArtistContainer (props) {

    const album = props.album;
    console.log(album);

    return (
        <div className="col artistContainer">
            {/* <div>
                
            </div> */}
            <PopContainer album={album}/>

                            
            <div className="imageHolder">
                <img style={{width: '70px', margin: 'auto', objectFit: 'cover'}}
                        src={`${album.albumArtFilename}`} />           
            </div>

                        
        </div>
    );
}