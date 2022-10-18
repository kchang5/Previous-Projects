#include "minFunc.h"
#include <string>
#include <iostream>

using namespace std;
const int * min(const int arr[], int arrSize){
	if (arr ==  NULL|| arrSize == 0){
	return nullptr;
}
    if (arrSize <= 1){
        return arr;
    }
    const int* t = min(arr, arrSize - 1);
    if (*t > arr[arrSize - 1]){
        return arr + arrSize - 1;
    }
    else{
        return t;
    }
}
