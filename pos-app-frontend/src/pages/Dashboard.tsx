// src/pages/Dashboard.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';
import NewSale from '../components/NewSale';
import AddEditProduct from '../components/AddEditProduct';
import CustomerManagement from '../components/CustomerManagement';
import SalesReport from '../components/SalesReport';
import InventoryReport from '../components/InventoryReport';
import FinancialReport from '../components/FinancialReport';
import Notifications from '../components/Notifications';
import UserProfile from '../components/UserProfile';
import Settings from '../components/Settings';
import SupportContactInfo from '../components/SupportContactInfo';
import HamburgerMenu from '../components/HamburgerMenu';

const Dashboard: React.FC = () => {
  const [salesSummary, setSalesSummary] = useState<any>({});
  const [orderStatus, setOrderStatus] = useState<any[]>([]);
  const [inventoryStatus, setInventoryStatus] = useState<any[]>([]);

  useEffect(() => {
    const fetchDashboardData = async () => {
      try {
        const response = await api.get('/dashboard/overview', {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`
          }
        });
        setSalesSummary(response.data.sales_summary);
        setOrderStatus(response.data.order_status);
        setInventoryStatus(response.data.inventory_status);
      } catch (error) {
        console.error('Failed to fetch dashboard data', error);
      }
    };

    fetchDashboardData();
  }, []);

  return (
    <div>
      <h1>Dashboard Overview</h1>
      <div>
        <h2>Sales Summary</h2>
        <p>Total Sales: {salesSummary.total_sales}</p>
        <p>Total Items Sold: {salesSummary.total_items_sold}</p>
      </div>
      <div>
        <h2>Order Status</h2>
        <ul>
          {orderStatus.map((status) => (
            <li key={status.status}>
              {status.status}: {status.count}
            </li>
          ))}
        </ul>
      </div>
      <div>
        <h2>Inventory Status</h2>
        <ul>
          {inventoryStatus.map((product) => (
            <li key={product.product}>
              {product.product}: {product.stock}
            </li>
          ))}
        </ul>
      </div>
      <div>
        <h2>Quick Actions</h2>
        <NewSale />
        <AddEditProduct />
        <CustomerManagement />
      </div>
      <div>
        <h2>Reports and Analytics</h2>
        <SalesReport />
        <InventoryReport />
        <FinancialReport />
      </div>
      <div>
       <UserProfile />
       <Settings />
     </div>
      <div>
        <h2>Notifications and Alerts</h2>
        <Notifications />
      </div>
      <div>
        <SupportContactInfo />
      </div>
       <div className="hamburger-menu-container">
        <HamburgerMenu />
      </div>
    </div>
  );
};

export default Dashboard;
