
import React, { useEffect } from 'react';

function Home() {
    useEffect(() => {
        fetch("/vegetables", {
            method: "GET",
            headers: { 
                Accept: "application/json"
            }
        })
        .then(r => r.json())
        .then((response) => {
            console.log(response)
        })
    }, []);

    return(
        <div className="py-3">
            <h1>Farms</h1>
            <div className="container text-center">
                <div className="row">
                    <div className="col align-self-start">
                    Mapped response goes here
                    </div>
                    <div className="col align-self-center">
                    Farms
                    </div>
                </div>
            </div>
        </div>
    )
}


export default Home