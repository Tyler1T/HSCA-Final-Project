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
    f = open("../hdl/testvector.tv", "w+")
    dec = open("testvectordec.txt", "w+")
    x = 0
    y = 0
    z = 0
    IA = 0
    for i in range(0, 30):
        x = random.uniform(1, 2)
        y = random.uniform(1, 2)
        IA = random.uniform(1, 2)
        z = x / y
        while z > 2:
            x = random.uniform(1, 2)
            y = random.uniform(1, 2)
            z = x / y

        f.write(decimalToBinary(z, 16))
        f.write("_")
        f.write(decimalToBinary(x, 16))
        f.write("_")
        f.write(decimalToBinary(y, 16))
        f.write("\n")
        dec.write(r"// Test " + str(i) + "\n" + "// Numbers are: " + str(x) + " / " + str(y) + " = " + str(z) + "\n" + "// Result should be near 1.2 or 1001100110001\n")
        dec.write("// IA is " + str(IA) + "\n\n")
        dec.write("#0 IA = 16'b" + decimalToBinary(IA, 16) + ";\n")
        dec.write("#0 N = 16'b" + decimalToBinary(x, 16) + ";\n")
        dec.write("#0 D = 16'b" + decimalToBinary(y, 16) + ";\n\n\n")

    f.close()
    dec.close()
