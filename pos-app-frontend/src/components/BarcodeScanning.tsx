// src/components/BarcodeScanning.tsx
import React, { useState } from 'react';
import QrReader from 'react-qr-reader';

const BarcodeScanning: React.FC = () => {
  const [scanResult, setScanResult] = useState('');

  const handleScan = (data: string | null) => {
    if (data) {
      setScanResult(data);
    }
  };

  const handleError = (error: any) => {
    console.error('QR Code scanning error:', error);
  };

  return (
    <div>
      <h2>Barcode Scanning</h2>
      <QrReader
        delay={300}
        onError={handleError}
        onScan={handleScan}
        style={{ width: '100%' }}
      />
      <p>Scan result: {scanResult}</p>
    </div>
  );
};

export default BarcodeScanning;
