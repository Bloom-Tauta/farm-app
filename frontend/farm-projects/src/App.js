import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import './App.css';
import Navbar from './components/layout/Navbar';
import Footer from './components/layout/Footer';
import Layout from './components/layout/Layout';
import Home from '.components/Home';


function App() {
  return (
    <div>
      
      {/* <Navbar/> */}
      {/* <Footer/> */}
      <Layout/>
      <Home/>
    </div>
    // <BrowserRouter>
    //   <Routes>
    //       <Route exact path="/" element={Home}/>
    //       <Route path="/navbar" element={Navbar}/>
    //       <Route path="/"/>
    //       <Route path="/"/>
    //   </Routes>   
    // </BrowserRouter>
    
  );
}

export default App;
