/*
Si scriva un programma in linguaggio C++ che gestisce una matrice di numeri interi di dimensione NxN (es: NxN=3x3). 
Il programma deve effettuare le seguenti operazioni:
- legge dalla tastiera i valori degli elementi della matrice;
- calcola la somma totale degli elementi della matrice;
- stampa la somma calcolata sullo schermo.
*/

#include <iostream>

using namespace std;

int main () {
    const int N = 3;
    double sommaElementi;
    double matrice[N][N];
    
    sommaElementi = 0;
    
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << "Inserisci elemento della riga " 
                 << i + 1
                 << " e della colonna "
                 << j + 1
                 << endl;
            cin  >> matrice[i][j];
          
            sommaElementi += matrice[i][j];
        }
    }

    cout << "Somma totale degli elementi della matrice: "
         << sommaElementi;

    return 0;
}
