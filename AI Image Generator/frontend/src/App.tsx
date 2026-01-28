import React, { useState } from 'react';
import { Sidebar } from './components/Sidebar';
import { Workspace } from './components/Workspace';

interface HistoryItem {
  id: string;
  url: string;
  prompt: string;
  timestamp: number;
}

function App() {
  const [history, setHistory] = useState<HistoryItem[]>([]);
  const [currentImage, setCurrentImage] = useState<HistoryItem | null>(null);

  const handleImageGenerated = (url: string, prompt: string) => {
    const newItem: HistoryItem = {
      id: Date.now().toString(),
      url,
      prompt,
      timestamp: Date.now(),
    };
    
    setHistory(prev => [newItem, ...prev]);
    setCurrentImage(newItem);
  };

  const handleSave = (id: string, newUrl: string) => {
    setHistory(prev => prev.map(item => 
      item.id === id ? { ...item, url: newUrl } : item
    ));
    if (currentImage?.id === id) {
      setCurrentImage(prev => prev ? { ...prev, url: newUrl } : null);
    }
  };

  return (
    <div className="flex h-screen w-full bg-black text-white font-sans overflow-hidden">
      <Sidebar 
        history={history} 
        onSelect={setCurrentImage} 
      />
      <Workspace 
        onImageGenerated={handleImageGenerated} 
        onSave={handleSave}
        currentImage={currentImage} 
      />
    </div>
  );
}

export default App;
