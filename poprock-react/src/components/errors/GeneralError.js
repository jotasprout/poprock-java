import { Link, useLocation } from 'react-router-dom';

export default function GeneralError(){
    const location = useLocation();
    const errorDetail = location.state?.error?.message ?? 'Unavailable';

    return (
        <>
            <div role='alert' className='alert alert-danger'>
                <h1>Error</h1>
                <p>An unexpected error occured. Please try again later.</p>
            </div>
            <Link to='/'>Return home.</Link>
        </>
    );


}