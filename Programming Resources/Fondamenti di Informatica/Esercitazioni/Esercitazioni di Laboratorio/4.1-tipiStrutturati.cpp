/*
    Si scriva un programma in linguaggio C++ che gestisce un array di numeri interi di dimensione N (es: N = 5). 
    Il programma deve effettuare le seguenti operazioni:
    - legge dalla tastiera i valori dell’array;
    - conta il numero di elementi dell’array minori di zero;
    - stampa il numero così calcolato sullo schermo; 
    - se nell’array non ci sono elementi negativi stampa a video “non ci sono elementi negativi”.
*/

#include <iostream>
using namespace std;

const int N = 5;

int main() {
    int array[N];
    int numNegativi;

    numNegativi = 0;

    for (int i = 0; i < N; i++) {
        cout << "Inserire il valore dell'elemento numero " 
             << i + 1 
             << " : " 
             << endl;
        cin  >> array[i];
    }

    for (int i = 0; i < N; i++) {
        if (array[i] < 0) {
            numNegativi += 1;
        }
    }

    if (numNegativi == 0) {
        cout << "Non ci sono elementi negativi." 
             << endl;
    } else {
        cout << "Ci sono " 
             << numNegativi
             << " numeri negativi."
             << endl;
    }
    
    return 0;
}
