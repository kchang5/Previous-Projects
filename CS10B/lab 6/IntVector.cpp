#include <iostream>
#include "IntVector.h"
#include <stdexcept>

using namespace std;

IntVector::IntVector(){
    _size = 0;
    _capacity = 0;
    _data = nullptr;
}

IntVector::IntVector(unsigned size, int value){
    _size = size;
    _capacity = size;
    _data = new int[_size];

    for (unsigned i = 0; i < size; ++i){
        _data[i] = value;
    }
}

IntVector::~IntVector(){
    delete _data;
    _data = nullptr;
}

unsigned IntVector::size() const{
    return _size;
}

unsigned IntVector::capacity() const{
    return _capacity;
}

bool IntVector::empty() const{
    return _size == 0;
}

const int & IntVector::at(unsigned index) const{
    if (empty() || index < 0 || index >= _size){
        throw out_of_range("IntVector::at_range_check");
    }

    return _data[index];
}

const int & IntVector::front() const{
    return _data[0];
}

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