//*****************************************************************************
//
// Ailish Stein
// Ohio University
// ET2100
// Lab 13
//
//*****************************************************************************

#include <stdio.h>
#include <stdlib.h>

int main(){
	printf("\nFarenheit to Celsius Conversion: Ailish Stein");
	printf("\n Temperature		Fahrenheit		Celsius");
	double tempf[21];
	double tempc[21];

	FILE * fp;
	fp = fopen("Lab13Data.txt","r");

	int size_of_array;
	fscanf(fp,"%d", &size_of_array);
	
	for(int i=0; i < size_of_array; ++i){
		fscanf(fp,"%lf", &tempf[i]);
		
	}

	for(int i=0; i < size_of_array; ++i){
		tempc[i] = (5.0/9.0)*(tempf[i] - 32.0);
		
	}
	for(int i=0; i < size_of_array; ++i){
		printf("\n%6d %25.2lf %25.2lf", i, tempf[i], tempc[i]);
	}
	fclose(fp);
	return 0;
}
