#include <iostream>
#include <cstdlib>
#include <stack>
#include <fstream>
#include <sstream>
#include "arithmeticExpression.h"



arithmeticExpression::arithmeticExpression(const string & val) {
        infixExpression = val; //private infixExpression variable set to val
        
        root = 0; //0 or null
    }

    int arithmeticExpression::priority(char op){
    int priority = 0;
    if(op == '('){
        priority =  3;
    }
    else if(op == '*' || op == '/'){
        priority = 2;
    }
    else if(op == '+' || op == '-'){
        priority = 1;
    }
    return priority;
}

string arithmeticExpression::infix_to_postfix(){
    stack<char> s;
    ostringstream oss;
    char c;
    for(unsigned i = 0; i< infixExpression.size();++i){
        c = infixExpression.at(i);
        if(c == ' '){
            continue;
        }
        if(c == '+' || c == '-' || c == '*' || c == '/' || c == '(' || c == ')'){ //c is an operator
            if( c == '('){
                s.push(c);
            }
            else if(c == ')'){
                while(s.top() != '('){
                    oss << s.top();
                    s.pop();
                }
                s.pop();
            }
            else{
                while(!s.empty() && priority(c) <= priority(s.top())){
                    if(s.top() == '('){
                        break;
                    }
                    oss << s.top();
                    s.pop();
                }
                s.push(c);
            }
        }
        else{ //c is an operand
            oss << c;
        }
    }
    while(!s.empty()){
        oss << s.top();
        s.pop();
    }
    return oss.str();
}

//void arithmeticExpression::visualizeTree(const string &outputFilename)
//{
//    ofstream outFS(outputFilename.c_str());
//    if (!outFS.is_open())
//    {
//        cout << "Error opening " << outputFilename << endl;
//        return;
//    }
//    outFS << "digraph G {" << endl;
//    visualizeTree(outFS, root);
//    outFS << "}";
//    outFS.close();
//    string jpgFilename = outputFilename.substr(0, outputFilename.size() - 4) + ".jpg";
//    string command = "dot -Tjpg " + outputFilename + " -o " + jpgFilename;
//    system(command.c_str());
//}


void arithmeticExpression::buildTree() {
    infixExpression = infix_to_postfix();
    stack <TreeNode*> string;

    for (unsigned i = 0; i < infixExpression.size(); ++i) {
        TreeNode *newNode = new TreeNode(infixExpression.at(i), 'a' + i);
        if (priority(infixExpression.at(i)) == 0) {
            string.push(newNode);
        }
        else if (priority(infixExpression.at(i)) > 0) {
            newNode->right = string.top();
            string.pop();
            newNode->left = string.top();
            string.pop();
            string.push(newNode);
            root = newNode;
        }
    }
}

void arithmeticExpression::infix() {
    infix(root);
}

void arithmeticExpression::infix(TreeNode* n){
    if (n == 0){
        return;
    }
    if (priority(n->data)) {
        cout << "(";
        infix(n->left);
        cout << n->data;
        infix(n->right);
        cout << ")";
    }
    else {
        infix(n->left);
        cout << n->data;
        infix(n->right);
    }
}

void arithmeticExpression::prefix() {
    prefix(root);
}

void arithmeticExpression::prefix(TreeNode* n){
    if (n == 0){
        return;
    }
    cout << n->data;
    prefix(n->left);
    prefix(n->right);
}

void arithmeticExpression::postfix() {
    postfix(root);
}


void arithmeticExpression::postfix(TreeNode* n){
if (n == 0) {
        return;
    }

    postfix(n->left);
    postfix(n->right);
    cout << n->data;
}

int arithmeticExpression::evaluate(){
        if(!isValidIntegerExpression(root)){
            throw invalid_argument("expression not valid");
        }
        else{
            return evaluateIntegerExpression(this->root);
        }
    }


bool arithmeticExpression::isValidIntegerExpression(TreeNode* n) {
if(n -> data >= '0' && n -> data <= '9') {
        return true; 
    }
    else if (n -> data == '+'){
        return true;
    }
    else if (n -> data == '-'){
        return true;
    }
    else if (n -> data == '*'){
        return true;
    } 
    else if (n -> data == '/' ){
        return true;
    }
        if (isValidIntegerExpression(n->left) && isValidIntegerExpression(n -> right)) {
            return true;
        } else {
            return false;
        }
    } 




int arithmeticExpression::evaluateIntegerExpression(TreeNode* node) {

    if (node -> data >= '0' && node->data <= '9') {

        switch (node-> data) {
            case '0':
                return 0;
                break;
            case '1':
                return 1;
                break;
            case '2':
                return 2;
                break;
            case '3':
                return 3;
                break; 
            case '4':
                return 4;
                break;
            case '5':
                return 5;
                break; 
            case '6':
                return 6;
                break;
            case '7':
                return 7;
                break; 
            case '8':
                return 8;
                break;
            case '9':
                return 9;
                break; 
        }
    }

    int leftVal= evaluateIntegerExpression(node->left);
    int rightVal = evaluateIntegerExpression(node-> right);

    if (node -> data == '*') {
        return leftVal * rightVal;
    }
    if (node -> data == '-') {
        return leftVal - rightVal;
    }
    if (node -> data == '+') {
        return leftVal + rightVal;
    }
    if (node -> data == '/') {
        return leftVal / rightVal;
    }

    return 0;
    
}
