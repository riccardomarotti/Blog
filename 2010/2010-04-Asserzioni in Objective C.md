Title: Asserzioni in Objective C
Date: 2010-04-22 13:09
Category: Spunti di riflessione
Tags: Objective C, Robe da nerd, Unit test
Slug: post/540519014/asserzioni-in-objective-c

Da una [discussione][] in un post di [Antonio][], mi sono accorto che i matcher usati in Objective C non sfruttano l’espressività del linguagggio.

[discussione]: http://blogs.ugidotnet.org/AntonioGanci/archive/2010/04/19/un-approccio-per-ottenere-una-architettura-malleabile.aspx#feedback

[Antonio]: http://blogs.ugidotnet.org/AntonioGanci/Default.aspx


Le assert di [OCUnit][] sono cose del tipo:

    :::objective-c
    STAssertNotNil (object, @"messsage");

[OCUnit]:http://www.sente.ch/software/ocunit/

La libreria [Hamcrest][] addolcisce un po’ la sintassi:

    :::objective-c
    AssertThat (object, isNot(nil));
    
[Hamcrest]: http://code.google.com/p/hamcrest/


Hamcrest, però, non è altro che un porting di una libreria Java, per cui utilizza la sintassi che ti permette di usare Java.

In virtù della sua parentela con Smalltalk, Objective C è molto più espressivo di così, e permette di fare cose del tipo:

    :::objective-c
    [Assert that:object isNot:nil];
    
Non è meglio?

Per l’implementazione, si tratta di creare il metodo `that:IsNot:` sulla classe `Assert`, nulla di più.

Ho intenzione di usare qualcosa del genere nei miei progetti.

Voi cosa ne pensate?