import PopUnit
 from "./PopUnit";
export default function PopContainer ({album}){
console.log(album);
    const albumPopularity = album.albumPopularity;
    console.log(albumPopularity);

    // let popUnits = [];

    function makePopUnits(albumPopularity) {
        let popUnits = [];
      
        for (let i = 0; i <= albumPopularity; i++) {
            popUnits.push(<div className="popUnit"></div>);
        }
        return popUnits;
    }

    return (
        <>
        <div className="popContainer">{makePopUnits(albumPopularity)}</div>
        </>

    );
}