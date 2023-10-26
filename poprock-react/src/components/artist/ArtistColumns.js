import ArtistContainer from "./ArtistContainer";


export default function ArtistColumns () {
    return (
        <div id="columnContainer" className="container">
            <h1>Column Chart</h1>
            <div className='row'>

                {/* {artists.map(artist => {
                    // console.log(album);
                    return <ArtistContainer artist={artist} key={artist.artistId}/>
                })} */}
                <ArtistContainer />
            </div>            
        </div>
    );
}