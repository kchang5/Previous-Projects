#include <iostream>
using namespace std;
class ClassA {
    int*   p1;
    int*   p2;
int** pp1;
    int**  pp2;
public:
    ClassA() {
        p1  = new int;
        p2  = new int;
        pp1 = &p1;
        pp2 = &p2;
        *p1 = 10;
*p2 = 20; }
    int* get_p1() {
        return p1;
    }
    int* get_p2() {
return p2; }
    int** get_pp1() {
        return pp1;
    }
    int** get_pp2() {
return pp2; }
};
class ClassB {
private:
    ClassA a_obj;
public:
    ClassB() {
        int tmp = **(a_obj.get_pp1());
        **(a_obj.get_pp1()) = **(a_obj.get_pp2());
        **(a_obj.get_pp2()) = tmp;
}
 ClassB() {

cout << *(a_obj.get_p1()) << endl;
        cout << *(a_obj.get_p2()) << endl;
    }
};
int main() {
    ClassB b_obj;
}
