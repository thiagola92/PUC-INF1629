Dupla: Thiago Lages de Alencar e Miguel José Gonçalves da Silva    
Matricula: 1121561 e 1111284

# Princípios de Engenharia de Software #
Objetivo do trabalho é pegar 4 estilos do livro "Exercises in Programming Style" e reescrever em Lua. Tem que usar as [6 regras da disciplina](https://pes2006.wordpress.com/2006/03/15/disciplina/ ).

# Como usar #
```
lua 3-Monolithic.lua input.txt
```

# Livro Diário - Thiago #
* 25/04/2017: Criação do github e preparação para começar o trabalho.
* 27/04/2017: Começo da leitura do livro.
* 02/05/2017: Desenvolvimento do programa no estilo Monolithic

# Timeline das atividades #

* 25/4 - Leitura do Livro

* 26/4 - Reunião da escolha dos estilos.

* 02/05 - desenvolvimento do primeiro estilo: Monotithic
* 02/05 - Adequação do código acima usando as regras vistas em sala de aula

* 02/05 - desenvolvimento do primeiro estilo: 
* 02/05 - Adequação do código acima usando as regras vistas em sala de aula

* 02/05 - desenvolvimento do primeiro estilo: 
* 02/05 - Adequação do código acima usando as regras vistas em sala de aula

* 03/05 - Revisão conjunta geral do código

# Diário de Desenvolvimento #
02/05

- No início se teve uma dificuldade para transformar python em lua, mas no decorrer do desenvolvimento os obstáculos foram superados.
- Foi necessário ler alguns textos, para se fazer a leitura de arquivo em lua
- Tinha algumas coisas de expressão regular que foi necessário ser relembrado para o entendimento do código.
- Outra coisa que pesquisamos, foi pegar pedaços de uma string e percorrer um array.
- Um incomodo que sentimos foi a contagem do array começar em 1 ao invés de 0. Isso foi resolvido colocando o contador iniciando em 1.
- Nós testamos o código com um texto pequeno e um gigante, no pequeno não teve problemas, mas no grande a letra "s" foi considerada uma palavra por contas de frases como "elisabeth's house". Creio que o ' separe as palavras e assim esteja causando esse erro.

