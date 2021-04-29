import random
import numpy as np

# Python program to convert decimal to binary

# Function to convert Decimal number
# to Binary number

# Function to convert decimal to binary
# upto k-precision after decimal point
def decimalToBinary(num, k_prec) :

    binary = ""

    # Fetch the integral part of
    # decimal number
    Integral = int(num)

    # Fetch the fractional part
    # decimal number
    fractional = num - Integral

    # Conversion of integral part to
    # binary equivalent

    rem = Integral % 2

    # Append 0 in binary
    binary += str(rem);


    # Reverse string to get original
    # binary equivalent
    binary = binary[ : : -1]

    # Append point before conversion
    # of fractional part
    binary += '.'

    # Conversion of fractional part
    # to binary equivalent
    while (k_prec) :

        # Find next bit in fraction
        fractional *= 2
        fract_bit = int(fractional)

        if (fract_bit == 1) :

            fractional -= fract_bit
            binary += '1'

        else :
            binary += '0'

        k_prec -= 1

    return binary


# Driver code
if __name__ == '__main__':
    f = open("hdl/testvector.tv", "w+")
    dec = open("testvectordec.txt", "w+")
    x = 0
    y = 0
    z = 0
    f.write("Q\t\tN\t\tD\n")
    for i in range(0, 30):
        x = random.uniform(0, 2)
        y = random.uniform(0, 2)
        z = x / y
        while z > 2:
            x = random.uniform(0, 2)
            y = random.uniform(0, 2)
            z = x / y

        f.write(decimalToBinary(z, 16))
        f.write("_")
        f.write(decimalToBinary(x, 16))
        f.write("_")
        f.write(decimalToBinary(y, 16))
        f.write("\n")
        dec.write(str(x) + " / ")
        dec.write(str(y) + " = ")
        dec.write(str(z))
        dec.write("\n")
    f.close()
    dec.close()
