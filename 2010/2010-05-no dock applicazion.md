Title: Come rimuovere un’applicazione dal dock
Date: 2010-05-02 13:04
Slug: post/565367936/no-dock-application
Category: Tips
Tags: Video, Xcode, Objective C

<iframe width="500" height="281" src="http://www.youtube.com/embed/591xWdi-suA?wmode=transparent&autohide=1&egm=0&hd=1&iv_load_policy=3&modestbranding=1&rel=0&showinfo=0&showsearch=0" frameborder="0" allowfullscreen></iframe>

**Spike**: come rimuovere un’applicazione dal dock e aggiungere alla barra di stato un’icona per l’applicazione, con relativo menu.

Questo video mostra i risultati del primo spike che ho fatto riguardo l’[applicazione][] simil Dropbox che sto sviluppando.

[applicazione]: http://blog.riccardomarotti.com/post/560768127/dropbox-sui-google-docs/

Per rimuovere l’icona dal dock, è sufficiente impostare a `True` la property `Applicaion is Agent`.

Per aggiungere un'icona alla status bar, con relativo menu, bisogna configurare a run-time, per esempio nel metodo `awakeFromNib` dell’application delegate[^1], lo status item dell’applciazione:

	:::objective-c
	[statusItem setMenu:applicationMenu];

	[statusItem setImage:[NSImage imageNamed:name]];

Nell’esempio ho usato l’icona di Dropbox:

La musica è dei Blue Wave Theory, ed è reperibile su magnatune.

[^1]: Quando si lancia l'applicazione, viene costruito il grafo degli oggetti codificati nel file `.xib` e vengono creati gli oggetti corrispondenti con le relative connessioni. Alla fine, prima di visualizzare l'applicazione, viene inviato il messaggio `awakeFromNib` a tutti gli oggetti che rispondono a tale messaggio.
