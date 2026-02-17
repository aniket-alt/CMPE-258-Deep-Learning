# Part A: Multimodal AI Exploration with Latest Models

## 📋 Overview

This part demonstrates the capabilities of modern AI models for multimodal tasks using **Google Gemini 2.5 Flash-Lite**. The notebook explores image understanding and advanced text generation capabilities.

## 🎯 Objectives Completed

| Task | Description | Status |
|------|-------------|--------|
| Image Understanding | Analyze diverse images and extract meaningful information | ✅ |
| Creative Writing | Generate original creative content | ✅ |
| Analytical Reasoning | Solve complex logic problems step-by-step | ✅ |
| Multi-turn Conversation | Maintain context across multiple exchanges | ✅ |
| Knowledge Synthesis | Connect concepts across multiple domains | ✅ |

## 🛠️ Technologies Used

- **Model**: Google Gemini 2.5 Flash-Lite
- **Platform**: Google Colab
- **Language**: Python 3.x
- **Libraries**: 
  - `google-generativeai` - Gemini API SDK
  - `Pillow` - Image processing
  - `requests` - HTTP requests

## 📁 File Structure
```
Part A/
├── README.md                              # This file
├── Part_A_Multimodal_AI_Exploration.ipynb # Main Colab notebook
├── images/                                # Sample images used for analysis
│   ├── sample_earth_from_space.jpg
│   ├── sample_waterfall_nature.jpg
│   └── sample_city_skyline.jpg
└── outputs/
    └── part_a_summary.json                # Execution summary
```

## 🚀 How to Run

### Prerequisites
1. Google account with access to [Google AI Studio](https://aistudio.google.com/)
2. Gemini API key (free tier available)

### Steps
1. Open the notebook in Google Colab: 
   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/aniket-alt/CMPE-258-Deep-Learning/blob/main/Assignment%20-%201/Part%20A/Part_A_Multimodal_AI_Exploration.ipynb)

2. Add your API key to Colab Secrets:
   - Click the 🔑 icon in the left sidebar
   - Add secret named `GEMINI_API_KEY` with your API key
   - Toggle "Notebook access" ON

3. Run all cells sequentially

## 📊 Sections in the Notebook

### Section 1: Image Loading
- Downloads diverse sample images from Unsplash
- Prepares images for multimodal analysis

### Section 2: Image Understanding with Gemini
Three different images analyzed:

| Image | Analysis Focus |
|-------|----------------|
| 🌍 Earth from Space | Scientific phenomena, geographic features, perspective |
| 🌊 Natural Waterfall | Geological formation, ecosystem, conservation |
| 🏙️ City Skyline | Architecture, urban planning, economic indicators |

### Section 3: Text-to-Text Capabilities

| Demo | Description |
|------|-------------|
| ✍️ Creative Writing | Sci-fi short story generation |
| 🧠 Analytical Reasoning | Logic puzzle with step-by-step solution |
| 💬 Multi-turn Chat | Deep learning architecture discussion |
| 🔬 Knowledge Synthesis | AI + Genomics + IoT in healthcare |

## 📹 Video Walkthrough

[Video Link - YouTube](YOUR_VIDEO_LINK_HERE)

The video covers:
- Introduction to the assignment objectives
- Walkthrough of each code section
- Explanation of Gemini's multimodal capabilities
- Results and analysis discussion

## 📸 Sample Outputs

### Image Analysis Example
The model successfully identified geographic features, weather patterns, and provided scientific context for the Earth from space image.

### Reasoning Example
The logic puzzle was solved correctly with clear step-by-step deductions, demonstrating chain-of-thought reasoning capabilities.

## 🔗 References

- [Google Gemini API Documentation](https://ai.google.dev/docs)
- [Gemini Multimodal Use Cases](https://colab.research.google.com/github/GoogleCloudPlatform/generative-ai/blob/main/gemini/use-cases/intro_multimodal_use_cases.ipynb)
- [DeepSeek R1 - Advanced Reasoning](https://www.datacamp.com/blog/deepseek-r1)
- [Janus Pro - Multimodal Model](https://www.datacamp.com/blog/janus-pro)

## 👤 Author

**Aniket Naik**  
MS in Software Engineering  
San José State University  
CMPE 258 - Deep Learning (Spring 2025)

---

*Part of Assignment 2: Learn Latest AI Coding Tools*
