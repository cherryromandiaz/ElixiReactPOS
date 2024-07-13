// src/components/OrderManagement.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const OrderManagement: React.FC = () => {
  const [orders, setOrders] = useState<any[]>([]);

  useEffect(() => {
    const fetchOrders = async () => {
      try {
        const response = await api.get('/orders');
        setOrders(response.data.orders);
      } catch (error) {
        console.error('Failed to fetch orders', error);
      }
    };

    fetchOrders();
  }, []);

  return (
    <div>
      <h2>Order Management</h2>
      <ul>
        {orders.map((order) => (
          <li key={order.id}>
            {/* Display order details */}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default OrderManagement;
