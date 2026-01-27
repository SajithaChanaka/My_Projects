import React, { Component } from 'react';

class Home extends Component{
    
    
    render() {
        const facs = this.props.alldata;
        const logged = this.props.success;
        const fheader = <tr><th>Store Name</th> <th>Address</th> <th>Phone Number</th></tr>;
        const fdata = facs.map((fac, key) => <tr><td>{fac.name}</td><td>{fac.address}</td><td>{fac.phone}</td></tr>);
        const logName = JSON.parse(localStorage.getItem('name'));

        return (



            <div class="jumbotron text-center text-primary">
                <h1 class="display-4">Know Thy Neighborhood</h1>
                <p class="lead">Add store around thy neighborhood to share to others</p>
                {logged && (
               <p>Welcome {logName}!</p>
          )}  
                
                <table class="container table table-striped pt-5">
                  <thead class="bg-primary"> {fheader} </thead>
                   <tbody> {fdata}</tbody> 
                </table>
                
            </div>
        )
    }

}

export default Home