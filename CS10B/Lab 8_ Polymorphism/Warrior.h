#ifndef __WARRIOR_H__
#define __WARRIOR_H__

#include "Character.h"
using namespace std;

class Warrior : public Character
{
    public:
        Warrior(string, double, double, string);
        void attack(Character &cname);
        string getAllegiance() const;
    private:
        string allegiance;
};

#endif

