export default function ArtistPopContainer ({artist}){
    console.log(artist);
        const artistPopularity = artist.artistPopularity;
        console.log(artistPopularity);
    
        // let popUnits = [];
    
        function makePopUnits(artistPopularity) {
            let popUnits = [];
          
            for (let i = 0; i <= artistPopularity; i++) {
                popUnits.push(<div className="popUnit"></div>);
            }
            return popUnits;
        }
    
        return (
            <>
            <div className="popContainer">{makePopUnits(artistPopularity)}</div>
            </>
    
        );
    }