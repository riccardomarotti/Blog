Title: Implementare i while senza usare keywords
Date: 2011-04-23
Category: Programmazione
Tags: OOP, Spunti di riflessione, Ruby
Slug: post/4871880142/implementare-i-while-senza-usare-keywords
Abstract: Per fare i while non servono parole chiave...

Da una discussione con [Antonio][] su come implementare il concetto di ciclo while nel tool di programmazione a oggetti su cui stiamo lavorando, è risultato che non serve creare costrutti sintattici particolari, ma basta un utilizzo oculato dei blocchi.

[Antonio]: http://blogs.ugidotnet.org/AntonioGanci/Default.aspx

Come sempre, l’ispirazione arriva da Smalltalk.

Un esempio tipico di ciclo while è rappresentato dal fattoriale. Vediamone il calcolo per il numero 5, in Ruby:

    :::ruby
     count = 5
     fattoriale = 1

     while count > 0 do
         fattoriale = fattoriale * count
         count -= 1
     end

     puts fattoriale

Il `while` valuta l’espressione passata (count > 0) ed esegue il blocco passato fintanto che tale espressione è vera.

[Come per gli if][], però, sarebbe stato possibile evitare di usare costrutti procedurali: è sufficiente aggiungere un messaggio `while_true` alla classe che rappresenta il blocco (cioè `Proc`), e usarlo in modo del tutto analogo al while:

[Come per gli if]: /post/3181905943/implementare-gli-if-senza-usare-keywords/

    :::ruby
     proc { count > 0 }.while_true do
         fattoriale = fattoriale * count
         count -= 1
     end

Il blocco anonimo `{ count > 0 }` è un oggetto che risponde al messaggio `while_true`.

L’implementazione di `while_true` deve essere tale per cui, fintanto che l’esecuzione del blocco restituisce `true`, viene eseguito il blocco passato come parametro:

    :::ruby
     class Proc
         def while_true &block
             self.call.if_true do
                 block.call
                 self.while_true &block
             end
         end
     end

`while_true` viene invocato ricorsivamente finché l’espressione del blocco che riceve il messaggio non è falsa.

(Per l’implementazione di `if_true`, si veda il [post sugli if]).

[post sugli if]: /post/3181905943/implementare-gli-if-senza-usare-keywords/

Può dare l’impressione di essere una banale modifica sintattica, ma si tratta di una differenza più sostanziale di quanto sembri.

Gestire i `while` in questo modo permette di rimuovere una parola chiave, semplificare il linguaggio, e renderlo più object oriented, dato che anche il ciclo while si riduce a uno scambio di messaggi.
