// src/components/HamburgerMenu.tsx
import React from 'react';
import { Link } from 'react-router-dom';

const HamburgerMenu: React.FC = () => {
  return (
    <div className="hamburger-menu">
      <h3>User Management</h3>
      <ul>
        <li><Link to="/user-profiles">User Profiles</Link></li>
        <li><Link to="/registration">Registration and Authentication</Link></li>
        <li><Link to="/profile-management">Profile Management</Link></li>
      </ul>
      <h3>Role Management</h3>
      <ul>
        <li><Link to="/role-definitions">Role Definitions</Link></li>
        <li><Link to="/permissions">Permissions</Link></li>
        <li><Link to="/role-assignment">Role Assignment</Link></li>
        <li><Link to="/rbac">Role-Based Access Control (RBAC)</Link></li>
      </ul>
      <h3>Sales Management</h3>
      <ul>
        <li><Link to="/point-of-sale">Point of Sale Interface</Link></li>
        <li><Link to="/order-management">Order Management</Link></li>
        <li><Link to="/returns-refunds">Returns and Refunds</Link></li>
      </ul>
      <h3>Inventory Management</h3>
      <ul>
        <li><Link to="/product-catalog">Product Catalog</Link></li>
        <li><Link to="/stock-control">Stock Control</Link></li>
        <li><Link to="/barcode-scanning">Barcode Scanning</Link></li>
      </ul>
      <h3>Customer Management</h3>
      <ul>
        <li><Link to="/customer-profiles">Customer Profiles</Link></li>
        <li><Link to="/loyalty-programs">Customer Loyalty Programs</Link></li>
      </ul>
      <h3>Employee Management</h3>
      <ul>
        <li><Link to="/user-roles-permissions">User Roles and Permissions</Link></li>
        <li><Link to="/time-tracking">Time Tracking</Link></li>
      </ul>
    </div>
  );
};

export default HamburgerMenu;
