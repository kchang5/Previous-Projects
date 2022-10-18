#ifndef __WIZARD_H__
#define __WIZARD_H__
using namespace std;

#include "Character.h"

class Wizard : public Character{
	private:
        int rank;
    public:
        Wizard(string, double, double, int);
        void attack(Character &cname);
        int getRank() const;
};

#endif