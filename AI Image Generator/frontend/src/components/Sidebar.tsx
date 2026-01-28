import React from 'react';
import { Image as ImageIcon, Clock } from 'lucide-react';

interface HistoryItem {
  id: string;
  url: string;
  prompt: string;
  timestamp: number;
}

interface SidebarProps {
  history: HistoryItem[];
  onSelect: (item: HistoryItem) => void;
}

export const Sidebar: React.FC<SidebarProps> = ({ history, onSelect }) => {
  return (
    <div className="w-64 bg-gray-900 text-white h-full flex flex-col border-r border-gray-800">
      <div className="p-4 border-b border-gray-800 flex items-center gap-2">
        <Clock className="w-5 h-5 text-blue-400" />
        <h2 className="font-semibold">History</h2>
      </div>
      
      <div className="flex-1 overflow-y-auto p-2 space-y-2">
        {history.length === 0 ? (
          <div className="text-gray-500 text-sm text-center mt-10">
            No images generated yet.
          </div>
        ) : (
          history.map((item) => (
            <div 
              key={item.id}
              onClick={() => onSelect(item)}
              className="p-2 hover:bg-gray-800 rounded-lg cursor-pointer group transition-colors"
            >
              <div className="aspect-square w-full bg-gray-800 rounded mb-2 overflow-hidden border border-gray-700">
                <img 
                  src={item.url} 
                  alt={item.prompt} 
                  className="w-full h-full object-cover group-hover:scale-105 transition-transform"
                />
              </div>
              <p className="text-xs text-gray-400 truncate" title={item.prompt}>
                {item.prompt}
              </p>
              <p className="text-[10px] text-gray-600">
                {new Date(item.timestamp).toLocaleTimeString()}
              </p>
            </div>
          ))
        )}
      </div>
    </div>
  );
};
