Title: Implementare gli if senza usare keywords
Date: 2011-02-8
Category: Programmazione
Tags: OOP, Spunti di riflessione, Preferiti
Slug: post/3181905943/implementare-gli-if-senza-usare-keywords
Abstract: Per fare gl'if non servono parole chiave.

Lavorando a un tool di sviluppo a oggetti, mi sono trovato a ragionare su quanto sia sbagliato usare la parola chiave `if` in un linguaggio a oggetti.

Le strutture di controllo come gli `if` sono fortemente procedurali e spingono a non programmare a oggetti.

Il succo della programmazione a oggetti è l’invio di messaggi; non è un caso se [Smalltalk] (l’unico linguaggio veramente a oggetti che conosco) implementa gli `if` come dei messaggi.

[Smalltalk]: http://en.wikipedia.org/wiki/Smalltalk

In Ruby i booleani sono le due classi `TrueClass` e `FalseClass`. 

Per ottenere un comportamento simile a quello di Smalltalk, si possono aggiungere i metodi `if_true` e `if_false` a queste classi:

    :::ruby
     class TrueClass
         def if_true
             yield
         end
    
         def if_false
         end
     end
    
     class FalseClass
         def if_true
         end
    
         def if_false
             yield
         end
     end
     
     aBoolean = 1==2
     aBoolean.if_true { print "true!" }
     # invece di
     # print “true!” if aBoolean
    
     aBoolean.if_false { print "false!" }
     # invece di
     # print “false!” unless aBoolean

Il metodo `if_true` di `TrueClass` esegue il blocco che viene passato, mentre `if_false` non fa nulla. La classe `FalseClass` ha il comportamento opposto.

Il bello di questo approccio è che non c’è nessun `if`; è un po’ come uno [state pattern][].

[state pattern]: http://en.wikipedia.org/wiki/State_pattern

Non capisco perché in Ruby gli `if` non siano stati implementati in maniera analoga (mentre per i cicli è stato fatto): in teoria, qualunque linguaggio che supporti i blocchi permette di non dover creare keywords per le strutture di controllo del flusso.
