// src/components/InventoryReport.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const InventoryReport: React.FC = () => {
  const [report, setReport] = useState<any[]>([]);

  useEffect(() => {
    const fetchInventoryReport = async () => {
      try {
        const response = await api.get('/reports/inventory', {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`
          }
        });
        setReport(response.data.report);
      } catch (error) {
        console.error('Failed to fetch inventory report', error);
      }
    };

    fetchInventoryReport();
  }, []);

  return (
    <div>
      <h2>Inventory Report</h2>
      <ul>
        {report.map((product, index) => (
          <li key={index}>
            {product.product}: {product.stock}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default InventoryReport;