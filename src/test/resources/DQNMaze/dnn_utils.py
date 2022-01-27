import numpy as np
import math

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
