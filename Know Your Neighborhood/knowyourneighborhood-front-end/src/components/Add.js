import React, { Component } from 'react';
import axios from 'axios';

class Add extends Component{
    constructor() {
        super();
        this.state = {
            "name": '',
            "address": '',
            "phone": ''
        }

    }

    

    addName = (event) => {
        
        this.setState({
            name:event.target.value
        })
    }

    addAddress = (event) => {
        
        this.setState({
            address:event.target.value
        })
    }
        
    addPhone = (event) => {
        
        this.setState({
            phone:event.target.value
        })
    }
        

    add = (event) => {
        alert(this.state.name + ", " + this.state.address + ", " + this.state.phone);
        axios.post('save',this.state)
        .then(res=>{
            console.log(res.data);
        })
        .catch(error=>{
            console.log(error);
        })
        
    } 

    render() {

        return (
            <div class="container text-start justify-content-center text-primary mt-5 py-2 rounded-4">
            <h2 class="text-center">Add Neighborhood Facility</h2>
            <form class="text-center " onSubmit={this.add}>
                <label for="name" class="form-label">Name:</label><br />
                <input type="text" name="name" class="form-control" value={this.state.name} onChange={this.addName}/><br />
                <label for="address" class="form-label">Address:</label><br />
                <input type="text" name="address" class="form-control" value={this.state.address} onChange={this.addAddress}/><br />
                <label for="phone" class="form-label">Phone:</label><br />
                <input type="text" name="phone" class="form-control" value={this.state.phone} onChange={this.addPhone}/><br />
               
                <button type="submit" class="btn btn-primary d-flex mx-auto">Upload</button>
            </form>
        </div>   
        )
    }

}

export default Add