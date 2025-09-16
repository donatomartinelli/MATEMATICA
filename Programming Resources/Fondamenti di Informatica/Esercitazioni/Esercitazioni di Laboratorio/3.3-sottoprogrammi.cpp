/*
Utilizzando i sottoprogrammi, scrivere un programma in linguaggio C++ che acquisisce ed elabora una sequenza di rettangoli:
- il programma richiede il numero di rettangoli da analizzare;
- per ciascun rettangolo legge la base e l’altezza;
- calcola la superficie;
- stampa i dati e la superficie;
- conta e stampa quanti rettangoli hanno superficie superiore a 10.
*/

#include <iostream>

using namespace std;

int main() {
    int numRett;
    int rettAreaMaggDieci;

    rettAreaMaggDieci = 0;

    cout << "Inserisci il numero di rettangoli che vuoi analizzare: " 
         << endl;
    cin  >> numRett;

    for (int i = 0; i < numRett; i++) {
        double base; 
        double altezza;
        double superficie;

        cout << "Inserisci base e altezza del rettangolo: " 
             << endl;
        cin  >> base 
             >> altezza;

        superficie = base * altezza;

        cout << "Superficie del rettangolo: " 
             << superficie 
             << endl;
        
        if (superficie > 10) {
            rettAreaMaggDieci += 1;
        }
    }

    cout << "Rettangoli con area maggiore di 10: " 
         << rettAreaMaggDieci 
         << endl;

    return 0;
}
