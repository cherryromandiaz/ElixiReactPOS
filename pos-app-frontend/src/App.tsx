import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

import HomePage from './pages/HomePage';
import Login from './pages/Login';
import Dashboard from './pages/Dashboard';
import ReturnsRefunds from './pages/ReturnsRefunds';
import PointOfSale from './pages/PointOfSale';
import OrderManagement from './pages/OrderManagement';
import UserProfiles from './pages/UserProfiles';
import Registration from './pages/Registration';
import ProfileManagement from './pages/ProfileManagement';
import RoleDefinitions from './pages/RoleDefinitions';
import Permissions from './pages/Permissions';
import RoleAssignment from './pages/RoleAssignment';
import RBAC from './pages/RBAC';
import ProductCatalog from './pages/ProductCatalog';
import StockControl from './pages/StockControl';
import BarcodeScanning from './pages/BarcodeScanning';
import CustomerProfiles from './pages/CustomerProfiles';
import CustomerLoyaltyPrograms from './pages/CustomerLoyaltyPrograms';
import UserRolesPermissions from './pages/UserRolesPermissions';
import TimeTracking from './pages/TimeTracking';

const App: React.FC = () => {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li><Link to="/">Home</Link></li>
            <li><Link to="/login">Login</Link></li>
            <li><Link to="/dashboard">Dashboard</Link></li>
            <li><Link to="/point-of-sale">Point of Sale</Link></li>
            <li><Link to="/order-management">Order Management</Link></li>
            <li><Link to="/returns-refunds">Returns and Refunds</Link></li>
            <li><Link to="/user-profiles">User Profiles</Link></li>
            <li><Link to="/registration">Registration and Authentication</Link></li>
            <li><Link to="/profile-management">Profile Management</Link></li>
            <li><Link to="/role-definitions">Role Definitions</Link></li>
            <li><Link to="/permissions">Permissions</Link></li>
            <li><Link to="/role-assignment">Role Assignment</Link></li>
            <li><Link to="/rbac">Role-Based Access Control (RBAC)</Link></li>
            <li><Link to="/product-catalog">Product Catalog</Link></li>
            <li><Link to="/stock-control">Stock Control</Link></li>
            <li><Link to="/barcode-scanning">Barcode Scanning</Link></li>
            <li><Link to="/customer-profiles">Customer Profiles</Link></li>
            <li><Link to="/customer-loyalty-programs">Customer Loyalty Programs</Link></li>
            <li><Link to="/user-roles-permissions">User Roles and Permissions</Link></li>
            <li><Link to="/time-tracking">Time Tracking</Link></li>
          </ul>
        </nav>

        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/login" element={<Login />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/point-of-sale" element={<PointOfSale />} />
          <Route path="/order-management" element={<OrderManagement />} />
          <Route path="/returns-refunds" element={<ReturnsRefunds />} />
          <Route path="/user-profiles" element={<UserProfiles />} />
          <Route path="/registration" element={<Registration />} />
          <Route path="/profile-management" element={<ProfileManagement />} />
          <Route path="/role-definitions" element={<RoleDefinitions />} />
          <Route path="/permissions" element={<Permissions />} />
          <Route path="/role-assignment" element={<RoleAssignment />} />
          <Route path="/rbac" element={<RBAC />} />
          <Route path="/product-catalog" element={<ProductCatalog />} />
          <Route path="/stock-control" element={<StockControl />} />
          <Route path="/barcode-scanning" element={<BarcodeScanning />} />
          <Route path="/customer-profiles" element={<CustomerProfiles />} />
          <Route path="/customer-loyalty-programs" element={<CustomerLoyaltyPrograms />} />
          <Route path="/user-roles-permissions" element={<UserRolesPermissions />} />
          <Route path="/time-tracking" element={<TimeTracking />} />
        </Routes>
      </div>
    </Router>
  );
};

export default App;
