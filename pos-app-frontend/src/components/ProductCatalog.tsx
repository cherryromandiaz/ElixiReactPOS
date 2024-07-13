// src/components/ProductCatalog.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  // Add more fields as needed
}

const ProductCatalog: React.FC = () => {
  const [products, setProducts] = useState<Product[]>([]);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await api.get('/products');
        setProducts(response.data.products);
      } catch (error) {
        console.error('Failed to fetch products', error);
      }
    };

    fetchProducts();
  }, []);

  return (
    <div>
      <h2>Product Catalog</h2>
      <ul>
        {products.map((product) => (
          <li key={product.id}>
            <div>Name: {product.name}</div>
            <div>Description: {product.description}</div>
            <div>Price: ${product.price.toFixed(2)}</div>
            {/* Add more details as needed */}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ProductCatalog;
