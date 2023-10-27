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
              onNodeDragEnd={node => {
                node.fx = node.x;
                node.fy = node.y;
                node.fz = node.z;
              }}

        />
    );
}

