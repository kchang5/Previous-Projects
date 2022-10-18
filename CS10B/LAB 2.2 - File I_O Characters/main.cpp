#include <fstream>
#include <iostream>
#include <cstdlib>

using namespace std;

int charCnt(string,char);

int main() {
   string filename;
   char ch;
   int chCnt = 0;
   
   cout << "Enter the name of the input file: ";
   cin >> filename;
   cout << endl;
   cout << "Enter a character: ";
   cin.ignore(); // ignores newline left in stream after previous input statement
   cin.get(ch);
   cout << endl;

   chCnt = charCnt(filename, ch);   
   cout << "# of " << ch << "'s: " << chCnt << endl;
   
   return 0;
}

   int charCnt(string FileName,char ch){
   ifstream fin(FileName);
   if(fin.is_open()){  
      int count=0;
      char cha;
      while(fin){  
         fin.get(cha);
         if(cha==ch)
            count++;
      }
      return count;
   }
else{  
      cout << "Error opening " << FileName << endl;
      exit(1);
   }

}