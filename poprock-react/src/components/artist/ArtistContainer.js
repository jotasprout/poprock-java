import ArtistPopContainer from "./ArtistPopContainer";

export default function ArtistContainer (props) {

    const artist = props.artist;
    console.log(artist);

    return (
        <div className="col columnContainer">
            {/* <div>
                
            </div> */}
            <ArtistPopContainer artist={artist}/>

                            
            <div className="imageHolder">
                <img style={{width: '70px', margin: 'auto', objectFit: 'cover'}}
                        src={`${artist.artistArtFilename}`} />           
            </div>

                        
        </div>
    );
}