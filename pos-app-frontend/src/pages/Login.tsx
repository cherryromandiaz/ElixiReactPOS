// src/pages/Login.tsx

import React, { useState } from 'react';
import { useHistory } from 'react-router-dom';
import axios from 'axios';

const Login: React.FC = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const history = useHistory();

  const handleLogin = async () => {
    try {
      const response = await axios.post('/api/login', { email, password });
      const token = response.data.token; // Assuming your backend returns a token
      localStorage.setItem('token', token); // Store token in local storage
      history.push('/dashboard'); // Redirect to dashboard on successful login
    } catch (error) {
      console.error('Login failed', error);
      // Handle login error (show error message, etc.)
    }
  };

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={(e) => { e.preventDefault(); handleLogin(); }}>
        <div>
          <label>Email</label>
          <input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
        </div>
        <div>
          <label>Password</label>
          <input type="password" value={password} onChange={(e) => setPassword(e.target.value)} required />
        </div>
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;
