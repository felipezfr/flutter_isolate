## Flutter Isolate

O Flutter que conhecemos funciona em uma única thread, e essa thread é chamada de main isolate.

As vezes, precisamos executar processos que podem gerar concorrência, então a main isolate gerencia seu event loop para que possamos executar código de forma assíncrona.

Existem casos em que tarefas muito pesadas causam sobrecarga no event loop, que também lida com instruções de renderização, e resultam em travamentos na tela.

### O que são isolates?

O Dart utiliza isolates, que executam suas instruções de forma sequencial e possuem uma região de memória dedicada. Cada isolate tem sua própria memória e seu próprio event loop, isolados para esse propósito. Diferente das threads, esses isolates não podem acessar os dados uns dos outros diretamente. Toda comunicação entre eles deve ser feita por meio de mensagens.

![Isolates](https://blog.codemagic.io/communication_btw_isolates_1516989056113503432_hu8c194e4418fe86b2b9504dba042d78df_0_1280x1800_fit_linear_3.png)

### Exemplo

Neste projeto de exemplo, temos uma animação que roda constantemente. No entanto, quando executamos o cálculo de Fibonacci, que é uma função custosa, ocorre um travamento na tela.

A solução para esse problema é realizar o processamento em paralelo ao main isolate, criando um novo isolate.

### Referências 

https://docs.flutter.dev/perf/isolates

https://blog.codemagic.io/understanding-flutter-isolates/

https://medium.com/brasilflutter/executando-processos-paralelos-com-flutter-dart-b257900b63fa