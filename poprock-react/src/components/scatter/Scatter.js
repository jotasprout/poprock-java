import React, { useEffect, useRef } from 'react';
import heart from '../../img/heart.png';

export default function Scatter() {

    const bowie = "0oSGxfWSnnOXhD2fKuz2Gy";         // 6
    const sabbath = "5M52tdBnJaKSvOpJGz8mfZ";       // 15
    const dio = "4CYeVo5iZbtYGBN4Isc3n6";           // 10
    const prince = "5a2EaR3hamoenG9rDuVn8j";        // 6
    const priest = "2tRsMl4eGxwoNabM08Dm4I";        // 
    const purple = "568ZhdwyaiCyOGJRtNYhWf";        // 14
    const rainbow = "6SLAMfhOi7UJI0fMztaK0m";       // 4
    const elf = "3RYdggbT5C9r4BsljokJ1Q";           // 2
    const hnh = "4UjiBRkTw9VmvDZiJZKPJ7";           // 1
    const heartbreakers = "4tX2TplrkIP4v05BNC903e"; // 13
    const tompettysolo = "2UZMlIwnkgAEDBsw1Rejkn";  // 3
    const blackhearts = "1Fmb52lZ6Jv7FMWXXTPO3K";   // 13
    const runaways = "5eTq3PxbOh5vgeRXKNqPyV";      // 4
    const evilstig = "5NhjPre67qjeeQP4KHDHpe";      // 1

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