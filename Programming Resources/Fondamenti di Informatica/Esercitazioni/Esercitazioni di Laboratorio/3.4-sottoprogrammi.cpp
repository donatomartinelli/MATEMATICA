/*
    Utilizzando i sottoprogrammi, scrivere un programma in linguaggio C++ che consente di elaborare i dati
    relativi ad un insieme di segmenti, secondo le seguenti specifiche:
    - il programma chiede il numero di segmenti da elaborare;
    - per ciascun segmento:
        - l’applicazione acquisisce dalla tastiera le coordinate (x1,y1) e (x2,y2) degli estremi del segmento;
        - calcola la lunghezza del segmento; (La misura del segmento che congiunge i due vertici è uguale alla distanza euclidea);
        - stampa sullo schermo le coordinate dei vertici e la lunghezza del segmento.
*/

#include <iostream>
#include <cmath>

using namespace std;

double lunghezza(double x1, double y1, double x2, double y2) {
    double lung;

    lung = sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));

    return lung;
}

int main() {
    int numSeg;

    cout << "Inserisci il numero di segmenti da elaborare: " 
         << endl;
    cin  >> numSeg;

    for (int i=0; i < numSeg; i++) {
        double x1, y1, x2, y2;
        double lung;

        cout << "Inserisci le coordinate del primo punto: ";
        cin  >> x1 
             >> y1;
        cout << "Inserisci le coordinate del secondo punto: ";
        cin  >> x2 
             >> y2;

        lung = sqrt(x1 * x2 + y1 * y2);
        
        cout << "Coordinate dei vertici: " 
             << "(" << x1 << "," << y1 << "), "
             << "(" << x2 << "," << y2 << "), "
             << endl
             << "Lunghezza del segmento: " 
             << lunghezza(x1, y1, x2, y2) 
             << endl;
    }

    return 0;
}
