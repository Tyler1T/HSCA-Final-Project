f = open("mux4byX.txt", "a")
for i in range(0, 19):
    f.write("mux4 m" + str(i) + " (d0[" + str(i) + "], ")
    f.write("d1[" + str(i) + "], ")
    f.write("d2[" + str(i) + "], ")
    f.write("d3[" + str(i) + "], ")
    f.write("S, ")
    f.write("Y[" + str(i) + "]);\n")
f.close()
