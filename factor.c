#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    // Check that a file name was provided as an argument
    if (argc < 2) {
        fprintf(stderr, "Usage: factors <file>\n");
        return 1;
    }

    // Open the file
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    // Read the numbers from the file, one line at a time
    while (!feof(file)) {
        // Read a line from the file
        char line[1024];
        if (fgets(line, sizeof(line), file)) {
            // Convert the line to an integer
            int n = atoi(line);

            // Print the factorization of n
            printf("%d=", n);

            // Find the factors of n
            int found = 0;
            for (int i = 2; i <= n/2; i++) {
                if (n % i == 0) {
                    printf("%d*%d", i, n/i);
                    found = 1;
                    break;
                }
            }

            // If no factors were found, the number is prime
            if (!found) {
                printf("%d*1", n);
            }

            // Print a newline after each factorization
            printf("\n");
        }
    }

    // Close the file
    fclose(file);

    return 0;
}
