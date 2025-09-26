// Write a C++ program to check two given integers, 
// and return true if one of them is 30 or if their sum is 30.

#include<iostream>
using namespace std;

// Read two integers from input
void readNum(int &x, int &y) 
{
    cout << "Insert two integer values: " << endl;
    cin >> x >> y;
}

// Return true if x or y is 30, or if their sum is 30
bool checkNum(int x, int y) 
{
    return x == 30 || y == 30 || (x + y) == 30;
}  

int main() 
{
    int x, y; // variables
    
    readNum(x,y); // input
    
    cout << checkNum(x,y) << endl; // output (1 = true, 0 = false)
    
    return 0;
}