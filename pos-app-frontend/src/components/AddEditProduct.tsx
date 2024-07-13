// src/components/AddEditProduct.tsx
import React, { useState } from 'react';
import api from '../services/api';

const AddEditProduct: React.FC = () => {
  const [productId, setProductId] = useState('');
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [price, setPrice] = useState('');
  const [stock, setStock] = useState('');

  const handleAddProduct = async () => {
    try {
      await api.post('/products', {
        product: {
          name,
          description,
          price: parseFloat(price),
          stock: parseInt(stock, 10)
        }
      }, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      alert('Product added successfully');
    } catch (error) {
      console.error('Failed to add product', error);
    }
  };

  const handleEditProduct = async () => {
    try {
      await api.put(`/products/${productId}`, {
        product: {
          name,
          description,
          price: parseFloat(price),
          stock: parseInt(stock, 10)
        }
      }, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      alert('Product updated successfully');
    } catch (error) {
      console.error('Failed to update product', error);
    }
  };

  return (
    <div>
      <h2>Add/Edit Product</h2>
      <input
        type="text"
        value={productId}
        onChange={(e) => setProductId(e.target.value)}
        placeholder="Product ID (for edit)"
      />
      <input
        type="text"
        value={name}
        onChange={(e) => setName(e.target.value)}
        placeholder="Name"
      />
      <input
        type="text"
        value={description}
        onChange={(e) => setDescription(e.target.value)}
        placeholder="Description"
      />
      <input
        type="number"
        value={price}
        onChange={(e) => setPrice(e.target.value)}
        placeholder="Price"
      />
      <input
        type="number"
        value={stock}
        onChange={(e) => setStock(e.target.value)}
        placeholder="Stock"
      />
      <button onClick={handleAddProduct}>Add Product</button>
      <button onClick={handleEditProduct}>Edit Product</button>
    </div>
  );
};

export default AddEditProduct;