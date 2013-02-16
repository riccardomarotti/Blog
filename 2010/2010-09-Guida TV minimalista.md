Title: Guida TV minimalista
Date: 2010-09-30
Category: Programmazione
Tags: Ruby
Slug: post/1215146887/guidatv
Abstract: http://guidatv.heroku.com

Volevo una singola pagina, che mi permettesse, senza dover cliccare mille link, scrollare pagine lunghissime, o usare applicazione flash dall’usabilità discutibile, di vedere i programmi tv della serata, per tutti canali che mi interessano .

Non sono riuscito a trovarla, per cui me la sono fatta, ed è questa:

<http://guidatv.heroku.com>

È un’applicazione che raccoglie i dati dei programmi in giro per la rete, e li mostra, si spera senza troppi errori (non sono un mago delle regular expression), in una singola pagina. È anche possibile vedere la programmazione completa dei singoli canali.

Questo esercizietto, oltre a fornirmi un servizio che mi mancava, mi ha permesso di scoprire come funziona [Heroku][], che, devo dire, non è niente male.

[Heroku]: http://www.heroku.com/

Nella fattispecie, mi ha permesso di pubblicare un’applicazione fatta con [Camping][], con accesso a un database, e un cron giornaliero che aggiorna i dati. Niente male per zero euro.

[Camping]: http://camping.rubyforge.org/

Se qualcuno la trova utile, o la troverebbe utile se solo avesse quella tal feature, può mandarmi una mail, o commentare qui sotto.
