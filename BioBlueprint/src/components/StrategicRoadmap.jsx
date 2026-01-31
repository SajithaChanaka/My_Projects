import React from 'react';
import { motion } from 'framer-motion';
import { Heart, TrendingUp, Leaf } from 'lucide-react';
import LifeProgressBar from './LifeProgressBar';
import { getHealthRecommendations, getCareerRecommendations, getSustainabilityGoal } from '../utils/recommendations';
import { calculateAge, calculateLifeExpectancy } from '../utils/ageEngine';

const StrategicRoadmap = ({ userData, resetData }) => {
  const age = calculateAge(userData.dob);
  const lifeExpectancy = calculateLifeExpectancy(userData.gender);
  
  const healthRecs = getHealthRecommendations(age.years, userData.gender);
  const careerRecs = getCareerRecommendations(age.years, userData.career);
  const ecoGoal = getSustainabilityGoal(age.years);

  const container = {
    hidden: { opacity: 0 },
    show: {
      opacity: 1,
      transition: {
        staggerChildren: 0.2
      }
    }
  };

  const item = {
    hidden: { opacity: 0, y: 20 },
    show: { opacity: 1, y: 0 }
  };

  return (
    <div className="max-w-4xl mx-auto space-y-8 pb-12">
      <div className="flex justify-between items-center mb-8">
        <h2 className="text-3xl font-bold text-slate-800">Your Strategic Roadmap</h2>
        <button 
          onClick={resetData}
          className="text-sm text-slate-500 hover:text-red-500 transition-colors"
        >
          Reset Data
        </button>
      </div>

      <LifeProgressBar age={age} lifeExpectancy={lifeExpectancy} />

      <motion.div 
        variants={container}
        initial="hidden"
        animate="show"
        className="grid grid-cols-1 md:grid-cols-2 gap-6"
      >
        {/* Health Section */}
        <motion.div variants={item} className="bg-white p-6 rounded-xl shadow-sm border border-slate-100">
          <div className="flex items-center gap-2 mb-4">
            <div className="p-2 bg-rose-100 rounded-lg">
              <Heart className="w-5 h-5 text-rose-500" />
            </div>
            <h3 className="text-xl font-semibold text-slate-800">Health Protocol</h3>
          </div>
          <div className="space-y-4">
            {healthRecs.map((rec) => (
              <div key={rec.id} className="border-l-2 border-rose-200 pl-4 py-1">
                <h4 className="font-medium text-slate-700">{rec.title}</h4>
                <p className="text-sm text-slate-500">{rec.description}</p>
                <span className="text-xs font-semibold text-rose-400 uppercase tracking-wide">{rec.frequency}</span>
              </div>
            ))}
          </div>
        </motion.div>

        {/* Career Section */}
        <motion.div variants={item} className="bg-white p-6 rounded-xl shadow-sm border border-slate-100">
          <div className="flex items-center gap-2 mb-4">
            <div className="p-2 bg-blue-100 rounded-lg">
              <TrendingUp className="w-5 h-5 text-blue-500" />
            </div>
            <h3 className="text-xl font-semibold text-slate-800">Strategic Innovations</h3>
          </div>
          <ul className="space-y-3">
            {careerRecs.map((rec) => (
              <li key={rec.id} className="flex items-start gap-3">
                <div className="mt-1.5 min-w-[6px] min-h-[6px] rounded-full bg-blue-400" />
                <span className="text-slate-600 leading-relaxed">{rec.text}</span>
              </li>
            ))}
          </ul>
        </motion.div>

        {/* Sustainability Goal */}
        <motion.div variants={item} className="md:col-span-2 bg-emerald-50 p-6 rounded-xl border border-emerald-100 flex items-start gap-4">
          <div className="p-3 bg-white rounded-full shadow-sm">
            <Leaf className="w-6 h-6 text-emerald-500" />
          </div>
          <div>
            <h3 className="text-lg font-semibold text-emerald-800 mb-1">Sustainability Goal</h3>
            <p className="text-emerald-700 text-lg font-medium">"{ecoGoal}"</p>
          </div>
        </motion.div>
      </motion.div>
    </div>
  );
};

export default StrategicRoadmap;
