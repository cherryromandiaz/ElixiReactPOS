// src/components/Notifications.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const Notifications: React.FC = () => {
  const [notifications, setNotifications] = useState<any[]>([]);

  useEffect(() => {
    const fetchNotifications = async () => {
      try {
        const response = await api.get('/notifications', {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`
          }
        });
        setNotifications(response.data.notifications);
      } catch (error) {
        console.error('Failed to fetch notifications', error);
      }
    };

    fetchNotifications();
  }, []);

  const markAsRead = async (id: number) => {
    try {
      await api.put(`/notifications/${id}/mark_as_read`, {}, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      setNotifications(notifications.filter(notification => notification.id !== id));
    } catch (error) {
      console.error('Failed to mark notification as read', error);
    }
  };

  return (
    <div>
      <h2>Notifications and Alerts</h2>
      <ul>
        {notifications.map((notification) => (
          <li key={notification.id}>
            {notification.message} - {notification.type}
            <button onClick={() => markAsRead(notification.id)}>Mark as Read</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default Notifications;
