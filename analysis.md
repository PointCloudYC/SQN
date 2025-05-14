# SQN: Weakly-Supervised Semantic Segmentation for 3D Point Clouds

This project implements the Semantic Query Network (SQN) for weakly-supervised 3D point cloud segmentation. Here's how to use it:

## Project Structure

- `main_S3DIS.py` - Main script for S3DIS dataset
- `utils/data_prepare_s3dis.py` - Data preparation script
- `SQN.py` - Core network implementation
- `tester_S3DIS.py` - Testing/evaluation implementation

## Setup

1. Prerequisites:
   - Python 3.6
   - TensorFlow 1.13
   - CUDA 9.0 and cuDNN 7.4.1
   - Ubuntu 16.04/18.04 / 22.04

2. Environment setup: see `setup.sh`
```bash
git clone https://github.com/QingyongHu/SQN && cd SQN
conda create -n sqn python=3.5
source activate sqn
conda install tensorflow-gpu=1.13.1
pip install -r helper_requirements.txt
sh compile_op.sh
```

## Workflow

### 1. Data Preparation

The S3DIS dataset needs to be processed before training:

```bash
python utils/data_prepare_s3dis.py
```

This script:
- Reads raw S3DIS data
- Organizes point clouds by area
- Preprocesses data (normalization, subsampling)
- Creates necessary data structures (KD-Trees)
- Saves processed data for training

### 2. Training with Weak Supervision

Training with different percentages of labeled points:

```bash
# Train with 0.1% labeled points
python main_S3DIS.py --mode train --gpu 0 --test_area 5 --labeled_point 0.1%

# Other options: 0.01%, 1%, 10%, 100%
```

Parameters:
- `--mode`: train/test/vis
- `--gpu`: GPU ID
- `--test_area`: Area used for validation (1-6)
- `--labeled_point`: Percentage of labeled points

### 3. Testing/Inference

To evaluate the trained model:

```bash
python main_S3DIS.py --mode test --gpu 0 --test_area 5 --labeled_point 0.1%
```

Results will be saved in the `results` directory.

### 4. Generating Pseudo Labels

To generate pseudo labels for unlabeled points:

```bash
python main_S3DIS.py --mode test --gpu 0 --test_area 5 --gen_pseudo
```

This creates predicted labels that can be used for retraining.

### 5. Retraining with Pseudo Labels

After generating pseudo labels, retrain the model:

```bash
python main_S3DIS.py --mode train --gpu 0 --test_area 5 --labeled_point 0.1% --retrain
```

### 6. Visualization

To visualize the point clouds and segmentation:

```bash
python main_S3DIS.py --mode vis --gpu 0 --test_area 5 --labeled_point 0.1%
```

This will display the point clouds with their segmentation labels.

### Complete Pipeline Example

```bash
# 1. Prepare dataset
python utils/data_prepare_s3dis.py

# 2. Initial training with weak supervision (0.1% labeled points)
python main_S3DIS.py --mode train --gpu 0 --test_area 5 --labeled_point 0.1%

# 3. Test the model
python main_S3DIS.py --mode test --gpu 0 --test_area 5 --labeled_point 0.1%

# 4. Generate pseudo labels
python main_S3DIS.py --mode test --gpu 0 --test_area 5 --gen_pseudo

# 5. Retrain with pseudo labels
python main_S3DIS.py --mode train --gpu 0 --test_area 5 --labeled_point 0.1% --retrain

# 6. Test the retrained model
python main_S3DIS.py --mode test --gpu 0 --test_area 5 --labeled_point 0.1%
```

## Debugging with VSCode

A launch.json configuration is provided for VSCode debugging with multiple configurations for different operations, including a customizable "S3DIS: Custom Args" option where you can choose arguments interactively.

