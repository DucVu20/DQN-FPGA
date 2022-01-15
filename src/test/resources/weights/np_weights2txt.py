import numpy as np
import pickle
# specify the location of the maze 
maze_size = (5, 5)
maze_file_name = "maze"+str(maze_size[0])+"_ref.npy"
trained_params_file = "trained_params_maze"+str(maze_size[0])+"x"+ str(maze_size[1])+".pkl"

# convert the maze into a txt file for loading into the DQN Accelerator
with open(maze_file_name, 'rb') as f:
    maze = np.load(f)

# open the saved trained parameters dictionary
trained_params_buf = open(trained_params_file, "rb")
trained_params = pickle.load(trained_params_buf)

for l in range(1, 4):
    globals()["w"+str(l)] = trained_params["w"+str(l)]
    globals()["b"+str(l)] = trained_params["b"+str(l)]
    with open("weights_layer" + str(l)+"_maze_"+str(maze_size[0]) + ".txt", "w") as file:
        for w_row in globals()["w" + str(l)]:
            for w in w_row:
                file.write(str(w) + "\n")
    file.close()

    with open("bias_layer" + str(l) + "_maze_" + str(maze_size[0]) + ".txt", "w") as file:
        for b in globals()["b" + str(l)]:
            file.write(str(*b) + "\n")
    file.close()

    # the asterisk is inserted to remove the [] pair from a numpy number
