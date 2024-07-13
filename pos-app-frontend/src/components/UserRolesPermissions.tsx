// src/components/UserRolesPermissions.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

interface Role {
  id: number;
  name: string;
  description: string;
}

const UserRolesPermissions: React.FC = () => {
  const [roles, setRoles] = useState<Role[]>([]);

  useEffect(() => {
    fetchRoles();
  }, []);

  const fetchRoles = async () => {
    try {
      const response = await api.get('/roles');
      setRoles(response.data.roles);
    } catch (error) {
      console.error('Failed to fetch roles', error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>User Roles and Permissions</h2>
      <ul>
        {roles.map(role => (
          <li key={role.id}>
            <strong>{role.name}</strong> - {role.description}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default UserRolesPermissions;
