import os
import time
import numpy as np

def assembler(file_location):
    try:
 #       with open(file_location, 'rb') as f:
        instructions = open(file_location, "r")
    except:
        print("the link received is not a file")

#    print(instructions)
    for instruction in instructions:

        ins = instruction.split(",")
        ins = str(ins).split(" ")
        print(ins)
        

    instructions.close()

assembler("instructions.txt")
