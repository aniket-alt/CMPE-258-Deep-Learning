# CMPE 258 - Deep Learning Assignment: Neural Network Implementations

[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://python.org)
[![PyTorch](https://img.shields.io/badge/PyTorch-2.0+-red.svg)](https://pytorch.org)
[![TensorFlow](https://img.shields.io/badge/TensorFlow-2.0+-orange.svg)](https://tensorflow.org)
[![NumPy](https://img.shields.io/badge/NumPy-1.24+-green.svg)](https://numpy.org)

## 📋 Overview

This repository contains multiple implementations of a **3-layer deep neural network** for **non-linear regression** using different frameworks and approaches. The goal is to demonstrate understanding of neural network fundamentals by implementing the same architecture from scratch and using various levels of abstraction.

### Target Function

All implementations learn the following non-linear function with 3 input variables:

$$y = \sin(x_1) \cdot \cos(x_2) + x_3^2 + 0.5 \cdot x_1 \cdot x_2$$

This function combines:
- **Trigonometric non-linearity**: sin(x₁), cos(x₂)
- **Polynomial non-linearity**: x₃²
- **Variable interaction**: x₁·x₂

## 🏗️ Network Architecture

All implementations use a consistent **3-layer architecture**:
```
Input Layer (3 neurons) → Hidden Layer 1 (64 neurons) → Hidden Layer 2 (32 neurons) → Output Layer (1 neuron)
                              ↓                              ↓
                          ReLU/Tanh                      ReLU/Tanh
```

- **Input**: 3 features (x₁, x₂, x₃)
- **Hidden Layer 1**: 64 neurons with non-linear activation
- **Hidden Layer 2**: 32 neurons with non-linear activation
- **Output**: 1 neuron (regression output)

## 📁 Repository Structure
```
cmpe258-assignment2-neural-networks/
├── README.md
├── notebooks/
│   ├── colab_a_numpy_from_scratch.ipynb      # NumPy only implementation
│   ├── colab_b_pytorch_from_scratch.ipynb    # PyTorch without nn.Module
│   ├── colab_c_pytorch_classes.ipynb         # PyTorch with nn.Module
│   ├── colab_d_pytorch_lightning.ipynb       # PyTorch Lightning version
│   └── colab_e_tensorflow_variants.ipynb     # All TensorFlow implementations
└── assets/
    └── 4d_visualization.png                  # 4D plot visualization
```

## 📓 Notebook Descriptions

### Colab a) NumPy from Scratch
**File**: `colab_a_numpy_from_scratch.ipynb`

- Pure NumPy implementation of a 3-layer neural network
- Uses `tf.einsum` for matrix multiplication operations
- Manual implementation of:
  - Forward propagation
  - Backpropagation using chain rule
  - Gradient descent optimization
- Non-linear activation functions (Tanh)
- 4D visualization using matplotlib with PCA

### Colab b) PyTorch from Scratch (No Built-in Layers)
**File**: `colab_b_pytorch_from_scratch.ipynb`

- PyTorch implementation WITHOUT using `nn.Module` or built-in layers
- Manual weight initialization using `torch.randn`
- Manual forward pass with tensor operations
- Uses PyTorch autograd for gradient computation
- Manual parameter updates (no optimizer)

### Colab c) PyTorch with Classes
**File**: `colab_c_pytorch_classes.ipynb`

- PyTorch implementation using `nn.Module`
- Uses built-in layers: `nn.Linear`, `nn.Tanh`
- `nn.Sequential` for layer organization
- Standard training loop with `loss.backward()` and `optim.Adam`
- `DataLoader` for batch processing

### Colab d) PyTorch Lightning
**File**: `colab_d_pytorch_lightning.ipynb`

- Refactored version using PyTorch Lightning
- `LightningModule` with `training_step`, `configure_optimizers`
- `LightningDataModule` for data organization
- Built-in callbacks: `EarlyStopping`, `ModelCheckpoint`
- CSV logging for metrics tracking

### Colab e) TensorFlow Variants
**File**: `colab_e_tensorflow_variants.ipynb`

Contains four sub-implementations:

| Section | Description |
|---------|-------------|
| **e-i** | TensorFlow from scratch using `tf.Variable` and `tf.GradientTape` |
| **e-ii** | Using `tf.keras.layers.Dense` with custom training loop |
| **e-iii** | Using Keras Functional API (`tf.keras.Model`) |
| **e-iv** | Using high-level Keras Sequential API with callbacks |

## 🎬 Video Walkthroughs

| Notebook | Video Link | Description |
|----------|------------|-------------|
| Colab a | [NumPy from Scratch](YOUR_LINK_HERE) | Manual backpropagation with chain rule, tf.einsum |
| Colab b | [PyTorch from Scratch](YOUR_LINK_HERE) | Manual weights, autograd for gradients |
| Colab c | [PyTorch with Classes](YOUR_LINK_HERE) | nn.Module, nn.Sequential, Adam optimizer |
| Colab d | [PyTorch Lightning](YOUR_LINK_HERE) | LightningModule, callbacks, checkpointing |
| Colab e | [TensorFlow Variants](YOUR_LINK_HERE) | All 4 implementations (scratch, layers, functional, sequential) |

Each video covers:
- Code explanation and walkthrough
- Training execution and results
- Loss curves visualization
- 4D plot demonstration
- Final output and metrics

Each video covers:
- Code explanation and walkthrough
- Training execution and results
- Loss curves visualization
- 4D plot demonstration
- Final output and metrics

## 🚀 Getting Started

### Prerequisites
```bash
# Core dependencies
pip install numpy matplotlib scikit-learn

# PyTorch
pip install torch torchvision

# TensorFlow
pip install tensorflow

# PyTorch Lightning
pip install pytorch-lightning
```

### Running the Notebooks

1. Open any notebook in Google Colab
2. Run all cells sequentially
3. View training progress and final visualizations

## 📊 Results Summary

| Implementation | Framework | Final MSE Loss | R² Score |
|----------------|-----------|----------------|----------|
| Colab a | NumPy | ~0.003 | ~0.99 |
| Colab b | PyTorch (scratch) | ~0.003 | ~0.99 |
| Colab c | PyTorch (classes) | ~0.003 | ~0.99 |
| Colab d | PyTorch Lightning | ~0.003 | ~0.99 |
| Colab e-i | TensorFlow (scratch) | ~0.003 | ~0.99 |
| Colab e-ii | TensorFlow (layers) | ~0.003 | ~0.99 |
| Colab e-iii | TensorFlow (functional) | ~0.003 | ~0.99 |
| Colab e-iv | TensorFlow (Keras) | ~0.003 | ~0.99 |

## 📈 4D Visualization

The 4D plot visualizes the relationship between 3 input variables and the output:
- **X, Y, Z axes**: Input variables (x₁, x₂, x₃) or PCA components
- **Color**: Predicted/Actual output value

## 🔑 Key Learnings

1. **Backpropagation**: Understanding gradient flow through chain rule
2. **Framework Abstraction**: How high-level APIs simplify implementation
3. **Matrix Operations**: Efficient computation using einsum and broadcasting
4. **Activation Functions**: Role of non-linearity in learning complex functions
5. **Optimization**: Impact of learning rate and batch size on convergence

## 🛠️ Implementation Comparison

| Feature | NumPy | PyTorch Scratch | PyTorch Classes | Lightning | TensorFlow |
|---------|-------|-----------------|-----------------|-----------|------------|
| Manual Weights | ✅ | ✅ | ❌ | ❌ | Varies |
| Manual Forward | ✅ | ✅ | ❌ | ❌ | Varies |
| Manual Backward | ✅ | ❌ | ❌ | ❌ | Varies |
| Auto Gradients | ❌ | ✅ | ✅ | ✅ | ✅ |
| Built-in Optimizer | ❌ | ❌ | ✅ | ✅ | ✅ |
| Callbacks | ❌ | ❌ | ❌ | ✅ | ✅ |

## 👤 Author

**Aniket Anil Naik**  
MS Software Engineering (Data Science Focus)  
San José State University  
Course: CMPE 258 - Deep Learning

## 📄 License

This project is for educational purposes as part of CMPE 258 coursework.

## 🔗 References

- [NumPy Documentation](https://numpy.org/doc/)
- [PyTorch Tutorials](https://pytorch.org/tutorials/)
- [TensorFlow Guide](https://www.tensorflow.org/guide)
- [PyTorch Lightning Docs](https://lightning.ai/docs/pytorch/stable/)
- [4D Plotting with Matplotlib](https://www.tutorialspoint.com/how-to-make-a-4d-plot-with-matplotlib-using-arbitrary-data)
