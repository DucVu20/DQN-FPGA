import numpy as np
import math
from numpy.core.fromnumeric import shape
from configuration import *
from dnn_utils import *

def initialize_parameters_DNN(layer_dims):
    # layer_dim: python list, containing the dimensions of each layer in a network, including input layer
    # return a dictionary containing weights and biases
    # 100 states, 100 hidden nodes, 50, 4
    np.random.seed(3)
    parameters = {}
    L = len(layer_dims)
    for l in range(1, L):
        parameters['w' + str(l)] = np.random.randn(layer_dims[l], layer_dims[l-1])
        parameters['b' + str(l)] = np.random.randn(layer_dims[l], 1)
    
    return parameters

def linear_forward(a, w, b):
    z = np.dot(w, a) + b
    cache = (a, w, b)
    return z, cache 

def linear_activation_forward(a_prev, w, b, activation: str):
    if activation == "sigmoid":
        z, linear_cache = linear_forward(a_prev, w, b)
        a, activation_cache = sigmoid(z)
    
    elif activation =="relu":
        z, linear_cache = linear_forward(a_prev, w, b)
        a, activation_cache = relu(z)
    
    elif activation =="softmax":
        z, linear_cache = linear_forward(a_prev, w, b)
        a, activation_cache = softmax(z)      
    elif activation =="linear":
        z, linear_cache = linear_forward(a_prev, w, b)
        a, activation_cache = linear(z)

    cache = (linear_cache, activation_cache)
    return a, cache

def L_model_forward(X, parameters):
    caches = []
    A = X 
    L = len(parameters)//2
    for l in range(0, L - 2):
        A_prev = A
        A, cache = linear_activation_forward(A_prev, parameters["w"+str(l)], parameters["b"+str(l)], activation='relu')
        caches.append(cache)
    

    Q, cache=linear_activation_forward(A, parameters["W"+str(L)], parameters["b"+str(L)], activation='linear')
    caches.append(cache)

    return Q, caches


def linear_backward(dZ, cache):

    a, w, b = cache
    m = a.shape[1]
    dw = np.dot(dZ, a.T)/m
    db = (1. /m)*np.dot(cache[1].T, dZ)
    da_prev = np.dot(cache[1], dZ)

    return da_prev, dw, db


def forward(w1, b1, w2, b2, w3, b3, state, inference:bool):
    current_s = np.zeros((maze_size[0]*maze_size[1], 1))
    current_s[state] = agent
    z1 = np.dot(w1, current_s) + b1
    a1 = relu(z1)
    
    z2 = np.dot(w2, a1) + b2
    a2 = relu(z2)

    z3 = np.dot(w3, a2) + b3
    a3 = linear(z3)

    q_predicted = a3

    if(inference):
        # print("infer layer 1", a1)
        # print("infer layer 2", a2)
        # print("infer layer 3", a3)
        print("best Q-value", np.max(q_predicted))
        print("max activation value in layer 1", np.max(a1))
        print("max activation value in layer 2", np.max(a2))
        print("max activation value in layer 3", np.max(a3))        
        
    return q_predicted


def update_params(w1, b1, w2, b2, w3, b3, current_state, action, next_state, reward):
    # target q value
    s_next = np.zeros((maze_size[0]*maze_size[1], 1))
    s_next[next_state] = agent
    z1 = np.dot(w1, s_next) + b1
    a1 = relu(z1)

    z2 = np.dot(w2, a1) + b2
    a2 = relu(z2)

    z3 = np.dot(w3, a2) + b3
    a3 = linear(z3)

    q_target = a3

    # predicted q value
    current_s = np.zeros((maze_size[0]*maze_size[1], 1))
    current_s[current_state] = agent
    z1 = np.dot(w1, current_s) + b1
    a1 = relu(z1)

    z2 = np.dot(w2, a1) + b2
    a2 = relu(z2)

    z3 = np.dot(w3, a2) + b3
    a3 = linear(z3)
    q_predicted = a3

    ## backward
    target = np.zeros((4, 1))
    
    if reward == goal_reward:
        target[action] = reward
    else:
        target[action] = reward + gamma*np.max(q_target)

    ## cost
    cost = 0.5*(max(target) - q_predicted[action])**2

    da3 = -1*(target - q_predicted)
    
    dz3 = da3*1
    dw3 = np.dot(dz3, a2.T)
    db3 = dz3
    dz2 = np.multiply(np.dot(w3.T, dz3), relu_prime(z2))
    dw2 = np.dot(dz2, a1.T)
    db2 = dz2

    dz1 = np.multiply(np.dot(w2.T, dz2), relu_prime(z1))
    dw1 = np.dot(dz1, current_s.T)
    db1 = dz1
    # update params
    w3 = w3 - alpha*dw3
    b3 = b3 - alpha*db3

    w2 = w2 - alpha*dw2
    b2 = b2 - alpha*db2

    w1 = w1 - alpha*dw1
    b1 = b1 - alpha*db1

    return w1, b1, w2, b2, w3, b3, cost
