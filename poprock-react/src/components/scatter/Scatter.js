import React, { useEffect, useRef } from 'react';
import heart from '../../img/heart.png';

export default function Scatter() {

    // function compareYears(a, b){
    //     if ( a.albumReleaseDate < b.albumReleaseDate ){
    //         return -1;
    //     }
    //     if ( a.albumReleaseDate > b.albumReleaseDate ){
    //         return 1;
    //     }
    //     return 0;
    // }

    // myAlbums.sort(compareYears);

    const canvasRef = useRef(null);

    useEffect(() => {
      const canvas = canvasRef.current;
      const ctx = canvas.getContext('2d');
  
      // Define your data here (for example)
      const data = [
        { x: 10, y: 20, imageUrl: `${heart}` },
        { x: 30, y: 40, imageUrl: `${heart}` },
        // Add more data points as needed
      ];
  
      // Draw scatterplot
      data.forEach(point => {
        const img = new Image();
        img.src = point.imageUrl;
        img.onload = () => {
          ctx.drawImage(img, point.x, point.y, 20, 20); // Adjust dimensions as needed
        };
      });
    }, []);

    return <canvas ref={canvasRef} width={800} height={600} />;

}