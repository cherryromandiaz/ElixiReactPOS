// src/components/StockControl.tsx
import React, { useState } from 'react';
import api from '../services/api';

const StockControl: React.FC = () => {
  const [productId, setProductId] = useState('');
  const [quantity, setQuantity] = useState('');

  const handleStockUpdate = async () => {
    try {
      await api.put(`/products/${productId}/stock`, { quantity });
      // Optionally handle success or update state
    } catch (error) {
      console.error('Failed to update stock', error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>Stock Control</h2>
      <form onSubmit={handleStockUpdate}>
        <label>
          Product ID:
          <input type="text" value={productId} onChange={(e) => setProductId(e.target.value)} />
        </label>
        <label>
          Quantity:
          <input type="number" value={quantity} onChange={(e) => setQuantity(e.target.value)} />
        </label>
        <button type="submit">Update Stock</button>
      </form>
    </div>
  );
};

export default StockControl;
