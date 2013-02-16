Title: Code Sign error: Provisioning profile ‘XXX’ can’t be found
Date: 2011-05-11
Category: Tips
Tags: XCode
Slug: post/5393177862/code-sign-error-provisioning-profile-xxx-cant-be
Abstract: Tip.

Se si aggiorna un Provisioning Profile, per esempio, di una distribuzione ad hoc di un’applicazione iOS, può succedere che, tentando di compilare, si incappi in questo errore:

`Code Sign error: Provisioning profile 'XXX' can’t be found`

Questo succede perché, se il nome del profilo resta lo stesso, XCode non aggiornerà con il nuovo ID il riferimento al profilo di provisioning all’interno del progetto, ma manterrà quello vecchio, che non esiste più.

L’unico modo che ho trovato per risolvere questo problema è stato di editare “a mano” il file project.pbxproj che sta all’interno del bundle del progetto (file `.xcodeproj`). A questo punto, si devono sostituire tutte le occorrenze dell’ID presente nell’errore (quello che ho qui indicato con `XXX`) con l’ID che del nuovo profilo. Nel mio caso c’erano due righe simili a queste:

`PROVISIONING_PROFILE = “5EB9AFBEB-8D98-46F1-788C-482712DA5BA4”;`
`“PROVISIONING_PROFILE[sdk=iphoneos*]” = “5E9AFBEB-8D98-46F1-788C-482712DA5BA4”`


Per trovare il nuovo ID basta aprire l’Organizer, selezionare `Library/Provisioning Profiles` e selezionare il profilo. Nel riepilogo sarà presente il profile identifier.

