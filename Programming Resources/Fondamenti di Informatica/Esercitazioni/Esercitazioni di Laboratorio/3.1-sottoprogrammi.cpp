/*
    Si scriva un programma in linguaggio C++, strutturato mediante i sottoprogrammi, che effettui le seguenti operazioni
    - legga da tastiera un numero intero positivo (con convalida del dato);
    - stampi a video tutti i numeri primi minori o uguali di tale intero;
    - effettui la media di tali numeri primi;
    - stampi a video la media e il numero di numeri primi.
    (Sugg. Un numero primo k non può essere pari, tranne il 2, e non deve essere divisibile per 3,5,7,…k-1.)
*/

#include <iostream>

using namespace std;

void lettura(int &num) {
    cout << "Inserisci un numero intero positivo: ";
    cin  >> num;

    while (num <= 0 ) { 
        cout << "Errore."
             << endl
             << "Inserisci un numero intero positivo: ";
        cin  >> num;
    }

    return;
}

void prime (int num, bool &primo) {
    int numDivisori;
    
    numDivisori = 0;
    
    for (int i = 1; i < num +1; i++) {
        if ((num % i) == 0) {
            numDivisori += 1;
        }
    }
    
    if (numDivisori == 2) {
        primo = true;
    } else {
        primo = false;
    }
    
    return;
}

int main() {
    int num;
    int sommaPrimi;
    int numeroPrimi;
    float mediaPrimi; 
    
    sommaPrimi = 0;
    numeroPrimi = 0;
    
    lettura(num);
    
    for (int i = 2; i < num + 1; i++) {
        int numDivisori;
        bool primo;
    
        numDivisori = 0;
    
        prime(i, primo);
    
        if (primo) {
            sommaPrimi += i;
            numeroPrimi += 1;
            
            cout << numeroPrimi 
                 << " " 
                 << i 
                 << endl;
            } 
    }
    
    mediaPrimi = sommaPrimi / numeroPrimi;
    
    cout << "Numero primi: " 
         << endl
         << numeroPrimi
         << endl
         << "Somma primi: "
         << endl
         << sommaPrimi
         << endl
         << "Media primi: "
         << endl
         << mediaPrimi
         << endl;
    
    return 0;
}
