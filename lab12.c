//***********************************************************
//
// Ailish Stein
// November 11th 2019
// Ohio University 
// Lab 12
//
//***********************************************************

#include <stdio.h>
void write5(int x[], int size);
int linearSearch(int x[], int size, int target);

int main(){
	printf("\n\nLinear Search Program");
	printf("\nProgrammer: Ailish Stein");
	const int SIZE = 29;
	int a[] = { 23, -11, 24, 19, 19,
		    66, 95, 0, -44, 33,
		    91, 191404498, 32, 48, 101,
		    55, 28, -21, -3, 18,
		    501, 46, 4, 72, -123456,
		    273849, 212, 512, 1048 };
	write5(a, SIZE);
	int target = 101;
	int locTarg = linearSearch(a, SIZE, target);
		if(locTarg < SIZE){
			printf("\n\nTarget %d is in the array at index %d", target, locTarg);
		} else {
			printf("\n\nTarget %d is not in the array.", target);
		}
	target = -101;
	locTarg = linearSearch(a, SIZE, target);
		if(locTarg < SIZE){
			printf("\n\nTarget %d is in the array at index %d", target, locTarg);
		} else {
			printf("\n\nTarget %d is not in the array.", target);
		}
	printf("\nEnd of Program\n");
	return 0;
}
void write5(int x[], int size){
	printf("\n\nWrite5 total is:");
	
	for(int i = 0; i < size; ++i){
		if (i % 5 == 0){
			printf("\n");
		}
		if (i % 25 == 0){
			printf("\n");
		}
		printf("%12d", x[i]);
	}
	printf("\n\n");
}
int linearSearch(int x[], int size, int target){
	for(int i = 0; i < size; ++i){
		if( x[i] == target){
			return i;
		}
	}
	return size;
}
