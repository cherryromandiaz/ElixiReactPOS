// src/components/FinancialReport.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const FinancialReport: React.FC = () => {
  const [report, setReport] = useState<any>({});

  useEffect(() => {
    const fetchFinancialReport = async () => {
      try {
        const response = await api.get('/reports/financial', {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`
          }
        });
        setReport(response.data.report);
      } catch (error) {
        console.error('Failed to fetch financial report', error);
      }
    };

    fetchFinancialReport();
  }, []);

  return (
    <div>
      <h2>Financial Report</h2>
      <p>Total Revenue: {report.total_revenue}</p>
      <p>Total Cost: {report.total_cost}</p>
      <p>Profit: {report.profit}</p>
    </div>
  );
};

export default FinancialReport;