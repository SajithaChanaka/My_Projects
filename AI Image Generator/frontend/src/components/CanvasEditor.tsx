import React, { useRef, useEffect, forwardRef, useImperativeHandle } from 'react';

export interface FilterState {
  brightness: number;
  contrast: number;
  saturation: number;
  hue: number;
  rotation: number;
}

interface CanvasEditorProps {
  imageSrc: string;
  filters: FilterState;
  className?: string;
}

export interface CanvasRef {
  download: (format: 'png' | 'jpg' | 'pdf') => void;
  getDataUrl: (format: 'png' | 'jpg') => string;
}

import { jsPDF } from 'jspdf';

export const CanvasEditor = forwardRef<CanvasRef, CanvasEditorProps>(({ imageSrc, filters, className }, ref) => {
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useImperativeHandle(ref, () => ({
    getDataUrl: (format) => {
      const canvas = canvasRef.current;
      if (!canvas) return '';
      return canvas.toDataURL(`image/${format === 'jpg' ? 'jpeg' : format}`);
    },
    download: (format) => {
      const canvas = canvasRef.current;
      if (!canvas) return;

      if (format === 'pdf') {
        const imgData = canvas.toDataURL('image/jpeg', 1.0);
        const pdf = new jsPDF({
          orientation: canvas.width > canvas.height ? 'l' : 'p',
          unit: 'px',
          format: [canvas.width, canvas.height]
        });
        pdf.addImage(imgData, 'JPEG', 0, 0, canvas.width, canvas.height);
        pdf.save(`image-edited.${format}`);
      } else {
        const link = document.createElement('a');
        link.download = `image-edited.${format}`;
        link.href = canvas.toDataURL(`image/${format === 'jpg' ? 'jpeg' : format}`);
        link.click();
      }
    }
  }));

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas || !imageSrc) return;

    const ctx = canvas.getContext('2d');
    if (!ctx) return;

    const img = new Image();
    img.crossOrigin = "anonymous";
    img.src = imageSrc;

    img.onload = () => {
        // Handle rotation dimensions
        const angleInRadians = (filters.rotation * Math.PI) / 180;
        const sin = Math.abs(Math.sin(angleInRadians));
        const cos = Math.abs(Math.cos(angleInRadians));
        
        const newWidth = img.width * cos + img.height * sin;
        const newHeight = img.width * sin + img.height * cos;

        canvas.width = newWidth;
        canvas.height = newHeight;

        // Clear and save context
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.save();

        // Move to center to rotate
        ctx.translate(canvas.width / 2, canvas.height / 2);
        ctx.rotate(angleInRadians);

        // Apply filters
        // ctx.filter is supported in most modern browsers
        ctx.filter = `brightness(${filters.brightness}%) contrast(${filters.contrast}%) saturate(${filters.saturation}%) hue-rotate(${filters.hue}deg)`;

        // Draw image centered
        ctx.drawImage(img, -img.width / 2, -img.height / 2);

        ctx.restore();
    };

  }, [imageSrc, filters]);

  return (
    <canvas 
      ref={canvasRef} 
      className={`max-w-full max-h-[600px] object-contain shadow-lg border border-gray-700 bg-[url('https://t3.ftcdn.net/jpg/02/95/94/94/360_F_295949484_8BrlWkTrPXTY5k59uo5EV68nL048e5IW.jpg')] ${className}`}
    />
  );
});

CanvasEditor.displayName = 'CanvasEditor';
