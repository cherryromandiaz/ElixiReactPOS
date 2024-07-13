// src/components/CustomerManagement.tsx
import React, { useState } from 'react';
import api from '../services/api';

const CustomerManagement: React.FC = () => {
  const [customerId, setCustomerId] = useState('');
  const [name, setName] = useState('');
  const [email, setEmail] = useState('');

  const handleAddCustomer = async () => {
    try {
      await api.post('/customers', {
        customer: { name, email }
      }, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      alert('Customer added successfully');
    } catch (error) {
      console.error('Failed to add customer', error);
    }
  };

  const handleEditCustomer = async () => {
    try {
      await api.put(`/customers/${customerId}`, {
        customer: { name, email }
      }, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      alert('Customer updated successfully');
    } catch (error) {
      console.error('Failed to update customer', error);
    }
  };

  return (
    <div>
      <h2>Customer Management</h2>
      <input
        type="text"
        value={customerId}
        onChange={(e) => setCustomerId(e.target.value)}
        placeholder="Customer ID (for edit)"
      />
      <input
        type="text"
        value={name}
        onChange={(e) => setName(e.target.value)}
        placeholder="Name"
      />
      <input
        type="email"
        value={email}
        onChange={(e) => setEmail(e.target.value)}
        placeholder="Email"
      />
      <button onClick={handleAddCustomer}>Add Customer</button>
      <button onClick={handleEditCustomer}>Edit Customer</button>
    </div>
  );
};

export default CustomerManagement;