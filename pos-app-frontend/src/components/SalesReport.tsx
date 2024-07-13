// src/components/SalesReport.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const SalesReport: React.FC = () => {
  const [report, setReport] = useState<any>({});

  useEffect(() => {
    const fetchSalesReport = async () => {
      try {
        const response = await api.get('/reports/sales', {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`
          }
        });
        setReport(response.data.report);
      } catch (error) {
        console.error('Failed to fetch sales report', error);
      }
    };

    fetchSalesReport();
  }, []);

  return (
    <div>
      <h2>Sales Report</h2>
      <p>Total Sales: {report.total_sales}</p>
      <p>Total Items Sold: {report.total_items_sold}</p>
    </div>
  );
};

export default SalesReport;