#include <bits/stdc++.h>
using namespace std;

struct tree_node{
    int value;
    tree_node *left,*right;
    tree_node(int v){
        value = v;
        left = nullptr;
        right = nullptr;
    }
};

int height(struct tree_node *root){
    if(root== nullptr){
        return -1;          // recrusive case for an empty tree of height = -1.
    }else{
        return 1 + max(height(root->left),height(root->right));  // height of tree = 1 + max(height of left subtree, height of right subtree).
    }
}

///Question 2

#include <bits/stdc++.h>
using namespace std;

struct tree_node{
    int value;
    tree_node *left,*right;
    tree_node(int v){
        value = v;
        left = nullptr;
        right = nullptr;
    }
};

int sum(struct tree_node *root){
    if(root==NULL){            // recrusive case for an empty tree of height = 0.
        return 0;
    }else{
        return root->value + sum(root->left) +  sum(root->right); // The sum of the nodes of a tree = value of root + 
    }                                                             // (sum of nodes of left subtree) + (sum of nodes of right subtree)



//Question 3
#include <bits/stdc++.h>
using namespace std;

struct tree_node{
    int value;
    tree_node *left,*right;
    tree_node(int v){
        value = v;
        left = nullptr;
        right = nullptr;
    }
};
    bool isPresent(struct tree_node *root,int v){
    if(root==NULL){        
        return false;
    }
    if(root->value==v){  // If root value equals the key, it returns true;
        return true;
    }
    if(isPresent(root->left,v)){ // searches for key in the left subtree, and returns true;
        return true;
    }
    if(isPresent(root->right,v)){ // searches for key in the right subtree, and returns true;
        return true;
    }
    return false;   // If key is not equal to the root and not present in the left subtree and the right subtree, return false.
    
}
}





vector<int> level(struct tree_node *root){
    vector<int>vec(height(root)+1,0);   // This vector stores the number of nodes at each level.
    if(root==NULL){
        return vec;
    else{
        unordered_map<struct tree_node *,int>ch; // map to store the level of each node.
        <struct tree_node *> queue;        
        queue.push(root);                           
        ch[root] = 0;
        vec[0] = 1;
        while(!queue.empty()){                    
            struct tree_node *r = queue.front();
            if(r->left){                       
                queue.push(r->left); 
            }
            vector<int>vec = level(root);
    for(int i = 0;i <= height(root);i++){
        cout<<vec[i]<<" ";    // couts the number of nodes
    }

