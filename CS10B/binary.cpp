#include <iostream>
#include <string>
using namespace std;

string hex_to_bin(char ch) {
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
    } else if (ch == 'G') {
        return "0000";
    } else if (ch == 'h') {
        return "0001";
    } else if (ch == 'I') {
        return "0010";
    } else if (ch == 'J') {
        return "0011";
    } else if (ch == 'K') {
        return "0100";
    } else if (ch == 'L') {
        return "0101";
    } else if (ch == 'M') {
        return "0110";
    } else if (ch == 'N') {
        return "0111";
    } else if (ch == 'O') {
        return "1000";
    } else if (ch == 'P') {
        return "1001";
    } else if (ch == 'Q') {
        return "1010";
    } else if (ch == 'R') {
        return "0001";
    } else if (ch == 'S') {
        return "0010";
    } else if (ch == 'T') {
        return "0011";
    } else if (ch == 'U') {
        return "0100";
    } else if (ch == 'V') {
        return "0101";
    } else if (ch == 'W') {
        return "0110";
    } else if (ch == 'X') {
        return "0111";
    } else if (ch == 'Y') {
        return "1000"; 
    } else if (ch == 'Z') {
        return "1001";
    } else {
        return "";
    }
}

int main() {
    string d;
    cout << "Enter a hexadecimal variable: ";
    cin >> d;
    cout << d << " hex = ";
    for (int i = 0; i < h.size(); ++i) {
        cout << hex_to_bin(d[i]);
    }
    cout << " binary." << endl;
    return 0;
}
