#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

int main(int argc, char *argv[]) {
   
   //string inputFile;
   // string outputFile;

   if (argc != 3) {
   cout << "Usage: progname inputFile outputFile" << endl;
   return 1;
}
   
   // Assign to inputFile value of 2nd command line argument
   // Assign to outputFile value of 3rd command line argument

   string inputFile = argv[1];
   string outputFile = argv[2];
   
   // Create input stream and open input csv file.
   ifstream fin(inputFile);

   
   // Verify file opened correctly.
   // Output error message and return 1 if file stream did not open correctly.

   if (!fin) {
      cout << "Error opening " << inputFile << endl;
      return 1;
   }
   
   // Read in integers from input file to vector.
   int x, sum = 0, count = 0;
   char delimiter;
   vector <int> vec;
   string vector;
   while(fin >> x){
      vec.push_back(x);
      ++count;
      sum += x;
      fin >> delimiter;
      cout << x << " " << endl;
   }
   // Close input stream.
   fin.close();
   // Get integer average of all values read in.
   int avg = sum/count;

   ofstream fout(outputFile);
   for (unsigned int i = 0; i < vec.size()-1; i++){
      fout << vec.at(i) - avg;
      fout << " , ";
   }
      fout << vec.at(vec.size()-1) - avg;
      fout.close();
   
   // Convert each value within vector to be the difference between the original value and the average.
   
   // Create output stream and open/create output csv file.

   // Verify file opened or was created correctly.
   // Output error message and return 1 if file stream did not open correctly.
   
   // Write converted values into ouptut csv file, each integer separated by a comma.
   
   // Close output stream.
   return 0;
}