#include <iostream>
#include <cstdlib>
#include <ctime>
#include <cmath>
using namespace std;

const int NUMBERS_SIZE = 50000;
const int CLOCKS_PER_MS = CLOCKS_PER_SEC / 1000;	

int genRandInt(int low, int high) {
   return low + rand() % (high - low + 1);
}
void fillArrays(int arr1[], int arr2[],int arr3[]){
    for(int i = 0; i < NUMBERS_SIZE; ++i){
        arr1[i] = genRandInt(0,NUMBERS_SIZE);
        arr2[i] = arr1[i];
        arr3[i] = arr1[i];
    }
}

void Quicksort_Midpoint(int numbers[], int i, int k){
	if (i >=k) {
		return;
	}
	int pivot = numbers[i + (k - i) / 2];
	int left = i;
	int right = k;
	
	while(true) {
		while (numbers[left] < pivot) {
			left += 1;
		}
		while (numbers[right] > pivot) {
			right -= 1;
		}
		if (left >= right) {
			break;
		}
		else {
			int temp = numbers[left];
			numbers[left] = numbers[right];
			numbers[right] = temp;
			left += 1;
			right -= 1;
		}
	}

	Quicksort_Midpoint(numbers, i, right);
	Quicksort_Midpoint(numbers, right+1,k);
}
int median(int a, int b, int c) {
	if (a > b) {
		if (b > c) {
			return b;
		}
		else if (a > c) {
			return c;
		}
		else {
			return a;
		}
	}
	else {
		if (a > c) {
			return a;
		}
		else if (b > c) {
			return c;
		}
		else {
			return b;
		}
	}
}

void Quicksort_MedianOfThree(int numbers[], int i, int k) {
	if (k == i+1) {
		return;
	}
	
	int pivot = median(numbers[i], numbers[i + (k - i) / 2], numbers[k]);
	int left = i;
	int right = k;
	
	while(true) {
		while (numbers[left] < pivot) {
			left += 1;
		}
		while (numbers[right] > pivot) {
			right -= 1;
		}
		if (left >= right) {
			break;
		}
		else {
			int temp = numbers[left];
			numbers[left] = numbers[right];
			numbers[right] = temp;
			left += 1;
			right -= 1;
		}
	}
	
	Quicksort_MedianOfThree(numbers, i, right);
	Quicksort_MedianOfThree(numbers, right + 1, k);
}

void InsertionSort(int numbers[], int numbersSize) {
	for (int i = 1; i < numbersSize; i++) {
		// Insert numbers[i] into sorted part
      // stopping once numbers[i] in correct position
		int j = i;
		while (j > 0 && numbers[j - 1] > numbers[j]) {
			int temp = numbers[j];
			numbers[j] = numbers[j - 1];
			numbers[j - 1] = temp;
			--j;
		}
	}
}


int main() {
	srand(time(nullptr));
	
	int arr1[NUMBERS_SIZE];
	int arr2[NUMBERS_SIZE];
	int arr3[NUMBERS_SIZE];
	
	fillArrays(arr1, arr2, arr3);
	
	cout << "Sorting runtime for an array of " << NUMBERS_SIZE << " integers: " << endl;
	
	clock_t start = clock();
	Quicksort_Midpoint(arr1, 0, NUMBERS_SIZE);
	clock_t end = clock();
	int runtime = (end - start) / CLOCKS_PER_MS;
	cout << "elspased time for Quicksort_Midpoint " << runtime << " ms" << endl;
	
	start = clock();
	Quicksort_MedianOfThree(arr2, 0, NUMBERS_SIZE);
	end = clock();
	runtime = (end - start) / CLOCKS_PER_MS;
	cout << "elspased time for Quicksort_MedianOfThree " << runtime << " ms" << endl;
	
	start = clock();
	InsertionSort(arr3, NUMBERS_SIZE);
	end = clock();
	runtime = (end - start) / CLOCKS_PER_MS;
	cout << "elspased time for InsertionSort  " << runtime << " ms" << endl;
}
