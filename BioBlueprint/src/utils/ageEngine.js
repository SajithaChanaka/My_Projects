export const calculateAge = (dob) => {
  if (!dob) return null;
  const birthDate = new Date(dob);
  const today = new Date();
  
  let years = today.getFullYear() - birthDate.getFullYear();
  let months = today.getMonth() - birthDate.getMonth();
  let days = today.getDate() - birthDate.getDate();

  if (days < 0) {
    months--;
    // Get days in previous month
    const prevMonthDate = new Date(today.getFullYear(), today.getMonth(), 0);
    days += prevMonthDate.getDate();
  }

  if (months < 0) {
    years--;
    months += 12;
  }

  return { years, months, days };
};

export const calculateLifeExpectancy = (gender) => {
  // Simple estimation based on average life expectancy (approximate)
  // Male: 76, Female: 81, Other/Prefer not to say: 79 (avg)
  const baseExpectancy = {
    male: 76,
    female: 81,
    other: 78.5
  };
  return baseExpectancy[gender.toLowerCase()] || 78.5;
};

export const getTotalDaysLived = (dob) => {
  if (!dob) return 0;
  const birthDate = new Date(dob);
  const today = new Date();
  const diffTime = Math.abs(today - birthDate);
  const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)); 
  return diffDays;
};
