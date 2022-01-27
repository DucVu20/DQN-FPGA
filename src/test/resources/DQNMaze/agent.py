from configuration import *
import numpy as np

def update_state(current_episode, current_state, q_values):
    y = int(current_state/maze_size[0]) 
    x = current_state%maze_size[1]

    # greedy algorithm
    epsilon = 1 - current_episode/max_episode
    valid_action = False
    while(not valid_action):
        rand1 = np.random.rand()
        if(rand1<epsilon): # if this is te case, explore
            rand2 = np.random.rand()
            if rand2 <= 0.25: # right
                action = 0 # right
            elif 0.25 < rand2 <= 0.5:
                action = 1 # up
            elif 0.5 < rand2 <= 0.75:
                action = 2 # left
            else:
                action = 3 # down
        else:
            action = np.argmax(q_values) # choose the action that has largest Q-value

        # new location based on the action being taken
        if action == 0: # right
            x_new = x + 1
            y_new = y
        elif action == 1: # up
            y_new = y - 1
            x_new = x
        elif action == 2: # left
            x_new = x - 1
            y_new = y
        else: # down
            y_new = y + 1
            x_new = x
            
        # check if the new location is valid or not
        if (0 <= x_new < maze_size[0]) and (0 <= y_new < maze_size[1]):
            valid_action = True
        else:
            valid_action = False
        #print(x_new, y_new, valid_action)

    new_state = x_new + maze_size[1]*y_new
    return action, x_new, y_new, new_state

def get_reward(new_location, maze, step):
    if step >= max_step - 1:
        reward = -0.25
    else:
        reward = maze[new_location[0], new_location[1]]
    return reward
    
def exploit(current_state, q_values):
    y = int(current_state/maze_size[0]) 
    x = current_state%maze_size[1]
    action = np.argmax(q_values) # choose the action that has largest Q-value

    if action == 0: # right
        x_new = x + 1
        y_new = y
    elif action == 1: # up
        y_new = y - 1
        x_new = x
    elif action == 2: # left
        x_new = x - 1
        y_new = y
    else: # down
        y_new = y + 1
        x_new = x
    new_state = x_new + maze_size[1]*y_new
    return new_state        
