//**************************************************************************
//
// Project 2
// Ailish Stein
// ET2100
// Ohio University
// November 4th 2019 
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

int getDaysInMonth(int year, int month);
void testDaysInMonth();

int isValidDate(int year, int month, int day);
void testValidDate();

int getDayInYear(int year, int month, int day);
void testDayInYear();

void writeDate(int year, int month, int day);
void testWriteDate();

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
		printf("\nD: Test for Days in Month");
		printf("\nL: Test for Leap Year");
		printf("\nV: Test Valid Date");
		printf("\nY: Get Day in Year");
		printf("\nW: Write Date");
		printf("\nQ: Quit.");
		printf("\n");
		printf("\nEnter a choice in <H,L,D,Y,W,Q>:");
	}
 int eventHandler (char event){
                switch (event){
                        case 'h':
                        case 'H':
                            printf("\nHello. My name is Ailish!\n");
                            break;
			case 'd':
			case 'D':
			    testDaysInMonth();
			    break;
                        case 'l':
                        case 'L':
                            testLeapYear();
                            break;
			case 'V':
			case 'v':
			    testValidDate();
			    break;
			case 'y':
			case 'Y':
			    testDayInYear();
			    break;
			case 'w':
			case 'W':
			    testWriteDate();
			    break;
                        case 'q':
                        case 'Q':
                            return TRUE;
                        default:
                            printf("\n\aBAD INPUT. Try again\n");
                }
        return FALSE;
        }

int isLeapYear(int year){
	if (year%400 == 0){
		return TRUE;
	}
	if(year%100 == 0){
		return FALSE;
	}
	if(year % 4 == 0){
		return TRUE;
	}
	else { 
	return FALSE;
	}	
}

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

int getDaysInMonth(int year, int month){
switch (month){
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
	return 31;
		break;
		case 4:
		case 6:
		case 9:
		case 11:
	return 30;
		break;
		case 2:
		    if(isLeapYear(year)){
			return 29;
		    }
		    else{
			return 28;
		    }
	printf("\n\n Month number %d is invalid", month);
		return 0;
}}
void testDaysInMonth(){
	printf("\nEnter a year:");
	int year;
	scanf("%d", &year);
	printf("\nEnter a month as it's number:");
	int month;
	scanf("%d", &month);
	switch(getDaysInMonth(year,month)){
		case 31:
			printf("\n\n Month %d has 31 days", month);
		break;
		case 30:
			printf("\n\n Month %d has 30 days", month);
		break;
		case 29:
			printf("\n\n Month %d has 29 days", month);
		break;		
		case 28:
			printf("\n\n Month %d has 28 days", month);
	}
}
int isValidDate(int year, int month, int day){
	if(year < 1){
		return FALSE;
	}
	if(month > 12){
		return FALSE;
	}
	if(day < 1){
		return FALSE;
	}
	if(day > getDaysInMonth (year, month)){
		return FALSE;
	}
	else{
	return TRUE;
	}
}
void testValidDate(){
	printf("\nEnter date information in yyyy mm dd format.");
	printf("\nEnter year: ");
	int year;
	scanf("%d", &year);
	printf("\nEnter month: ");
	int month;	
	scanf("%d", &month);
	printf("\nEnter day: ");
	int day;	
	scanf("%d", &day);

	if(isValidDate(year, month, day)){
		printf("%d  %d  %d is a valid date.", year, month, day);
	}
	else{
		printf("%d  %d  %d is not a valid date.", year, month, day);
	}
}
int getDayInYear(int year, int month, int day){
	int retVal = 0;
	for(int m = 1; m<month; ++m){
		retVal += getDaysInMonth (year, m);
	}
		retVal += day;
		return retVal;
}

void testDayInYear(){
	printf("\nTest Day in Year");
	printf("\n\n");
	int year;
	int month;
	int day;
	printf("\nEnter a date in yyyy mm dd format.");
	printf("\nEnter year:");
	scanf("%d", &year);
	printf("\nEnter month:");
	scanf("%d", &month);
	printf("\nEnter day:");
	scanf("%d", &day);
	if(isValidDate(year, month, day)){
		printf("\n\nDay in year is %d", getDayInYear(year, month, day));
	}
	else{
		printf("\n\nBad Date Entered");
	}
}
void writeDate(int year, int month, int day){
	if(isValidDate(year, month, day)){
		printf("\nYear %d, Month %d, Day %d is day %d in the year", year, month, day, getDayInYear(year, month, day));
	} else{
		printf("\nYear %d, Month %d, Day %d is NOT a valid date.", year, month, day);
	}

}
void testWriteDate(){
	printf("\n Test Write Date Function");
	printf("\nEnter a date in yyyy mm dd format");
	int year;
	int month;
	int day;
	printf("\nEnter year:");
	scanf("%d", &year);
	printf("\nEnter month:");
	scanf("%d", &month);
	printf("\nEnter day:");
	scanf("%d", &day);
	writeDate(year, month, day);
}


















