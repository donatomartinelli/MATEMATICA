/*
    Scrivere una function in linguaggio C++ che preveda in input 4 numeri reali x, y, z e t ed effettui le seguenti operazioni:
    - costruisca la matrice quadrata A che abbia tutti gli elementi al di sotto della diagonale principale coincidenti con x e tutti gli elementi sulla diagonale principale coincidenti con y;
    - costruisca la matrice quadrata B che abbia tutti gli elementi al di sopra della diagonale principale coincidenti con z e tutti gli elementi sulla diagonale principale coincidenti con t;
    - calcoli la somma C delle matrici A e B;
    - restituisca la matrice C.
*/

#include <iostream>
using namespace std;

const int N = 4;

void letturaVettore (int v[N]) {
    cout << "Inserisci gli elementi x, y, z, e t rispettivamente: "
         << endl;

    for (int i = 0; i < N; i++) {
        cin  >> v[i];
    }
    cout << endl;

    return ;
}

void letturaMatA (int mat[N][N], int v[N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i == j) {
                mat[i][j] = v[1];
            } else {
                mat[i][j] = 0;
            }
        }
    }
    for (int i = 0; i < N - 1; i++) {
        for (int j = 0; j < N - 1; j++) {
            if (i == j) {
                mat[i + 1][j] = v[0];
            }
        }
    }
    cout << endl;

    return ;
}

void letturaMatB (int mat[N][N], int v[N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (i == j) {
                mat[i][j] = v[3];
            } else {
                mat[i][j] = 0;
            }
        }
    }
    for (int i = 0; i < N - 1; i++) {
        for (int j = 0; j < N - 1; j++) {
            if (i == j) {
                mat[i][j + 1] = v[2];
            }
        }
    }
    cout << endl;

    return ;
}

void sommaMat (int mat1[N][N], int mat2[N][N], int mat3[N][N]) {
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            mat3[i][j] = mat1[i][j] + mat2[i][j];
        }
    }

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

int main() {
    int num[N];
    int A[N][N];
    int B[N][N];
    int C[N][N];

    letturaVettore(num);
    
    letturaMatA(A,num);
    letturaMatB(B,num);
    
    cout << "A = " << endl;
    stampaMat(A);
    cout << "B = " << endl;
    stampaMat(B);

    sommaMat(A, B, C);

    cout << "C = A + B = " << endl;
    stampaMat(C);

    return 0;
}
