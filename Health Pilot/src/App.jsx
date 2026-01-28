import React, { useState, useRef } from 'react';
import HealthForm from './components/HealthForm';
import HealthResults from './components/HealthResults';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';

function App() {
  const [results, setResults] = useState(null);
  const resultRef = useRef(null);

  const calculateHealth = (data) => {
    const { gender, age, height, weight } = data;
    const h = parseFloat(height);
    const w = parseFloat(weight);
    const a = parseFloat(age);

    // BMI Calculation
    // BMI = weight (kg) / (height (m))^2
    const bmiValue = (w / Math.pow(h / 100, 2)).toFixed(1);
    
    let category = '';
    let color = '';

    if (bmiValue < 18.5) {
      category = 'Underweight';
      color = '#3b82f6'; // Blue-500
    } else if (bmiValue >= 18.5 && bmiValue < 24.9) {
      category = 'Healthy';
      color = '#22c55e'; // Green-500
    } else if (bmiValue >= 25 && bmiValue < 29.9) {
      category = 'Overweight';
      color = '#f97316'; // Orange-500
    } else {
      category = 'Obese';
      color = '#ef4444'; // Red-500
    }

    // BMR Calculation (Mifflin-St Jeor Equation)
    let bmrValue = 0;
    if (gender === 'male') {
      bmrValue = 10 * w + 6.25 * h - 5 * a + 5;
    } else {
      bmrValue = 10 * w + 6.25 * h - 5 * a - 161;
    }

    setResults({
      bmi: bmiValue,
      bmr: Math.round(bmrValue),
      category,
      color
    });
  };

  const exportPDF = () => {
    const input = resultRef.current;
    if (input) {
      // Improve clarity and ensure content fits
      html2canvas(input, { 
        scale: 3, // Higher scale for better clarity
        backgroundColor: '#ffffff', // Solid background for clean PDF
        useCORS: true,
        logging: false,
        onclone: (clonedDoc) => {
            // Fix Title Gradient Text
            const title = clonedDoc.querySelector('h1');
            if (title) {
                title.classList.remove('text-transparent', 'bg-clip-text', 'bg-gradient-to-r');
                title.style.color = '#4f46e5'; // Solid indigo color
                title.style.background = 'none';
            }

            // Darken all text for better readability
            const allElements = clonedDoc.querySelectorAll('*');
            allElements.forEach(el => {
                const style = window.getComputedStyle(el);
                const color = style.color;
                // If it's a gray color, make it darker
                if (color.includes('rgba') || color.includes('rgb')) {
                    el.style.color = '#000000'; // Force black
                    el.style.opacity = '1';
                }
            });
            
            // Force darker text on specific containers
            const container = clonedDoc.querySelector('.glass');
            if (container) {
                container.classList.add('text-black');
                // Remove glass transparency for PDF to avoid washing out
                container.style.background = '#ffffff';
                container.style.border = '1px solid #000000';
                container.style.boxShadow = 'none';
                container.classList.remove('glass'); // Remove glass class to strip backdrop-filter
            }

            // Fix labels specifically
            const labels = clonedDoc.querySelectorAll('label');
            labels.forEach(label => {
                label.style.color = '#000000';
                label.style.fontWeight = 'bold';
                label.classList.remove('text-gray-700', 'text-gray-900');
            });
            
            // Fix inputs
            const inputs = clonedDoc.querySelectorAll('input, select');
            inputs.forEach(input => {
                input.style.color = '#000000';
                input.style.borderColor = '#000000';
                input.style.backgroundColor = '#ffffff';
                input.style.fontWeight = 'bold';
            });
            
            // Fix paragraphs
            const paragraphs = clonedDoc.querySelectorAll('p, li, span');
            paragraphs.forEach(p => {
                 if (!p.classList.contains('text-white')) { // Don't darken button text if it's white
                     p.style.color = '#000000';
                     p.style.fontWeight = '500';
                 }
            });
        }
      }).then((canvas) => {
        const imgData = canvas.toDataURL('image/png');
        
        // Calculate dimensions
        const imgWidth = canvas.width;
        const imgHeight = canvas.height;
        
        // Use A4 width (210mm) as reference
        const pdfWidth = 210;
        const pdfHeight = (imgHeight * pdfWidth) / imgWidth;
        
        // Create PDF with custom height if content is longer than A4 (297mm)
        // Otherwise use standard A4
        const orientation = pdfHeight > 297 ? 'p' : 'p';
        const format = pdfHeight > 297 ? [pdfWidth, pdfHeight] : 'a4';
        
        const pdf = new jsPDF({
          orientation: orientation,
          unit: 'mm',
          format: format
        });

        pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
        pdf.save('health-pilot-report.pdf');
      });
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center p-4">
      <div className="w-full max-w-md glass p-8 shadow-2xl animate-fade-in" ref={resultRef}>
        <div className="text-center mb-6">
          <h1 className="text-4xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-purple-600">
            HealthPilot
          </h1>
          <p className="text-gray-600 mt-2">Personal Health & Nutrition Advisor</p>
        </div>

        <HealthForm onCalculate={calculateHealth} />

        {results && (
          <div className="mt-6">
            <HealthResults 
              bmi={results.bmi} 
              bmr={results.bmr} 
              category={results.category} 
              color={results.color} 
            />
            
            <button
              onClick={exportPDF}
              data-html2canvas-ignore="true" 
              className="w-full mt-6 bg-gray-800 hover:bg-gray-900 text-white font-bold py-2 px-4 rounded-lg transition duration-300 flex items-center justify-center transform hover:scale-105"
            >
              <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
              </svg>
              Export to PDF
            </button>
          </div>
        )}
      </div>
    </div>
  );
}

export default App;
