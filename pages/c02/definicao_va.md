@def title = "Conceitos essenciais"

# {{ get_title }}

> "The basic object of study in probability is the random variable and I will argue that it should be treated as a basic construct, like spaces, groups and functions, and it is artificial and unnatural to define it in terms of measure theory. ... [We] propose that probabilities and random variables can be built into the foundations of mathematics, resulting in a more intuitive and powerful formalism" - David Mumford, in *The Dawning of the Age of Stochasticity* (Classe di Scienze Fisiche, Matematiche e Naturali. Rendiconti Lincei. Matematica e Applicazioni, 2000).

Uma **variável aleatória** é uma variável que pode assumir diferentes valores de acordo com alguma distribuição de probabilidades. Variáveis aleatórias estão associadas a fenômenos de difícil previsão, tanto em problemas simples, como o resultado de um lançamento de uma moeda, do lançamento de um dado, ou de um jogo de roletas, quanto em fenômenos extremamente complexos, como previsão de tempo, mercado de ações, etc..

Variáveis aleatórias podem ser classificadas de acordo com o tipo de valores que podem assumir. Esses possíveis valores podem ser *finitos* ou *infinitos*, *discretos* ou *contínuos*, *enumeráveis* ou *não-enumeráveis*, etc.

Por exemplo, no caso de um **lançamento de uma moeda**, podemos ter *cara* ou *coroa*, com probabilidade 1/2 de ocorrer cada **evento**. No caso de um lançamento de um dado "não-viciado", temos os possíveis eventos $1, 2, 3, 4, 5, 6$, cada um com probabilidade 1/6. Um dado "viciado" pode ter probabilidades diferentes. Dados pluviométricos podem ser medidos em milímetros, podendo teoricamente, assumir qualquer valor inteiro não-negativo.

Usualmente, uma variável aleatória é denotada por letras maísculas, como $X$. Formalmente, é uma função *mensurável* de um espaço de probabilidades $(\Omega, \mathcal{F}, P)$ em um espaço mensurável $(\Sigma, \mathcal{S})$. 
