import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import Header from "./components/Header";
import Landing from "./components/Landing";

import TrackList from "./components/track/TrackList";
import ArtistList from "./components/artist/ArtistList";
import AlbumList from "./components/album/AlbumList";

// import TrackDelete from "./components/track/TrackDelete";
// import ArtistDelete from "./components/artist/ArtistDelete";
// import AlbumDelete from "./components/album/AlbumDelete";

import TrackForm from "./components/track/TrackForm";
import ArtistForm from "./components/artist/ArtistForm";
import AlbumForm from "./components/album/AlbumForm";

import ArtistProfile from "./components/artist/ArtistProfile";
import AlbumProfile from "./components/album/AlbumProfile";

import NotFound from "./components/NotFound";
import Error from './components/errors/Error';

import './App.css';

export default function App() {
  return (
    <Router>
        <Header />
        <Routes>
            <Route path='/' element={<Landing />} />

            <Route path='/albums' element={<AlbumList />} />
            <Route path='/artists' element={<ArtistList />} />
            <Route path='/tracks' element={<TrackList />} />

            {/* <Route path='/artists/delete/:artistId' element={<ArtistDelete />} /> 
            <Route path='/tracks/delete/:trackId' element={<TrackDelete />} />
            <Route path='/albums/delete/:albumId' element={<AlbumDelete />} /> */}

            <Route path='/tracks/edit/:trackId' element={<TrackForm />} />
            <Route path='/artists/edit/:artistId' element={<ArtistForm />} />
            <Route path='/albums/edit/:albumId' element={<AlbumForm />} />

            <Route path='/tracks/add' element={<TrackForm />} />
            <Route path='/artists/add' element={<ArtistForm />} />
            <Route path='/albums/add' element={<AlbumForm />} />

            <Route path='/artists/profile/:artistId' element={<ArtistProfile />} />
            <Route path='/albums/profile/:albumId' element={<AlbumProfile />} />

            <Route path='*' element={<NotFound />} />

            <Route path='/error' element={<Error />} />

        </Routes>
    </Router>
  );
}
