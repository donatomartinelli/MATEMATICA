/*
    It is known that if a function f(x) is continuous on the interval [a,b], 
    the definite integral of f, denoted by
        ∫ from a to b f(x) dx
    represents the area between the curve y = f(x) and the x-axis. 
    It is not always possible to compute the integral analytically. 
    However, numerical algorithms can be used to approximate it. 
    One such method is the so-called rectangle formula:
        ∫ from a to b f(x) dx ≈ (b - a) / m * Σ from k=0 to m f(x_k)
    where:
        x_k = x_(k-1) + (b - a)/m ,   k = 1,...,m,   with x_0 = a.
    Write a C++ program that uses subprograms and that:
    - Reads from the keyboard the interval endpoints a and b, and an integer m;
    - Computes the approximate value of the integral of the function
        f(x) = e^x / (x^2 + 1);
    - Prints the calculated value on the screen.
*/

#include <iostream>
#include <cmath>

using namespace std;

void letturaIntervallo(double &a, double &b) {
    cout << "Inserisci estremi dell'intervallo: " << endl;
    cin  >> a 
         >> b;

    while (a > b) {
        cout << "Errore. Il primo numero deve essere minore del secondo." 
             << endl
             << "Inserisci estremi dell'intervallo: " 
             << endl;
        cin  >> a 
             >> b;
    }
}

double f(double x) {
    return exp(x) / (x * x + 1);
}

int main() {
    double a, b;
    int m;
    double delta;
    double integrale;

    integrale = 0;

    letturaIntervallo(a, b);

    cout << "Inserisci il numero di suddivisioni m: ";
    cin  >> m;

    delta = (b - a) / m;

    for (int k = 0; k < m; k++) {
        double xk = a + k * delta;
        integrale += f(xk);
    }

    integrale *= delta;

    cout << "Integrale approssimato: " 
         << integrale 
         << endl;

    return 0;
}
