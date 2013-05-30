Title: Dropbox sui Google Docs
Date: 2010-05-1 6:11
Tags: Objective C, Cocoa
Slug: post/560768127/dropbox-sui-google-docs

<blockquote></blockquote>&#13;
&#13;
<blockquote>&#13;
<p><em><strong>Nota</strong>: ho sospeso lo sviluppo di questa applicazione, dato che le API di google per accedere ai documenti funzionano solo per i Google Apps Premier Account, che hanno un costo che rendono sostanzialmente inutile un’applicazione del genere. Se e quando tali API funzioneranno anche per account gratuiti, finirò il lavoro.</em></p>&#13;
</blockquote>&#13;
<p>Oggi inizio ufficialmente lo sviluppo di un’applicazione che permetta di sincronizzare una directory locale con i Google Documents. In pratica vorrei fare una sorta di Dropbox che si appoggi a Google.</p>&#13;
<p>Perché? </p>&#13;
<ul><li>50GB con Dropbox costano 100$ l’anno</li>&#13;
<li>20GB sui Google Docs costano 5$ l’anno</li>&#13;
<li>80GB sui Google Docs costano 20$ l’anno.</li>&#13;
</ul><p>Non credo servano ulteriori commenti :).</p>&#13;
<p>Come avevo detto <a target="_blank" href="http://riccardo.marotti.name/post/537851192/ma-davvero-agli-italiani-non-interessa-il-tdd">precedentemente</a>, vorrei riportare qui gli sviluppi dello sviluppo :)</p>&#13;
<p>Lo annuncio pubblicamente perché ritengo sia uno stimolo in più ad arrivare in fondo.</p>&#13;
<p>La prima cosa che farò è uno spike per capire come si possa creare un’applciazione che non appaia nel dock, ma solo nella barra del menu, esattamente come fa Dropbox (ma anche Time Machine, per esempio).</p>&#13;
<p>Poi farò un altro spike per capire a fondo come si può interagire con i docs da Objective C. </p>&#13;
<p>Poi inizierò a scrivere codice veramente: non ho ancora creato le carte, ma a grandi linee penso ci saranno tre temi principali:</p>&#13;
<ul><li>modulo per l’accesso ai docs</li>&#13;
<li>modulo con la logica di sincronizzazione</li>&#13;
<li>interfaccia grafica</li>&#13;
</ul><p>Penso che, tra un mesetto (sia chiaro, non è una <a target="_blank" href="http://riccardo.marotti.name/post/556460537/sulle-stime">stima</a> ;), avrò bisogno di qualche beta tester: qualcuno si offre volontario?</p>