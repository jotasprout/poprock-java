import PopContainer from "./PopContainer";

export default function ColumnContainer (props) {

    const album = props.album;
    console.log(album);

    return (
        <div className="col columnContainer">

            <PopContainer album={album}/>
                            
            <div className="imageHolder">
                <img style={{width: '70px', margin: 'auto', objectFit: 'cover'}}
                        src={`${album.albumArtFilename}`} />           
            </div>
                        
        </div>
    );
}
