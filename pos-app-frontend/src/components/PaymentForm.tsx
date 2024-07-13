// src/components/PaymentForm.tsx
import React, { useState } from 'react';
import api from '../services/api';

const PaymentForm: React.FC = () => {
  const [amount, setAmount] = useState('');
  const [currency, setCurrency] = useState('USD');
  const [token, setToken] = useState('');

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();

    try {
      const response = await api.post('/payments', { amount, currency, token });
      console.log('Payment successful:', response.data.payment);
      // Handle success
    } catch (error) {
      console.error('Payment failed:', error.response.data.error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>Payment Form</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Amount:
          <input type="text" value={amount} onChange={(e) => setAmount(e.target.value)} />
        </label>
        <br />
        <label>
          Currency:
          <select value={currency} onChange={(e) => setCurrency(e.target.value)}>
            <option value="USD">USD</option>
            {/* Add more currencies as needed */}
          </select>
        </label>
        <br />
        <label>
          Card Token:
          <input type="text" value={token} onChange={(e) => setToken(e.target.value)} />
        </label>
        <br />
        <button type="submit">Pay Now</button>
      </form>
    </div>
  );
};

export default PaymentForm;
