# Direttive per la Scrittura della Funzione MATLAB

## 1. Struttura e Documentazione (Help Text)
* **Intestazione:** La prima riga deve contenere il nome della funzione e una descrizione sintetica.
* **Sintassi Generica:** Nella descrizione dell'uso, utilizzare `F` maiuscola per indicare la funzione (es. `Z = F(x, y)`), specificando chiaramente le dimensioni delle matrici/vettori.
* **Separazione Visiva:** Utilizzare `%%` per dividere le varie fasi dell'algoritmo. Questo crea sezioni visive e concettuali (code folding) nell'editor di MATLAB.

## 2. Ordine delle Operazioni
1.  **Validazione Input (Dimensioni):** Primo step fondamentale.
2.  **Controllo Stabilità Numerica (Epsilon):** Verifica affidabilità dei valori.
3.  **Pre-allocazione:** Riservare memoria prima dei calcoli.
4.  **Algoritmo:** Esecuzione del calcolo vero e proprio.

## 3. Gestione Errori e Stabilità
* **Sintassi Errori:** Usare sempre `error('nomefunzione:nomeerrore', 'Messaggio')`.
* **Stabilità (Epsilon Macchina):** Mai controllare se un numero è *esattamente* zero (`if x == 0`). Controllare se è inferiore alla precisione di macchina usando `eps`.
    * *Regola:* Se `abs(x) < eps`, il numero è inaffidabile/troppo piccolo.
* **Allocazione:** Usare sempre `zeros()` per pre-allocare le matrici risultato.
