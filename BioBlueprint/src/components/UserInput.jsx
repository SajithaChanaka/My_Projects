import React, { useState } from 'react';
import { motion } from 'framer-motion';
import { Calendar, Briefcase, User } from 'lucide-react';

const UserInput = ({ onComplete, initialData }) => {
  const [formData, setFormData] = useState(initialData || {
    gender: '',
    dob: '',
    career: ''
  });

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    if (formData.gender && formData.dob && formData.career) {
      onComplete(formData);
    }
  };

  return (
    <motion.div 
      initial={{ opacity: 0, y: 20 }}
      animate={{ opacity: 1, y: 0 }}
      className="max-w-md mx-auto bg-white p-8 rounded-2xl shadow-lg border border-slate-100"
    >
      <h2 className="text-2xl font-bold text-slate-800 mb-6 text-center">Initialize LifeSync</h2>
      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-slate-600 mb-1">Gender</label>
          <div className="relative">
            <User className="absolute left-3 top-3 w-5 h-5 text-slate-400" />
            <select 
              name="gender" 
              value={formData.gender} 
              onChange={handleChange}
              className="w-full pl-10 pr-4 py-2 border border-slate-200 rounded-lg focus:ring-2 focus:ring-med-tech-400 focus:border-transparent outline-none transition-all appearance-none bg-white"
              required
            >
              <option value="">Select Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-slate-600 mb-1">Date of Birth</label>
          <div className="relative">
            <Calendar className="absolute left-3 top-3 w-5 h-5 text-slate-400" />
            <input 
              type="date" 
              name="dob" 
              value={formData.dob} 
              onChange={handleChange}
              className="w-full pl-10 pr-4 py-2 border border-slate-200 rounded-lg focus:ring-2 focus:ring-med-tech-400 focus:border-transparent outline-none transition-all"
              required
            />
          </div>
        </div>

        <div>
          <label className="block text-sm font-medium text-slate-600 mb-1">Current Career Field</label>
          <div className="relative">
            <Briefcase className="absolute left-3 top-3 w-5 h-5 text-slate-400" />
            <select 
              name="career" 
              value={formData.career} 
              onChange={handleChange}
              className="w-full pl-10 pr-4 py-2 border border-slate-200 rounded-lg focus:ring-2 focus:ring-med-tech-400 focus:border-transparent outline-none transition-all appearance-none bg-white"
              required
            >
              <option value="">Select Field</option>
              <option value="technology">Technology</option>
              <option value="healthcare">Healthcare</option>
              <option value="finance">Finance</option>
              <option value="education">Education</option>
              <option value="creative">Creative Arts</option>
              <option value="other">Other</option>
            </select>
          </div>
        </div>

        <button 
          type="submit"
          className="w-full bg-med-tech-500 hover:bg-med-tech-600 text-white font-semibold py-3 rounded-lg transition-colors duration-200 mt-4 shadow-md hover:shadow-lg"
        >
          Generate Roadmap
        </button>
      </form>
    </motion.div>
  );
};

export default UserInput;
