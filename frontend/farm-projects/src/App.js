import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import './App.css';
import Layout from './components/layout/Layout';
import Home from './components/Home';


function App() {
  return (
    <BrowserRouter>
      <Routes>
          <Route path="/" element={<Layout/>}>
            <Route index element={<Home/>}/>
            {/* <Route path='/about' element={<About/>}/> */}
            {/* <Route path='/forms' element={<Forms/>}/> */}
          </Route>
      </Routes>   
    </BrowserRouter>
  );
}

export default App;
