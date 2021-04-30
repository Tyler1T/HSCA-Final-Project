f = open("carryChain.txt", "a")
for i in range(2, 32):
    f.write("half_adder CPA" + str((i)) + "(carry[" + str((i)) + "], toMux[" + str(i) + "], oneC[" + str(i) + "], carry[" + str((i - 1)) + "]);\n")
f.close()
