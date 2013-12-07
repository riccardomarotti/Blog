Title: Perché Objective C?
Date: 2010-04-26 8:46
Tags: Objective C, Smalltalk, Robe da nerd, Seaside
Slug: post/551290299/perche-objective-c

Premesso che sono fermamente convinto che
>Tools build productivity like keyboards build software.

penso che programmare con Objective C presenti molti vantaggi.

Ma quali sono le peculiarità che lo rendono migliore della maggioranza degli altri linguaggi?

###Messaggi###

Gli oggetti sono manipolati inviando loro messaggi.

Potrà sembrare banale, ma questo permette di fare cose molto sofisticate, come decidere a run-time come rispondere a un dato messaggio, oppure fare un broadcast del messaggio ad altri oggetti, e molto altro.

Inoltre, almeno per me, pensare che un programma non è altro che un insieme di oggetti che si inviano messaggi, aiuta a scrivere software migliore, perché fa focalizzare sul comportamento del codice e non sulla sua struttura.

###Semplicità###

Di fatto si tratta di C, con in più gli oggetti e la sintassi per inviare messaggi tra loro. Nulla di più.

Non ha tutte quelle features cosiddette *"avanzate"*, che ha, per esempio, il C++ (templates, ereditarietà multipla, overloading, e chi più ne ha più ne metta).

###Espressività###

La sintassi dell’invio dei messaggi è incredibilmente [espressiva][asserzioni].

[asserzioni]: http://blog.riccardomarotti.com/post/540519014/asserzioni-in-objective-c/

Questo metodo Ruby

    :::ruby
    str.insert(5, "pippo")

in ObjC diventa

    :::objective-c
    [str insertString:@"pippo" atIndex:5];

Quale si legge meglio?

###Dinamico###

I tipi vengono “risolti” a run-time (la parola chiave “id” significa “qualunque tipo”). Ecco perché non servono overloading & C.

###Statico###

Se lo desideri, i tipi sono risolti a “compile-time”: questo evita tutti i problemi dei linguaggi dinamici.

____

La maggioranza di queste caratteristiche sono ereditate da Smalltalk: naturalmente penso che Smalltalk sia il miglior linguaggio mai creato ;).

E allora perché non uso Smalltalk? Perché non mi soddisfa il look and feel delle applicazioni che produce. Essendo cross-platform, ha la sua versione delle finestre, dei bottoni, etc… Non si integra con il sistema.

Ecco perché la mia scelta è Objective C/Cocoa per le applicazioni desktop, Smalltalk/[Seaside][] per quelle web.

[Seaside]: http://www.seaside.st/
