// src/components/ReturnsRefunds.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const ReturnsRefunds: React.FC = () => {
  const [returns, setReturns] = useState<any[]>([]);

  useEffect(() => {
    const fetchReturns = async () => {
      try {
        const response = await api.get('/returns');
        setReturns(response.data.returns);
      } catch (error) {
        console.error('Failed to fetch returns', error);
      }
    };

    fetchReturns();
  }, []);

  // Placeholder function to handle refund processing
  const processRefund = async (returnId: number) => {
    try {
      // Implement refund processing logic
      await api.put(`/returns/${returnId}/process`);
      // Optionally, update state or show success message
    } catch (error) {
      console.error('Failed to process refund', error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>Returns and Refunds</h2>
      <ul>
        {returns.map((returnItem) => (
          <li key={returnItem.id}>
            <div>Date: {returnItem.date}</div>
            <div>Customer: {returnItem.customerName}</div>
            <div>Products:
              <ul>
                {returnItem.products.map((product: any) => (
                  <li key={product.id}>
                    {product.name} - Quantity: {product.quantity}
                  </li>
                ))}
              </ul>
            </div>
            <div>Reason: {returnItem.reason}</div>
            <div>Status: {returnItem.status}</div>
            <button onClick={() => processRefund(returnItem.id)}>Process Refund</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ReturnsRefunds;
