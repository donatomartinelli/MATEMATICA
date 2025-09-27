/* 
    Scrivere un programma in linguaggio C++ che legga da tastiera un insieme di numeri reali (0 per fermarsi), ne calcoli il prodotto e lo stampi a video.
*/

#include <iostream>
#include <cmath>

using namespace std;

int main (){
    float numero;
    float prodotto;

    prodotto = 1;

    while (true){
        cout << "Inserisci un numero reale (0 per fermarti): " 
             << endl;
        cin  >> numero;

        if (numero != 0){
            prodotto *= numero;
        } else {
            break;
        }
    }

    cout << "Prodotto: " 
         << prodotto 
         << endl;

    return 0;
}
