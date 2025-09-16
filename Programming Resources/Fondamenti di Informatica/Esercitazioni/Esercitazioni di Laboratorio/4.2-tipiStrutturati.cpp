/*
Si scriva un programma in linguaggio C++ che gestisce un array di numeri reali di dimensione N (es: N = 5). 
Il programma deve effettuare le seguenti operazioni:
- legge dalla tastiera i valori dell’array;
- calcola il valore minimo contenuto nell’array;
- stampa il valore del minimo e la sua posizione nell’array sullo schermo.
*/

#include <iostream>

using namespace std;

const int N = 5;

int main() {

    int array[N];
    int minimo;
    int pos;

    pos = 0;


    for (int i = 0; i < N; i++) {
        cout << "Inserire il valore dell'elemento numero " 
             << i + 1 
             << " : " 
             << endl;
        cin  >> array[i];
    }

    for (int i = 0; i < N; i++) {
        if (array[i] < array[pos]) {
            pos = i;
        }
    }

    cout << "Posizione del minimo: " 
         << pos + 1
         << " . Minimo corrisponde a "
         << array[pos]
         << endl;

    return 0;
}
