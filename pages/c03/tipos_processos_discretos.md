@def title = "Tipos de processos discretos"

# {{ get_title }}

Podemos classificar os processos aleatórios de várias formas diferentes.

## Processos identicamente distribuídos

Um processo $\{X_t\}_{t\in I}$ é dito **identicamente distribuído** quando as variáveis aleatórias $X_t$ são identicamente distribuídas, ou seja, quando as leis de probabilidade de cada $X_t$ são iguais entre si.

Por exemplo, o processo de Bernoulli tem $X_n \sim \textrm{Bernoulli}(p)$, para qualquer $n\in \mathbb{N}$, sendo, portanto, um processo identicamente distribuído.

Jogar um mesmo dado, não-viciado, várias vezes, também é um processo identicamente distribuído, com $X_n \sim \textrm{Uniform}(1, 2, \ldots, 6),$ para todo $n\in \mathbb{N}$. Mesmo um dado viciado também gera um processo identicamente distribuído, já que é o mesmo dado que estamos jogando. A distribuição só não será uniforme.

O processo de contagem binomial, por outro lado, não é identicamente distribuído, pois cada passo $W_n$ tem distribuição binomial diferente $W_n \sim \textrm{Binomial}(n, p)$.

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

Um processo $\{X_t\}$ é dito independente quando as variáveis aleatórias $X_t$ são independentes entre si. Ou seja, as chances de $X_{t_1} = x_1$ são independentes de $X_{t_2} = x_2$, em momentos distintos $t_1$ e $t_2$. Podemos escrever isso na forma
$$
\mathbb{P}(X_{t_2} = x_2 | X_{t_1} = x_1) = \mathbb{P}(X_{t_2} = x_2), \quad \forall t_1 \neq t_2.
$$

O processo de Bernoulli, por exemplo, é independente. Pense, novamente, no lançamento de uma moeda. Se em um determinado momento eu lancei a moeda e obtive cara, isso não vai mudar as probabilidades de eu obter coroa em um futuro lançamento. Mesma coisa com o lançamento sucessivo de um dado.

Já o caminho aleatório não é independente, já que as chances de $X_3 = 3$ dependem da posição $X_2$. Mais precisamente,
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

O caminho aleatório não é idependente, como vimos, mas os seus *passos* são independentes. De fato, as chances de darmos um passo $+1$ ou $-1$ em um determinado instante independe de qualquer passo dado anteriormente. Ou seja, os passos $X_{n+1} - X_n$ são independentes entre si. Nesse caso, dizemos que o processo $\{X_n\}_n$ tem **passos independentes.**

Da mesma forma, um processo contínuo $\{X_t\}_{t\in I}$ tem **passos independentes** quando, para cada $\tau > 0$, as variáveis aleatórias $\{W_t^\tau\}_{t, t+\tau \in I}$, definidas por $W_t^\tau = X_{t + \tau} - X_t$, são idependentes entre si.

## Processos independentes e identicamente distribuídos

Esse processos, chamados simplesmente de *iid*, ou *i.i.d.*, ou *I.I.D.*, são aqueles que são, ao mesmo tempo, independentes e identicamente distribuídos, é claro.

Como vimos, o processo de Bernoulli é independente e identicamente distribuído.

Um processo pode ser independente sem ser identicamente distribuído. De fato, pense em um processo de Bernoulli em que a cada passo temos um teste de Bernoulli com probabilidades diferentes, digamos $X_n \sim Bernoulli(p_n)$, com $p_n$ distintos. Por exemplo, jogamos, alternadamente, um dado viciado e um dado não viciado.

Um processo também pode ser identicamente distribuído sem ser independente. Por exemplo, digamos que, a cada mês, eu faça um sorteio, sempre do mesmo modo, para escolher uma certa quantidade de números para jogar na loteria e eu que eu repita os números a cada semana daquele mês. A probabilidade de um dos números ser igual a três é a mesma independe da semana. E as chances de eu jogar o número três na primeira semana de julho são as mesmas tendo eu jogado três na terceira semana de março ou não. Mas se um dos números jogados na primeira semana de julho for três, então certamente o três será jogado novamente na terceira semana de julho. Os números jogados em um mesmo mês não são independentes entre si.

## Processos com passos independentes e identicamente distribuídos

Novamente, o nome já diz, por si só, o que é um processo com **passos independentes e identicamente distribuídos**. Um exemplo é o caminho aleatório.

## Processos estacionários

Um processo é dito estacionário
