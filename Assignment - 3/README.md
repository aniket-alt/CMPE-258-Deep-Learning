# Basic Neural Network using NumPy, PyTorch, and TensorFlow (Colab + GitHub)

This repository contains multiple Google Colab notebooks implementing a **3-layer deep neural network for non-linear regression**, progressively using:
- **Part A:** NumPy only (from scratch, manual backpropagation using chain rule, `einsum`)
- **Part B:** PyTorch from scratch (no built-in layers, manual weights + `einsum`)
- **Part C:** PyTorch class/module-based (`nn.Module`, layers, optimizer)
- **Part D:** PyTorch Lightning version
- **Part E:** TensorFlow implementations (low-level → built-in layers → functional API → high-level API)

> **Submission requirements covered:** clean GitHub repo, public access, clear documentation, loss vs epochs plots, final results, and video walkthrough links.

---

## Repository Structure


---

## Notebooks + Links (to be filled)

| Part | Notebook | Colab Link | Video Walkthrough |
|------|----------|-----------|------------------|
| A | `part_a_numpy_scratch/PartA_Numpy_3Layer_FromScratch.ipynb` | (add link) | (add link) |
| B | `part_b_pytorch_scratch/PartB_Torch_FromScratch_NoBuiltinLayers.ipynb` | (add link) | (add link) |
| C | `part_c_pytorch_modules/PartC_Torch_nnModule.ipynb` | (add link) | (add link) |
| D | `part_d_pytorch_lightning/PartD_Lightning.ipynb` | (add link) | (add link) |
| E1 | `part_e_tensorflow/PartE1_TF_LowLevel.ipynb` | (add link) | (add link) |
| E2 | `part_e_tensorflow/PartE2_TF_BuiltinLayers.ipynb` | (add link) | (add link) |
| E3 | `part_e_tensorflow/PartE3_TF_FunctionalAPI.ipynb` | (add link) | (add link) |
| E4 | `part_e_tensorflow/PartE4_TF_HighLevelFit.ipynb` | (add link) | (add link) |

---

## Common Experiment Setup (used across parts)

- **Task:** Non-linear regression
- **Inputs:** 3 variables (x1, x2, x3)
- **Model:** 3-layer neural network
- **Loss:** Mean Squared Error (MSE)
- **Outputs required:** 
  - Training loss vs epochs plot  
  - Final test metrics (MSE and optional R²)
  - Visualizations (including a 4D-style plot: 3D axes + color as the 4th dimension)

---

## How to Run

1. Open any notebook in Google Colab.
2. Run cells top-to-bottom.
3. Each notebook includes:
   - Data generation and preprocessing
   - Model definition
   - Training loop
   - Loss curve plot
   - Final evaluation + visualization

---

## Notes for Grading / Instructor

- Part A and Part B implement **manual backpropagation** using the **chain rule**, and use `einsum` operations for tensor math.
- Parts C–E use framework utilities (modules / optimizers / training loops) as required.

---

## Author
- Name: (Your Name)
- Course: (Course Name / Section)
- Term: (Term)
