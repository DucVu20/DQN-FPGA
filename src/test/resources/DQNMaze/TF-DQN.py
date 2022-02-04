from colorama import Fore, Back, Style
import pickle
from types import new_class
import tensorflow as tf
import numpy as np
from tensorflow import keras
import matplotlib.pyplot as plt
from tensorflow.keras import layers
from environment import *
from agent import *
import os

def DQN():

    inp = tf.keras.Input(shape=(maze_size[0]*maze_size[1], ), dtype=tf.float32)
#    x = layers.Flatten()(inp)
    x = layers.Dense(units=first_hidden_units, activation="relu")(inp)

    x = layers.Dense(units=second_hidden_units, activation="relu")(x)

    actions = layers.Dense(units=4, activation="linear")(x)

    model = tf.keras.Model(inputs=inp, outputs=actions)
    model.compile(optimizer="SGD", loss="mean_squared_error")
    return model


# maze = environment(maze_size, starting_location, goal_location, number_of_obstacle)
with open('maze_ref.npy', 'rb') as f:
    maze = np.load(f)

plt.matshow(maze)
plt.show()

current_state = np.zeros((maze_size[1]*maze_size[1], 1))
current_state[starting_location[0] +maze_size[1]*starting_location[1]] = agent
model = DQN()
model.summary()

# plt.matshow(maze)
# plt.show()
#a= np.random.rand(1, 25)

#print("the prediction is", model.predict(a))
for current_episode in range(max_episode):
    current_state = starting_location[0] + starting_location[1]*maze_size[1]
    for step in range(max_step):
        current_state_in = np.zeros((maze.size, 1))
        current_state_in[current_state] = agent

        q_predict = model.predict(current_state_in.T)
        action, x_new, y_new, next_state = update_state(current_episode,
        current_state, q_predict)
        
        next_state_array = np.zeros((maze.size, 1))
        next_state_array[next_state] = agent
        
        q_target = model.predict(next_state_array.T)
        
        reward = get_reward((x_new, y_new), maze, step)
        target = np.zeros((4,1))
        if reward == goal_reward:
            target[action] = reward
        else:
            target[action] = reward + gamma*np.max(q_target)

        history = model.fit(current_state_in.T, target.T)
        current_state = next_state
        print(Fore.RED+"training at step", step, "episode", current_episode,"reward", reward,
            "state", next_state, "action",action, "q_max", np.max(q_target),""+Fore.RESET)
        if reward == goal_reward:
            print(Fore.BLUE+"************************************************************************************************************************************"+Fore.RESET)
            break

model.save("/home/userdata/k63D/vuld_63m/cloned_repo/python/maze-DQN/dqn_maze.h5")
with open('trainHistoryDict', 'wb') as file_pi:
    pickle.dump(history.history, file_pi)
print("saved model")
# current_state = starting_location[0] + starting_location[1]*maze_size[1]

# print("path found")
# while True:
#     current_state_in = np.zeros(maze.size, 1)
#     current_state_in[current_state] = agent
    
#     a3 = model.predict(current_state_in.T)
#     _, _, current_state = update_state(max_episode, current_state, a3)
#     print(current_state)
#     if current_state == goal_location + maze_size[1]*goal_location:
#         break
