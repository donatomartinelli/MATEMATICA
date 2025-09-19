/*
    Programma in C++ che lavora su una matrice NxN (N=4).
    Operazioni richieste:
    - Lettura e stampa della matrice.
    - Scambio della colonna y con quella successiva (y dato dall’utente).
    - Calcolo della somma degli elementi non nulli della riga y.
*/

#include <iostream>
using namespace std;

const int N = 4; // dimensione fissa della matrice

// Funzione per leggere la matrice da tastiera
void letturaMatrice(int mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << "Inserisci elemento a riga " << i + 1
                 << " e colonna " << j + 1 << ": ";
            cin >> mat[i][j];
        }
    }
}

// Funzione per stampare la matrice
void stampaMatrice(int mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << mat[i][j] << " ";
        }
        cout << endl;
    }
}

int main() {
    int mat[N][N];    // matrice 
    int y;            // indice della colonna da scambiare
    int colTras[N];   // array di appoggio per la colonna
    int sum = 0;      // somma degli elementi non nulli della riga y

    letturaMatrice(mat);
    stampaMatrice(mat);

    // Input e validazione dell’indice y
    cout << "Inserisci un numero intero compreso tra 0 e " << N - 2 << ": ";
    cin >> y;
    while (y < 0 || y > (N - 2)) {
        cout << "Errore! Inserisci un numero compreso tra 0 e " << N - 2 << ": ";
        cin >> y;
    }

    // Salvo la colonna y
    for (int k = 0; k < N; k++) {
        colTras[k] = mat[k][y];
    }

    // Scambio colonna y con la colonna successiva
    for (int i = 0; i < N; i++) {
        mat[i][y] = mat[i][y + 1];
        mat[i][y + 1] = colTras[i];
    }

    cout << "\nMatrice dopo lo scambio:" << endl;
    stampaMatrice(mat);

    // Calcolo della somma degli elementi non nulli della riga y
    for (int k = 0; k < N; k++) {
        if (mat[y][k] != 0) {
            sum += mat[y][k];
        }
    }

    cout << "Somma degli elementi non nulli sulla riga " << y + 1
         << " = " << sum << endl;

    return 0;
}
