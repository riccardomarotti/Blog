Title: Tailcall optimization in Ruby
Date: 2011-04-25
Category: Tips
Tags: Ruby
Slug: post/4923406088/tailcall-optimization-in-ruby
Abstract: Un modo (discutibile) per rendere le ricorsioni illimitate, in Ruby.

Il [commento][] di Alessandro al mio [post precedente][] ha evidenziato che, con l’approccio descritto, non si potrebbe fare una cosa del tipo:

    :::ruby
     proc { true }.while_true do
         puts "Stack overflow?"
     end


[commento]: /post/4871880142/implementare-i-while-senza-usare-keywords#comment-190803796
[post precedente]: /post/4871880142/implementare-i-while-senza-usare-keywords
perché lo stack si riempirebbe dopo poco.

La soluzione a questo problema è l’implementazione della [Tailcall Optimization][] (TCO). In parole povere si tratta, quando possibile, di rendere iterative le chiamate ricorsive.
In teoria, dalla versione 1.9 di Ruby, è possibile abilitare la TCO, ma, o ho sbagliato qualcosa, oppure non funziona come dovrebbe, perché, anche abilitandola, lo stack va in overflow con la ricorsione.

[Tailcall Optimization]: http://en.wikipedia.org/wiki/Tail_call_optimization

Alla fine ho trovato [questa discussione][], da cui ho ricavato questo pezzo di codice, dove si sfrutta il meccanismo di *catch/throw* [^nota] e un po’ di metaprogrammazione:

    :::ruby
     class Class
       def tailcall_optimize(meth)
         org = instance_method(meth)
         define_method(meth) do |*args,&block|
           if Thread.current[meth]
             throw(:recurse,args)
           else
             Thread.current[meth] = org.bind(self)
             result = catch(:done) do
               loop do
                 args = catch(:recurse) do
                   throw(:done,Thread.current[meth].call(*args,&block))
                 end
               end
             end
             Thread.current[meth] = nil
             result
           end
         end
       end
     end

[questa discussione]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/145593

Il metodo `tailcall_optimize` altera il metodo passato, eliminando la ricorsione. Quindi, se si aggiunge:

    :::ruby
     class Proc
         tailcall_optimize :while_true
     end

la ricorsione può continuare all’infinito.

[^nota]: l’interprete Ruby, ad ogni chiamata a `throw`, cerca nello stack il blocco corrispondente (cioè che ha la stessa label del throw), svuota lo stack fino a quel punto e continua l’esecuzione da lì.
