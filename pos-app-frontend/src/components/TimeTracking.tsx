// src/components/TimeTracking.tsx
import React, { useEffect, useState } from 'react';
import api from '../services/api';

interface TimeEntry {
  id: number;
  employeeName: string;
  startTime: string;
  endTime: string;
}

const TimeTracking: React.FC = () => {
  const [timeEntries, setTimeEntries] = useState<TimeEntry[]>([]);

  useEffect(() => {
    fetchTimeEntries();
  }, []);

  const fetchTimeEntries = async () => {
    try {
      const response = await api.get('/time-entries');
      setTimeEntries(response.data.timeEntries);
    } catch (error) {
      console.error('Failed to fetch time entries', error);
      // Handle error
    }
  };

  return (
    <div>
      <h2>Time Tracking</h2>
      <ul>
        {timeEntries.map(entry => (
          <li key={entry.id}>
            <strong>{entry.employeeName}</strong> - {entry.startTime} to {entry.endTime}
          </li>
        ))}
      </ul>
    </div>
  );
};

export default TimeTracking;
