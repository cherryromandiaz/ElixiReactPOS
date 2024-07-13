// src/components/NewSale.tsx
import React, { useState } from 'react';
import api from '../services/api';

const NewSale: React.FC = () => {
  const [productId, setProductId] = useState('');
  const [quantity, setQuantity] = useState('');
  const [totalPrice, setTotalPrice] = useState('');

  const handleNewSale = async () => {
    try {
      await api.post('/sales', {
        sale: {
          product_id: productId,
          quantity: parseInt(quantity, 10),
          total_price: parseFloat(totalPrice)
        }
      }, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      alert('Sale created successfully');
    } catch (error) {
      console.error('Failed to create sale', error);
    }
  };

  return (
    <div>
      <h2>New Sale</h2>
      <input
        type="text"
        value={productId}
        onChange={(e) => setProductId(e.target.value)}
        placeholder="Product ID"
      />
      <input
        type="number"
        value={quantity}
        onChange={(e) => setQuantity(e.target.value)}
        placeholder="Quantity"
      />
      <input
        type="number"
        value={totalPrice}
        onChange={(e) => setTotalPrice(e.target.value)}
        placeholder="Total Price"
      />
      <button onClick={handleNewSale}>Create Sale</button>
    </div>
  );
};

export default NewSale;