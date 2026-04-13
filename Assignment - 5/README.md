# CMPE 258 – Deep Learning Training Design Space

This repository contains executed Google Colab notebooks covering the deep learning training design space, along with YouTube video walkthroughs for each notebook. Each colab has been run with full outputs preserved.

---

## Notebooks & Video Walkthroughs

| # | Topic | Colab (Executed) | Video Walkthrough |
|---|-------|-----------------|-------------------|
| 1 | Deep Learning Training Techniques | [Open Colab](https://colab.research.google.com/drive/1iTkufT7-J_2eA3_ft25Pb2iGCe7pCcUf#scrollTo=VXRec997-14k) | [Video](#) |
| 2 | Metrics for Classification – Fundamentals | [Open Colab](#) | [Video](#) |
| 3 | Hyperparameter Tuning for Deep Learning | [Open Colab](#) | [Video](#) |
| 4 | Optimizers for Deep Learning | [Open Colab](#) | [Video](#) |
| 5 | Activation Functions for Deep Learning | [Open Colab](#) | [Video](#) |
| 6 | Convolutional Neural Networks | [Open Colab](#) | [Video](#) |
| 7 | Modern CNN Architectures & Transfer Learning | [Open Colab](#) | [Video](#) |

> Replace each `#` with the actual Google Colab sharing link and YouTube video URL.

---

## Notebook Summaries

### 1. Deep Learning Training Techniques
Covers the fundamental mechanics of training deep neural networks — forward pass, loss computation, backpropagation, and gradient descent. Explores practical training strategies including batch normalization, dropout, learning rate scheduling, and early stopping. Demonstrates how these techniques improve convergence and generalization.

### 2. Metrics for Classification – Fundamentals
Explores the full suite of classification evaluation metrics: accuracy, precision, recall, F1 score, ROC-AUC, and confusion matrices. Covers when to use each metric, the trade-off between precision and recall, and why accuracy alone is misleading for imbalanced datasets.

### 3. Hyperparameter Tuning for Deep Learning
Demonstrates systematic approaches to finding optimal hyperparameters — learning rate, batch size, number of layers, neurons per layer, dropout rate. Covers grid search, random search, and learning rate finder techniques. Shows how hyperparameter choices impact training stability and final model performance.

### 4. Optimizers for Deep Learning
Compares optimization algorithms used to train neural networks: SGD, SGD with Momentum, RMSProp, Adam, AdamW, and others. Visualizes convergence behavior for each optimizer. Explains adaptive learning rate methods and when to prefer one optimizer over another.

### 5. Activation Functions for Deep Learning
Surveys activation functions — Sigmoid, Tanh, ReLU, Leaky ReLU, ELU, SELU, GELU, and Swish. Demonstrates how each affects gradient flow, covers the vanishing/exploding gradient problem, and explains why ReLU variants dominate modern architectures.

### 6. Convolutional Neural Networks
Builds CNNs from scratch for image classification. Explains convolution, pooling, stride, padding, and receptive fields. Covers the standard CNN pipeline and implements a working image classifier, visualizing filters and feature maps along the way.

### 7. Modern CNN Architectures & Transfer Learning
High-level overview of landmark CNN architectures: AlexNet, VGG, ResNet, Inception, EfficientNet, and MobileNet. Demonstrates transfer learning — loading a pretrained model, freezing layers, and fine-tuning on a new dataset. Shows why transfer learning dramatically reduces training time and data requirements.

---

## How to Run

1. Open any notebook link in the table above (Google Colab)
2. Go to **Runtime → Run all**
3. All outputs are pre-saved in the archived `.ipynb` files in this repo

---

## Course Info

**Course:** CMPE 258 – Deep Learning  
**Institution:** San José State University  
**Semester:** Spring 2026
