@def title = "Conceitos essenciais"

# {{ get_title }}

> "The basic object of study in probability is the random variable and I will argue that it should be treated as a basic construct, like spaces, groups and functions, and it is artificial and unnatural to define it in terms of measure theory. ... [We] propose that probabilities and random variables can be built into the foundations of mathematics, resulting in a more intuitive and powerful formalism" - David Mumford, in *The Dawning of the Age of Stochasticity* (Classe di Scienze Fisiche, Matematiche e Naturali. Rendiconti Lincei. Matematica e Applicazioni, 2000).

## Definição informal

Uma variável, no sentido mais geral, é um elemento arbitrário de um determinado conjunto, podendo assumir qualquer valor nesse conjunto. Uma **variável aleatória**, por sua vez, pode ser pensada como uma variável em que cada valor, ou conjunto de valores, chamados de **eventos**, possui uma certa *probabilidade* de ser observado.

Variáveis aleatórias estão, muitas vezes, associadas a fenômenos de difícil previsão, tanto em problemas aparentemente simples, como o resultado de um lançamento de uma moeda, do lançamento de um dado, ou de um jogo de roletas, quanto em fenômenos extremamente complexos, como previsão do tempo, de terremotos, no mercado de ações e sobre o desejo dos consumidores, por exemplo.

Variáveis aleatórias podem ser classificadas de acordo com o tipo de valores que podem assumir. Esses possíveis valores podem ser *finitos* ou *infinitos*, *discretos* ou *contínuos*, *enumeráveis* ou *não enumeráveis*, *escalares* ou *vetoriais*, etc.

## Exemplos

Por exemplo, no caso do lançamento de uma moeda, podemos ter os eventos discretos "cara" e "coroa", com probabilidade 1/2 de cada evento ser observado. No caso de um lançamento de um dado "não viciado", temos os possíveis eventos discretos $1, 2, 3, 4, 5, 6$, cada um com probabilidade 1/6 de ser realizado. Um dado "viciado" pode ter probabilidades diferentes. Estes são exemplos com um conjunto finito de possíveis observações.

Se lançarmos uma moeda um número arbitrário de vezes, podemos observar as chances de termos sucesso apenas em algum enésimo lançamento. Qualquer número inteiro não negativo pode ser observado.

O índice pluviométrico, por sua vez, informa a quantidade de chuva por metro quadrado e é medido em milímetros, podendo teoricamente, assumir qualquer múltiplo inteiro não negativo de $1\;\texttt{mm}$, e cujas probabilidades dependem de uma série de fatores. Dessa forma, o conjunto de possíveis valores também é discreto e infinito enumerável. Em determinados modelos, podemos tratar o índice pluviométrico como uma quantidade assumindo valores reais não negativos, com alguma unidade de comprimento.

O tempo também pode ser pensado como uma variável contínua, de modo que o tempo que um objeto leva para cair de uma certa altura até o chão pode ser visto como uma variável aleatória assumindo qualquer valor real positivo. Naturalmente, há muito mais chances do valor observado ser de acordo com a segunda lei de Newton, mas há sempre alguma incerteza, por conta de diversos fatores, tanto de erros de medição (da altura inicial e do cronômetro marcando o início e o fim do movimento) como pelo fato de um modelo ser apenas uma aproximação da realidade.

## Notação

Usualmente, uma variável aleatória é denotada por letras maísculas, como $X$. Uma determinada **realização** é denotada por $X(\omega)$, onde $\omega$ funciona como uma variável auxiliar, um mero índice, indicando possíveis resultados da variável e associando a isso a devida probabilidade. Podemos pensar $\omega$ como um **experimento**. A probabilidade de um determinado evento $e$, dado por um único valor, ocorrer é denotada por $\mathbb{P}(X = e)$. A probabilidade de ocorrer um certo evento $E$ formado por um conjunto de valores é denotada por $\mathbb{P}(X \in E)$.

É comum denotarmos
$$
X \sim \mathbb{P}
$$
para indicar a distribuição de probabilidades associada a uma variável aleatória $X$.

No caso de uma moeda, temos os possíveis valores "cara" e "coroa", que podemos representar por $0$ e $1$, respectivamente. Cada evento pode ocorrer de acordo com as probabilidades $\mathbb{P}(X = \textrm{``cara''}) = 1/2$ e $\mathbb{P}(X = \textrm{``coroa''}) = 1/2$, ou, escrito de outra forma, $\mathbb{P}(X = j) = 1/2$, para $j = 0, 1$. No caso dos dados, temos $\mathbb{P}(X = j) = 1/6$, $j = 1, \ldots, 6.$ A probabilidade do resultado ser par é $\mathbb{P}(X \textrm{ é "par"}) = \mathbb{P}(X \in \{2, 4, 6\}) = 1/2.$ A probabilidade do evento ser menor ou igual a $j$ é $\mathbb{P}(X \leq j) = j/6$, para $j = 1, \ldots, 6$. A *probabilidade conjunta* de $X$ ser par e menor ou igual a quatro é $\mathbb{P}(X \textrm{ é par e } X \leq 4) = 1/3$.

## Definição formal

Formalmente, uma variável aleatória $X$ é uma função *mensurável* de um espaço de probabilidades $(\Omega, \mathcal{A}, \mathbb{P})$ em um espaço mensurável $(\Sigma, \mathcal{E})$. Isso significa que a pré-imagem $X^{-1}(E)$ de qualquer *evento* $E\subset \mathcal{E}$ pertence ao conjunto amostral $\mathcal{A}$. O conjunto amostral $\mathcal{A}$ e o conjunto de eventos $\mathcal{E}$ são *$\sigma$-álgebras*, i.e. coleções de subconjuntos de $\Omega$ e $\Sigma$, respectivamente, que contém o conjunto vazio e são fechados por certas operações de conjuntos: complemento, uniões enumeráveis e interseções enumeráveis.

As possíveis realizações são $X(\omega)\in \Sigma$, para $\omega\in \Omega$. A probabilidade de um determinado evento $e\in \Sigma$ ocorrer é a probabilididade do conjunto $\{\omega \in \Omega; \;X(\omega) = e\} = X^{-1}(e)$: $\mathbb{P}(X = e) = \mathbb{P}(\{\omega \in \Omega; \; X(\omega) = e\})$. Também podemos considerar eventos $E\in \mathcal{E}\subset \Sigma$, cuja probabilidade é $\mathbb{P}(X \in E) = \mathbb{P}(\{\omega\in \Omega; X(\omega) \subset E\}) = \mathbb{P}(X^{-1}(E))$. No exemplo do moeda, $\Sigma = \{0, 1\} = \{\textrm{``cara''}, \textrm{``coroa''}\}$. No exemplo dos dados, $\Sigma = \{1, 2, 3, 4, 5, 6\}$. No exemplo do índice pluviométrico, $\Sigma = \{0\;\texttt{mm}, 1\;\texttt{mm}, 2\;\texttt{mm}, \ldots\}$, ou mesmo $\Sigma = \{r \;\texttt{mm}; \;r \geq 0 \}.$
