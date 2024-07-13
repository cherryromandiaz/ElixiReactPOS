// src/components/RoleDefinitions.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const RoleDefinitions: React.FC = () => {
  const [roles, setRoles] = useState<any[]>([]);

  useEffect(() => {
    const fetchRoles = async () => {
      try {
        const response = await api.get('/roles');
        setRoles(response.data.roles);
      } catch (error) {
        console.error('Failed to fetch roles', error);
      }
    };

    fetchRoles();
  }, []);

  return (
    <div>
      <h2>Role Definitions</h2>
      <ul>
        {roles.map((role) => (
          <li key={role.id}>{role.name}</li>
        ))}
      </ul>
    </div>
  );
};

export default RoleDefinitions;
