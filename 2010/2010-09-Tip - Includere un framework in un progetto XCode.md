Title: Tip - Includere un framework in un progetto XCode
Date: 2010-09-10
Category: Tips
Tags: XCode
Slug: post/1096272870/framework-tip
Abstract: Tip.

Quando si include un framework esterno in un progetto XCode, per esempio, GData, anche se compila tutto, può succedere che, una volta eseguita l’applicazione, ci sia un crash con un errore del tipo:

    dyld: Library not loaded: @loader_path/../Frameworks/GData.framework/[…]
    Referenced from:[path dell’eseguibile]
    Reason: image not found


Questo succede perché l’eseguibile, linkato dinamicamente con il framework, non trova la libreria a runtime. Infatti la directory Frameworks non esiste all’interno del bundle dell’eseguibile.

Per creare la directory e copiare al suo interno la libreria, basta aggiungere un “Copy Files Build Phase” (Click destro sul target, poi `Add -> New Build Phase -> New Copy Files Build Phase`):

![ima1](/static/images/framework-tip-1.png)

e assicurarsi di selezionare Frameworks come Destination

![ima2](/static/images/framework-tip-2.png)

Ora basta draggare il framework nel passo appena creato

![ima3](/static/images/framework-tip-3.png)

In questo modo, la libreria sarà copiata opportunamente, e non ci saranno sorprese a runtime.
