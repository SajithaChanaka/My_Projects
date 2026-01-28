import React from 'react';

const HealthResults = ({ bmi, bmr, category, color }) => {
  const getPosition = (bmi) => {
    // Map BMI to percentage for the gauge
    // Range 15 to 40 covers most cases
    const min = 15;
    const max = 40;
    let percent = ((bmi - min) / (max - min)) * 100;
    if (percent < 0) percent = 0;
    if (percent > 100) percent = 100;
    return percent;
  };

  return (
    <div className="mt-8 space-y-6 animate-fade-in-up transition-all duration-500 ease-in-out">
      <div className="text-center">
        <h2 className="text-2xl font-bold text-gray-800">Your Results</h2>
        <div className="mt-4 p-4 rounded-xl bg-white/30 backdrop-blur-md shadow-inner border border-white/40">
          <p className="text-lg text-gray-700">BMI: <span className="font-bold text-3xl" style={{ color }}>{bmi}</span></p>
          <p className="text-lg font-semibold text-gray-800 mt-1">{category}</p>
          
          {/* Gauge */}
          <div className="relative h-6 mt-6 mb-2 bg-gray-200 rounded-full overflow-hidden shadow-inner">
             <div className="absolute top-0 left-0 h-full w-full bg-gradient-to-r from-blue-400 via-green-400 via-orange-400 to-red-500"></div>
          </div>
          <div className="relative h-4 -mt-4 mb-6">
             <div 
               className="absolute top-0 w-1 h-8 bg-gray-800 -mt-2 transform -translate-x-1/2 transition-all duration-1000 ease-out border-2 border-white rounded-sm shadow-sm"
               style={{ left: `${getPosition(bmi)}%` }}
             ></div>
          </div>
          <div className="flex justify-between text-xs text-gray-500 px-1">
             <span>Underweight</span>
             <span>Healthy</span>
             <span>Overweight</span>
             <span>Obese</span>
          </div>

          <p className="mt-6 text-xl text-gray-700">BMR: <span className="font-bold text-2xl text-indigo-700">{bmr}</span> <span className="text-sm">kcal/day</span></p>
        </div>
      </div>

      <div className="bg-white/40 backdrop-blur-md p-6 rounded-xl shadow-lg border border-white/50">
        <h3 className="text-xl font-bold text-gray-800 mb-3 border-b border-gray-200 pb-2">Action Plan</h3>
        <InstructionContent category={category} />
      </div>
    </div>
  );
};

const InstructionContent = ({ category }) => {
  if (category === 'Underweight') {
    return (
      <ul className="space-y-3 text-gray-700">
        <li className="flex items-start"><span className="mr-2">🍲</span><span><strong>Diet:</strong> Increase caloric intake with nutrient-dense foods (nuts, avocados, whole grains).</span></li>
        <li className="flex items-start"><span className="mr-2">💪</span><span><strong>Protein:</strong> Aim for 1.6-2.0g of protein per kg of body weight to build muscle.</span></li>
        <li className="flex items-start"><span className="mr-2">🏋️</span><span><strong>Exercise:</strong> Focus on strength training and compound movements (squats, deadlifts). Limit excessive cardio.</span></li>
        <li className="flex items-start"><span className="mr-2">💡</span><span><strong>Tip:</strong> Eat more frequently, aiming for 5-6 meals a day.</span></li>
      </ul>
    );
  } else if (category === 'Healthy') {
    return (
      <ul className="space-y-3 text-gray-700">
        <li className="flex items-start"><span className="mr-2">🥗</span><span><strong>Diet:</strong> Maintain a balanced diet rich in fruits, vegetables, lean proteins, and healthy fats.</span></li>
        <li className="flex items-start"><span className="mr-2">💧</span><span><strong>Wellness:</strong> Stay hydrated and ensure adequate sleep (7-9 hours).</span></li>
        <li className="flex items-start"><span className="mr-2">🏃</span><span><strong>Exercise:</strong> Mix cardio and strength training for overall fitness (150 mins moderate activity/week).</span></li>
        <li className="flex items-start"><span className="mr-2">🧘</span><span><strong>Tip:</strong> Practice mindful eating to maintain your current weight.</span></li>
      </ul>
    );
  } else if (category === 'Overweight' || category === 'Obese') {
    return (
      <ul className="space-y-3 text-gray-700">
        <li className="flex items-start"><span className="mr-2">📉</span><span><strong>Diet:</strong> Create a slight caloric deficit (300-500 kcal below TDEE). Focus on high-volume, low-calorie foods.</span></li>
        <li className="flex items-start"><span className="mr-2">💧</span><span><strong>Hydration:</strong> Drink water before meals to help with satiety.</span></li>
        <li className="flex items-start"><span className="mr-2">🚶</span><span><strong>Exercise:</strong> Start with low-impact cardio (walking, swimming, cycling) to protect joints.</span></li>
        <li className="flex items-start"><span className="mr-2">🚫</span><span><strong>Tip:</strong> Track your meals and avoid sugary drinks and processed snacks.</span></li>
      </ul>
    );
  }
  return null;
};

export default HealthResults;
