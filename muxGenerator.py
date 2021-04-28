f = open("mux4by16.txt", "a")
for i in range(0, 16):
    f.write("mux4 m" + str(i) + " (Y[" + str(i) + "], ")
    f.write("d0[" + str(i) + "], ")
    f.write("d1[" + str(i) + "], ")
    f.write("d2[" + str(i) + "], ")
    f.write("d3[" + str(i) + "], ")
    f.write("S);\n")
f.close()
