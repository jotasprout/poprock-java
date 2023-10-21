import { useEffect, useState } from "react";
import FormErrors from "../errors/FormErrors";
import { Link, useNavigate, useParams } from 'react-router-dom';

const INITIAL_ARTIST = {
	artistId: 0,
    firstName: "",
    middleName: "",
    lastName: "",
    dob: "",
    heightInInches: ""
};

// TODO Add Select Menu for Security Clearance

export default function ArtistForm() {

    const [artist, setArtist] = useState(INITIAL_ARTIST);
	const navigate = useNavigate(); 
	const { artistId } = useParams();
    const [errors, setErrors] = useState([]);

	useEffect(() => {
		if (artistId) {
			fetch(`http://localhost:8080/api/artist/${artistId}`)
				.then(res => res.json())
				.then(setArtist)
				.catch(console.error);
		}
	}, [artistId]);

    function handleChange(event) {
		const updatedArtist = { ...artist };
		if (event.target.type === 'checkbox') {

			updatedArtist[event.target.name] = event.target.checked;
		} else {
			updatedArtist[event.target.name] = event.target.value;
		}
		setArtist(updatedArtist);

		console.log(updatedArtist);
    }

    function handleSubmit(event) {
        event.preventDefault();

        if (artist.artistId > 0){
            updateArtist();
        } else {
            addArtist();
        }
    }

	function updateArtist() {
		fetch(`http://localhost:8080/api/artist/${artist.artistId}`, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(artist),
		})
			.then(res => {
				if (res.ok) {
					navigate(`/artists`);
				} else if (res.status === 400) {
					return res.json();
				} else if (res.status === 404) {
					navigate('/404');
				} else {
					// Any other status code is unexpected and thrown to .catch()
					return Promise.reject(
						new Error(`Unexpected status code: ${res.status}`)
					);
				}
			})
			.then(setErrors)
			.catch(console.error)
            .catch((error) => {
                console.error(error)
                navigate('/artists');
       });
	}    

    // TODO Copy lines 79-81 above to similar code in other components

    function addArtist() {
		fetch(`http://localhost:8080/api/artist`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
			},
			body: JSON.stringify(artist),
		})
			.then(res => {
				if (res.ok) {
					navigate(`/artists`);
				} else if (res.status === 400) {

					return res.json();
				} else {
					return Promise.reject(
						new Error(`Unexpected status code: ${res.status}`)
					);
				}
			})
			.then(setErrors)
			.catch(console.error); 
	}

    return (
        <>
            <h1>{artist.artistId > 0 ? 'Update' : 'Add'}</h1>

            <form onSubmit={handleSubmit}>
                <div className="row mb-3">
                    <div className="col">
                        <label className="form-label" htmlFor="firstName">First Name</label>
                        <input id="firstName" name="firstName" type="text" className="form-control" required
                            onChange={handleChange} value={artist.firstName} />
                    </div>
                    <div className="col">
                        <label className="form-label" htmlFor="middleName">Middle Name</label>
                        <input id="middleName" name="middleName" type="text" className="form-control"
                            onChange={handleChange} value={artist.middleName} />
                    </div>
                </div>
                <div className="mb-3">
                    <label className="form-label" htmlFor="lastName">Last Name</label>
                    <input id="lastName" name="lastName" type="text" className="form-control" required
                        onChange={handleChange} value={artist.lastName} />
                </div>
                <div className="row mb-3">
                    <div className="col">
                        <label className="form-label" htmlFor="dob">DOB</label>
                        <input id="dob" name="dob" type="date" className="form-control" required
                            onChange={handleChange} value={artist.dob ?? ''} />
                    </div>
                    <div className="col">
                        <label className="form-label" htmlFor="heightInInches">Height (inches)</label>
                        <input id="heightInInches" name="heightInInches" type="number" className="form-control"
                            required min="36" max="96"
                            onChange={handleChange} value={artist.heightInInches} />
                    </div>
                </div>
                <div className="mb-3">
                    <button type="submit" className="btn btn-primary me-2">Save</button>
                    <Link className='btn btn-secondary' to='/artists'>Cancel</Link>
                </div>
                <FormErrors errors={errors} />
            </form>
        </>
    );
}
