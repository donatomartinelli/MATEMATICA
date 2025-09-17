/*
    Scrivere una function in linguaggio C++ che preveda in input un vettore ed effettui le seguenti operazioni:
    - costruisca la matrice quadrata “a freccia” che ha la prima riga, la prima colonna e la diagonale coincidenti con il vettore di input;
    - calcoli il minimo degli elementi positivi della matrice;
    - restituisca il minimo calcolato e la matrice.
*/

#include<iostream>

using namespace std;

const int N = 5;

void letturaMatrice(int matrice[N][N]) { 
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cout << matrice[i][j] << " ";
        }
      
        cout << endl;   
    }
    
    return;
    }

int ricercaMinimo(int vettore[]) {
    int pos = -1;
    
    for (int i = 0; i < N; i++) {
        if (vettore[i] > 0) {
            if (pos == -1 || vettore[i] < vettore[pos]) {
                pos = i;
            }
        }
    }
    
    return pos;
    
    
void matriceFreccia(int vettore[N], int matrice[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i == 0) {
                matrice[i][j] = vettore[j];
            } else if (j == 0) {
                matrice[i][j] = vettore[i];
            } else if (i == j) {
                matrice[i][j] = vettore[i];
            } else {
                matrice[i][j] = 0;
            }
        }
    }
    
    letturaMatrice(matrice);
    
    ricercaMinimo(vettore);
    
    if (ricercaMinimo(vettore) != -1) {
        cout << "Minimo tra gli elementi positivi: " 
             << vettore[ricercaMinimo(vettore)] 
             << endl;
    } else {
        cout << "Nessun elemento positivo trovato nel vettore." 
             << endl;
    }
    
    return ;
}

int main() {
    int vettore[N];
    int matrice[N][N];

    vettore[N] = {-11, 2, -1, 1, -30};
    
    matriceFreccia(vettore, matrice);
    
    return 0;
}
