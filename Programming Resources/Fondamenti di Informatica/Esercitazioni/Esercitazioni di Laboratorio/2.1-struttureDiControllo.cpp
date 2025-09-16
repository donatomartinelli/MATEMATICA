/**
Scrivere un programma in linguaggio C++ che consenta di calcolare il perimetro di un poligono con n lati, secondo le seguenti specifiche il programma:
- chiede il numero di lati del poligono;
- per ciascun lato chiede la misura;
- calcola il perimetro del poligono;
- stampa sullo schermo il perimetro calcolato.
Introduci inoltre meccanismi di convalida dei dati di ingresso.
*/


#include <iostream>
#include <cmath>

using namespace std;

int main (){
    int numeroLati;
    float lato;
    float perimetro;

    perimetro = 0;

    cout << "Inserisci numero lati del poligono: " 
         << endl;
    cin  >> numeroLati;

    while (numeroLati < 3){
        cout << "Numero errato di lati (deve essere almeno 3)." 
             << endl
             << "Inserisci numero lati del poligono: " 
             << endl;
        cin  >> numeroLati;
    }

    for (int i = 0 ; i < numeroLati ; i++){
        cout << "Inserisci lunghezza del lato " 
             << i+1 
             << ": " 
             << endl;
        cin  >> lato;

        while (lato <= 0){
            cout << "Lunghezza errata (deve essere maggiore di 0)." 
                 << endl
                 << "Inserisci lunghezza del lato " 
                 << i+1 
                 << ": " 
                 << endl;
            cin  >> lato;
        }

        perimetro += lato;
    }
  
    cout << "Perimetro del poliono: " 
         << perimetro 
         << endl;

    return 0;
}
