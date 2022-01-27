# this file specifies all the configurations for training and the maze information

# maze
maze_size = (5, 5)
number_of_obstacle = 9
starting_location = (0, 0)
goal_location = (4, 4)

# hyperparameters
alpha = 0.0005
gamma = 0.99
max_episode = 4000
max_step = 15

agent = 1 # one hot encoding for the input of the nn
goal_reward = 2
obstacle_reward = -1
#out_of_maze_reward = 



# network hyperparameters
input_units = maze_size[0]*maze_size[1]

first_hidden_units = input_units
second_hidden_units = int(first_hidden_units/2)
output_units = 4

dnn_layers = (input_units, first_hidden_units, second_hidden_units, output_units)
