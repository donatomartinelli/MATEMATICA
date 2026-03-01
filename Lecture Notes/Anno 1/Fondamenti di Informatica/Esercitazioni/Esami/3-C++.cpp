/*
    Scrivere un programma in linguaggio C++ che effettui le seguenti operazioni su una matrice di reali di fissata dimensione NxN (per es. N=4):
    Parte a:
    - legga dalla tastiera gli elementi della matrice;
    - stampi sullo schermo gli elementi della matrice;
    Parte b:
    - legga da tastiera due numeri reali x e y con x < y (con convalida dei dati);
    - conti quanti elementi della matrice sono compresi tra x e y;
    - stampi sullo schermo il contatore;
    Parte c:
    - scambi gli elementi della prima colonna con quelli dell’ultima riga;
    - stampi sullo schermo la matrice modificata.
    L’uso di sottoprogrammi è facoltativo.
*/

#include <iostream>
using namespace std;

const int N = 4; // dimensione fissa della matrice NxN

// Legge gli elementi della matrice da tastiera
void letturaMatrice (int mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << "Inserisci elemento a riga " << i + 1
                 << " e colonna a " << j + 1  << endl;
            cin >> mat[i][j];
        }
    }
    return ;
}

// Stampa la matrice a video
void stampaMatrice (int mat[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << mat[i][j] << " ";
        }
        cout << endl;
    }
    return ;
}

// Scambia la prima colonna con l’ultima riga
void scambioColonnaRiga (int mat[N][N]) {
    for (int i = 0; i < N; i++) {
        int temp = mat[i][0];       // elemento della prima colonna
        mat[i][0] = mat[N - 1][i];  // sostituisco con quello dell'ultima riga
        mat[N - 1][i] = temp;       // metto l’elemento della colonna salvato
    }
}

// Legge due interi con validazione: x < y
void letturaIntConv (int &x, int &y) {
    cout << "Inserisci due numeri reali, il primo minore del secondo: " << endl;
    cin >> x >> y;

    // Ripeti finché la condizione non è rispettata
    while (x > y) {
        cout << "Errore! Il primo è maggiore o uguale del secondo." << endl
             << "Inserisci due numeri reali, il primo minore del secondo: " << endl;
        cin >> x >> y;
    }

    return ;
}

// Conta quanti elementi della matrice sono compresi tra x e y
void verificaInt (int x, int y, int mat[N][N]) {
    int elemComp = 0;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (mat[i][j] > x && mat[i][j] < y) {
                elemComp++;
            }
        }
    }

    cout << "Nella matrice ci sono " << elemComp 
         << " elementi compresi tra " << x << " e " << y << " ." << endl
         << "Scambio prima e ultima riga." << endl;

    return ;
}

int main() {
    int mat[N][N];
    int x, y;
    
    letturaMatrice(mat);       // inserimento della matrice
    stampaMatrice(mat);        // stampa della matrice
    letturaIntConv(x,y);       // lettura e controllo degli estremi
    verificaInt(x,y,mat);      // verifica degli elementi compresi
    scambioColonnaRiga(mat);   // scambio prima colonna e ultima riga
    stampaMatrice(mat);        // stampa finale

    return 0;
}
