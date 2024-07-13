// src/components/SupportContactInfo.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

const SupportContactInfo: React.FC = () => {
  const [contactInfo, setContactInfo] = useState<any>({});

  useEffect(() => {
    const fetchContactInfo = async () => {
      try {
        const response = await api.get('/support/contact_info');
        setContactInfo(response.data.contact_info);
      } catch (error) {
        console.error('Failed to fetch support contact information', error);
      }
    };

    fetchContactInfo();
  }, []);

  return (
    <div>
      <h2>Support Contact Information</h2>
      <p>Phone Number: {contactInfo.phone_number}</p>
      <p>Email: <a href={`mailto:${contactInfo.email}`}>{contactInfo.email}</a></p>
      <p>Developer: {contactInfo.developer}</p>
    </div>
  );
};

export default SupportContactInfo;
