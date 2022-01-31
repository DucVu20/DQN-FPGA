# DQN-FPGA
========================================

A [Chisel3](https://github.com/ucb-bar/chisel3) implementation of a tiny fully connected neural network accelerator for Deep Q-Network, supporting inference only.

### Setup

Clone this repository and build

```bash
# Clone the repository
git clone https://github.com/DucVu20/DQN-FPGA.git -b VuDev
cd DQN-FPGA

# Generate the verilog code of the design
sbt "runMain dnn.DQNAcceleratorTopGenerator"
cd generatedVerilog

```

To train a DQN agent to solve a random maze by software (python) and perform inference on the DQN Accelerator

```bash
# from the DQN-FPGA directory
cd src/test/resources/DQNMaze
python3 DQN_maze.py
python3 DQNMazeInference.py
python3 np_weights2txt.py
cd ../../../..
sbt "test:testOnly dnn.DQNAcceleratorTopTester"
```
