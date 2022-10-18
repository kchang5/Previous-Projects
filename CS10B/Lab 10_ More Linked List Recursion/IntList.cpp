#include "IntList.h"

void IntList::distanceFrom(int key) {
   searchAndModify(head,key);
}


int IntList::searchAndModify(IntNode *curr, int key) {
   if(curr == NULL || curr->data == key)
   return 0;
return curr->data = (1 + searchAndModify(curr->next, key));
}

