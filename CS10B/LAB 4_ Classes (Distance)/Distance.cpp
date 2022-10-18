#include <iostream>
#include<math.h>
#include "Distance.h"
using namespace std;

     void Distance :: init (){
          inches=abs(inches);
          if(inches>=12){
          feet+=int(inches/12);
          inches=fmod(inches,12);
    }
}

     Distance :: Distance (){
          feet=0;
          inches=0.0;
     }
 
     Distance :: Distance (unsigned ft, double in){
          feet=ft;
          inches=in;
          init();
     }

     Distance :: Distance (double in){
          feet = 0;
          inches = in;
          init();
     }

     unsigned Distance :: getFeet () const{
          return feet;
     }    

     double Distance :: getInches () const{
          return inches;
}

     double Distance :: distanceInInches () const{
          return (feet*12.0)+inches;
     }

     double Distance::distanceInFeet () const{
          return feet+(inches/12);
}

     double Distance :: distanceInMeters () const{
          return distanceInInches()*0.0254;
}

     Distance Distance :: operator+ (const Distance & rhs) const{
          return Distance((this->distanceInInches()+rhs.distanceInInches()));
}

     Distance Distance :: operator- (const Distance & rhs) const{
          return Distance((this->distanceInInches()-rhs.distanceInInches()));
}

          ostream& operator<< (ostream & out, const Distance & rhs){
          out << rhs.feet<< "\' " << rhs.inches <<"\"";
               return out;
}

 
