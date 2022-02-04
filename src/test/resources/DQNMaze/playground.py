import numpy as np
import pickle

trained_params_location = "weights/trained_params_maze5x5.pkl"
trained_params_buf = open(trained_params_location, "rb")
trained_params = pickle.load(trained_params_buf)

for a in range(1, 4):
    globals()["w"+str(a)] = trained_params["w"+str(a)]
    globals()["b"+str(a)] = trained_params["b"+str(a)]

print("bias layer 1 is", b1)    
print("first row of weight layer 1 is")
for w in w1[0]:
    print(w)
