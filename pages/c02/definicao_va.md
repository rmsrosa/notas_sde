@def title = "Conceitos essenciais"

# {{ get_title }}

> "The basic object of study in probability is the random variable and I will argue that it should be treated as a basic construct, like spaces, groups and functions, and it is artificial and unnatural to define it in terms of measure theory. ... [We] propose that probabilities and random variables can be built into the foundations of mathematics, resulting in a more intuitive and powerful formalism" - David Mumford, in *The Dawning of the Age of Stochasticity* (Classe di Scienze Fisiche, Matematiche e Naturali. Rendiconti Lincei. Matematica e Applicazioni, 2000).

Uma variável, no sentido mais geral, é um elemento arbitrário de um determinado conjunto, podendo assumir qualquer valor nesse conjunto. Uma **variável aleatória**, por sua vez, pode ser pensada como uma variável em que cada valor, ou conjunto de valores, chamados de **eventos**, possui uma certa probabilidade de ser observado.

Variáveis aleatórias estão associadas a fenômenos de difícil previsão, tanto em problemas aparentemente simples, como o resultado de um lançamento de uma moeda, do lançamento de um dado, ou de um jogo de roletas, quanto em fenômenos extremamente complexos, como previsão do tempo, de terremotos, no mercado de ações e sobre o desejo dos consumidores, por exemplo.

Variáveis aleatórias podem ser classificadas de acordo com o tipo de valores que podem assumir. Esses possíveis valores podem ser *finitos* ou *infinitos*, *discretos* ou *contínuos*, *enumeráveis* ou *não-enumeráveis*, *escalares* ou *vetoriais*, etc.

Por exemplo, no caso do lançamento de uma moeda, podemos ter os eventos discretos "cara" e "coroa", com probabilidade 1/2 de cada evento ser observado. No caso de um lançamento de um dado "não-viciado", temos os possíveis eventos discretos $1, 2, 3, 4, 5, 6$, cada um com probabilidade 1/6 de ser realizado. Um dado "viciado" pode ter probabilidades diferentes. Estes são exemplos com um conjunto finito de possíveis observações.

Se lançarmos uma moeda um número infinito de vezes, podemos observar as chances de termos sucesso apenas no enésimo lançamento. Isso pode acontecer para qualquer número natural $n\in \mathbb{N}$.

O Índice pluviométrico, por sua vez, informa a quantidade de chuva por metro quadrado e é medido em milímetros, podendo teoricamente, assumir qualquer valor inteiro não-negativo, e cujas probabilidades dependem de uma série de fatores. Dessa forma, o conjunto de possíveis valores é discreto e infinito enumerável. Em determinados modelos, podemos tratar o índice pluviométrico como uma quantidade contínua.

O tempo também pode ser pensado como uma variável contínua, de modo que o tempo que um objeto leva para cair de uma certa altura até o chão pode ser visto como uma variável aleatória assumindo qualquer valor real positivo. Naturalmente, há muito mais chances do valor observado ser de acordo com a segunda lei de Newton, mas há sempre alguma incerteza, por conta de diversos fatores, tanto de erros de medição (da altura inicial e do cronômetro marcando o início e o fim do movimento) como pelo fato de um modelo ser apenas uma aproximação da realidade.

Usualmente, uma variável aleatória é denotada por letras maísculas, como $X$. Uma determinada **realização** é denotada por $X(\omega)$, onde $\omega$ funciona como uma variável auxiliar, um mero índice, indicando possíveis resultados da variável e associando a isso a devida probabilidade. Podemos pensar $\omega$ como um **experimento**. A probabilidade de um determinado evento $e$, dado por um único valor, ocorrer é denotada por $P(X = e)$. A probabilidade de ocorrer um certo evento $E$ formado por um conjunto de valores é denotada por $P(X \in E)$.

No caso de uma moeda, temos os possíveis valores "cara" e "coroa". Cada evento pode ocorrer de acordo com as probabilidades $P(X = \textrm{"cara"}) = 1/2$ e $P(X = \textrm{"coroa"}) = 1/2$. No caso dos dados, temos $P(X = j) = 1/6$, $j = 1, \ldots, 6.$ A probabilidade do resultado ser par é $P(X \textrm{ é "par"}) = P(X \in \{2, 4, 6\}) = 1/2.$

Formalmente, uma variável aleatória é uma função *mensurável* de um espaço de probabilidades $(\Omega, \mathcal{F}, P)$ em um espaço mensurável $(\Sigma, \mathcal{S})$. As possíveis realizações são $X(\omega)\in \Sigma$, para $\omega\in \Omega$. A probabilidade de um determinado evento $e\in \Sigma$ ocorrer é a probabilididade do conjunto $\{\omega \in \Omega; \;X(\omega) = e\} = X^{-1}(e)$: $P(X = e) = P(\{\omega \in \Omega; \; X(\omega) = e\})$. Também podemos eventos $E\subset \mathcal{S}\subset \Sigma$, cuja probabilidade é $P(X \in E) = P(\{\omega\in \Omega; X(\omega) \subset E\}) = P(X^{-1}(E))$. No exemplo do moeda, $\Sigma = \{\textrm{"cara"}, \textrm{"coroa"}\}$. No exemplo dos dados, $\Sigma = \{1, 2, 3, 4, 5, 6\}$. No exemplo do índice pluviométrico, $\Sigma = \{0\;\texttt{mm}, 1\;\texttt{mm}, 2\;\texttt{mm}, \ldots\}$, ou mesmo $\Sigma = \{r \;\texttt{mm}; \;r \geq 0 \}.$

## Variávels aleatórias discretas

Mais especificamente, uma variável aleatória discreta finita possui um conjunto finito $\{x_1, \ldots, x_J\}$ de valores possíveis, $K\in \mathbb{N}$, com probabilidades
$$
P(X = x_j) = p_j, \quad j = 1, \ldots, J,
$$
onde
$$
0 \leq p_j \leq 1, \quad \sum_{j=1}^J p_j = 1.
$$

### Exemplo: Teste de Bernoulli

Uma **variável aleatória de Bernoulli** com parâmetro $p$, $0\leq p \leq 1$, possui dois resultados possíveis, $0$ e $1$, com probabilidades $p$ e $1-p$, respectivamente. Ou seja, $J = 2$, $x_1 = 0$, $x_2 = 1$, $p_1 = p$ e $p_2 = 1 - p$. Pode ser exemplificado como o resultado do lançamento de uma moeda, com $0$ e $1$ representando "cara" e "coroa", respectivamente. O resultado de teste de um exame de laboratório verificando a presença de um marcador para alguma doença pode ser "positivo" ou "negativo", podendo, também, ser modelado por uma variável de Bernoulli.

### Exemplo: Número de sucessos e a distribuição binomial

Podemos, também, jogar uma moeda $n$ vezes e contarmos o número de vezes em que o resultado é "cara", por exemplo. A probabilidade de não termos nenhuma cara é $1/2^n$, pois devemos ter exatamente $n$ coroas lançadas, sendo que cada uma tem probabilidade 1/2 de ocorrer. A probabilidade de termos exatamente uma cara é $n/2^n$, pois a cara pode vir em qualquer um dos $n$ lançamentos. Mais geralmente, temos um número
$$
  \left(\begin{matrix} n \\ i \end{matrix}\right) = \frac{n!}{i!(n-i)!}
$$
de combinações possíveis de exatamente $i$ resultados iguais (e.g. "caras"), em $n$ lançamentos. Assim, se $X$ é a variável aleatória contando o número de "caras" em $n$ lançamentos, então a probabilidade de termos $i$ caras é
$$
  P(X = i) = \frac{1}{2^n} \left(\begin{matrix} n \\ i \end{matrix}\right), \quad 1 \leq i \leq n.
$$

No caso de um dado viciado, ou, mais geralmente, de $n$ testes de Bernoulli com parâmetro $p$, $0\leq p \leq 1$, então a probabilidade de $i$ sucessos é
$$
  P(X = i) = p^i(1-p)^{n-i} \left(\begin{matrix} n \\ i \end{matrix}\right), \quad 1 \leq i \leq n.
$$

### Exemplo: Tempo de espera e a distribuição geométrica

Baseado no teste de Bernoulli, podemos considerar a variável aleatória que nos dá as chances de termos sucesso após $n$ tentativas fracassadas. Ou seja, em $n$ tentativas, temos insucesso nos primeiros $n-1$ testes e sucesso apenas no último teste. Se a chance de sucesso é $p$ e de fracasso é de $1-p$, com $0 < p \leq 1$, então temos probabilidade $(1-p)^{n-1}$ de insucessos nos $n$ primeiros testes e $p$ de sucesso no último teste, ou seja,
$$
P(X = n) = (1-p)^{n-1}p
$$
Essa distribuição é chamada de distribuição geométrica. Note que
$$
  \sum_{n=1}^\infty (1-p)^{n-1}p = p + (1-p)p + (1-p)^2p + \ldots = p(1 + (1-p) + (1-p)^2 + \ldots) = p \frac{1}{p} = 1.
$$

Observe que há uma questão de interpretação, aqui. A probabilidade $(1-p)^{n-1}p$ de termos sucesso *apenas* no $n$-ésimo é a mesma que a de termos apenas um sucesso em $n$ testes, independentemente de ser no último teste ou não.

Observe, ainda, que no caso da distribuição binomial discutida acima, fixamos o número $n$ de testes e analisamos a quantidade de sucessos nesses $n$ testes. Já na distribuição geométrica, podemos ter um número arbitrário de testes.

## Variávels aleatórias contínuas

