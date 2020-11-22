/*****************************************
* Ailish Stein
* Ohio University
* 04/17/20
* Lab 12 Part 2 - Tollbooth problem
*****************************************/

#include <cstdlib>
#include <iomanip>
#include <iostream>
#include <cctype>
#include <vector>
#include <fstream>
using namespace std;
// Class Tollbooth - needs number of cars and amount of money //
class Tollbooth{
	public:
	Tollbooth();
	void payinCar();
	void nopayCar();
	void display();

	private:
	int car;
	double money;
};
/******************************************************************
* Functions (in order):
* Default constructor - initializes values
* payinCar - adds 1 car to counter, adds $ 0.50 to money 
* nopayCar - adds 1 car to counter
* display - displays the number of cars and money collected
******************************************************************/
Tollbooth::Tollbooth(){
	 car = 0;
	 money = 0;
}

void Tollbooth::payinCar(){
	car++;
	money += 0.50;
}

void Tollbooth::nopayCar(){
	car++;
}

void Tollbooth::display(){
	cout << "Total number of cars: " << car << endl;
	cout << "Total amount collected: $" << fixed << setprecision(2) << showpoint << money << endl;
}

int main(int argc, char const *argv[]){
	Tollbooth toll;
	char ch;
	do{
		cout << "P - paid   N - Not paid   Q - Quit  ->";
		cin >> ch;
		switch( ch = toupper(ch)){ //changes all of the characters to upper
			case 'P':
			toll.payinCar(); //payinCar function - above
			break;

			case 'N':
			toll.nopayCar(); //nopayCar function - above
			break;
		}
	}while(ch != 'Q');
	toll.display(); // displays the output to screen
	return(0);
}
