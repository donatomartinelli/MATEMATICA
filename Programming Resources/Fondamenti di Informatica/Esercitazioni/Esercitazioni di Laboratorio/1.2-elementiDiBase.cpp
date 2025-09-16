/* 
Utilizzando un editor di testo creare nella cartella di lavoro un file denominato “dati.txt”, contenente tre numeri (es: 20 45.4 15.74)
Modificare il programma C++ scritto per risolvere l’esercizio n.1 in modo da effettuare le seguenti operazioni:
- Acquisire i valori delle basi e dell’altezza del trapezio dal file “dati.txt” creato al passo precedente
- Calcolare il valore dell’area del trapezio
- Scrivere il valore dell’area calcolata in un nuovo file denominato “risultati.txt”.
*/ 

#include <iostream>
#include <fstream>

using namespace std;

int main (){
    float altezza;
    float baseMaggiore;
    float baseMinore;
    float areaTrapezio;
    
    altezza = 0;
    baseMaggiore = 0;
    baseMinore = 0;
    areaTrapezio = 0;

    ifstream flussoLettura("dati.txt");

    flussoLettura >> baseMaggiore 
                  >> baseMinore 
                  >> altezza;
    
    areaTrapezio = ((baseMaggiore + baseMinore) * altezza) / 2;

    flussoLettura.close();

    ofstream flussoStampa ("risultati.txt");

    flussoStampa   << "Area del trapezio: " 
                   << areaTrapezio;

    flussoStampa.close();

    return 0;
}
