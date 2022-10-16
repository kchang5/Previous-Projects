#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
using namespace std;

template<typename T>
unsigned min_index(const vector<T> &vals, unsigned index){
    unsigned minValue = index;

    for (unsigned i = index + 1; i < vals.size(); ++i){
        if (vals.at(minValue) > vals.at(i)){
            minValue = i;
        }
    }

    return minValue;
}


template<typename T>
void selection_sort(vector<T> &vals){
    for (unsigned i = 0; i + 1 < vals.size(); ++i){
        unsigned minValue = min_index(vals, i);
        T temp = vals.at(i);
        vals.at(i) = vals.at(minValue);
        vals.at(minValue) = temp;
    }
}

template<typename T>
T getElement(vector<T> vals, int index) {
    return vals.at(index);
}

template<typename T>
void print_vector(vector<T> &vals)
{
    for (unsigned i = 0; i < vals.size(); ++i)
    {
        cout << vals.at(i) << " ";
    }
    cout << endl;
}
vector<char> createVector(){
    int vecSize = rand() % 26;
    char c = 'a';
    vector<char> vals;
    for(int i = 0; i < vecSize; i++)
    {
        vals.push_back(c);
        c++;
    }
    return vals;
}

int main(){
    //Part B
     srand(time(0));
     vector<char> vals = createVector();
     char curChar;
     int index;
     int numOfRuns = 10;
     while(--numOfRuns >= 0){
         cout << "Enter a number: " << endl;
         cin >> index;
         curChar = getElement(vals,index);
         cout << "Element located at " << index << ": is " << curChar << endl;
    }
    return 0;
}