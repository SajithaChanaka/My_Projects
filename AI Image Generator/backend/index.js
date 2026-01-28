const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');
const axios = require('axios');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Mock Image URL for testing without API Key
const MOCK_IMAGE_URL = "https://picsum.photos/1024/1024";

app.get('/api/health', (req, res) => {
  res.send({ status: 'ok' });
});

app.post('/api/generate', async (req, res) => {
  const { prompt, provider = 'openai' } = req.body;

  if (!prompt) {
    return res.status(400).json({ error: 'Prompt is required' });
  }

  try {
    let imageUrl = MOCK_IMAGE_URL;

    // Check if key is present and not the placeholder
    const hasApiKey = process.env.OPENAI_API_KEY && process.env.OPENAI_API_KEY.startsWith('sk-') && process.env.OPENAI_API_KEY !== 'sk-...';

    if (hasApiKey && provider === 'openai') {
      console.log('Generating image with OpenAI...');
      try {
        const response = await axios.post(
          'https://api.openai.com/v1/images/generations',
          {
            model: "dall-e-3",
            prompt: prompt,
            n: 1,
            size: "1024x1024",
            response_format: "url"
          },
          {
            headers: {
              'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
              'Content-Type': 'application/json'
            }
          }
        );
        imageUrl = response.data.data[0].url;
      } catch (apiError) {
        console.error('OpenAI API failed, falling back to free provider:', apiError?.response?.data || apiError.message);
        console.log('Falling back to Pollinations.ai (Free)...');
        imageUrl = `https://image.pollinations.ai/prompt/${encodeURIComponent(prompt)}?nologo=true`;
      }
    } else {
        console.log('Using Pollinations.ai (Free - No API Key required)');
        imageUrl = `https://image.pollinations.ai/prompt/${encodeURIComponent(prompt)}?nologo=true`;
    }

    // In a real app, you might want to download the image and serve it from your backend 
    // to avoid CORS issues with the canvas, or proxy it.
    // For DALL-E, the URL is temporary.
    // We will return the URL. Frontend might need to proxy it to avoid taint.
    
    // To solve Canvas Taint issues, we can fetch the image here and return base64
    const imageResponse = await axios.get(imageUrl, { responseType: 'arraybuffer' });
    const base64Image = Buffer.from(imageResponse.data, 'binary').toString('base64');
    const mimeType = imageResponse.headers['content-type'];
    const dataURI = `data:${mimeType};base64,${base64Image}`;

    res.json({ 
        url: imageUrl, 
        data_url: dataURI,
        prompt 
    });

  } catch (error) {
    console.error('Error generating image:', error?.response?.data || error.message);
    res.status(500).json({ error: 'Failed to generate image', details: error?.response?.data });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
