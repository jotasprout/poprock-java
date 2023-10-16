import { Link, useLocation } from 'react-router-dom';

export default function Error() {
    const location = useLocation();
    const errorDetail = location.state?.error?.message ?? 'Unavailable';
    return (
        <>
            <div role='alert' className='alert alert-danger'>
                <h1>Error</h1>
                <p>An unexpected error occurred. Please try again later.</p>
                <small>Details: {errorDetail}</small>
            </div>
            <Link to='/'>Return home.</Link>
        </>
    );
}