/* 
    Scrivere un programma in linguaggio C++ che:
    - legga dalla tastiera la lunghezza delle basi e dell’altezza di un trapezio;
    - calcoli l’area del trapezio;
    - stampi sullo schermo l’area calcolata.
*/  

#include <iostream>
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
  
    cout << "Digita rispettivamente altezza e lunghezza delle basi maggiore e minore del trapezio: ";
    cin >> altezza 
        >> baseMaggiore 
        >> baseMinore;
  
    areaTrapezio = ((baseMaggiore + baseMinore) * altezza) / 2;
  
    cout << "Area del trapezio: " 
         << areaTrapezio;
  
    return 0;
}
