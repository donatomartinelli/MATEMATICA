// 4.5 con sottoprogrammi, da ultimare.

#include <iostream>
using namespace std;

const int N = 3;

void letturaMatrice(double matrice[N][N]) {
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
}

void stampaMatrice(double matrice[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout <<  matrice[i][j] << " " ;
        }
        cout << endl;
    }
}

double mediaRiga (int n, double matrice[N][N]) {
    double sommaRiga;
    double mediaRiga;

    sommaRiga = 0;

    for (int j = 0; j < N; j++) {
        sommaRiga += matrice[n-1][j];
    }
    
    mediaRiga = sommaRiga / N;

    return mediaRiga;
}


int main () {
    double matrice[N][N];
    int riga;
    double sommaDiagonale;
    int elementiNulli;

    sommaDiagonale = 0;
    elementiNulli = 0;

    letturaMatrice(matrice);
    
    cout << endl;

    stampaMatrice(matrice);

    cout << endl;

    cout << "Inserisci riga da elaborare media: ";
    cin >> riga;

    cout << endl;

    cout << "La media della riga " 
         << riga 
         << " e' " 
         << mediaRiga(riga, matrice) 
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
