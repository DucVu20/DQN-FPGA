import numpy as np
import matplotlib.pyplot as plt
from configuration import *
np.random.seed()
def environment(maze_size, starting_location, goal_coor):

    maze = np.zeros(maze_size, dtype=int)
    obstacle_loc = np.random.randint(maze.size, size=number_of_obstacle)
    for ob in obstacle_loc:
        maze[int(ob%maze_size[0]), int(ob/maze_size[1])] = obstacle_reward
        
    
    maze[goal_coor[0], goal_coor[1]] = goal_reward
    maze[starting_location[0], starting_location[1]] = 0

    return maze

def show(maze):
    plt.matshow(maze)
    plt.show()
    
# maze = environment(maze_size, starting_location, goal_location)
# plt.matshow(maze)
# plt.show()

# with open('maze5_ref.npy', 'wb') as f:
#     np.save(f, maze)

# with open('maze5_ref.npy', 'rb') as f:
#     maze = np.load(f)    
# plt.matshow(maze)
# plt.show()

