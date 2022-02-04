import numpy as np
import math
import matplotlib.pyplot as plt
from dnn_utils import *
from network import *
from environment import *
from configuration import *
from agent import *
from colorama import Fore, Back, Style
import time
import pickle

# load the sample maze

# with open('maze5_ref.npy', 'rb') as f:
#     maze = np.load(f)

maze = environment(maze_size, starting_location, goal_location)
with open('weights/maze5_ref.npy', 'wb') as f:
    np.save(f, maze)

with open('weights/maze5_ref.npy', 'rb') as f:
    maze = np.load(f)
maze_copy = np.copy(maze)
maze_copy[starting_location[0], starting_location[1]] = agent

# initialize parameters and start measuring runtime
start_time = time.time()
params = initialize_parameters_DNN(dnn_layers)
for a in range(1, 4):
    print("size of layer", a, "is ",params["w"+str(a)].shape, "bias", params["b"+str(a)].shape)
    globals()["w"+str(a)] = params["w"+str(a)]
    globals()["b"+str(a)] = params["b"+str(a)]

reward_overtime = []

plt.matshow(maze)
plt.show()
for episode in range(max_episode):
    current_state = starting_location[0] + starting_location[1]*maze_size[1]
    accumulated_reward = 0
    for step in range(max_step):
        a3 = forward(w1, b1, w2, b2, w3, b3, current_state, False)
        action, x_new, y_new, next_state = update_state(episode, current_state, a3)
        reward = get_reward((x_new, y_new), maze, step)
        w1, b1, w2, b2, w3, b3, cost = update_params(w1, b1, w2, b2,
                        w3, b3, current_state, action, next_state, reward)
        print("traing at step", step, "episode", episode, "reward", reward, "state",
         next_state, "cost", cost, "max q values",np.max(a3))
        if reward == goal_reward:
            print(Fore.RED+Back.GREEN+"*******************************************************************"+Style.RESET_ALL)
            break

            
        current_state = next_state
        accumulated_reward = accumulated_reward+ reward
    reward_overtime.append(accumulated_reward)

print("training time is", time.time() - start_time)
current_state = starting_location[0] + starting_location[1]*maze_size[1]
plt.title("the loss over time")
plt.xlabel("training step")
plt.ylabel("cost")
plt.plot(np.arange(0, np.asarray(reward_overtime).size), reward_overtime)
plt.show()

## save the trained params
trained_parameters = {}
for a in range(1, 4):
    trained_parameters['w' + str(a)] = globals()["w"+str(a)]
    trained_parameters['b' + str(a)] = globals()["b"+str(a)]

trained_params_location = "weights/trained_params_maze"+str(maze_size[0])+"x"+str(maze_size[1])+".pkl"
trained_params_file = open(trained_params_location, "wb")
pickle.dump(trained_parameters, trained_params_file)
trained_params_file.close()

# open the saved parameters dictionary
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
for step in range(max_step):
    a3 = forward(w1, b1, w2, b2, w3, b3, current_state, True)
    action, x_new, y_new, next_state = update_state(episode, current_state, a3)
    maze_copy[next_state%maze_size[0], int(next_state/maze_size[1])] = goal_reward
    reward = get_reward((x_new, y_new), maze, step)
    print("state", next_state)
    if reward == goal_reward:
        break
    current_state = next_state
print("inference time is", time.time() - inference_time_start)


# plot solved maze
fig, axis = plt.subplots(2)
fig.suptitle("solve maze by neural network")
axis[0].matshow(maze)
axis[0].set_title("original maze")

axis[1].matshow(maze_copy)
axis[1].set_title("DQN")
plt.show()
