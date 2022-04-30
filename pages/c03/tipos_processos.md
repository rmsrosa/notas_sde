@def title = "Tipos de processos"

# {{ get_title }}

Podemos classificar os processos aleatórios de várias formas diferentes.

## Processos identicamente distribuídos

Um processo $\{X_t\}_{t\in I}$ é dito **identicamente distribuído** quando as variáveis aleatórias $X_t$ são identicamente distribuídas, ou seja, quando as leis de probabilidade das variáveis $X_t$ são iguais entre si.

Por exemplo, o processo de Bernoulli $\{X_n\}_{n\in\mathbb{N}}$ tem $X_n \sim \textrm{Bernoulli}(p)$, para todo $n\in \mathbb{N}$, sendo, portanto, um processo identicamente distribuído.

Jogar um mesmo dado, não-viciado, várias vezes, também é um processo identicamente distribuído, com $X_n \sim \textrm{Uniforme}(\Sigma),$ com $\Sigma = \{1, 2, \ldots, 6\}$, para todo $n\in \mathbb{N}$. Mesmo um dado viciado também gera um processo identicamente distribuído, já que é o mesmo dado que estamos jogando. A distribuição só não será uniforme.

O processo de contagem binomial, por outro lado, não é identicamente distribuído, pois cada passo $W_n$ tem distribuição binomial diferente $W_n \sim \textrm{Binomial}(n, p)$.

Observe, como falamos antes, que não basta conhecermos apenas a função de probabilidade acumulada em cada instante de tempo. É preciso saber todas as probabilidades conjuntas. De fato, o processo de Bernoulli $X_n$ discutido acima é tal que, para algum $p$, vale $X_n \sim \mathrm{Bernoulli}(p)$, para todo $n$. Por outro lado, se definirmos o processo constante $Y_n = Y$, onde $Y = \mathrm{Bernoulli}(p)$, ou seja, com medida de probabilidade $\tilde{\mathbb{P}}(Y = (0, 0, \ldots)) = 1 - p$ e $\tilde{\mathbb{P}}(Y = (1, 1, \ldots)) = p$, então também temos cada $Y_t \sim\mathrm{Bernouilli}(p)$. Mas os processos são bem diferentes.

## Processos com passos identicamente distribuídos

O processo de contagem binomial não é identicamente distribuído, mas os seus passos $W_{n+1} - W_n = X_{n+1} \sim \textrm{Bernoulli}(p)$ são testes de Bernoulli com a mesma probabilidade de sucesso.

Quando os passos de um processo são variáveis aleatórias identicamente distribuídas, dizemos que é um **processo com passos identicamente distribuídos**.

Se $W_{n + 1} - W_n$ são identicamente distribuídos, então $\{W_{n + k} - W_n\}_k$ também são passos (largos) identicamente distribuídos, já que
$$
W_{n + k} - W_n = \sum_{j = 0}^{k-1} W_{n + j + 1} - W_{n + j} \sim \sum_{j = 0}^{k-1} W_{j + 1} - W_{j} = \text{ independente de $n$}.
$$

Pensando nisso, o conceito de processo com passos identicamente distribuídos se estende facilmente a processos contínuos. Assim, mais geralmente, dizemos que um processo $\{X_t\}_{t\in I}$ é um **processo com passos identicamente distribuídos** quando, para cada $\tau > 0$, as variáveis aleatórias $\{W_t^\tau\}_{t, t+\tau \in I}$, definidas por $W_t^\tau = X_{t + \tau} - X_t$, são identicamente distribuídas. A distribuição pode variar com o tamanho do passo, mas não com o momento em que cada passo é dado.

Assim, vemos que o modelo de Einstein para o processo Browniano é um processo estocástico contínuo com passos identicamente distribuídos.

## Processos independentes

Um processo $\{X_t\}$ é dito independente quando as variáveis aleatórias $X_t$ são independentes entre si. Ou seja, as chances de $X_{t_1} \in E_1$ são independentes de $X_{t_2} \in E_2$, em momentos distintos $t_1$ e $t_2$. Podemos escrever isso na forma
$$
\mathbb{P}(X_{t_2} \in E_2 | X_{t_1} \in E_1) = \mathbb{P}(X_{t_2} \in E_2), \quad \forall t_1 \neq t_2.
$$

O processo de Bernoulli, por exemplo, é independente. Pense, novamente, no lançamento de uma moeda. Se em um determinado lance foi obtido cara, isso não vai mudar as chances de se obter coroa no próximo lançamento. Mesma coisa com lançamentos sucessivos de um dado.

Já o caminho aleatório não é independente, pois as chances de termos $X_3 = 3$ dependem da posição $X_2$. Mais precisamente,
$$
\mathbb{P}(X_3 = 3 | X_2 = 2) = \frac{1}{2},
$$
mas
$$
\mathbb{P}(X_3 = 3 | X_2 \leq 1) = 0.
$$
Além disso, como $X_0 = 0$, a única chance de chegar em $X_3 = 3$ é dar três passos $+1$, de modo que
$$
\mathbb{P}(X_3 = 3) = \frac{1}{2}\times\frac{1}{2}\times\frac{1}{2} = \frac{1}{8}.
$$

## Processos com passos independentes

O caminho aleatório não é independente, como vimos, mas os seus *passos* são independentes. De fato, as chances de darmos um passo $+1$ ou $-1$ em um determinado instante independe de qualquer passo dado anteriormente. Ou seja, os passos $X_{n+1} - X_n$ são independentes entre si. Nesse caso, dizemos que o processo $\{X_n\}_n$ tem **passos independentes.**

Mais geralmente, um processo $\{X_t\}_{t\in I}$ tem **passos independentes** quando, para cada $\tau > 0$, com $t + \tau \in I$, as variáveis aleatórias $\{W_t^\tau\}_{t, t+\tau \in I}$, definidas por $W_t^\tau = X_{t + \tau} - X_t$, são idependentes entre si.

## Processos independentes e identicamente distribuídos

Esses processos, chamados simplesmente de *i.i.d.*, são aqueles que são, ao mesmo tempo, independentes e identicamente distribuídos, é claro.

Como vimos, o processo de Bernoulli é independente e identicamente distribuído.

Um processo pode ser independente sem ser identicamente distribuído. De fato, pense em um processo de Bernoulli em que a cada passo temos um teste de Bernoulli com probabilidades diferentes, digamos $X_n \sim \mathrm{Bernoulli}(p_n)$, com $p_n$ distintos. Por exemplo, jogamos, alternadamente, um dado viciado e um dado não viciado.

Um processo também pode ser identicamente distribuído sem ser independente. Por exemplo, digamos que, a cada mês, eu faça um sorteio, sempre do mesmo modo, para escolher uma certa quantidade de números para jogar na loteria e eu que eu repita os números em todas as semanas daquele mês. A probabilidade de um dos números ser igual a três é a mesma independente da semana. E as chances de eu jogar o número três na primeira semana de julho são as mesmas tendo eu jogado três na terceira semana de março ou não. Mas se um dos números jogados na primeira semana de julho for três, então certamente o três será jogado novamente na terceira semana de julho. Os números jogados em um mesmo mês não são independentes entre si.

Um exemplo contínuo é o processo
$$
X_t = \cos(t + U), \quad t\in \mathbb{R},
$$
onde $U$ é a variável aleatória $U \sim \mathrm{Uniforme}([0, 2\pi])$, i.e. com lei uniforme no intervalo $[0, 2\pi)$. Como o cosseno é periódico com período $2\pi$, essa lei é a mesma em todos os instantes $t\in \mathbb{R}$, ou seja, são identicamente distribuídos. Mas não são independentes.

## Processos com passos independentes e identicamente distribuídos

Novamente, o nome já diz, por si só, o que é um processo com **passos independentes e identicamente distribuídos**. Um exemplo é o caminho aleatório.

## Processos estacionários

Um processo $\{X_t\}_{t\in I}$ é dito **estacionário** quando as suas informações estatísticas não variam com o tempo. Mais precisamente, para quaisquer $t_1, \ldots, t_n \in I$ e $\tau>0$ tais que $t_1 + \tau, \ldots, t_n + \tau \in I$, as distribuições conjuntas de $X_{t_1}, \ldots, X_{t_n}$ e $X_{t_1 + \tau}, \ldots, X_{t_n + \tau}$ são iguais, o que pode ser expresso por
$$
\mathbb{P}(X_{t_1 + \tau} \in E_1, \ldots, X_{t_n + \tau} \in E_n) = \mathbb{P}(X_{t_1} \in E_1) \times \cdots \times \mathbb{P}(X_{t_n} \in E_n) = \mathbb{P}(X_{t_1} \in E_1, \ldots, X_{t_n} \in E_n),
$$
para eventos quaisquer $E_1, \ldots, E_n \in \mathcal{E}$.

Em particular, as suas distribuições simples $X_{t + \tau} \sim X_t$ são idênticas, ou seja, processos estacionários são necessariamente identicamente distribuídos. Mas não precisam ser independentes. De fato, considere o processo de Bernoulli $\{X_n\}_{n\in \mathbb{N}}$ e defina $Y_n = X_n + X_{n + 1}$, ou seja, $Y_n$ soma os resultados de dois lançamentos consecutivos, em uma série de lançamentos. A distribuição de $Y_n$ é sempre a mesma, igual à binomial $B(2, p)$. Mas $Y_{n+1}$ não é independente de $Y_n$.

Por outro lado, qualquer processo *i.i.d.* é estacionário. De fato, temos, trivialmente, que, como cada realização é independente,
$$
\mathbb{P}(X_{t_1 + \tau} \in E_1, \ldots, X_{t_n + \tau} \in E_n) = \mathbb{P}(X_{t_1 + \tau} \in E_1) \times \cdots \times \mathbb{P}(X_{t_n + \tau} \in E_n).
$$
Além disso, como são identicamente distribuídos, cada $\mathbb{P}(X_{t_j + \tau} \in E_j) = \mathbb{P}(X_{t_j} \in E_j)$. Usando isso e, novamente, a independência das realizações,
$$
\mathbb{P}(X_{t_1 + \tau} \in E_1, \ldots, X_{t_n + \tau} \in E_n) = \mathbb{P}(X_{t_1} \in E_1) \times \cdots \times \mathbb{P}(X_{t_n} \in E_n) = \mathbb{P}(X_{t_1} \in E_1, \ldots, X_{t_n} \in E_n).
$$
Nesse caso, podemos ir além e deduzir que essa distribuição conjunta  é $\mathbb{P}(X_t \in E_1) \times \cdots \times \mathbb{P}(X_t \in E_n)$, independente de $t$.

## Processos estacionários no sentido fraco

Pedir que um processo seja estacionário é, invariavelmente, pedir muito. Em várias situações, apenas parte das informações estatísticas de um processo são estacionárias, a saber, o valor médio e a autocorrelação. Mais precisamente, dizemos que um processo $\{X_t\}_{t\in I}$ é **fracamente estacionário**, ou **estacionário no sentido fraco**, quando
$$
\mathbb{E}(X_t) \text{ é finito e independente de } t\in I,
$$
e
$$
\forall t_1, t_2\in I, \;\mathbb{E}(X_{t_1 + \tau} X_{t_2 + \tau}) \text{ é finito e independente de } \tau > 0, \;t_1 + \tau, t_2 + \tau \in I.
$$

Observe a condição desses momentos serem finitos. Por conta disso, não podemos dizer, estritamente, que processos estacionários são fracamente estacionário. Mas qualquer processo estacionário com autocorrelação finita é fracamente estacionário.

Vale lembrar que a variável aleatória discreta $Y$ com probabilidades dadas pelos termos da série de Euler é um exemplo de variável aleatória com valor esperado (e autocorrelação) infinita. Um processo estacionário tal que $X_n = Y$, $\forall n$, não é fracamente estacionário.

## Exercícios

1. Mostre que, se $\{X_n\}_n$ é um processo *i.i.d.* e $k \in \mathbb{N}$, o processo $Y_n = X_n + \cdots + X_{n + k}$ é estacionário mas não é *i.i.d.*.