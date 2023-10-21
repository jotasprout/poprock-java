import { ForceGraph2D, ForceGraph3D, ForceGraphVR, ForceGraphAR } from 'react-force-graph';
import three from 'three';
import SpriteText from 'three-spritetext';

import data from './force-sample2.json';

export default function Relations() {

    console.log(data);

    function initNodeColor(node) {
        if (node.level === 1) {
            return 14
        }
        if (node.level === 2) {
            return 8
        }
        // if (node.level === 3) {
        //     return 'magenta'
        // }
        // if (node.level === 4) {
        //     return 'blue'
        // }
        // if (node.level === 5) {
        //     return 'green'
        // }
        // if (node.level === 6) {
        //     return 'orange'
        // }
    };

    return (



        <ForceGraph3D
            graphData={data}
            nodeAutoColorBy="group"
            nodeThreeObject={node => {
                const sprite = new SpriteText(node.id);
                sprite.color = node.color;
                sprite.textHeight = initNodeColor(node);
                return sprite;
              }}
            // nodeCanvasObject={(node, ctx, globalScale) => {
            //   const label = node.id;
            //   const fontSize = 12/globalScale;
            //   ctx.font = `${fontSize}px Sans-Serif`;
            //   const textWidth = ctx.measureText(label).width;
            //   const bckgDimensions = [textWidth, fontSize].map(n => n + fontSize * 0.2); // some padding
  
            //   ctx.fillStyle = 'rgba(255, 255, 255, 0.8)';
            //   ctx.fillRect(node.x - bckgDimensions[0] / 2, node.y - bckgDimensions[1] / 2, ...bckgDimensions);
  
            //   ctx.textAlign = 'center';
            //   ctx.textBaseline = 'middle';
            //   ctx.fillStyle = node.color;
            //   ctx.fillText(label, node.x, node.y);
  
            //   node.__bckgDimensions = bckgDimensions; // to re-use in nodePointerAreaPaint
            // }}
            // nodePointerAreaPaint={(node, color, ctx) => {
            //   ctx.fillStyle = color;
            //   const bckgDimensions = node.__bckgDimensions;
            //   bckgDimensions && ctx.fillRect(node.x - bckgDimensions[0] / 2, node.y - bckgDimensions[1] / 2, ...bckgDimensions);
            // }}
        />
    );
}

