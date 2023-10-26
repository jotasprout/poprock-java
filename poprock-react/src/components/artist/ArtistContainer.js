import PopContainer from "./PopContainer";

export default function ArtistContainer (props) {

    const album = props.album;
    console.log(album);

    return (
        <div className="col artistContainer">
            
            <PopContainer album={album}/>
            <div>
                <img style={{width: '100%', objectFit: 'cover'}}
                        src={`${album.albumArtFilename}`}
                />
            </div>            
        </div>
    );
}