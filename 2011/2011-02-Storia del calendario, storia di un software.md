Title: Storia del calendario, storia di un software
Date: 2011-02-22
Category: Racconti
Tags: Preferiti
Tags: Spunti di riflessione
Slug: post/3445357594/storia-del-calendario-storia-di-un-software
Abstract: Perché la storia del calendario sembra la storia di un software.

Sono sempre stato piuttosto affascinato dall’evoluzione che ha avuto il calendario.

Credo che questo sia dovuto al fatto che il calendario, in sostanza, è un software, essendo l’applicazione di un algoritmo. Il bello è che la sua evoluzione sembra quella di un software.

Il problema del calendario è che il periodo di rivoluzione della terra intorno al sole (l’anno) e quello di rotazione su se stessa (il giorno), non sono sincronizzati. Per cui un anno non è divisibile in un numero intero di giorni. In particolare un anno è composto da 365 giorni, 6 ore, 9 minuti e 10 secondi (365,2422).

Una delle prime versioni di calendario fu quello di Romolo. Pare che questo calendario avesse dieci mesi, sei da 30 e quattro da 31 giorni, da marzo a dicembre, per un totale di 304 giorni. Alla fine di dicembre si smetteva semplicemente di contare i giorni, fino alla primavera. Questo sistema, che, in pratica, non considera l’inverno, non aveva il problema della non sincronizzazione di durata anno/giorno.

È un po’ come una prima release: fa quello che deve, sebbene un po’ rozza, ma alla fine in inverno i campi restano fermi; va bene così.

Poi si cominciò a pensare che il popolo romano non potesse ritenere accettabile un sistema così impreciso. È come quando arriva il nuovo manager con discorsi del tipo “il processo deve essere mappato in modo più rigoroso!”, con l’unico scopo di illudersi di avere più [controllo].

[controllo]: http://riccardo.marotti.name/post/556460537/sulle-stime/

Allora Numa modificò le durate dei mesi (i mesi con giorni pari portavano sfortuna) e aggiunse Gennaio e Febbraio. In questo modo si arrivò ad avere 355 giorni. Per recuperare i dieci giorni che mancavano, venne introdotto un complicatissimo sistema di recupero, che, in sintesi, consisteva nell’inserire un mese straordinario, il Mercedonio, ogni due anni, che durava 22 o 23 giorni. Il ciclo era di quattro anni: anno normale, anno con mercedonio di 22 giorni, anno normale, anno con mercedonio di 23 giorni, anno normale, anno con mercedonio di 22 giorni.

L’anno medio, con questo sistema, era di 366 giorni e 6 ore. C’era quindi ancora uno sfasamento di un giorno tra l’anno solare e l’anno civile. Uno sfasamento eccessivo, che portò a innumerevoli modifiche (bug fix) che complicarono sempre di più la regola, fino a portarla ad avere un ciclo di 24 anni. 

Anche nel software, si tende ad aggiungere logiche per adattare alle nuove richieste, piuttosto che trovare la soluzione più semplice che soddisfi sia le vecchie, sia le nuove features.  

In sostanza fu impossibile applicare queste regole e, intorno alla metà del primo secolo avanti Cristo, lo sfasamento tra anno solare e anno civile era di circa tre mesi.

Giulio Cesare, quindi, affidò all’astronomo Sosìgene, l’arduo compito di sistemare le cose. 

Insomma: abbiamo un software che funziona da ormai svariati anni a forza di bug-fix e martellate, ora non funziona più e non riusciamo più a gestirlo: chiamiamo uno bravo che ci sistema la baracca.

L’esperto considerò che l’anno durasse 365,25 giorni. Di conseguenza il nuovo anno sarebbe stato di 365 giorni, e di 366 ogni quattro anni, così che la durata media fosse di 365,25 giorni. Per ottenere questo ci sarebbero stati dodici mesi di 30 e 31 giorni alternati, con l’eccezione di febbraio che sarebbe stato di 29 giorni, e 30 ogni quattro anni. Questo calendario, il calendario Giuliano, entrò in vigore nel 45 a.c. Però, per azzerare gli errori accumulatisi negli anni precedenti si decise di rinunciare alla retrocompatibilità: il 46 a.c. fu un anno particolare; vi furono aggiunti tre mesi di 23, 33 e 34 giorni; così l’ultimo anno di Numa ebbe 445 giorni. 

Questo calendario è decisamente migliore dei predecessori, perde 3 giorni ogni 400 anni, e ha regole semplici.

Perfettamente consci del problema dei 3 giorni persi ogni quattrocento anni, si andò avanti, ignorando la cosa; questo è un classico dell’informatica: sappiamo benissimo che c’è un problema. Adesso sarebbe facilissimo sistemarlo, ma adesso tutto funziona in modo accettabile: ci preoccuperemo quando sarà ora (e sarà difficilissimo sistemarlo).

Così, nel sedicesimo secolo lo sfasamento tra anno solare e civile arrivò a circa dieci giorni. Allora nel 1582 ci fu la riforma Gregoriana, cioè l’attuale calendario. La cosa interessante fu che, per recuperare i giorni persi, si rinunciò nuovamente alla retrocompatibilità e si fece in modo che il giorno successivo al 4 ottobre 1582 fosse il 15 ottobre.

In Svezia però, si tentò di mantenere la retrocompatibilità. La decisione di passare dal Giuliano al Gregoriano fu presa nel 1699, ma si decise di recuperare i dieci giorni eliminando gli anni bisestili dal 1700 al 1740; cioè si sarebbe recuperato un giorno ogni 4 anni, cioè dieci nei quarant’anni. Solo che questo piano fu applicato solo nel 1700: nel 1704 e nel 1708 si dimenticarono di farlo. Una volta capito l’errore, si tornò al calendario Giuliano. 

Alla fine la Svezia passò al Gregoriano nel 1753, rinunciando alla retrocompatibilità, cioè saltando i giorni dal 18 al 28 febbraio.

Quanti software hanno avuto storie simili?