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
