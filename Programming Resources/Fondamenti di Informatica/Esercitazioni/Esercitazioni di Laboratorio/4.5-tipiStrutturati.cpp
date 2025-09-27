/*
    Si scriva un programma in linguaggio C++ che gestisce una matrice di numeri interi di dimensione NxN (es: NxN=5x5). 
    Il programma deve effettuare le seguenti operazioni:
    - legge dalla tastiera i valori degli elementi della matrice;
    - stampa a video la matrice;
    - calcola la media degli elementi della seconda riga della matrice;
    - verifica se ci sono elementi nulli sulla diagonale;
    - stampa sullo schermo la somma e un messaggio che dice se ci sono elementi nulli o meno sulla diagonale.
*/

#include <iostream>
using namespace std;

const int N = 5;

int main () {
    double matrice[N][N];
    double sommaSecondaRiga;
    double mediaSecondaRiga;
    double sommaDiagonale;
    int elementiNulli;

    sommaSecondaRiga = 0;
    sommaDiagonale = 0;
    elementiNulli = 0;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << "Inserisci elemento della riga " 
                 << i + 1
                 << " e della colonna "
                 << j + 1
                 << endl;
            cin  >> matrice[i][j];
        }
    }

    cout << endl;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout <<  matrice[i][j] << " " ;
        }
        cout << endl;
    }

    cout << endl;

    for (int j = 0; j < N; j++) {
        sommaSecondaRiga += matrice[1][j];
    }
    
    mediaSecondaRiga = sommaSecondaRiga / N;

    cout << "Media seconda riga: " 
         << mediaSecondaRiga 
         << endl;

    for (int k = 0; k < N; k++) {
        if (matrice[k][k] != 0) {
            sommaDiagonale += matrice[k][k];
        } else {
            elementiNulli += 1;
        }
    }

    cout << "Somma elementi diagonale: "
         << sommaDiagonale
         << endl;

    if (elementiNulli != 0) {
        cout << "Sono presenti " << elementiNulli << " elementi nulli sulla diagonale";
    } else {
        cout << "Non sono presenti elementi nulli sulla diagonale." << endl;
    }

    return 0;
}
