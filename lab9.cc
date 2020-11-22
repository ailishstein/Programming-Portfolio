/***********************************************************************
* Ailish Stein
* Ohio University
* 3/26/20
* Description: Producing an output file using iostream
***********************************************************************/

#include <cstdlib>
#include <iostream>
#include <string>
#include <iomanip>
#include <fstream>
using namespace std;

string getInputOutputStreams(ifstream &inStream, ofstream &outStream);
void numberFile(ifstream &inStream, ofstream &outStream);

int main() {
	ifstream inStream;
	ofstream outStream;
	getInputOutputStreams(inStream, outStream);
	numberFile(inStream, outStream);
	return EXIT_SUCCESS;
}

string getInputOutputStreams(ifstream &inStream, ofstream &outStream){
	string fileName;
	string ofileName;

	do{
		cout << "/nEnter the input file name: ";	// instream file check
		cin >> fileName;
		inStream.open(fileName);
	}while(inStream.fail());
	do{
		cout << "Enter the output file name: ";		// outstream file check
		cin >> ofileName;
		outStream.open(ofileName);
	}while(outStream.fail());
	return fileName, ofileName;
}
void numberFile(ifstream &inStream, ofstream &outStream){
	string fileName;
	string ofileName;
	int number = 0;
	string lines;
	while(getline(inStream, lines)){			// count only the lines with a non-blank string
		if(lines == ""){}
		else{
			number++;
			outStream << number << ". " << lines << endl;
			getline(inStream, lines);
		}
	}
	cout << number << " lines processed ";
	inStream.close();
	outStream.close();
}
