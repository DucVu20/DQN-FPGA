import numpy as np
import time
from configuration import *

class NeuralNetwork:

    def __init__(self, num_inputs, first_hidden, second_hidden, outputs):
        self.num_inputs = num_inputs
        self.first_hidden = first_hidden
        self.second_hidden = second_hidden
        self.outputs = outputs
        self.layer_dims = (num_inputs, first_hidden, second_hidden, outputs)
        self.parameters = self.initialize_parameters_DNN(self.layer_dims)

    def initialize_parameters_DNN(self, layer_dims):
        np.random.seed(3)
        parameters = {} # define a dictionary
        L = len(self.layer_dims)
        for l in range(1, L):
            parameters['w' + str(l)] = np.random.randn(layer_dims[l], layer_dims[l-1])
            parameters['b' + str(l)] = np.random.randn(layer_dims[l], 1)
        
        return parameters

    def feed_forward(self, inputs): # input is one hot encoding
        # first hiddent layer
        self.z1 = np.dot(self.parameters["w1"], inputs) + self.parameters["b1"]
        self.a1 = relu(self.z1)
        # second hiddent layer
        self.z2 = np.dot(self.parameters["w2"], self.a1) + self.parameters["b2"]
        self.a2 = relu(self.z2)
        # output layer
        self.z3 = np.dot(self.parameters["w3"], self.a2) + self.parameters["b3"]
        self.q = linear(self.z3)


    def backward(self, current_state, next_state, reward, action):
        self.target = self.feed_forward(next_state)
        self.q_predicted = self.feed_forward(current_state)

        self.q_target = np.zeros((self.outputs, 1))
        if reward == goal_reward:
            self.q_target[action] = reward
        else:
            self.q_target[action] = reward + gamma*np.max(self.target)
            
        self.cost = 0.5*(max(self.q_target) - self.q_predicted[action])**2

        # backward

        self.da3 = -1*(self.target - self.q_predicted)
    
        dz3 = self.da3*1
        dw3 = np.dot(dz3, self.a2.T)
        db3 = dz3
        dz2 = np.multiply(np.dot(self.w3.T, dz3), relu_prime(self.z2))
        dw2 = np.dot(dz2, self.a1.T)
        db2 = dz2

        dz1 = np.multiply(np.dot(self.w2.T, dz2), relu_prime(self.z1))
        dw1 = np.dot(dz1, current_state.T)
        db1 = dz1

        # update params
        self.w3 = self.w3 - alpha*dw3
        self.b3 = self.b3 - alpha*db3
        
        self.w2 = self.w2 - alpha*dw2
        self.b2 = self.b2 - alpha*db2
        
        self.w1 = self.w1 - alpha*dw1
        self.b1 = self.b1 - alpha*db1
        

# Activation functions and their derivatives
def sigmoid(z):
    return 1.0/(1.0 + np.exp(-z))

def sigmoid_prime(z):
    return sigmoid(z)*(1.0 - sigmoid(z))

def softmax(x):
    return (np.exp(np.array(x)) / np.sum(np.exp(np.array(x))))

def softmax_prime(x):
    return softmax(x)*(1.0-softmax(x))

def relu(z):
    return np.maximum(0, z)

def relu_prime(a):
    g = []
    for activation in a:
        if activation>0:
            g.append(1)
        else:
            g.append(0)
    g = np.reshape(g, (a.size, 1))
    return g

# def softmax(x):
#     A = (math.exp(1)**x)/(math.exp(1)**x).sum()
#     cache = x

#     return A, cache

def linear(x):
    return x