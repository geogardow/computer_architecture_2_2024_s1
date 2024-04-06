from mif_recover import *

live = mif_recover("./Audio Scripts/Semi ARM Prototype/simd8.mif")[:-15]
memory = mif_recover("./Audio Scripts/Semi ARM Prototype/memory.mif")

coincidences = 0
for i in range(len(live)):
    if live[i] == memory[i]:
        coincidences+=1

print(coincidences)