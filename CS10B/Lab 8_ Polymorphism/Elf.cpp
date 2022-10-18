#include <iostream>
#include <string>
#include "Character.h"
#include "Elf.h"

using namespace std;
    Elf::Elf(string name, double health, double attack, string family)
    : Character(ELF, name, health, attack), family(family) { }

    void Elf::attack(Character &cname){
        cout << "Elf " << name << " ";
        double finDmg = attackStrength * (health / MAX_HEALTH);
    if (cname.getType() == ELF){
        Elf& elf = dynamic_cast<Elf&>(cname);
        if (elf.getFamily() == family){
            cout << "does not attack Elf " << elf.getName() << "." << endl;
            cout << "They are both members of the " << family << " family." << endl;
            return;
        }
    }
    cout << "shoots an arrow at " << cname.getName() << " --- TWANG!!" << endl;
    cout << cname.getName() << " takes " << finDmg << " damage." << endl;
    cname.damage(finDmg);
}

string Elf::getFamily() const
{
    return family;
}
  