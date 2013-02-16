Title: Come rimuovere il DRM dai PDF che hai comprato
Date: 2010-04-15
Category: Tips
Tag: pdf
Slug: post/522788392/come-rimuovere-il-drm-dai-pdf-che-hai-comprato

> **UPDATE** (Nov 2012): [questo articolo](http://lifehacker.com/5954466/how-do-i-get-rid-of-the-drm-on-my-ebooks-and-video) spiega come rimuovere le protezioni utilizzando [calibre](http://calibre-ebook.com), in modo più semplice rispetto a quanto spiegato in questo post.

Ieri ho comprato un ebook su [Book Depository][]. Visto che come formato indicava PDF, supponevo di poterlo leggere col vecchio caro [Preview][].

[Book Depository]: http://www.bookdepository.co.uk/
[Preview]: http://en.wikipedia.org/wiki/Preview_(software)

Invece, **solo dopo averlo pagato**, al momento del download, vengo informato di due cose sconcertanti:

* in quanto DRM munito, per leggere quel pdf serve Adobe Digital Editions (software notoriamente raccapricciante)
* posso scaricarlo al massimo 3 volte

A questo punto, dopo una [breve incazzatura galattica][] (il libro l’ho pagato 30 euro), decido che l’unica soluzione razionale è rimuovere il DRM dal pdf.

[breve incazzatura galattica]: http://www.gametrailers.com/user-movie/homer-simpson-angry/89292

La cosa, in realtà, è di una semplicità eclatante, a dimostrazione di quanto sia utile e fondamentale il DRM[^1].

Ho trovato [questo][strip_drm] articolo, che spiega come fare, solo che non funzionava: “error decrypting book session key”. Allora ho indagato ancora po’ e ho scoperto che bastava una versione più aggiornata degli script che suggeriva di usare.

[strip_drm]: http://imaddicted.ca/ebooks/using-inept-to-strip-drm/

In sostanza, per poter decrittare i pdf, servono: 

1. <strike>Windows :( (purtroppo gli script richiedono windll…) </strike>
2. [Python][] installato
3. [Pycrypto][] installato
4. Questi due script: [ineptpdf.pyw][ineptpdf], [ineptkey.pyw][ineptkey] ([ineptkeymac.py][ineptkeymac] su Mac) [^2]
5. Un’installazione di Adobe Digital Editions con registrato l’utente con cui si è scaricato il pdf

A questo punto, dopo aver messo gli script e il pdf in una qualunque directory (per esempio c:\pdf), si esegue, da una command line in quella directory, ineptkey.pyw per ottenere la chiave dell’utente.

![image1](/static/images/drm-1.png)

Poi si esegue `ineptpdf.pyw`

![image2](/static/images/drm-2.png)

inserendo il file contenente la chiave, il pdf protetto e il nome del file di output:

![image3](/static/images/drm-3.png)

Premere Decrypt.

Fatto.


[Python]: http://www.python.it/download/
[Pycrypto]: http://www.voidspace.org.uk/python/modules.shtml#pycrypto
[ineptpdf]: http://pastebin.com/sQSNwN8B
[ineptkey]: http://pastebin.com/HbHbebqY
[ineptkeymac]: http://pastebin.com/f1182324a

[^1]: Su [questo][pragprog] sito vendono libri tecnici senza DRM. Sono certo che loro non hanno problemi economici dovuti a questa assenza.
[^2]: Grazie a Lance che ha suggerito l’utilizzo di questo script su Mac, sotto nei commenti.

[pragprog]: http://pragprog.com/
