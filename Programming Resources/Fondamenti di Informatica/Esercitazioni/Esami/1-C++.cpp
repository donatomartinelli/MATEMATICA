/*
    Scrivere un programma in linguaggio C++ che effettui le seguenti operazioni su una matrice di reali di fissata dimensione NxN (per es. N=4):
    Parte a:
    - legga dalla tastiera gli elementi della matrice;
    - stampi sullo schermo gli elementi della matrice;
    Parte b:
    - legga da tastiera due numeri reali distinti x e y (con verifica dei dati);
    - conti quanti elementi non nulli della matrice sono maggiori di (x-y)/2;
    - stampi sullo schermo il contatore;
    Parte c:
    - calcoli il minimo degli elementi che si trovano sulle prime N/2 righe;
    - stampi sullo schermo tale minimo e la sua posizione.
    L’uso di sottoprogrammi è facoltativo.
*/

#include <iostream>
using namespace std;

const int N = 4;

void letturaMatrice (int mat[N][N]) {
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

void stampaMatrice (int mat[N][N]) {
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
    int mat[N][N];
    int x;
    int y;
    double z;
    int elemMagg;
    int rigPosMin;
    int colPosMin;

    elemMagg = 0;
    rigPosMin = 0;
    colPosMin = 0;

    letturaMatrice(mat);
    stampaMatrice(mat);

    cout << "Inserisci due numeri reali: "
         << endl;
    cin >> x >> y;

    while (x == y) {
        cout << "Errore ! I due numeri devono essere distinti."
             << endl
             << "Inserisci due numeri reali: "
             << endl;
        cin  >> x 
             >> y;
    }

    z = (x - y) / 2;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (mat[i][j] > z) {
                elemMagg += 1;
            }
        }
    }
    
    cout << "Nella matrice ci sono "
         << elemMagg
         << " elementi con valore maggiore di "
         << z 
         << endl;
    
    for (int i = 0; i < int(N / 2); i++) {
        for (int j = 0; j < N; j++) {
            if (mat[i][j] < mat[rigPosMin][colPosMin]) {
                rigPosMin = i;
                colPosMin = j;
            }
        }
    }

    cout << "L'elemento minimo delle prime "
         << int(z)
         << " righe della matrice e' "
         << mat[rigPosMin][colPosMin]
         << " a riga "
         << rigPosMin + 1
         << " e colonna "
         << colPosMin + 1
         << endl;

    return 0;
}
