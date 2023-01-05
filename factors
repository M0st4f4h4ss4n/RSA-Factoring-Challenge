#!/usr/bin/env bash

# Iterate through each line of the input file
while read i; do
    # Print the input number
    printf "$i="

    # Check if the number is even
    if [ $((i % 2)) -eq 0 ]; then
        # Print 2 and divide out any additional factors of 2
        printf "2*"
        i=$((i / 2))
        while [ $((i % 2)) -eq 0 ]; do
            i=$((i / 2))
        done
    fi

    # Check if the number is a multiple of 3
    if [ $((i % 3)) -eq 0 ]; then
        # Print 3 and divide out any additional factors of 3
        printf "3*"
        i=$((i / 3))
        while [ $((i % 3)) -eq 0 ]; do
            i=$((i / 3))
        done
    fi

    # Check if the number is greater than 3
    if [ $i -gt 3 ]; then
        # Iterate through the range [3, sqrt(n)]
        for j in $(seq 3 $(echo "sqrt($i)" | bc | awk '{print int($1)}')); do
            # Check if a factor is found
            if [ $((i % j)) -eq 0 ]; then
                # If a factor is found, print it and divide it out of the remaining number
                printf "$j*"
                i=$((i / j))
                # Divide out any additional factors of j
                while [ $((i % j)) -eq 0 ]; do
                    i=$((i / j))
                done
            fi
        done

        # If a factor was not found in the range [3, sqrt(n)], call the "primef" function to find a factor
        if [ $i -ne 1 ]; then
            factor=$(python primef.py $i)
            printf "$factor"
        fi
    fi
    printf "\n"
done < "$1"
