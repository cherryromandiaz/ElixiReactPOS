// src/components/CustomerProfiles.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

interface Customer {
  id: number;
  name: string;
  email: string;
  phone: string;
}

const CustomerProfiles: React.FC = () => {
  const [customers, setCustomers] = useState<Customer[]>([]);

  useEffect(() => {
    fetchCustomers();
  }, []);

  const fetchCustomers = async () => {
    try {
      const response = await api.get('/customers');
      setCustomers(response.data.customers);
    } catch (error) {
      console.error('Failed to fetch customers', error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>Customer Profiles</h2>
      <ul>
        {customers.map(customer => (
          <li key={customer.id}>
            <strong>{customer.name}</strong> - {customer.email} - {customer.phone}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default CustomerProfiles;
