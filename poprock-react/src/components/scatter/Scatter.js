import { useEffect, useRef, useState } from 'react';
import heart from '../../img/heart.png';

export default function Scatter() {

    const jj = 21;
    const rjd = 8;
    const tp = 4;

    const canvasRef = useRef(null);

    const [commonAlbums, setCommonAlbums] = useState([]);

    useEffect(() => {

        // const canvas = canvasRef.current;
        // const ctx = canvas.getContext('2d');

        const fetchCommonAlbums = async () => {
            const response = await fetch(`http://localhost:8080/api/commonalbum/${jj}`);

            if (response.ok) {
                const data = await response.json();
                setCommonAlbums(data);
                console.log(data);
            } else {
                setCommonAlbums(null);
            }
        };

        fetchCommonAlbums();

        // Draw scatterplot
        // commonAlbums.forEach(point => {
        //     const img = new Image();
        //     img.src = point.imageUrl;
        //     img.onload = () => {
        //         ctx.drawImage(img, point.x, point.y, 20, 20); // Adjust dimensions as needed
        //     };
        // });

    }, []);

    if (!commonAlbums){
        return null;
    };

        // const data = [
        //   { x: 10, y: 20, imageUrl: `${heart}` },
        //   { x: 30, y: 40, imageUrl: `${heart}` },
        // ];

    console.log(commonAlbums);

    // function compareYears(a, b){
    //     if ( a.albumReleaseDate < b.albumReleaseDate ){
    //         return -1;
    //     }
    //     if ( a.albumReleaseDate > b.albumReleaseDate ){
    //         return 1;
    //     }
    //     return 0;
    // }

    // commonAlbums.sort(compareYears);

    // return <canvas ref={canvasRef} width={800} height={600} />;

}