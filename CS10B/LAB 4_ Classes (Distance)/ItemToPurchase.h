#include <iostream>
#include <string>
using namespace std;

class ItemToPurchase{
private: 
	string itemName,itemDescription;
   	int itemPrice, itemQuantity;
public:
   ItemToPurchase();
   void SetName(string ItemName);
   void SetPrice(double itemPrice);
   void SetQuantity(int itemQuantity);
   void SetDescription(string itemDescription);

   string GetName();
   int GetPrice();
   int GetQuantity();
   string GetDescription(); 
   void PrintItemCost(); 
   void PrintItemDescription();
};
