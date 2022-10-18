#include <iostream>

using namespace std;

#include "Character.h"
#include "Wizard.h"

Wizard::Wizard(string name, double health, double attack, int rank)
    : Character(WIZARD, name, health, attack), rank(rank) { }

void Wizard::attack(Character& def){
    cout << "Wizard " << name << " attacks " << def.getName() << " --- POOF!!" << endl;
    double damageDealt = attackStrength;
    if (def.getType() == WIZARD){
        Wizard& wiz = dynamic_cast<Wizard&>(def);
        damageDealt = attackStrength * (static_cast<double>(rank) / static_cast<double>(wiz.getRank()));
    }
    cout << def.getName() << " takes " << damageDealt << " damage." << endl;
    def.damage(damageDealt);
}

int Wizard::getRank() const{
    return rank;
}