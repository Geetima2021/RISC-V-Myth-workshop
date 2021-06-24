#include <stdio.h>
#include <math.h>

int main () {
	unsigned long long int max = (unsigned long long int) (pow(2,64) -1);
	unsigned long long int min = (unsigned long long int) (pow(2,64) *-1);
	printf("Highest number representation by unsigned long long is %llu\n",max);
	printf("Lowest number representation by unsigned long long is %llu\n",min);
	return 0;
	}
