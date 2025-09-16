/* 
Scrivere un programma in linguaggio C++ che legga da tastiera il nome di un mese dell’anno e stabilisca:
- Il numero dei giorni di cui il mese è formato;
- stampi sullo schermo il risultato.
(l'algoritmo è basato sul detto:"30 giorni ha novembre, con aprile, giugno e settembre, di 28 ce n'è uno (febbraio) tutti gli altri son 31.)
*/ 

#include <iostream>
#include <string>

using namespace std;

int main(){
    int numGiorni;
    string mese;

    numGiorni = 0;
    
    cout << "Inserisci nome mese: " 
         << endl;
    
    getline(cin,mese);

    if (mese == "novembre" || mese == "aprile" || mese == "giugno" || mese == "settembre") {
        numGiorni = 30;
    } else if (mese == "febbraio") {
        numGiorni = 28;
    } else {
        numGiorni = 31;
    }
    
    cout << "Il mese di " 
         << mese 
         << " ha " 
         << numGiorni 
         << " giorni." 
         << endl;
    
    return 0;
}
