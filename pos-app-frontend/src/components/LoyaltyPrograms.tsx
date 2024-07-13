// src/components/LoyaltyPrograms.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

interface LoyaltyProgram {
  id: number;
  name: string;
  description: string;
  discountPercentage: number;
}

const LoyaltyPrograms: React.FC = () => {
  const [loyaltyPrograms, setLoyaltyPrograms] = useState<LoyaltyProgram[]>([]);

  useEffect(() => {
    fetchLoyaltyPrograms();
  }, []);

  const fetchLoyaltyPrograms = async () => {
    try {
      const response = await api.get('/loyalty-programs');
      setLoyaltyPrograms(response.data.loyaltyPrograms);
    } catch (error) {
      console.error('Failed to fetch loyalty programs', error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>Customer Loyalty Programs</h2>
      <ul>
        {loyaltyPrograms.map(program => (
          <li key={program.id}>
            <strong>{program.name}</strong> - {program.description} - {program.discountPercentage}%
          </li>
        ))}
      </ul>
    </div>
  );
};

export default LoyaltyPrograms;
