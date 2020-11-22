/* Ailish Stein
/  March 3rd 2020
*  title lab8.cc
*  Description: Using cryptography and making a Caesar Cipher */

#include <cstdlib>
#include <iostream>
#include <fstream>
using namespace std;

void displayMenu();
void shiftkey(int shift);
void encrypt(int key);
void decrypt(int key);

int main(){
int choice, key;
key = 3; //default
do {
    displayMenu();
    cin >> choice; 							//display choices in main
	if (choice == 1) {
	    shiftkey(key);
	}
	else if (choice == 2) {
	    encrypt(key);
	}
	else if (choice == 3) {
	    decrypt(key);
	}
	} while(choice != 4);
return 0;
}


void displayMenu(){							//menu function

    cout << "1. Set the shift key value (default is 3)" << endl;
    cout << "2. Encrypt a file" << endl;
    cout << "3. Decrypt a file" << endl;
    cout << "4. Quit" << endl;
}

void shiftkey(int key){							//set shift key
do{
    cout << "Please enter a shift key value between 1  and 10" << endl;
    cin >> key;
    
    } while( key < 1 || key > 10);

}

void encrypt(int key){							// encrypt function
 string fileName;
 string ofileName;
 ofstream outStream;
 ifstream inStream;
 char ch;
 char output;
    cout << "Enter the input file name: ";
    cin >> fileName;
    cout << "Enter the output file name: ";
    cin >> ofileName;
    inStream.open(fileName);						//Test files for failure
    if(inStream.fail()){	
	cout << "Error. File did not open";
        exit (0);
    }
    outStream.open(ofileName);	
    if(outStream.fail()){
	cout << "Error. File did not open";
        exit (0);
    }
	while(inStream.get(ch)){					//output char + shift value
	    output = key + ch;
	    outStream << output;
	}
    
    outStream.close();							//close files
}
		
void decrypt(int key){							//Decrypt function
     string fileName;
 string ofileName;
 ofstream outStream;
 ifstream inStream;
 char ch;
 char output;
    cout << "Enter the input file name: ";
    cin >> fileName;
    cout << "Enter the output file name: ";
    cin >> ofileName;
    inStream.open(fileName);						//Test files for failure
    if(inStream.fail()){
	cout << "Error. File did not open";
        exit (0);
    }
    outStream.open(ofileName);
    if(outStream.fail()){
	cout << "Error. File did not open";
        exit (0);
    }
	while(inStream.get(ch)){					//output char - shift value
	    output = ch - key;
	    outStream << output;
	}
    
    outStream.close();							//close files
}


