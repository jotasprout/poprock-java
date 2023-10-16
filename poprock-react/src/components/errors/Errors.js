import { Link, useLocation } from 'react-router-dom'

export default function Errors({msg}){
    const location = useLocation();

    return (
    <p>
      🙅🏾‍♂️ Error{" "}
      {location.state ? ` - ${location.state.msg}` : ""}
      {msg}
    </p>
  );
    // return (
    //     <>
    //         <div className="d-flex justify-content-center align-items-center" style={{marginTop: "100px"}}>
    //             <p className="fw-bolder" style={{fontSize: "100px"}}>
    //                 <i className="bi bi-emoji-smile"></i><i className="bi bi-emoji-smile-upside-down"></i>ps!
    //             </p>
    //         </div>
    //         <div className="d-flex justify-content-center align-items-center">
    //             <p style={{fontSize: "30px", color: "#ffffff"}} className="fw-bold">Something went wrong!</p>
    //         </div>
    //         <hr className="mb-0" style={{marginTop: "0", background : "#b68c68", height: "5px"}} />
    //         <div className="text-center mt-4">
    //             <p style={{fontSize: "20px", color: "#5c636a"}} class="fw-bold"></p>
    //         </div>
    //         <div className="text-center">
    //             <p style={{fontSize: "20px", color: "#5c636a"}} class="fw-bold">
                    
                    
    //                 Please try again!
    //             </p>
    //         </div>
    //         <div class="mt-5 d-flex justify-content-center">
    //             <Link className="btn btn-secondary ms-2" to='/' >Home</Link>
    //         </div>
    //     </>
    // );

}