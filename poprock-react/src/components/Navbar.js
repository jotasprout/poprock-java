import { NavLink } from "react-router-dom";

export default function Navbar() {
    return (
        <nav className="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
            <div className="container-fluid"> 

				<NavLink className='navbar-brand' to='/'>
					PopRock
				</NavLink>

                <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                </button>

                <div className="collapse navbar-collapse" id="navbarColor02">

                    <ul className='navbar-nav me-auto'>
                        <li className='nav-item'>
                            <NavLink className='nav-link' to='/artists'>
                                Artists
                            </NavLink>
                        </li>
                        <li className='nav-item'>
                            <NavLink className='nav-link' to='/albums'>
                                Albums
                            </NavLink>
                        </li>
                        <li className='nav-item'>
                            <NavLink className='nav-link' to='/artistcolumns'>
                                Artist Columns
                            </NavLink>
                        </li>
                        <li className='nav-item'>
                            <NavLink className='nav-link' to='/scatter'>
                                Scatter
                            </NavLink>
                        </li>
                        <li className='nav-item'>
                            <NavLink className='nav-link' to='/force'>
                                Force
                            </NavLink>
                        </li>
                        {/* <li className='nav-item'>
                            <NavLink className='nav-link' to='/tracks'>
                                Logout
                            </NavLink>
                        </li> */}

                        {/* <li className="nav-item dropdown">
                            <a className="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Other</a>
                            <div className="dropdown-menu">
                                <a className="dropdown-item" href="#">thing 1</a>
                                <a className="dropdown-item" href="#">thing 2</a>
                                <a className="dropdown-item" href="#">thing 3</a>
                                <div className="dropdown-divider"></div>
                                <a className="dropdown-item" href="#">Separated link</a>
                            </div>
                        </li> */}
                    </ul>

                    <form className="d-flex">
                        <input className="form-control me-sm-2" type="search" placeholder="Search" />
                        <button className="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                    </form>

                </div>

			</div>
        </nav>
    )
};