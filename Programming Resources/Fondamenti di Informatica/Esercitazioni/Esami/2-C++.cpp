/*
    Scrivere un programma in linguaggio C++ che effettui le seguenti operazioni su una matrice di reali di fissata dimensione NxN (per es. N=5):
    
    Parte a:
    - legga dalla tastiera gli elementi della matrice;
    - stampi sullo schermo gli elementi della matrice;

    Parte b:
    - legga da tastiera un numero reale x>0 (con convalida del dato);
    - calcoli il prodotto degli elementi della diagonale che sono minori di x e diversi da zero;
    - stampi sullo schermo il prodotto o un messaggio nel caso non ci siano elementi minori di x sulla diagonale;

    Parte c:
    - conti quanti elementi che si trovano sulla prima riga, sulla seconda riga, sulla penultima riga e sull’ultima riga della matrice sono maggiori di x;
    - stampi sullo schermo il contatore.

    L’uso di sottoprogrammi è facoltativo.
*/

#include <iostream>

using namespace std;

const int N = 5;

void letturaMatrice (double mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << "Inserisci elemento di riga "
                 << i + 1
                 << " e colonna "
                 << j + 1
                 << " : "
                 << endl;
            cin  >> mat[i][j];
        }
    }
    cout << endl;

    return ;
}

void stampaMatrice (double mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << mat[i][j]
                 << " ";
        }
        cout << endl;
    }
    cout << endl;

    return ;
}

int main() {
    double mat[N][N];
    double x;
    double prod;
    int elemMinX;
    int elemMaggX;
    
    prod = 1;
    elemMinX = 0;

    letturaMatrice(mat);
    stampaMatrice(mat);

    cout << "Inserisci numero reale maggiore di 0: "
         << endl;
    cin  >> x;

    while (x <= 0){
        cout << "Errore ! Il numero inserito e' minore o uguale a 0."
             << "Inserisci numero reale maggiore di 0: "
             << endl;
        cin  >> x;
    }
    
    for (int k = 0; k < N; k++) {
        if (mat[k][k] < x && mat[k][k] != 0) {
            prod *= mat[k][k];
            elemMinX += 1;
        }
    }

    if (elemMinX != 0) {
        cout << "Il prodotto degli elementi della diagonale che sono minori di "
             << x 
             << " e diversi da 0 e' "
             << prod
             << endl;
    } else {
        cout << "Non ci sono elementi minori di "
             << x 
             << " sulla diagonale."
             << endl;
    }

    for (int i = 0; i < N; i++) {
        elemMaggX = 0;

        for (int j = 0; j < N; j++) {
            if (i != 2) {
                if (mat[i][j] > x) {
                    elemMaggX += 1;
                }
            }
        }

        if (i != 2) {
            if (elemMaggX != 0) {
                cout << "Nella riga "
                     << i + 1
                     << " ci sono "
                     << elemMaggX
                     << " elementi maggiori di "
                     << x 
                     << endl;
            } else {
                cout << "Nella riga "
                     << i + 1
                     << " non ci sono elementi maggiori di "
                     << x 
                     << endl;
            }
            cout << endl;
        }
    }

    return 0;
}
