import React, { Component } from 'react';
import axios from 'axios';

class Registration extends Component{
    constructor() {
        super();
        this.state = {
            "name": '',
            "userName": '',
            "email": '',
            "password": ''
        }

    }

    addName = (event) => {
        
        this.setState({
            name:event.target.value
        })
    }

    addUName = (event) => {
        
        this.setState({
            userName:event.target.value
        })
    }
        
    addEmail = (event) => {
        
        this.setState({
            email:event.target.value
        })
    }
        
    addPass = (event) => {
            
        this.setState({
            password:event.target.value
        })
    }

    register = (event) => {
        
        alert(this.state.name + ", " + this.state.userName + ", " + this.state.email + ", " + this.state.password );
        axios.post('register',this.state)
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
            <h2 class="text-center">Register</h2>
            <form class="text-center " onSubmit={this.register}>
                <label for="name" class="form-label">Name:</label><br />
                <input type="text" name="name" class="form-control" value={this.state.name} onChange={this.addName}/><br />
                <label for="uname" class="form-label">User Name:</label><br />
                <input type="text" name="uname" class="form-control" value={this.state.userName} onChange={this.addUName}/><br />
                <label for="email" class="form-label">Email:</label><br />
                <input type="text" name="email" class="form-control" value={this.state.email} onChange={this.addEmail}/><br />
                <label for="password" class="form-label">Password:</label><br />
                <input type="text" name="password" class="form-control" value={this.state.password} onChange={this.addPass}/><br />
               
                <button type="submit" class="btn btn-primary d-flex mx-auto">Upload</button>
            </form>


        </div>   
        )
    }

}

export default Registration