import numpy as np
import pickle
from configuration import *

# specify the location of the maze 
maze_size = (5, 5)
maze_file_name = "weights/maze"+str(maze_size[0])+"_ref.npy"
trained_params_file = "weights/trained_params_maze"+str(maze_size[0])+"x"+ str(maze_size[1])+".pkl"

# convert the maze into a txt file for loading into the DQN Accelerator
with open(maze_file_name, 'rb') as f:
    maze = np.load(f)
with open("weights/environment.txt", "w") as file:
    for row in maze:
        for reward in row:
            print(reward)
            file.write(str(reward) + "\n")

# open the saved trained parameters dictionary
trained_params_buf = open(trained_params_file, "rb")
trained_params = pickle.load(trained_params_buf)

for l in range(1, 4):
    globals()["w"+str(l)] = trained_params["w"+str(l)]
    globals()["b"+str(l)] = trained_params["b"+str(l)]
    globals()["p"+str(l)] = np.concatenate((globals()["w"+str(l)], globals()["b"+str(l)]), axis=1)
    print("shape of layer", l, "is", globals()["p"+str(l)].shape)
    with open("weights/params_layer" + str(l)+"_maze_"+str(maze_size[0]) + ".txt", "w") as file:
        for w_row in globals()["p" + str(l)]:
            for w in w_row:
                file.write(str(w) + "\n")
    file.close()

# write agent configurations into the configuration files. Configutations are written
# in number format in the following order
# mazeSizeX; x_inital, y_inital, reference goal_location

with open("weights/configuration.txt", "w") as file:
    file.write(str(maze_size[1]) + "\n")
    file.write(str(starting_location[0]) + "\n")
    file.write(str(starting_location[1]) + "\n")
    file.write(str(goal_location[1] + goal_location[1]*maze_size[1]) + "\n")
        
