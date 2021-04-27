import random
import numpy as np

# Python program to convert decimal to binary

# Function to convert Decimal number
# to Binary number

def decimalToNBinary(q, n):
    return format(q, "0" + str(n) + "b")

def intToBinary(n):
    return format(n, "02b")

def fracToBinary(n):
    return format(n, "02b")

# Driver code
if __name__ == '__main__':
    f = open("hdl/testvector.tv", "w+")
    dec = open("testvectordec.txt", "w+")
    x = 0
    y = 0
    z = 0
    for i in range(0, 30):
        x = random.uniform(0, 2)
        y = random.uniform(0, 2)
        z = x / y
        f.write(decimalToNBinary(int(z), 32))
        f.write("_")
        f.write(decimalToNBinary(x, 16))
        f.write("_")
        f.write(decimalToNBinary(y, 16))
        f.write("\n")
        dec.write(str(x) + " / ")
        dec.write(str(y) + " = ")
        dec.write(str(z))
        dec.write("\n")
    f.close()
    dec.close()
