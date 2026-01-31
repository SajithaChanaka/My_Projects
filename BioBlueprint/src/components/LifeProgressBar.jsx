import React from 'react';
import { BarChart, Bar, XAxis, YAxis, ResponsiveContainer, Tooltip, Cell } from 'recharts';

const LifeProgressBar = ({ age, lifeExpectancy }) => {
  const yearsLived = parseFloat((age.years + (age.months / 12)).toFixed(2));
  const remaining = parseFloat(Math.max(0, lifeExpectancy - yearsLived).toFixed(2));
  const percentage = Math.min(100, (yearsLived / lifeExpectancy) * 100).toFixed(1);

  const data = [
    {
      name: 'Life',
      Lived: yearsLived,
      Remaining: remaining,
    },
  ];

  return (
    <div className="bg-white p-6 rounded-xl shadow-sm border border-slate-100 mb-6">
      <div className="flex justify-between items-end mb-4">
        <div>
          <h3 className="text-lg font-semibold text-slate-800">Life Progress</h3>
          <p className="text-sm text-slate-500">
            {age.years} years, {age.months} months, {age.days} days
          </p>
        </div>
        <div className="text-right">
          <span className="text-3xl font-bold text-med-tech-600">{percentage}%</span>
          <p className="text-xs text-slate-400">of estimated {lifeExpectancy} years</p>
        </div>
      </div>
      
      <div className="h-24 w-full">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            layout="vertical"
            data={data}
            margin={{ top: 0, right: 0, left: 0, bottom: 0 }}
          >
            <XAxis type="number" hide domain={[0, lifeExpectancy]} />
            <YAxis type="category" dataKey="name" hide />
            <Tooltip 
              cursor={false}
              contentStyle={{ borderRadius: '8px', border: 'none', boxShadow: '0 4px 6px -1px rgb(0 0 0 / 0.1)' }}
            />
            <Bar dataKey="Lived" stackId="a" fill="#0ea5e9" radius={[4, 0, 0, 4]} animationDuration={1500} />
            <Bar dataKey="Remaining" stackId="a" fill="#e2e8f0" radius={[0, 4, 4, 0]} animationDuration={1500} />
          </BarChart>
        </ResponsiveContainer>
      </div>
    </div>
  );
};

export default LifeProgressBar;
