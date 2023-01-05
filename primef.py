mport sys

def primef(n):
    # Check if n is less than or equal to 3
    if n <= 3:
        return int(n)

    # Check if n is even
    if n % 2 == 0:
        return 2
    # Check if n is a multiple of 3
    elif n % 3 == 0:
        return 3
    # Check if n is a multiple of 5
    elif n % 5 == 0:
        return 5
    else:
        # Iterate through the range [5, sqrt(n)]
        for i in range(5, int((n)**0.5) + 1, 6):
            # Check if n is a multiple of i
            if n % i == 0:
                return int(i)
            # Check if n is a multiple of (i + 2)
            if n % (i + 2) == 0:
                return primef(n/(i+2))
    # If no factors were found in the range [5, sqrt(n)], return n
    return int(n)

# Print the result of calling "primef" with the first command-line argument
print(primef(int(sys.argv[1])))
