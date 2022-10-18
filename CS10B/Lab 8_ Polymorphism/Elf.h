#ifndef __ELF_H__
#define __ELF_H__
using namespace std;

#include "Character.h"

class Elf : public Character{
     private:
        string family;
    public:
       Elf(string, double, double, string);
        void attack(Character &cname);
        string getFamily() const;
    
};

#endif