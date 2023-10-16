export default function FormErrors({ errors }){
    if (!errors || !errors.length) return null;

    return (
        <div className='alert alert-danger'>
            <h3>Please note:</h3>
            <ul>
                {errors.map(error => (
                    <li key={error}>{error}</li>
                ))}
            </ul>
        </div>

    )

}