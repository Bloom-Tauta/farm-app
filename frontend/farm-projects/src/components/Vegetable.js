import React from 'react'

function Vegetable({vegetable}) {
    return (
        <div>
            <div className="card mb-3">
            <img src={vegetable.img_url} className="card-img-top" alt="..."/>
                <div className="card-body">
                    <h5 className="card-title fw-bold">{vegetable.name}</h5>
                    <p className="card-text">{vegetable.description}</p>
                    <p className="card-text">{vegetable.review}</p>
                    <p className="card-text">Farm_id {vegetable.farm_id}</p>
                    <a href="#" className="btn btn-primary">Go somewhere</a>
                </div>
            </div>

            {/* <div className="card mb-3">
            <img src={vegetable.img_url} className="card-img-top" alt="..."/>
                <div className="card-body">
                    <h5 className="card-title fw-bold">{farm.name}</h5>
                    <p className="card-text">{farm.location}</p>
                    <p className="card-text">{farm.farmer_id.name}</p>
                    <p className="card-text">Farm_id {vegetable.farm_id}</p>
                    <a href="#" className="btn btn-primary">Go somewhere</a>
                </div>
            </div> */}

        </div>
    )
}

export default Vegetable