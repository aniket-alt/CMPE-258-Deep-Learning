# Part D: MNIST Digit Classifier using Keras

## 📋 Overview

A neural network model to classify handwritten digits (0-9) from the MNIST dataset, built using **Keras/TensorFlow** with the help of **Cursor** - an AI-powered code editor. The notebook includes comprehensive metrics and visualizations.

## 🎯 Objectives

- Build a neural network for digit classification
- Train and evaluate on MNIST dataset
- Generate all supporting metrics (accuracy, loss, confusion matrix, classification report)
- Visualize training progress and predictions

## 📊 Results

| Metric | Value |
|--------|-------|
| **Test Accuracy** | ~97-98% |
| **Test Loss** | ~0.08 |
| **Training Epochs** | 10 |

## 🧠 Model Architecture
```
┌─────────────────────────────────────┐
│ Input Layer (28x28 = 784 pixels)    │
├─────────────────────────────────────┤
│ Flatten Layer                       │
├─────────────────────────────────────┤
│ Dense Layer (256 units, ReLU)       │
├─────────────────────────────────────┤
│ Dropout (0.3)                       │
├─────────────────────────────────────┤
│ Dense Layer (128 units, ReLU)       │
├─────────────────────────────────────┤
│ Dropout (0.3)                       │
├─────────────────────────────────────┤
│ Dense Output Layer (10 units, Softmax)│
└─────────────────────────────────────┘
```

## 📈 Metrics & Visualizations

| Visualization | Description |
|---------------|-------------|
| 📊 Training Curves | Accuracy and Loss over epochs |
| 🔢 Confusion Matrix | 10x10 heatmap of predictions vs actual |
| 📋 Classification Report | Precision, Recall, F1-score per digit |
| 🖼️ Sample Predictions | Visual comparison of true vs predicted |

## 🛠️ Built With

| Tool | Purpose |
|------|---------|
| **Cursor** | AI-powered code generation |
| **TensorFlow/Keras** | Deep learning framework |
| **NumPy** | Numerical computations |
| **Matplotlib/Seaborn** | Visualizations |
| **Scikit-learn** | Metrics (confusion matrix, classification report) |
| **Google Colab** | Runtime environment |

## 📁 File Structure
```
Part D/
├── README.md
├── Part_D_MNIST_Neural_Network_Keras.ipynb
└── screenshots/
    ├── confusion_matrix.png
    └── training_curves.png
```

## 🚀 How to Run

### Option 1: Google Colab (Recommended)
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/aniket-alt/CMPE-258-Deep-Learning/blob/main/Assignment%20-%201/Part%20D/Part_D_MNIST_Neural_Network_Keras.ipynb)

1. Click the badge above
2. Run all cells (Runtime → Run all)

### Option 2: Local Setup
1. Clone repository:
```bash
   git clone https://github.com/aniket-alt/CMPE-258-Deep-Learning.git
```

2. Install dependencies:
```bash
   pip install tensorflow numpy matplotlib seaborn scikit-learn
```

3. Run notebook:
```bash
   jupyter notebook "Assignment - 1/Part D/Part_D_MNIST_Neural_Network_Keras.ipynb"
```

## 🤖 How It Was Built (Using Cursor)

### Step 1: Project Setup
- Created new Google Colab notebook
- Opened Cursor AI editor

### Step 2: AI-Assisted Development
- Used Cursor's Chat (Ctrl+L) to generate complete notebook
- Provided detailed prompt specifying all requirements

### Step 3: Prompt Used
```
Generate a complete Google Colab notebook for MNIST digit classifier using Keras with:
- Data loading and exploration
- Preprocessing (normalization, one-hot encoding)
- Neural network model (Dense layers with Dropout)
- Training with validation split
- Training curves visualization
- Confusion matrix heatmap
- Classification report
- Sample predictions visualization
```

### Step 4: Execution
- Uploaded generated code to Google Colab
- Ran all cells successfully
- Verified metrics and visualizations

## 📹 Video Walkthrough

🎥 **Video Link: (https://drive.google.com/file/d/1QhKudDb0nG4eLO_5_gK7yMpzv0GWoSjB/view?usp=sharing)**

The video demonstrates:
1. Opening Cursor AI editor
2. Generating neural network code with AI
3. Running in Google Colab
4. Explaining model architecture
5. Analyzing results and metrics

## 📚 References

- [Cursor AI Editor](https://cursor.sh/)
- [MNIST Dataset](http://yann.lecun.com/exdb/mnist/)
- [Keras Documentation](https://keras.io/)
- [TensorFlow Guide](https://www.tensorflow.org/guide)

## 👤 Author

**Aniket Anil Naik**  
MS in Software Engineering  
San José State University  
CMPE 258 - Deep Learning (Spring 2025)

---

*Part of Assignment 2: Learn Latest AI Coding Tools*
