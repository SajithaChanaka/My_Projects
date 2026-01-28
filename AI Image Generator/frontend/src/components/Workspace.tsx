import React, { useState, useRef } from 'react';
import axios from 'axios';
import { Download, Edit2, RefreshCw, Save, Image as ImageIcon, Loader2, RotateCw } from 'lucide-react';
import { CanvasEditor } from './CanvasEditor';
import type { CanvasRef, FilterState } from './CanvasEditor';

interface WorkspaceProps {
  onImageGenerated: (url: string, prompt: string) => void;
  onSave: (id: string, newUrl: string) => void;
  currentImage: { id: string; url: string; prompt: string } | null;
}

const DEFAULT_FILTERS: FilterState = {
  brightness: 100,
  contrast: 100,
  saturation: 100,
  hue: 0,
  rotation: 0,
};

export const Workspace: React.FC<WorkspaceProps> = ({ onImageGenerated, onSave, currentImage }) => {
  const [prompt, setPrompt] = useState('');
  const [loading, setLoading] = useState(false);
  const [filters, setFilters] = useState<FilterState>(DEFAULT_FILTERS);
  
  const canvasRef = useRef<CanvasRef>(null);

  const handleGenerate = async () => {
    if (!prompt.trim()) return;
    
    setLoading(true);
    setFilters(DEFAULT_FILTERS);

    try {
      const response = await axios.post('http://localhost:5000/api/generate', { prompt });
      // Use data_url to avoid CORS
      const imageUrl = response.data.data_url || response.data.url;
      onImageGenerated(imageUrl, prompt);
    } catch (error) {
      console.error('Error generating image:', error);
      alert('Failed to generate image. Please try again.');
    } finally {
      setLoading(false);
    }
  };

  const handleDownload = (format: 'png' | 'jpg' | 'pdf') => {
    if (canvasRef.current) {
      canvasRef.current.download(format);
    }
  };

  const handleSave = () => {
    if (canvasRef.current && currentImage) {
      const newUrl = canvasRef.current.getDataUrl('png');
      if (newUrl) {
        onSave(currentImage.id, newUrl);
        // Reset filters as the image itself is now "baked" with the changes
        setFilters(DEFAULT_FILTERS); 
      }
    }
  };

  const handleFilterChange = (key: keyof FilterState, value: number) => {
    setFilters(prev => ({ ...prev, [key]: value }));
  };

  const handleRotate = () => {
    setFilters(prev => ({ ...prev, rotation: (prev.rotation + 90) % 360 }));
  };

  // When currentImage changes (e.g. from history), reset filters
  React.useEffect(() => {
    setFilters(DEFAULT_FILTERS);
    if (currentImage) {
        setPrompt(currentImage.prompt);
    }
  }, [currentImage]);

  return (
    <div className="flex-1 flex flex-col h-full overflow-hidden bg-gray-950 text-white">
      {/* Header / Input Area */}
      <div className="p-6 border-b border-gray-800">
        <h1 className="text-2xl font-bold mb-4 flex items-center gap-2">
          <ImageIcon className="text-purple-500" />
          AI Image Studio
        </h1>
        
        <div className="flex gap-2 max-w-3xl">
          <input
            type="text"
            value={prompt}
            onChange={(e) => setPrompt(e.target.value)}
            placeholder="Describe the image you want to generate..."
            className="flex-1 bg-gray-900 border border-gray-700 rounded-lg px-4 py-3 focus:outline-none focus:border-purple-500 transition-colors"
            onKeyDown={(e) => e.key === 'Enter' && handleGenerate()}
          />
          <button
            onClick={handleGenerate}
            disabled={loading || !prompt.trim()}
            className="bg-purple-600 hover:bg-purple-700 disabled:opacity-50 disabled:cursor-not-allowed px-6 py-3 rounded-lg font-medium flex items-center gap-2 transition-colors"
          >
            {loading ? <Loader2 className="animate-spin" /> : <RefreshCw />}
            Generate
          </button>
        </div>
      </div>

      <div className="flex-1 flex overflow-hidden">
        {/* Main Canvas Area */}
        <div className="flex-1 p-6 flex items-center justify-center bg-gray-900 relative">
          {!currentImage ? (
            <div className="text-center text-gray-500">
              <ImageIcon className="w-16 h-16 mx-auto mb-4 opacity-20" />
              <p>Enter a prompt and click Generate to start</p>
            </div>
          ) : (
            <div className="relative w-full h-full flex items-center justify-center">
               <CanvasEditor 
                 ref={canvasRef}
                 imageSrc={currentImage.url}
                 filters={filters}
               />
            </div>
          )}
        </div>

        {/* Editor / Controls Sidebar */}
        {currentImage && (
          <div className="w-80 bg-gray-900 border-l border-gray-800 p-6 overflow-y-auto">
            <div className="space-y-6">
              
              {/* Actions */}
              <div>
                <h3 className="text-sm font-medium text-gray-400 mb-3 uppercase tracking-wider">Downloads</h3>
                <div className="grid grid-cols-3 gap-2">
                  <button onClick={() => handleDownload('jpg')} className="bg-gray-800 hover:bg-gray-700 p-2 rounded text-sm text-center">JPG</button>
                  <button onClick={() => handleDownload('png')} className="bg-gray-800 hover:bg-gray-700 p-2 rounded text-sm text-center">PNG</button>
                  <button onClick={() => handleDownload('pdf')} className="bg-gray-800 hover:bg-gray-700 p-2 rounded text-sm text-center">PDF</button>
                </div>
              </div>

              <hr className="border-gray-800" />

              {/* Editor Controls */}
              <div>
                <div className="flex justify-between items-center mb-4">
                  <h3 className="text-sm font-medium text-gray-400 uppercase tracking-wider flex items-center gap-2">
                    <Edit2 className="w-4 h-4" /> Adjustments
                  </h3>
                  <div className="flex gap-2">
                    <button 
                      onClick={handleSave}
                      className="text-xs text-green-400 hover:text-green-300 flex items-center gap-1"
                      title="Save edits permanently"
                    >
                      <Save className="w-3 h-3" /> Save
                    </button>
                    <button 
                      onClick={() => setFilters(DEFAULT_FILTERS)}
                      className="text-xs text-blue-400 hover:text-blue-300"
                    >
                      Reset
                    </button>
                  </div>
                </div>

                <div className="space-y-4">
                  <div className="space-y-2">
                    <label className="text-xs text-gray-400">Brightness ({filters.brightness}%)</label>
                    <input 
                      type="range" min="0" max="200" 
                      value={filters.brightness}
                      onChange={(e) => handleFilterChange('brightness', Number(e.target.value))}
                      className="w-full accent-purple-500"
                    />
                  </div>

                  <div className="space-y-2">
                    <label className="text-xs text-gray-400">Contrast ({filters.contrast}%)</label>
                    <input 
                      type="range" min="0" max="200" 
                      value={filters.contrast}
                      onChange={(e) => handleFilterChange('contrast', Number(e.target.value))}
                      className="w-full accent-purple-500"
                    />
                  </div>

                  <div className="space-y-2">
                    <label className="text-xs text-gray-400">Saturation ({filters.saturation}%)</label>
                    <input 
                      type="range" min="0" max="200" 
                      value={filters.saturation}
                      onChange={(e) => handleFilterChange('saturation', Number(e.target.value))}
                      className="w-full accent-purple-500"
                    />
                  </div>

                  <div className="space-y-2">
                    <label className="text-xs text-gray-400">Hue Rotation ({filters.hue}°)</label>
                    <input 
                      type="range" min="0" max="360" 
                      value={filters.hue}
                      onChange={(e) => handleFilterChange('hue', Number(e.target.value))}
                      className="w-full accent-purple-500"
                    />
                  </div>
                  
                  <div className="pt-2">
                    <button 
                      onClick={handleRotate}
                      className="w-full bg-gray-800 hover:bg-gray-700 py-2 rounded flex items-center justify-center gap-2 text-sm"
                    >
                      <RotateCw className="w-4 h-4" /> Rotate 90°
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};
