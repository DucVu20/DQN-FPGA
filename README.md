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
### Synthesis result
![image](https://user-images.githubusercontent.com/63137043/151771660-caf5802b-190d-460c-8f31-28db32f40ee8.png)
![image](https://user-images.githubusercontent.com/63137043/151771733-05b7654b-f7bc-4aa1-8536-c3c6a14b3dd3.png)
![image](https://user-images.githubusercontent.com/63137043/151771769-f64b49ae-e21f-42e8-aaf0-4866d1d048b5.png)
