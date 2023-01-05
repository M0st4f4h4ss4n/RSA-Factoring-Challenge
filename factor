#!/usr/bin/env bash

# Check that a file name was provided as an argument
if [ $# -ne 1 ]; then
    echo 'Usage: factors <file>'
    exit 1
fi

# Open the file
while read i; do
    # Check if the number is even
    if [ $((i % 2)) -eq 0 ]; then
        # If the number is even, it has at least one factor of 2
        printf "$i=2*"
        i=$((i / 2))

        # Divide out any additional factors of 2
        while [ $((i % 2)) -eq 0 ]; do
            i=$((i / 2))
        done
    fi

    # Check if the remaining number is a prime number
    if [ $i -eq 1 ]; then
        printf "1"
    else
        # If the remaining number is not a prime number, find a factor in the range [3, sqrt(n)]
        for ((j = 3; j <= sqrt(i); j += 2)); do
            if [ $((i % j)) -eq 0 ]; then
                printf "$j*$((i / j))"
                break
            fi
        done

        # If no factors were found, the number is prime
        if [ $j -gt sqrt(i) ]; then
            printf "$i*1"
        fi
    fi

    # Print a newline after each factorization
    printf "\n"
done < "$1"
