#include <fstream>
#include <iostream>
#include <string>
#include <cstdlib> //needed for exit function

using namespace std;

int fileSum(string filename);

int main() {

   string filename;
   int sum = 0;
   
   cout << "Enter the name of the input file: ";
   cin >> filename;
   cout << endl;
   
   sum = fileSum(filename);

   cout << "Sum: " << sum << endl;
   
   return 0;
}
   int fileSum(string filename){
   ifstream fin;
   fin.open(filename);
   int sum = 0;
   if (!fin) {
      cout << "Error opening " << filename << endl;
      system("pause");
      exit(1);}
   else
   {
       int value;
       //read file until end of file exist
       while(fin>>value)
       {
           sum+=value;
       }
   }

   return sum;

}

