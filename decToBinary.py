# Python program to convert decimal to binary

# Function to convert Decimal number
# to Binary number
def decimalToBinary8(n):
    return format(n, "08b")

def decimalToBinary4(n):
    return format(n, "04b")

def decimalToBinary15(n):
    return format(n, "015b")

def decimalToNBinary(q, n):
    return format(q, "0" + str(n) + "b")

# Driver code
if __name__ == '__main__':
    f = open("hdl/testvector.tv", "w+")
    x = 0
    y = 0
    z = 0
    #for i in range(0, 5):
    print("What is the first number to multiply by?")
    x = int(input())
    print("What is the second number to multiply by?")
    y = int(input())
    z = x*y
    f.write(decimalToNBinary(z, 32))
    f.write("_")
    f.write(decimalToNBinary(x, 16))
    f.write("_")
    f.write(decimalToNBinary(y, 16))
    f.write("\n")
    print()
    f.close()
