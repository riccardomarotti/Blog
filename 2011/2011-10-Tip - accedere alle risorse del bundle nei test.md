Title: Accedere alle risorse del bundle nei test
Abstract: Tip.
Date: 2011-10-24
Category: Tips
Tags: Objective C
Slug: post/11855069147/tip-accedere-alle-risorse-del-bundle-nei-test

Per accedere ai file contenuti nel bundle di un’applicazione iOS, in genere si usa una cosa del tipo:

    :::Objective-C
     NSBundle *bundle = [NSBundle mainBundle];

Purtroppo, nei test, se si prova a usare il mainBundle per ottenere il path di una risorsa,

    :::objective-c
     [bundle pathForResource:@"aResource"  ofType:@"aType"];

si ottiene un bel `NULL`. 

Penso che questo succeda perché il mainBundle è il bundle associato alla directory dell’applicazione correntemente in esecuzione, che non è la nostra applicazione, ma il tester.

Per ovviare a questo problema, si può usare

    :::objective-c
     NSBundle *bundle = [NSBundle  bundleForClass:[MyTestedClass  class]];

che restituisce il bundle associato alla directory che contiene la classe passata.

Passando la classe testata, si otterrà il bundle associato alla directory che contiene tutte le risorse usate nel test.
