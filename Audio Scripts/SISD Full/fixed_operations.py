def mult(number1, number2, int_bits=7, float_bits=8):
    a = number1[1:int_bits+1]
    b = number1[int_bits+1:]
    c = number2[1:int_bits+1]
    d = number2[int_bits+1:]
    high = bin(int(a,2)*int(c,2))[2:]
    high = bin(int(a,2)*int(c,2))[2:]