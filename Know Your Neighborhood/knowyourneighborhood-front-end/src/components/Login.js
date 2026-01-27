import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import $ from 'jquery';

const Login = ({ login, logout }) => {
  const [userName, setUname] = useState('');
  const [password, setPass] = useState('');

  const [failedLogin, setFail] = useState(
    JSON.parse(localStorage.getItem('failedLogin')) || false
  );
  const navigate = useNavigate();
  const [userDetails, setUserDetails] = useState({});

  const [success, setSuccess] = useState(
    JSON.parse(localStorage.getItem('success')) || false
  );

  const [name, setName] = useState(
    JSON.parse(localStorage.getItem('name')) || 'User'
  );

  const handleSubmit = async (event) => {
    event.preventDefault();
    const userName = event.target.userName.value;
    const password = event.target.password.value;
    await login(userName, password);
    window.location.reload();
  };

  useEffect(() => {
    localStorage.setItem('success', JSON.stringify(success));
    localStorage.setItem('failedLogin', JSON.stringify(failedLogin))
    localStorage.setItem('name', JSON.stringify(userName||name));
  }, [success, failedLogin, userName||name]);


  const facebookLogin = () => {
    window.location.href = "http://localhost:9087/login";
    setSuccess(true);
    setFail(false);
    setName(userDetails.name);
  }

  const home = () => {
    navigate('/');
  }

  useEffect(() => {
    $.get('/user', function (data) {
      console.log('Data: ');
      console.log(data);
      $('#user').html(data.userAuthentication.details.name);
      console.log('After name id: ' + data.userAuthentication.details.id);
      console.log('After name name: ' + data.userAuthentication.details.name);
      $('.unauthenticated').hide();
      $('.authenticated').show();
      setUserDetails(data.userAuthentication.details);
      
    });
  }, []);

  return (
        <div class="container text-center text-primary mt-5 py-2 rounded-4">
          
          {success ? (
          <div>
          <h1>Login Success!</h1>
          <p>Welcome {name}!</p>
          <button class="btn btn-primary mx-auto" onClick={home}>Go Home</button>
          </div>
          ) : (
            <div>
            <h2 class="text-center">Login</h2>
          <form onSubmit={handleSubmit}>
            
            <label for="uname" className="form-label">User Name:</label><br />
            <input type="text" name="userName" class="form-control w-50 mx-auto" value={userName} onChange={(e) => setUname(e.target.value)} /><br />
          
            <label for="password" class="form-label">Password:</label><br />
            <input type="password" name="password" class="form-control w-50 mx-auto" value={password} onChange={(e) => setPass(e.target.value)} /><br />
            <button type="submit" class="btn btn-primary d-flex mx-auto">Login</button>
          </form>

          {failedLogin && (
               <p class="text-danger text-center">Incorrect Credentials</p>
            )}  
            
            {success && (
               <p class="text-danger text-center">Incorrect Credentials</p>
          )}  

          <div class="container justify-content-center mt-5">
            <p class="text-center">Log in with:</p>
            <button type="submit" class="btn btn-primary d-flex mx-auto my-3 fs-4" onClick={facebookLogin}><i class="bi bi-facebook"></i>&#160; Facebook</button>
            </div>
            </div>
            )}
        </div>
    )
};

export default Login