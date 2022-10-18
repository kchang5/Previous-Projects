#include <iostream>
#include <string>

using namespace std;

string convert_hex_char(char ch) {
    if (ch == '0') {
        return "0000";
    } else if (ch == '1') {
        return "0001";
    } else if (ch == '2') {
        return "0010";
    } else if (ch == '3') {
        return "0011";
    } else if (ch == '4') {
        return "0100";
    } else if (ch == '5') {
        return "0101";
    } else if (ch == '6') {
        return "0110";
    } else if (ch == '7') {
        return "0111";
    } else if (ch == '8') {
        return "1000";
    } else if (ch == '9') {
        return "1001";
    } else if (ch == 'A') {
        return "1010";
    } else if (ch == 'B') {
        return "1011";
    } else if (ch == 'C') {
        return "1100";
    } else if (ch == 'D') {
        return "1101";
    } else if (ch == 'E') {
        return "1110";
    } else if (ch == 'F') {
        return "1111";
    } else {
        return "";
    }
}

int main() {
    string h;
    cout << "Enter a hexadecimal number: ";
    cin >> h;
    cout << h << " hex = ";
    for (int i = 0; i < h.size(); ++i) {
        cout << convert_hex_char(h[i]);
    }
    cout << " binary." << endl;
    return 0;
}