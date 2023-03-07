
import React, { useEffect ,useState } from 'react';
import Vegetable from './Vegetable'

function Home() {

    const [vegetables, setVegetable] = useState();
    const [loading, setLoading] = useState(true);
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
            setVegetable(response)
        })
    }, []);

    return(
        <div className="py-3">
            <h1>Vegetables {vegetables && vegetables.length} </h1>
            <div className="container text-center">
                <div className="row">
                    <div className="col-sm-8">
                    {
                        vegetables && vegetables.map((vegetable)=>(
                         <Vegetable vegetable={vegetable} key={vegetable.id} />
                        ))
                    }
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