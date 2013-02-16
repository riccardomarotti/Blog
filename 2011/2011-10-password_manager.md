Title: Tip - password manager minimale
Date: 2011-10-25
Category: Tips
Tags: Robe da nerd
Slug: post/11898574381/tip-password-manager-minimale
Abstract: Come creare un password manager tramite Bash.

Dopo aver letto [questo][hacked] articolo, il mio desiderio di avere password complesse è aumentato. Tale desiderio, però, non va d’accordo con la mia incapacità mnemonica.

Allora ho pensato a un [password manager][pwdmanager], ma sono tutti troppo complessi (e in certi casi costosi). A me serve solo un software che:

1. mi generi delle password
2. me le salvi in modo sicuro, proteggendole con una password (l’unica che dovrò ricordare)
3. mi permetta di copiare negli appunti una password salvata

Spendere 50 euro per questo mi sembrava eccessivo ([keepass][] è gratuito, ma su Mac serve Mono…).

[hacked]: http://www.theatlantic.com/magazine/archive/2011/10/hacked/8673/
[pwdmanager]: http://en.wikipedia.org/wiki/Password_manager
[keepass]: http://keepass.info/

Per cui, dopo qualche ricerca, il nerd che è in me ha prodotto questo script, che va aggiunto al proprio `~/.bash_profile`:

    :::bash
    PWD_DIR=~/Dropbox/passwords
    DEFAULT_PWD_FILE=password

    function genpwd()
    {
        head /dev/urandom | uuencode -m - | sed -n 2p | head -c ${2:-15} \
            | gpg -c --force-mdc > $PWD_DIR/${1:-$DEFAULT_PWD_FILE}.gpg;
    }

    function getpwd()
    {
        gpg -d $PWD_DIR/${1:-${DEFAULT_PWD_FILE}}.gpg | pbcopy
    }

In sostanza vengono creati due comandi: `genpwd`, che genera una password, la critta con [gpg][], e la salva. E `getpwd`, che permette di copiarla negli appunti.

[gpg]: http://www.gnupg.org/

Per esempio

    :::bash
     genpwd google 20

crea una password di 20 caratteri e la salva, crittata, nel file `google.gpg`, contenuto nella directory `~/Dropbox/passwords` (per cambiare la directory, basta modificare la variabile PWD_DIR).

Se non si passano parametri, viene generata una password di 15 caratteri (lunghezza di default) e viene salvata nel file `password.gpg` (che è il nome di default).

Per ottenere la password salvata

    :::bash
     getpwd google

decritta il file `google.gpg` e copia il suo contenuto (cioè la password) negli appunti.

Volendo si può svuotare la clipboard con

    :::bash
     pbcopy < /dev/null
