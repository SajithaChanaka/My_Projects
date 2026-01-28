import React, { useState } from 'react';

const HealthForm = ({ onCalculate }) => {
  const [formData, setFormData] = useState({
    gender: 'male',
    age: '',
    height: '',
    weight: ''
  });

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (formData.age && formData.height && formData.weight) {
      onCalculate(formData);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <div>
        <label className="block text-gray-900 text-sm font-bold mb-2">Gender</label>
        <select
          name="gender"
          value={formData.gender}
          onChange={handleChange}
          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white/70 backdrop-blur-sm text-gray-900 font-medium"
        >
          <option value="male">Male</option>
          <option value="female">Female</option>
        </select>
      </div>
      <div className="grid grid-cols-2 gap-4">
        <div>
            <label className="block text-gray-900 text-sm font-bold mb-2">Age</label>
            <input
            type="number"
            name="age"
            value={formData.age}
            onChange={handleChange}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white/70 backdrop-blur-sm text-gray-900 font-medium placeholder-gray-500"
            placeholder="Years"
            required
            min="1"
            max="120"
            />
        </div>
        <div>
            <label className="block text-gray-900 text-sm font-bold mb-2">Height (cm)</label>
            <input
            type="number"
            name="height"
            value={formData.height}
            onChange={handleChange}
            className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white/70 backdrop-blur-sm text-gray-900 font-medium placeholder-gray-500"
            placeholder="cm"
            required
            min="1"
            />
        </div>
      </div>
      <div>
        <label className="block text-gray-900 text-sm font-bold mb-2">Weight (kg)</label>
        <input
          type="number"
          name="weight"
          value={formData.weight}
          onChange={handleChange}
          className="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 bg-white/70 backdrop-blur-sm text-gray-900 font-medium placeholder-gray-500"
          placeholder="kg"
          required
          min="1"
        />
      </div>
      <button
        type="submit"
        className="w-full bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded-lg transition duration-300 transform hover:scale-105 shadow-md"
      >
        Calculate
      </button>
    </form>
  );
};

export default HealthForm;
