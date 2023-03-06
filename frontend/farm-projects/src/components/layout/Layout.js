import React from 'react'
import { Outlet } from 'react-router-dom'
import Navbar from './Navbar'
import Footer from './Footer'

function Layout() {
    return(
        <div>
            <Navbar/> 
                <div className="container min-vh-100">
                    <Outlet/>
                
                </div>
            <Footer/>
        </div>
    )
}

export default Layout