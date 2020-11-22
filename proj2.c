//**************************************************************************
//
// Project 2
// Ailish Stein
// ET2100
// Ohio University
// October 14th 2019 
//
//**************************************************************************

#include <stdio.h>

const int FALSE = 0;
const int TRUE = 1;
const int EXIT_SUCCESS = 0;
void eventLoop();
void writeMenu();
int eventHandler (char event);
int isLeapYear (int year);
void testLeapYear();
void waitUp();
int main(){
	printf("\n\nProject 2.\n\n");
	eventLoop();
	printf("\nEnd of Project 2.\n\n");
	return EXIT_SUCCESS;
}
	void eventLoop(){
	int done = FALSE;
	char event;
	while (! done) {
		writeMenu();
		scanf(" %c", &event);
		done = eventHandler (event);
	}
	}
	void writeMenu(){
		printf("Project 2 Part 1 			Ailish Stein");
		printf("\n");
		printf("\nChoose one of the following:");
		printf("\nH: Hello from programmer");
		printf("\nL: Test for Leap Year");
		printf("\nQ: Quit.");
		printf("\n");
		printf("\nEnter a choice in <H,L,Q>:");
	}


int isLeapYear(int year){
	if (year%400 == 0){
		return TRUE;
}
	if(year%100 == 0){
		return FALSE;
}
	if(year % 4 ==0){
		return TRUE;
	}
	else { 
	return FALSE;
}}

void waitUp(){
	printf("\nEnter any key to continue:");
	char key;
	scanf (" %c", &key);
}
void testLeapYear(){
	int year;
	printf("\nEnter a year:");
	scanf("%d", &year);
	if (isLeapYear(year)){
		printf("\n\n%d is a leap year!", year);
		}

	 else{
			printf("\n\n%d is not a leap year.", year);
		  }
			waitUp();
		}

        int eventHandler (char event){
                switch (event){
                        case 'h':
                        case 'H':
                            printf("\nHello. My name is Ailish!\n");
                            break;
                        case 'l':
                        case 'L':
                            testLeapYear();
                            break;
                        case 'q':
                        case 'Q':
                            return TRUE;
                        default:
                            printf("\n\aBAD INPUT. Try again\n");
                }
        return FALSE;
        }


