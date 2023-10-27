import imageph from '../../img/image-ph.jpg';
import { Link } from "react-router-dom";

export default function ArtistThumb({artist}){

    function phCheck(imgFileName){
        switch(imgFileName){
            case "image-ph.jpg":
                imgFileName = imageph;
                break;
            default:
                imgFileName = imgFileName;
        }
        return imgFileName;
    }

    return (
        <div>
            <div>
                <img 
                    id='6'
                    className='artistThumb'
                    src='https://i.scdn.co/image/5931700f9515dd6587230130beb615e0549e47dc' 
                />
            </div>

            <div>
                <img 
                    id='8'
                    className='artistThumb'
                    src='https://i.scdn.co/image/ab6761610000e5eb555c8199ba80168cfeafdfbc' 
                />
            </div>

            <div>
                <img 
                    id='21'
                    className='artistThumb'
                    src='https://i.scdn.co/image/ab6761610000e5eb358cc74a410c5476802f9fb9' 
                />
            </div>
            <div>
                <img 
                    id=''
                    className='artistThumb'
                    src='' 
                />
            </div>

            <div>
                <img 
                    id=''
                    className='artistThumb'
                    src='' 
                />
            </div>

            <div>
                <img 
                    id=''
                    className='artistThumb'
                    src='' 
                />
            </div>

        </div>
    );
}
