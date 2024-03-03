def array_to_file(array, path):
    with open(path, 'w') as f:
        for i, value in enumerate(array):
            f.write(f"{value}\n")