// Write a C++ program to compute the sum of two given integer values. 
// If the two values are the same, then return triple their sum.

#include<iostream>
using namespace std;

// Read two integers from input
void readNum(int &x, int &y) 
{
    cout << "Insert two integer values: " << endl;
    cin >> x >> y;
}

// Return sum, triple if equal
int checkNum(int x, int y) 
{
    return x == y ? 3 * (x + y) : x + y;
}  

int main() 
{
    int x, y; // variables
    
    readNum(x,y); // input
    
    cout << checkNum(x,y) << endl; // output
    
    return 0;
}