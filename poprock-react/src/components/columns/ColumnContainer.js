import PopContainer from "./PopContainer";

export default function ColumnContainer (props) {

    const album = props.album;
    console.log(album);

    return (
        <div className="col columnContainer">
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

{/* <button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="left" data-bs-original-title="Tooltip on left">Left</button>
<button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Tooltip on top">Top</button>
<button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-original-title="Tooltip on bottom">Bottom</button>
<button type="button" class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-original-title="Tooltip on right">Right</button> */}