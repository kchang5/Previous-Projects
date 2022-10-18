#include "IntList.h"
#include <ostream>
using namespace std;

IntList::IntList() : head(nullptr) {}
void IntList::push_front(int val) {
   if (!head) {
      head = new IntNode(val);
   } else {
      IntNode *temp = new IntNode(val);
      temp->next = head;
      head = temp;
   }
}

bool IntList::exists(int val) const{
    if (exists(head,val)){
        return true;
    }
    return false;
}

bool IntList::exists(IntNode* node, int val) const{
    if (node->value != val){
        if (node->next == nullptr){
            return false;
        }
        else{
            return exists(node->next, val);
        }
    }
    else{
        return true;
    }
}

ostream& operator<<(ostream& os, const IntList& list){
    if (list.head == nullptr){
        return os;
    }

    os << list.head->value;
    return operator<<(os, list.head->next);
}

ostream& operator<<(ostream& os, IntNode* node){
    if (node == nullptr){
        return os;
    }
    else{
        os << " ";
    }
    os << node->value;
    return operator<<(os, node->next);
}
