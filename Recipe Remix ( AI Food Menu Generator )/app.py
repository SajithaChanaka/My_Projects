import streamlit as st
from google import genai
from google.genai import types
import os
import json
from dotenv import load_dotenv

# --- 1. CONFIG & SETUP ---
load_dotenv()
st.set_page_config(page_title="Recipe Remix", page_icon="🍳", layout="centered")

# Initialize Gemini Client
# Make sure GOOGLE_API_KEY is in your .env file
client = genai.Client(api_key=os.getenv("GOOGLE_API_KEY"))

# --- 2. AI LOGIC FUNCTIONS ---

def generate_recipe(ingredients, cuisine, style):
    """Generates a structured recipe using Gemini 3 Flash."""
    try:
        prompt = (
            f"Act as a professional chef. Create a {style} {cuisine} recipe using these ingredients: {ingredients}. "
            "Return ONLY a JSON object with this exact structure: "
            "{\"title\": \"string\", \"instructions\": [\"step 1\", \"step 2\"], \"cook_time\": \"string\", \"fun_fact\": \"string\"}"
        )
        
        response = client.models.generate_content(
            model="gemini-3-flash-preview",
            contents=prompt,
            config=types.GenerateContentConfig(
                response_mime_type="application/json",
            )
        )
        return json.loads(response.text)
    except Exception as e:
        st.error(f"Recipe Generation Error: {e}")
        return None

# --- 3. STREAMLIT UI ---

st.title("🍳 Recipe Remix")
st.markdown("### *Turn your fridge leftovers into a gourmet masterpiece!*")

# Sidebar for extra features
with st.sidebar:
    st.header("Customize your Remix")
    cuisine_type = st.selectbox("Cuisine Type", ["Any", "Italian", "Mexican", "Indian", "Asian Fusion", "Mediterranean"])
    cooking_style = st.select_slider("Complexity", options=["Simple", "Standard", "Fancy"])
    st.divider()
    st.info("Tip: Use comma-separated ingredients for best results.")

# Main Input
user_ingredients = st.text_input("What ingredients do you have?", placeholder="e.g. eggs, stale bread, sriracha, spinach")

if st.button("Generate My Remix", use_container_width=True):
    if not user_ingredients.strip():
        st.warning("Please tell the Chef what ingredients you have!")
    else:
        with st.spinner("🧑‍🍳 Chef Gemini is brainstorming..."):
            # Generate Text Recipe
            recipe = generate_recipe(user_ingredients, cuisine_type, cooking_style)
            
            if recipe:
                st.divider()
                
                # Display Recipe Details
                st.header(recipe['title'])
                
                col1, col2 = st.columns([1, 1])
                with col1:
                    st.write(f"⏱️ **Estimated Time:** {recipe['cook_time']}")
                with col2:
                    if 'fun_fact' in recipe:
                        st.info(f"💡 **Chef's Tip:** {recipe['fun_fact']}")
                
                st.subheader("Instructions")
                for i, step in enumerate(recipe['instructions'], 1):
                    st.write(f"{i}. {step}")

# Footer
st.divider()
st.caption("Powered by Chef AI")