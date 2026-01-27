import './App.css';
import React, { Component } from 'react';
import axios from "axios";
import {BrowserRouter as Router, Routes, Route, Link} from "react-router-dom";
import Home from './components/Home';
import Registration from './components/Registration';
import Login from './components/Login';
import About from './components/About';
import Terms from './components/Terms';
import Contact from './components/Contact';
import Add from "./components/Add";


class App extends Component {
  
  constructor(props) {
    super(props);
    this.state = {
      facilities: [],
      failedLogin: JSON.parse(localStorage.getItem('failedLogin')) || false,
      success: JSON.parse(localStorage.getItem('success')) || false,
      name: JSON.parse(localStorage.getItem('name')) || ''
    };
  }

  logout = () => {
    this.setState({
      success: false,
      name: ''
    });
    localStorage.removeItem('success');
    localStorage.removeItem('name');
    localStorage.removeItem('failedLogin');
  };

  login = async (userName, password) => {
    try {
      
      const response = await axios.post('sign', { userName, password });

      if (response.data === 'Succ') {
        console.log('Login successful');
        this.setState({
          success: true,
          failedLogin: false
        });
        localStorage.setItem('success', JSON.stringify(true));
        localStorage.setItem('failedLogin', JSON.stringify(false));
      } else {
        console.log('Login failed');
        this.setState({
          success: false,
          failedLogin: true
        })
        localStorage.setItem('success', JSON.stringify(false));
        localStorage.setItem('failedLogin', JSON.stringify(true));
      }
    } catch (error) {
      console.log('Login failed:', error);
    }
  };


  componentDidMount(){
    axios.get('list')
    .then(res=>{   
     this.setState({
       facilities:res.data
     })
    })
    .catch(error=>{
      console.log(error);
    })
  }

  render(){
    return(
      <Router>
          <div>
          <nav class="navbar navbar-expand-lg navbar-light bg-light text-primary">
          <p class="navbar-brand ps-3 name text-primary">
              KYN
            </p>

              {this.state.success ? (
              <div class="navbar-nav">
                <Link class="nav-item nav-link" to="/">Home</Link>
                <Link class="nav-item nav-link" to="/AddFac">Add Facility</Link>
                <Link class="nav-item nav-link" to="/About">About Us</Link>
                <Link class="nav-item nav-link" to="/Contact">Contact Us</Link>
                <Link class="nav-item nav-link" to="/Terms">Terms and Conditions</Link>
                <Link class="nav-item nav-link" to="/Login"><button class="btn btn-danger d-flex justify-content-end" onClick={this.logout}>Logout</button></Link>
                 
                  </div>
              ) : (
                <div class="navbar-nav">
                <Link class="nav-item nav-link" to="/">Home</Link>
                <Link class="nav-item nav-link" to="/Login">Login</Link>
                <Link class="nav-item nav-link" to="/Register">Register</Link>
                <Link class="nav-item nav-link" to="/About">About Us</Link>
                <Link class="nav-item nav-link" to="/Contact">Contact Us</Link>
                <Link class="nav-item nav-link" to="/Terms">Terms and Conditions</Link>
                </div>
              )}


               
  
            </nav> 
        </div>
          <Routes>
          <Route path="/" element={<Home success={this.state.success} alldata={this.state.facilities} />} />
          <Route path="/Login" element={<Login success={this.state.success} login={this.login} logout={this.logout} />} />
          <Route path="/Register" element={<Registration />} />
          <Route path="/About" element={<About />} />
          <Route path="/Contact" element={<Contact/>} />
          <Route path="/Terms" element={<Terms />} />
          <Route path="/AddFac" element={<Add />} />
          </Routes>
        </Router>
    );
  }
}

export default App;
