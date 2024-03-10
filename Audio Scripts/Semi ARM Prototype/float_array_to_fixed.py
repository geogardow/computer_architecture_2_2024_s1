def float_array_to_fixed(samples, int_bits=7, float_bits=8):
    samples_fixed = []
    for element in samples:
        if element < 0:
            binary = "1"
        else: 
            binary = "0"
        integer = bin(int(abs(element)))[2:].zfill(int_bits)
        binary = binary + integer
        decimal = abs(element) - int(abs(element))
        sum = 0
        for i in range(float_bits):
            if sum + 2**(-(i+1)) <= decimal:
                sum += 2**(-(i+1))
                binary = binary + "1"
            else:
                binary = binary + "0"
        samples_fixed.append(binary)

    return samples_fixed