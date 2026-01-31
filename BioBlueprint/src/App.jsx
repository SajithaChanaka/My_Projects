import React, { useState, useEffect } from 'react';
import { Shield, ShieldOff, Trash2 } from 'lucide-react';
import UserInput from './components/UserInput';
import StrategicRoadmap from './components/StrategicRoadmap';
import { saveUserData, loadUserData, clearUserData } from './utils/storage';

function App() {
  const [userData, setUserData] = useState(null);
  const [localMode, setLocalMode] = useState(true);

  useEffect(() => {
    // Load local mode preference
    const savedMode = localStorage.getItem('bioblueprint_local_mode');
    const initialMode = savedMode !== null ? JSON.parse(savedMode) : true;
    setLocalMode(initialMode);

    // Load user data if local mode is enabled
    if (initialMode) {
      const savedData = loadUserData();
      if (savedData) {
        setUserData(savedData);
      }
    }
  }, []);

  useEffect(() => {
    localStorage.setItem('bioblueprint_local_mode', JSON.stringify(localMode));
    
    if (localMode) {
      if (userData) {
        saveUserData(userData);
      }
    } else {
      // If switching to incognito/local-off, clear storage for privacy
      clearUserData();
    }
  }, [userData, localMode]);

  const handleUserSubmit = (data) => {
    setUserData(data);
  };

  const handleSecureDelete = () => {
    clearUserData();
    setUserData(null);
    // Optional: visual feedback
    if (confirm("Are you sure you want to securely wipe all data?")) {
        // Confirmation already handled by the user clicking the button usually, but alert adds friction
    }
  };

  const confirmSecureDelete = () => {
     if (window.confirm("Securely wipe all data? This action cannot be undone.")) {
         clearUserData();
         setUserData(null);
     }
  }

  return (
    <div className="min-h-screen bg-slate-50 text-slate-900 font-sans selection:bg-med-tech-100">
      <nav className="bg-white border-b border-slate-200 px-6 py-4 flex justify-between items-center sticky top-0 z-50 shadow-sm">
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 bg-gradient-to-br from-med-tech-400 to-med-tech-600 rounded-lg flex items-center justify-center text-white font-bold shadow-md">
            L
          </div>
          <h1 className="text-xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-med-tech-600 to-med-tech-800">
            LifeSync
          </h1>
        </div>
        
        <div className="flex items-center gap-4">
          <button 
            onClick={() => setLocalMode(!localMode)}
            className={`flex items-center gap-2 px-3 py-1.5 rounded-full text-sm font-medium transition-all ${
              localMode 
                ? 'bg-emerald-50 text-emerald-600 border border-emerald-200 hover:bg-emerald-100' 
                : 'bg-slate-100 text-slate-500 border border-slate-200 hover:bg-slate-200'
            }`}
            title={localMode ? "Data saved to this device" : "Data not saved"}
          >
            {localMode ? <Shield className="w-4 h-4" /> : <ShieldOff className="w-4 h-4" />}
            <span className="hidden sm:inline">{localMode ? 'Local-Only Mode' : 'Incognito Mode'}</span>
          </button>
          
          {userData && (
             <button 
              onClick={confirmSecureDelete}
              className="p-2 text-slate-400 hover:text-red-500 hover:bg-red-50 rounded-full transition-all"
              title="Secure Delete"
            >
              <Trash2 className="w-5 h-5" />
            </button>
          )}
        </div>
      </nav>

      <main className="container mx-auto px-4 py-12">
        {!userData ? (
          <UserInput onComplete={handleUserSubmit} initialData={null} />
        ) : (
          <StrategicRoadmap userData={userData} resetData={() => setUserData(null)} />
        )}
      </main>
      
      <footer className="text-center text-slate-400 text-sm py-8">
        <p>© {new Date().getFullYear()} LifeSync. All calculations run locally.</p>
      </footer>
    </div>
  );
}

export default App;
