export const getLifeStage = (age) => {
  if (age < 18) return 'Youth';
  if (age < 30) return 'Young Adult';
  if (age < 50) return 'Mid-Life';
  return 'Senior';
};

export const getHealthRecommendations = (ageYears, gender) => {
  const recommendations = [];
  
  // General screenings
  recommendations.push({
    id: 'h1',
    title: 'Annual Physical',
    description: 'Comprehensive check-up including blood pressure and BMI.',
    frequency: 'Yearly'
  });

  recommendations.push({
    id: 'h2',
    title: 'Dental Cleaning',
    description: 'Professional cleaning and exam.',
    frequency: 'Every 6 months'
  });

  if (ageYears >= 20) {
    recommendations.push({
      id: 'h3',
      title: 'Cholesterol Screening',
      description: 'Lipid profile test.',
      frequency: 'Every 4-6 years'
    });
  }

  if (ageYears >= 45) {
     recommendations.push({
      id: 'h4',
      title: 'Colon Cancer Screening',
      description: 'Colonoscopy or other screening methods.',
      frequency: 'Every 10 years'
    });
  }

  // Gender specific
  if (gender === 'female') {
    if (ageYears >= 21 && ageYears < 65) {
      recommendations.push({
        id: 'hf1',
        title: 'Cervical Cancer Screening',
        description: 'Pap smear test.',
        frequency: 'Every 3 years'
      });
    }
    if (ageYears >= 40) {
      recommendations.push({
        id: 'hf2',
        title: 'Mammogram',
        description: 'Breast cancer screening.',
        frequency: 'Yearly or Every 2 years'
      });
    }
  } else if (gender === 'male') {
     if (ageYears >= 50) {
      recommendations.push({
        id: 'hm1',
        title: 'Prostate Cancer Screening',
        description: 'PSA test discussion with doctor.',
        frequency: 'As recommended'
      });
    }
  }

  return recommendations;
};

export const getCareerRecommendations = (ageYears, career) => {
  const innovations = [];

  const stage = getLifeStage(ageYears);

  // General career advice based on stage
  if (stage === 'Youth') {
    innovations.push("Focus on foundational learning and exploring diverse interests.");
    innovations.push("Start building a digital portfolio of projects.");
  } else if (stage === 'Young Adult') {
    innovations.push("Prioritize high-growth skill acquisition over immediate salary.");
    innovations.push("Network aggressively within your industry.");
  } else if (stage === 'Mid-Life') {
    innovations.push("Transition from individual contributor to leadership or specialized expert.");
    innovations.push("Focus on financial independence and diversifying income streams.");
  } else {
    innovations.push("Mentor the next generation.");
    innovations.push("Consulting or board positions using accumulated expertise.");
  }

  // Specific to career
  switch (career) {
    case 'technology':
      innovations.push("Explore AI and Machine Learning integration in your workflow.");
      innovations.push("Contribute to open source to build global reputation.");
      break;
    case 'healthcare':
      innovations.push("Investigate Telemedicine and Digital Health tools.");
      innovations.push("Focus on patient-centric data analytics.");
      break;
    case 'finance':
      innovations.push("Master Fintech tools and Blockchain implications.");
      innovations.push("Automate routine analysis with Python or R.");
      break;
    case 'education':
      innovations.push("Adopt EdTech platforms for personalized learning.");
      innovations.push("Create digital courses to scale your impact.");
      break;
    case 'creative':
      innovations.push("Leverage NFTs or digital rights management.");
      innovations.push("Build a personal brand on emerging social platforms.");
      break;
    default:
      innovations.push("Digitize your workflow to increase efficiency.");
      innovations.push("Focus on soft skills like negotiation and emotional intelligence.");
  }

  return innovations.map((text, idx) => ({ id: `c${idx}`, text }));
};

export const getSustainabilityGoal = (ageYears) => {
  const stage = getLifeStage(ageYears);
  
  if (stage === 'Youth') {
    return "Reduce fast-fashion consumption. Buy second-hand or swap clothes.";
  }
  if (stage === 'Young Adult') {
    return "Adopt a plant-rich diet to reduce carbon footprint.";
  }
  if (stage === 'Mid-Life') {
    return "Invest in energy-efficient home upgrades (solar, insulation).";
  }
  return "Reduce plastic waste and focus on zero-waste gardening.";
};
