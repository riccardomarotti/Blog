Title: Migliorare il design grazie agli oggetti immutabili
Date: 2010-06-18
Category: Programmazione
Tags: C, Erlang, Linguaggi funzionali, OOP, Oggetti immutabili, Preferiti
Slug: post/711204747/migliorare-il-design-grazie-agli-oggetti-immutabili

In [Erlang][] non esistono le variabili a cui siamo abituati. All’interno di uno scope, si può assegnare un valore a una variabile una sola volta. Questo approccio, tipico dei linguaggi funzionali, aiuta a ridurre gli effetti collaterali (side-effects).

[Erlang]: http://www.erlang.org/

Una funzione è detta [pura][], cioè senza effetti collaterali, se, dato un input, il suo output è sempre lo stesso, indipendentemente dal contesto in cui viene eseguita.

[pura]: http://en.wikipedia.org/wiki/Pure_function

Proviamo a trasferire nel mondo a oggetti questi concetti: dato un oggetto immutabile, cioè un oggetto che non può cambiare il suo stato, tutti i suoi metodi che restituiscono un valore saranno funzioni pure.

Vediamo cosa accade se usiamo solo oggetti immutabili in un semplice esempio: come rappresentare una traiettoria, cioè un insieme ordinato di punti.

La prima cosa che viene in mente, per l’implementazione, è mantenere una lista di punti all’interno di un oggetto e, a ogni chiamata di un metodo, per esempio `Move`, viene aggiunto un punto a questa lista:

    :::ruby
    public class Trajectory
    {
      List<Point> points = new List<Point>{new Point(0, 0)};
    
      public void Move(int delta_x, int delta_y)
      {
        points.Add(new Point(CurrentX + delta_x, CurrentY + delta_y));
      }
    
      public int CurrentX { get { return points[points.Count-1].X; } }
      public int CurrentY { get { return points[points.Count-1].Y; } }
    }

Il metodo `Move` non è una funzione, ma una procedura; inoltre non è privo di effetti collaterali: se, una volta istanziata la traiettoria, lo invoco N volte con gli stessi parametri, ottengo N cambi di stato.

Allora rendiamo la traiettoria un oggetto immutabile.

La prima domanda che sorge è: come si gestiscono i cambiamenti di stato? Ogni cambiamento di stato corrisponde alla creazione di un nuovo oggetto.

Allora, facciamo in modo che, a ogni chiamata a Move, venga creata una nuova traiettoria:

    :::ruby
    public class Trajectory
    {
      List<Point> points;
    
      public Trajectory()
      {
        points = new List<Point>{new Point(0, 0)};
      }
    
      private Trajectory(List<Point> points)
      {
        this.points = points;
      }
    
      public Trajectory Move(int delta_x, int delta_y)
      {
          return new Trajectory(new List<Point>(points)
                {new Point(CurrentX + delta_x, CurrentY + delta_y)});
      }
    
      public int CurrentX { get { return points[points.Count-1].X; } }
      public int CurrentY { get { return points[points.Count-1].Y; } }
    }

</pre>
La nuova traiettoria sarà una copia della precedente, con il nuovo punto aggiunto.

Il nuovo metodo `Move` è diventato una funzione pura: una volta istanziata una traiettoria, invocandolo N volte con gli stessi parametri, ottengo sempre lo stesso risultato. Tant’è che la nuova traiettoria è un oggetto immutabile.

Il prossimo passo è rendere questo codice più object oriented. Perché non lo è tanto? Vengono usati tre oggetti: `Trajectory`, `Point` e `List`. Però Point e List non fanno nulla: si limitano a mantenere uno stato [^1]. Da notare che è stata l’introduzione dell’immutabilità che ha rimosso l’unica azione fatta dall’oggetto `List`, cioè la chiamata al metodo `Add`, evidenziandone l’inutilità.

L’unico comportamento presente è quello rappresentato dal metodo `Move`. Quindi dovrà esserci un solo tipo di oggetto, che implementi il metodo Move e mantenga lo stato dei punti.

Questo è un possibile approccio: cominciamo con un’interfaccia `IPoint`:

    :::ruby
    public interface IPoint
    {
      int X{ get; }
      int Y{ get; }
    
      IPoint Move (int delta_x, int delta_y);
    }

Si vede che il metodo `Move` restiruisce un punto, questo perché, a ogni sua invocazione, per mantenere l’immutabilità, se ne deve creare uno nuovo.

Definiamo il punto iniziale, cioè quello di coordinate (0,0):

    :::ruby
    public class StartPoint : IPoint
    {
      public int X { get { return 0; } }
      public int Y { get { return 0; } }
    
      public IPoint Move(int delta_x, int delta_y)
      {
        return new RelativePoint(this, delta_x, delta_y);
      }
    }

La classe `RelativePoint`, istanziata dal metodo `Move`, sarà una cosa del tipo:

    :::ruby
    public class RelativePoint : IPoint
    {
      IPoint previousPoint;
      int delta_x, delta_y;
    
      public RelativePoint(IPoint prev, int delta_x, int delta_y)
      {
        this.previousPoint = prev;
        this.delta_x = delta_x;
        this.delta_y = delta_y;
      }
    
      public int X { get { return previousPoint.X + delta_x; } }
      public int Y { get { return previousPoint.Y + delta_y; } }
    
      public IPoint Move (int delta_x, int delta_y)
      {    
        return new RelativePoint(this, delta_x, delta_y);
      }
    }

In questo modo, il concetto di traiettoria non è stato modellato utilizzando una classe che la rappresenta, cioè una struttura, ma tramite lo scambio di messaggi tra gli oggetti che la compongono, i punti[^2]. Molto semplice, e molto object oriented[^3].

**Lo stato del sistema**, la traiettoria, **è definito solo dall’interazione tra oggetti** (immutabili), i punti.

In generale, forzandosi a utilizzare oggetti immutabili, viene più naturale sviluppare il design in questa direzione, cioè verso lo sfruttamento dell’interazione tra oggetti, anziché della loro struttura.

In un contesto così semplice, è difficile apprezzare i vantaggi di questo approccio però possiamo vedere, per esempio, l’implementazione della rimozione dell’ultimo punto della traiettoria per il design a oggetti:

    :::ruby
    public IPoint RemoveLast() // per StartPoint
    {
      return this;
    }   
    
    public IPoint RemoveLast() // per RelativePoint
    {
      return previousPoint;
    }

e per quello procedurale:

    :::ruby
    public void RemoveLast()
    {
      if (points.Count > 1) {
        points.RemoveAt(points.Count-1);
      }
    }


Cos’è meglio?

[^1]:  “Object-oriented computation is about the exchange of messages between objects. The purpose is to create objects and to send objects back and forth via messages” (<http://www.ccs.neu.edu/home/matthias/Presentations/ecoop2004.pdf>).

[^2]: Attenzione perché, compilando in Debug, la ricorsione porta facilmente ad avere delgli stack overflow, già con 100.000 punti. Compilando in Release, viene effettuata la [tail-call optimization][tco], per cui non ci sono limiti alla ricorsione, se non quelli imposti dalla memoria del sistema.

[tco]: http://en.wikipedia.org/wiki/Tail_call

[^3]: L’eliminazione della duplicazione del metodo `Move` è un semplice esercizio, che viene lasciato al lettore :)