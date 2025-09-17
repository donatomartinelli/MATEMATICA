/*
    Scrivere una function in linguaggio C++ che preveda in input due vettori v e w di lunghezza N e N-1 rispettivamente ed effettui le seguenti operazioni:
    - costruisca la matrice “tridiagonale” che ha come diagonale principale il vettore v, come sopra diagonale il vettore w e come sottodiagonale il vettore -w;
    - conti quanti elementi della matrice sono superiori alla media degli elementi del vettore v;
    - restituisca il valore della media e il numero di elementi di valore superiore.
*/

#include <iostream>

using namespace std;

const int N = 5;

void letturaV (int v[N]) {
    for (int i = 0; i < N; i++) {
        cout << "Inserisci elemento numero "
             << i + 1
             << " del vettore v: "
             << endl;
        cin  >> v[i];
    }

    cout << endl;

    return ;
}

void letturaW (int w[N - 1]) {
    for (int i = 0; i < N - 1; i++) {
        cout << "Inserisci elemento numero "
             << i + 1
             << " del vettore v: "
             << endl;
        cin  >> w[i];
    }

    cout << endl;

    return ;
}

void stampaV (int v[N]) {
    for (int i = 0; i < N; i++) {
        cout << v[i]
             << " " ;
    }

    cout << endl;

    return ;
}

void stampaW (int w[N - 1]) {
    for (int i = 0; i < N - 1; i++) {
        cout << w[i]
             << " " ;
    }

    cout << endl;

    return ;
}

void letturaMat (int mat[N][N], int v[N], int w[N-1]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i == j) {
                mat[i][j] = v[i];
            } else {
                mat[i][j] = 0;
            }
        }
    }
    
    for (int i = 0; i < N - 1; i++) {
        for (int j = 0; j < N - 1; j++) {
            if (i == j) {
                mat[i + 1][j] = -w[i];
                mat[i][j + 1] = w[i];
            }
        }
    }

    cout << endl;

    return ;
}

void stampaMat (int mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << mat[i][j] << " ";
        }

        cout << endl;
    }

    cout << endl;

    return ;
}

int media (int v[N]) {
    int somma;
    int media;

    somma = 0;

    for (int i = 0; i < N; i++) {
        somma += v[i];
    }

    media = somma / N;

    return media;
}

int elem (int mat[N][N], int media) {
    int elem ;
    
    elem = 0;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (mat[i][j] > media) {
                elem += 1;
            }
        }
    }

    return elem;
}

int main() {
    int v[N] = {1, 2, 3, 4, 5};
    int w[N-1] = {6, 6, 6, 6};
    int mat[N][N];

    // letturaV(v);
    // letturaW(w);

    // stampaV(v);
    // stampaW(w);
    
    letturaMat(mat, v, w);
    stampaMat(mat);

    cout << "Media del vettore v: "
         << media(v)
         << endl
         << "Elementi della matrice maggiore della media di v: "
         << elem(mat,media(v))
         << endl;
    
    return 0;
}
