// src/components/Settings.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const Settings: React.FC = () => {
  const [settings, setSettings] = useState<any>({});
  const userId = 1; // Example user ID, this should be dynamically set

  useEffect(() => {
    const fetchSettings = async () => {
      try {
        const response = await api.get(`/users/${userId}`, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('token')}`
          }
        });
        setSettings(response.data.user);
      } catch (error) {
        console.error('Failed to fetch settings', error);
      }
    };

    fetchSettings();
  }, [userId]);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLSelectElement>) => {
    const { name, value } = e.target;
    setSettings((prevSettings: any) => ({
      ...prevSettings,
      [name]: value
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await api.put(`/users/${userId}`, { user: settings }, {
        headers: {
          Authorization: `Bearer ${localStorage.getItem('token')}`
        }
      });
      alert('Settings updated successfully');
    } catch (error) {
      console.error('Failed to update settings', error);
    }
  };

  return (
    <div>
      <h2>Settings</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Language:
          <select
            name="language"
            value={settings.language || ''}
            onChange={handleChange}
          >
            <option value="en">English</option>
            <option value="fr">French</option>
            <option value="es">Spanish</option>
          </select>
        </label>
        <label>
          Theme:
          <select
            name="theme"
            value={settings.theme || ''}
            onChange={handleChange}
          >
            <option value="light">Light</option>
            <option value="dark">Dark</option>
          </select>
        </label>
        <label>
          Notification Preferences:
          <select
            name="notification_preferences"
            value={settings.notification_preferences || ''}
            onChange={handleChange}
          >
            <option value="all">All</option>
            <option value="important">Important</option>
            <option value="none">None</option>
          </select>
        </label>
        <button type="submit">Save</button>
      </form>
    </div>
  );
};

export default Settings;