# CMPE 258: Advanced Customizations in Deep Learning and Neural Networks

## 📋 Assignment Overview

This repository contains implementations of advanced deep learning customizations covering regularization techniques, data augmentation across multiple modalities, and custom component development in both TensorFlow/Keras and PyTorch.

**Author:** Aniket Anil Naik
**Course:** CMPE 258 - Deep Learning  
**University:** San José State University

---

## 📁 Repository Structure
```
├── README.md
├── notebooks/
│   ├── notebook1_regularization_techniques.ipynb
│   ├── notebook2_data_augmentation.ipynb
│   ├── notebook3_advanced_keras.ipynb
│   └── notebook4_advanced_pytorch.ipynb
└── assets/
    └── (screenshots/diagrams if needed)
```

---

## 📓 Notebooks Summary

### Notebook 1: Regularization Techniques
**File:** `notebook1_regularization_techniques.ipynb`

Comprehensive exploration of regularization methods to prevent overfitting, implemented in both TensorFlow and PyTorch with A/B testing comparisons.

| Technique | Description |
|-----------|-------------|
| **Baseline Model** | No regularization (control) |
| **L1 Regularization** | Lasso - promotes sparsity |
| **L2 Regularization** | Ridge - weight decay |
| **Dropout** | Random neuron deactivation |
| **Early Stopping** | Training termination on validation plateau |
| **MC Dropout** | Monte Carlo Dropout for uncertainty estimation |
| **Batch Normalization** | Internal covariate shift reduction |
| **Weight Initialization** | He, Xavier, LeCun comparison |

**Dataset:** Fashion-MNIST (60,000 training, 10,000 test images)

---

### Notebook 2: Data Augmentation Across Modalities
**File:** `notebook2_data_augmentation.ipynb`

Multi-modal data augmentation techniques with quantitative A/B testing showing improvement from augmentation.

| Modality | Techniques |
|----------|------------|
| **Image** | Keras layers, KerasCV (RandAugment, CutMix, MixUp, Cutout), Albumentations |
| **Text** | nlpaug (character-level, word-level, BERT contextual augmentation) |
| **Time Series** | Jittering, scaling, time warping, permutation |
| **Tabular** | SMOTE, ADASYN, Borderline-SMOTE for class imbalance |
| **Audio** | audiomentations, librosa (time stretch, pitch shift, noise injection) |

**Datasets:** CIFAR-10, synthetic time series, credit card fraud, audio samples

---

### Notebook 3: Advanced Keras Customizations
**File:** `notebook3_advanced_keras.ipynb`

Building custom deep learning components from scratch in TensorFlow/Keras.

| Component Type | Implementations |
|----------------|-----------------|
| **LR Schedulers** | OneCycleLR, WarmupExponentialDecay |
| **Dropout** | MCAlphaDropout (SELU-compatible) |
| **Normalization** | MaxNormDense |
| **Loss Functions** | HuberLoss, FocalLoss |
| **Activations** | LeakyReLU, Swish, Mish |
| **Initializers** | MyGlorotInitializer, OrthogonalInitializer |
| **Constraints** | PositiveWeights, UnitNormConstraint |
| **Metrics** | HuberMetric, F1Score |
| **Layers** | ExponentialLayer, MyDense, AddGaussianNoise, MyLayerNormalization |
| **Models** | ResidualBlock, ResidualRegressor |
| **Optimizers** | MyMomentumOptimizer |
| **Callbacks** | CustomTensorBoardCallback |

**Datasets:** California Housing (regression), Fashion-MNIST (classification)

---

### Notebook 4: Advanced PyTorch Customizations
**File:** `notebook4_advanced_pytorch.ipynb`

Mirror implementation of Notebook 3 in PyTorch, demonstrating framework-agnostic understanding.

| Component Type | Implementations |
|----------------|-----------------|
| **LR Schedulers** | OneCycleLR, WarmupCosineScheduler |
| **Dropout** | MCDropout, AlphaDropout |
| **Loss Functions** | HuberLoss, FocalLoss, LabelSmoothingCrossEntropy |
| **Activations** | Swish, Mish, GELU, ParametricReLU |
| **Initialization** | xavier_init, kaiming_init, orthogonal_init |
| **Layers** | CustomLinear, CustomLayerNorm, SqueezeExcitation, GaussianNoise |
| **Models** | ResidualBlock, ResidualMLP, AttentionMLP, FullCustomClassifier |
| **Optimizers** | CustomSGD, CustomAdamW |
| **Uncertainty** | MC Dropout prediction with uncertainty visualization |

**Datasets:** California Housing (regression), Fashion-MNIST (classification)

---

## 🚀 Getting Started

### Option 1: Google Colab (Recommended)
Click the "Open in Colab" badges in each notebook or upload directly to [Google Colab](https://colab.research.google.com/).

### Option 2: Local Setup
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/cmpe258-deep-learning-advanced.git
cd cmpe258-deep-learning-advanced

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Launch Jupyter
jupyter notebook
```

### Requirements
```
tensorflow>=2.15.0
torch>=2.0.0
torchvision>=0.15.0
numpy>=1.24.0
matplotlib>=3.7.0
scikit-learn>=1.3.0
pandas>=2.0.0
albumentations>=1.3.0
nlpaug>=1.1.11
audiomentations>=0.30.0
librosa>=0.10.0
imbalanced-learn>=0.11.0
keras-cv>=0.6.0
tensorboard>=2.15.0
```

---

## 📊 Key Results

### Notebook 1: Regularization Impact
| Technique | Test Accuracy | Improvement |
|-----------|---------------|-------------|
| Baseline | ~85% | - |
| L2 + Dropout | ~88% | +3% |
| BatchNorm + Early Stopping | ~89% | +4% |

### Notebook 2: Augmentation Impact
| Modality | Without Aug | With Aug | Improvement |
|----------|-------------|----------|-------------|
| Image (CIFAR-10) | ~70% | ~78% | +8% |
| Tabular (Imbalanced) | 0.65 F1 | 0.82 F1 | +0.17 F1 |

### Notebooks 3 & 4: Custom Components
- Successfully implemented 15+ custom components in each framework
- MC Dropout uncertainty correlates with prediction correctness
- Custom optimizers achieve comparable performance to built-in versions

---

## 🎥 Video Walkthrough

A comprehensive video walkthrough explaining the code line-by-line is available here:

📹 **[Video Link]** (Add your video link here)

---

## 📚 References

1. Smith, L. N. (2017). *Cyclical Learning Rates for Training Neural Networks*
2. Lin, T. Y., et al. (2017). *Focal Loss for Dense Object Detection*
3. Gal, Y., & Ghahramani, Z. (2016). *Dropout as a Bayesian Approximation*
4. Cubuk, E. D., et al. (2019). *RandAugment: Practical Automated Data Augmentation*
5. He, K., et al. (2016). *Deep Residual Learning for Image Recognition*
6. Loshchilov, I., & Hutter, F. (2017). *Decoupled Weight Decay Regularization*

---

## 📝 License

This project is for educational purposes as part of CMPE 258 coursework at San José State University.

---

## 🙏 Acknowledgments

- Professor and TAs of CMPE 258 - Deep Learning
- TensorFlow and PyTorch documentation and tutorials
- Open-source community for various augmentation libraries
