/*************************************
* Ailish Stein
* Ohio University
* 04/17/20
* Part A of lab 12 - counter class
*************************************/

#include <cstdlib>
#include <iomanip>
#include <string>
#include <vector>
#include <iostream>
using namespace std;

// Class counter - needs a value //
class Counter
{
	public:
	Counter();
	Counter(int new_val);
	void increment();
	int get_value();

	private:
	int value;
};

/*****************************************************************
* Counter() - initializes value 
* Counter(int new_val) - converts new_val into val
* int Counter::get_value() - returns value
* void Counter::increment() - increases value by 1
*****************************************************************/
Counter::Counter(){
	value = 6;
}
Counter::Counter(int new_val){
	value = new_val;
}

int Counter::get_value(){
	return value;
}
void Counter::increment(){
	value++;
}

int main(){
	Counter c;
	cout << "Value at the beginning " << c.get_value() << endl;
	if(c.get_value() < 10){ //uses get_value function from above
		c.increment(); //increments value from above
	} else{
		cout << "Enter another value under 10" << endl;
		exit(0);
	}
	cout << "Value at the end " << c.get_value() << endl; //outputs the incremented value
}
