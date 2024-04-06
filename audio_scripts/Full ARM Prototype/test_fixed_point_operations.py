import numpy as np
from fixed_point_operations import clivec, cadvec, multvecesc, addvecesc, andvecesc

def test_multvecesc():
    # Test case 1
    array = np.array(['0000000000000001', '0000000000000010', '0000000000000100'])
    binary_number = '0000000000000011'
    expected_result = np.array(['0000000000000011', '0000000000000110', '0000000000001100'])
    assert np.array_equal(multvecesc(array, binary_number), expected_result)

    # Test case 2
    array = np.array(['1111111111111111', '0000000000000001', '1111111111111111'])
    binary_number = '0000000000000010'
    expected_result = np.array(['1111111111111110', '0000000000000010', '1111111111111110'])
    assert np.array_equal(multvecesc(array, binary_number), expected_result)

    # Test case 3
    array = np.array(['0101010101010101', '1010101010101010', '0101010111111101'])
    binary_number = '1111111111111111'
    expected_result = np.array(['1010101010101011', '0101010101010110', '1010101000000011'])
    assert np.array_equal(multvecesc(array, binary_number), expected_result)

def test_addvecesc():
    # Test case 1
    array = np.array(['0000000000000001', '0000000000000010', '0000000000000100'])
    binary_number = '0000000000000011'
    expected_result = np.array(['0000000000000100', '0000000000000101', '0000000000000111'])
    assert np.array_equal(addvecesc(array, binary_number), expected_result)

    # Test case 2
    array = np.array(['1111111111111111', '0000000000000001', '1111111111111111'])
    binary_number = '0000000000000010'
    expected_result = np.array(['0000000000000001', '0000000000000011', '0000000000000001'])
    assert np.array_equal(addvecesc(array, binary_number), expected_result)

    # Test case 3
    array = np.array(['0101010101010101', '1010101010101010', '0101010111111101'])
    binary_number = '1111111111111111'
    expected_result = np.array(['0101010101010100', '1010101010101001', '0101010111111100'])
    assert np.array_equal(addvecesc(array, binary_number), expected_result)

def test_andvecesc():
    # Test case 1
    array = np.array(['0000000000000001', '0000000000000010', '0000000000000100'])
    binary_number = '0000000000000011'
    expected_result = np.array(['0000000000000001', '0000000000000010', '0000000000000000'])
    assert np.array_equal(andvecesc(array, binary_number), expected_result)

    # Test case 2
    array = np.array(['1111111111111111', '0000000000000001', '1111111111111111'])
    binary_number = '0000000000000010'
    expected_result = np.array(['0000000000000010', '0000000000000000', '0000000000000010'])
    assert np.array_equal(andvecesc(array, binary_number), expected_result)

    # Test case 3
    array = np.array(['0101010101010101', '1010101010101010', '0101010111111101'])
    binary_number = '1111111111111111'
    expected_result = np.array(['0101010101010101', '1010101010101010', '0101010111111101'])
    assert np.array_equal(andvecesc(array, binary_number), expected_result)

# Run the tests
test_multvecesc()
test_addvecesc()
test_andvecesc()

array = np.array(['0101010101010101', '1010101010101010', '0101010111111101'])
print(clivec(array, 8))