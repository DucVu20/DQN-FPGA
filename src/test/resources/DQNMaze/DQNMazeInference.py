import matplotlib.pyplot as plt
import numpy as np
from colorama import Fore, Back, Style
import os
from environment import *
from configuration import *
from agent import * 
from network import *
from network import *
import time
import pickle

trained_params_location = "weights/trained_params_maze5x5.pkl"
with open('weights/maze5_ref.npy', 'rb') as f:
    maze_ref = np.load(f)

maze_copy = np.copy(maze_ref)
maze_copy[starting_location[0], starting_location[1]] = agent    

plt.matshow(maze_ref)
plt.show()

trained_params_buf = open(trained_params_location, "rb")
trained_params = pickle.load(trained_params_buf)

for a in range(1, 4):
    globals()["w"+str(a)] = trained_params["w"+str(a)]
    globals()["b"+str(a)] = trained_params["b"+str(a)]

# Perform inference on the trained params
current_state = starting_location[0] + starting_location[1]*maze_size[1]

print("find path")
inference_time_start = time.time()
episode = max_episode - 1
state_found = []
for step in range(max_step):
    print("state", current_state)
    a3 = forward(w1, b1, w2, b2, w3, b3, current_state, True)
    action, x_new, y_new, next_state = update_state(episode, current_state, a3)
    maze_copy[next_state%maze_size[0], int(next_state/maze_size[1])] = goal_reward
    reward = get_reward((x_new, y_new), maze_ref, step)
    print("action taken", action)
    state_found.append(next_state)
    if reward == goal_reward:
        break
    current_state = next_state
print("inference time is", (time.time() - inference_time_start)*1000, "ms")

with open("weights/inference_result.txt", "w") as file:
    for state in state_found:
        file.write(str(state) + "\n")
# plot solved maze
fig, axis = plt.subplots(2)
axis[0].matshow(maze_ref)
axis[0].set_xlabel("original maze")

axis[1].matshow(maze_copy)
axis[1].set_xlabel("DQN")
plt.show()
