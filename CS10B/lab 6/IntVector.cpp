#include <iostream>
#include "IntVector.h"
#include <stdexcept>

using namespace std;

//This function should set both the size and capacity of the IntVector to 0 and will not allocate any memory to store integers.
//(Make sure you do not have a dangling pointer.)

IntVector::IntVector(){
    _size = 0;
    _capacity = 0;
    _data = nullptr;
}
// Sets both the size and capacity of the IntVector to the value of the parameter passed in and dynamically allocates an array of that size as well. 
//This function should initialize all elements of the array to the value of the 2nd parameter.

IntVector::IntVector(unsigned size, int value){
    _size = size;
    _capacity = size;
    _data = new int[_size];

    for (unsigned i = 0; i < size; ++i){
        _data[i] = value;
    }
}
//The destructor is used to clean up (delete) any remaining dynamically-allocated memory. 
//For this class, that will be the array pointed to by the int pointer called data.

IntVector::~IntVector(){
    delete _data;
    _data = nullptr;
}

//This function returns the current size (not the capacity) of the IntVector object, which is the values stored in the sz data field.
unsigned IntVector::size() const{
    return _size;
}

//This function returns the current capacity (not the size) of the IntVector object, which is the value stored in the cap data field.
unsigned IntVector::capacity() const{
    return _capacity;
}

//Returns whether the IntVector is empty (the sz field is 0).
bool IntVector::empty() const{
    return _size == 0;
}

//This function will return the value stored in the element at the passed in index position. 
//Your function should throw an outofrange exception if an invalid index is passed in. 
//An invalid index is an index greater than or equal to the size
const int & IntVector::at(unsigned index) const{
    if (empty() || index < 0 || index >= _size){
        throw out_of_range("IntVector::at_range_check");
    }

    return _data[index];
}

//This function will return the value stored in the first element.
const int & IntVector::front() const{
    return _data[0];
}

//This function will return the value stored in the last element.
const int & IntVector::back() const{
    return _data[_size - 1];
}


void IntVector::assign(unsigned n, int value)
{
    if (n > _capacity * 2){
        expand(n - _capacity);
    }
    else if (n > _capacity){
        expand();
    }

    for (unsigned i = 0; i < n; ++i)
    {
        _data[i] = value;
    }

    _size = n;
}

void IntVector::push_back(int value)
{
    if (_size == _capacity)
    {
        expand();
    }
    _data[_size] = value;
    ++_size;
}

void IntVector::pop_back()
{
    --_size;
}

void IntVector::clear()
{
    _size = 0;
}

void IntVector::resize(unsigned size, int value)
{
    if (size < _size){
        _size = size;
    }
    else if (size > _size){
        if (size > _capacity * 2)
        {
            expand(size - _capacity);
        }
        else if (size > _capacity)
        {
            expand();
        }

        for (unsigned i = _size; i < size; ++i)
        {
            _data[i] = value;
        }

        _size = size;
    }
}

void IntVector::reserve(unsigned n)
{
    if (n > _capacity){
        expand(n - _capacity);
    }
}

void IntVector::expand()
{
    if (_capacity == 0){
        expand(1);
    }
    else
    {
        expand(_capacity);
    }
}

void IntVector::expand(unsigned amount)
{
    int* temp = new int[_capacity + amount];
    for (unsigned i = 0; i < _size; ++i) // Should not iterate if data is empty/null
    {
        temp[i] = _data[i];
    }
    delete[] _data;
    _data = temp;
    _capacity += amount;
}
