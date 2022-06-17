@def title = "Tipos de processos"

# {{ get_title }}

Podemos classificar os processos aleatórios de várias formas diferentes. Vejamos algumas classificações e exemplos.

## Processos identicamente distribuídos

Um processo $\{X_t\}_{t\in I}$ é dito **identicamente distribuído** quando as variáveis aleatórias $X_t$ são identicamente distribuídas, ou seja, quando as leis de probabilidade das variáveis $X_t$ são iguais entre si.

Por exemplo, o processo de Bernoulli $\{X_n\}_{n\in\mathbb{N}}$ tem $X_n \sim \textrm{Bernoulli}(p)$, para todo $n\in \mathbb{N}$, sendo, portanto, um processo identicamente distribuído.

Jogar um mesmo dado, não-viciado, várias vezes, também é um processo identicamente distribuído, com $X_n \sim \textrm{Unif}(\Sigma),$ com $\Sigma = \{1, 2, \ldots, 6\}$, para todo $n\in \mathbb{N}$. Mesmo um dado viciado também gera um processo identicamente distribuído, já que é o mesmo dado que estamos jogando. A distribuição só não será uniforme.

O processo de contagem binomial, por outro lado, não é identicamente distribuído, pois cada incremento $W_n$ tem distribuição binomial diferente $W_n \sim \textrm{Binomial}(n, p)$.

Observe, como falamos antes, que não basta conhecermos apenas a função de probabilidade acumulada em cada instante de tempo. É preciso saber todas as probabilidades conjuntas. De fato, o processo de Bernoulli $X_n$ discutido acima é tal que, para algum $p$, vale $X_n \sim \mathrm{Bernoulli}(p)$, para todo $n$. Por outro lado, se definirmos o processo constante $Y_n = Y$, onde $Y = \mathrm{Bernoulli}(p)$, ou seja, com medida de probabilidade $\tilde{\mathbb{P}}(Y = (0, 0, \ldots)) = 1 - p$ e $\tilde{\mathbb{P}}(Y = (1, 1, \ldots)) = p$, então também temos cada $Y_t \sim\mathrm{Bernouilli}(p)$. Mas os dois processos são bem diferentes entre si.

## Processos com incrementos identicamente distribuídos

O processo $\{X_n\}_{n\in \mathbb{Z}^*}$ de contagem binomial não é identicamente distribuído, mas os passos $X_{n+1} - X_n\sim \textrm{Bernoulli}(p)$ são testes de Bernoulli com a mesma probabilidade de sucesso, portanto identicamente distribuídos.

Se $\Delta X_n = X_{n + 1} - X_n$ são identicamente distribuídos, então $\Delta X_n \sim \Delta X_1$, para todo $n\in \mathbb{N}$. Assim, para cada $k\in \mathbb{N}$, a família $\Delta X_n^k = X_{n + k} - X_n$, $n\in \mathbb{N}$, de "passos largos" também é identicamente distribuída, já que
$$
X_{n + k} - X_n = \sum_{j = 0}^{k-1} \left( X_{n + j + 1} - X_{n + j} \right) = \sum_{j = 0}^{k-1} \Delta X_{n + j} \sim \sum_{j = 0}^{k-1} \Delta X_1 = \text{ independente de $n$}.
$$

Mais geralmente, dizemos que um processo $\{X_t\}_{t\in I}$ é um **processo com incrementos identicamente distribuídos** quando, para cada $\tau > 0$, as variáveis aleatórias $\{\Delta X_t^\tau\}_{t, t+\tau \in I}$, definidas por $\Delta X_t^\tau = X_{t + \tau} - X_t$, são identicamente distribuídas. A distribuição pode variar com o tamanho do incremento $\tau$, mas não com o instante $t$ em que cada incremento é dado.

Um exemplo de processo contínuo que tem incrementos identicamente distribuídos é o processo de Wiener, que veremos em breve.

Já o processo de renovação não tem incrementos identicamente distribuídos. De fato, sejam $S_j$, $j\in \mathbb{N}$, variáveis aleatórias independentes, com distribuições $\mathbb{P}(S_j = 1) = \mathbb{P}(S_j = 2) = 1/2$, para $j \in \mathbb{N}$. Seja $X_t$ o processo de renovação associado a esses saltos. Lembremos que
$$
X_t = \sum_{n\in \mathbb{N}} \chi_{\{T_n \leq t\}} = \sup\{n; \; T_n \leq t\},
$$
onde
$$
T_n = \sum_{j = 1}^n S_j.
$$
Como $S_j = 1$ ou $2$, então $T_1 = 1$ ou $2$ e $T_j \geq 2$, para $j \geq 2$.

Então $X_t = 0$, para $t < 1$; $X_t = 0$ ou $1$, para $1 \leq t < 2$; $X_t \geq 2$, para $t \geq 2$. Portanto, $X_{1/2} - X_0 = 0$ mas $X_1 - X_{1/2} = 0$ ou $1$, com iguais probabilidades. Ou seja, esses incrementos não têm a mesma distribuição, não sendo identicamente distribuídos.

## Processos independentes

Um processo $\{X_t\}$ é dito **independente** quando as variáveis aleatórias $X_t$ são independentes entre si. Ou seja, as chances de $X_{t_1} \in E_1$ são independentes de $X_{t_2} \in E_2$, em momentos distintos $t_1$ e $t_2$. Podemos escrever isso na forma
$$
\mathbb{P}(X_{t_2} \in E_2 | X_{t_1} \in E_1) = \mathbb{P}(X_{t_2} \in E_2), \quad \forall t_1 \neq t_2.
$$

O processo de Bernoulli, por exemplo, é independente. Pense, novamente, no lançamento de uma moeda. Se em um determinado lançamento foi obtido cara, isso não vai mudar as chances de se obter coroa no próximo lançamento. Mesma coisa com lançamentos sucessivos de um dado.

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

## Processos com incrementos independentes

O caminho aleatório não é independente, como vimos, mas os seus *incrementos* são independentes. De fato, as chances de darmos um passo $+1$ ou $-1$ em um determinado instante independe de qualquer passo dado anteriormente. Ou seja, os incrementos $X_{n+1} - X_n$ são independentes entre si. Nesse caso, dizemos que o processo $\{X_n\}_n$ tem *incrementos independentes.*

Mais geralmente, um processo $\{X_t\}_{t\in I}$ tem **incrementos independentes** quando, para quaisquer $0 \leq t_0 < t_1, \ldots, t_n$, os incrementos $X_{t_1} - X_{t_0}$, $X_{t_2} - X_{t_1}$, ..., $X_{t_n} - X_{t_{n-1}}$ são variáveis aleatórias mutuamente independentes.

Veremos que o processo de Wiener é um exemplo de processo contínuo com incrementos independentes.

O processo de renovação, por sua vez, também não tem incrementos independentes. De fato, sejam $S_j$, $j\in \mathbb{N}$, variáveis aleatórias independentes com distribuições $\mathbb{P}(S_1 = 1) = \mathbb{P}(S_j = 2) = 1/2$ e $\mathbb{P}(S_j < 2) = 0$, para $j \geq 2$. Seja $X_t$ o processo de renovação associado a esses saltos. Lembremos que
$$
X_t = \sum_{n\in \mathbb{N}} \chi_{\{T_n \leq t\}} = \sup\{n; \; T_n \leq t\},
$$
onde
$$
T_n = \sum_{j = 1}^n S_j.
$$
Observe que $S_1 = 1$ ou $2$ e $S_j \geq 2$, para $j \geq 2$. Assim, $T_1 = 1$ ou $2$ e $T_j \geq 3$, para $j \geq 2$.

Então $X_t = 0$, para $t < 1$; $X_t = 0$ ou $1$, para $1 \leq t < 2$ e $X_t = 1$, para $2 \leq t < 3$. Observe, ainda, que $X_{5/4} - X_{3/4} = X_1 - X_{1/2}$ com iguais probabilidades de serem $0$ ou $1$, dependendo do resultado de $S_1$. Assim, esses incrementos não são independentes. Se $X_1 - X_{1/2} = 1$, então $S_1 = 1$ e necessariamente $X_{5/4} - X_{3/4} = 1$. Já se $X_1 - X_{1/2} = 0$, então $S_1 = 2$ e necessariamente $X_{5/4} - X_{3/4} = 0$. Todos os outros passos são mais longos e não interferem nesse movimento inicial.

## Processos independentes e identicamente distribuídos

Esses processos, chamados simplesmente de *i.i.d.*, são aqueles, naturalmente, que são, ao mesmo tempo, independentes e identicamente distribuídos.

Como vimos, o processo de Bernoulli é independente e identicamente distribuído.

Um processo pode ser independente sem ser identicamente distribuído. De fato, pense em um processo de Bernoulli em que a cada passo temos um teste de Bernoulli com probabilidades diferentes, digamos $X_n \sim \mathrm{Bernoulli}(p_n)$, com $p_n$ distintos. Por exemplo, jogamos, alternadamente, um dado viciado e um dado não viciado.

Um processo também pode ser identicamente distribuído sem ser independente. Por exemplo, digamos que, a cada mês, eu faça um sorteio, sempre do mesmo modo, para escolher uma certa quantidade de números para jogar na loteria e eu que eu repita os números em todas as semanas daquele mês. A probabilidade de um dos números ser igual a três é a mesma independente da semana. E as chances de eu jogar o número três na primeira semana de julho são as mesmas tendo eu jogado três na terceira semana de março ou não. Mas se um dos números jogados na primeira semana de julho for três, então certamente o três será jogado novamente na terceira semana de julho. Os números jogados em um mesmo mês não são independentes entre si.

Um exemplo contínuo é o processo
$$
X_t = \cos(t + U), \quad t\in \mathbb{R},
$$
onde $U$ é a variável aleatória $U \sim \mathrm{Unif}([0, 2\pi])$, i.e. com lei uniforme no intervalo $[0, 2\pi)$. Como o cosseno é periódico com período $2\pi$, essa lei é a mesma em todos os instantes $t\in \mathbb{R}$, ou seja, são identicamente distribuídos. Mas não são independentes.

## Processos com incrementos independentes e identicamente distribuídos

O nome já diz, por si só, o que é um processo com **incrementos independentes e identicamente distribuídos**.

Um exemplo é o caminho aleatório. Processos de Wiener, que veremos mais adiante, são exemplos de processos contínuos com incrementos *i.i.d.*.

Vale ressaltar aqui que, para a independência dos incrementos, os incrementos devem ser consecutivos, i.e. $W_{t_j} - W_{t_j}$, para $t_0 < t_1 < \cdots < t_n$ ou, no mínimo, sem interseção nos intervalos de tempo. Já para a distribuição idêntica, os passos devem ser tomados com intervalos iguais, i.e. $X_{t + \tau} - X_t$ e $X_{s + \tau} - X_s$, mas pode haver interseção, ou seja $\tau > 0$ e $t, s$ são arbitrários.

## Processos estacionários

Um processo $\{X_t\}_{t\in I}$ é dito **estacionário** quando as suas informações estatísticas não variam com o tempo. Mais precisamente, para quaisquer $t_1, \ldots, t_n \in I$ e $\tau>0$ tais que $t_1 + \tau, \ldots, t_n + \tau \in I$, as distribuições conjuntas de $X_{t_1}, \ldots, X_{t_n}$ e $X_{t_1 + \tau}, \ldots, X_{t_n + \tau}$ são iguais, o que pode ser expresso por
$$
\mathbb{P}(X_{t_1 + \tau} \in E_1, \ldots, X_{t_n + \tau} \in E_n) = \mathbb{P}(X_{t_1} \in E_1, \ldots, X_{t_n} \in E_n),
$$
para eventos quaisquer $E_1, \ldots, E_n \in \mathcal{E}$.

Em particular, considerando $n = 1$, vemos que as distribuições simples $X_t$ também são idênticas, ou seja, processos estacionários são necessariamente identicamente distribuídos. Mas não precisam ser independentes. De fato, considere o processo de Bernoulli $\{X_n\}_{n\in \mathbb{N}}$ e defina $Y_n = X_n + X_{n + 1}$, ou seja, $Y_n$ soma os resultados de dois lançamentos consecutivos, em uma série de lançamentos. A distribuição de $Y_n$ é sempre a mesma, igual à binomial $B(2, p)$. Mas $Y_{n+1}$ não é independente de $Y_n$.

Por outro lado, qualquer processo *i.i.d.* é estacionário. De fato, temos, trivialmente, que, como cada realização é independente,
$$
\mathbb{P}(X_{t_1 + \tau} \in E_1, \ldots, X_{t_n + \tau} \in E_n) = \mathbb{P}(X_{t_1 + \tau} \in E_1) \times \cdots \times \mathbb{P}(X_{t_n + \tau} \in E_n).
$$
Além disso, como são identicamente distribuídos, cada $\mathbb{P}(X_{t_j + \tau} \in E_j) = \mathbb{P}(X_{t_j} \in E_j)$. Usando isso e, novamente, a independência das realizações,
$$
\mathbb{P}(X_{t_1 + \tau} \in E_1, \ldots, X_{t_n + \tau} \in E_n) = \mathbb{P}(X_{t_1} \in E_1) \times \cdots \times \mathbb{P}(X_{t_n} \in E_n) = \mathbb{P}(X_{t_1} \in E_1, \ldots, X_{t_n} \in E_n).
$$
Nesse caso, podemos ir além e deduzir que essa distribuição conjunta é $\mathbb{P}(X_t \in E_1) \times \cdots \times \mathbb{P}(X_t \in E_n) = \mathbb{P}(X_t \in E_1 \cap \cdots \cap E_n)$ e independente de $t$.

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

Vale lembrar que a variável aleatória discreta $Y$ com probabilidades dadas pelos termos da série de Euler, i.e. $\mathbb{P}(Y = k) = p_k = {6}/{\pi^2 k^2}$, é um exemplo de variável aleatória com valor esperado (e autocorrelação) infinita. Assim, o processo dado por $X_n = Y$, para todo $n$, é estacionário mas não é fracamente estacionário.

## Processos de Poisson

Um **processo de Poisson** com taxa, ou intensidade, $\lambda > 0$ é um processo contínuo $\{X_t\}_{t\geq 0}$ com valores inteiros e com seguintes propriedades:
1. $X_0 = 0$;
2. Os incrementos são independentes, i.e. para quaisquer $0 \leq t_0 < t_1, \ldots, t_n$, os incrementos $X_{t_1} - X_{t_0}$, $X_{t_2} - X_{t_1}$, ..., $X_{t_n} - X_{t_{n-1}}$ são variáveis aleatórias independentes;
3. Para $t\geq 0$ e $\tau > 0$, o incremento $X_{t + \tau} - X_t$ é uma variável aleatória com distribuição de Poisson, i.e.
$$
\mathbb{P}(X_{t + \tau} - X_t = k) = \frac{(\lambda \tau)^k e^{-\lambda \tau}}{k!}.
$$

Os processos de Poisson são uma versão contínua do processo de contagem. Por definição, os processos de Poisson são processos com incrementos *i.i.d.*.

## Processos Gaussianos

Um **processo Gaussiano** é um processo contínuo $\{X_t\}_{t\in I}$, em um intervalo $I\subset \mathbb{R}$, tal que as distribuições conjuntas $X_{t_1}, \ldots, X_{t_n}$ são normais (multivariadas).

Um exemplo é dado pela Gaussiana senoidal $X_t = \cos(at)Y_1 + \sin(at)Y_2$, onde $a > 0$ e $Y_i = \mathcal{N}(\mu_i, \sigma_i^2)$ são normais independentes, $i = 1, 2$.

Processos de Wiener também são processos Gaussianos, como veremos a seguir.

## Processos e cadeias de Markov

**Processos e cadeias de Markov** são processos estocásticos em que a mudança de estado para um estado futuro, conhecendo-se o estado atual, não depende dos estados passados. São frequentemente chamados de processos *sem memória*. 

É comum distinguir entre processos discretos e contínuos, denominando os primeiros como **cadeias de Markov** e os últimos como **processos de Markov**, mas nem todos os autores fazem essa distinção; em muitos contextos, a denominação *cadeia de Markov* se refere a processos que podem ser discretos ou contínuos.

No caso discreto, se $\{X_t\}_{t\in I}$ é um processo aleatório em um conjunto discredo $I$, $t_1 < t_2 < \ldots < t_n < t_{n+1}$ pertencem a $I$, e $E, E_1, \ldots, E_n$ são possíveis eventos, então, dados $X_{t_1} \in E_1, X_{t_2} \in E_2, \ldots, X_{t_n} \in E_n$, temos que a probabilidade de $X_{t_{n+1}} \in E$ só depende da informação dada no instante mais recente $t_n$, ou seja
$$
\mathbb{P}(X_{t_{n+1}} \in E | X_{t_1} \in E_1, X_{t_2} \in E_2, \ldots, X_{t_n} \in E_n) = \mathbb{P}(X_{t_{n+1}} \in E | X_{t_n} \in E_n).
$$
No caso em que o conjunto de eventos também é discreto, podemos escrever
$$
\mathbb{P}(X_{t_{n+1}} = x | X_{t_1} = x_1, X_{t_2} = x_2, \ldots, X_{t_n} = x_n) = \mathbb{P}(X_{t_{n+1}} = x | X_{t_n} = x_n).
$$

A definição formal no caso em que o processo estocástico é contínuo é um pouco delicada, pois a condição requer envolver não apenas um número finito de instantes anteriores mas, sim, um contínuo de instantes $s \leq t$. Para isso, é necessário o conceito de *filtração*. Veremos isso em outro momento.

O processo de Bernoulli é um exemplo trivial de uma cadeia de Markov discreta. O passeio aleatório é outro exemplo. O processo de Wiener, modelando o movimento Browniano, por sua vez, é um exemplo de um processo de Markov contínuo. Já o modelo da urna sem recomposição, como tratado anteriormente, não é uma cadeia de Markov, já que cada passo depende do estado do sistema em todos os incrementos anteriores. Mas este pode ser reformulado como um processo de Markov. Veremos isso posteriormente, junto com o estudo de propriedades específicas de processos de Markov.

## Martingales

Processos do tipo Martingale são processos em que o valor esperado em um instante futuro é igual ao valor atual. Mais precisamente, no caso de $I$ discreto, um processo $\{X_t\}_{t\in I}$ é **Martingale** se
$$
\mathbb{E}\left[|X_t|\right] < \infty, \quad \forall t\in I,
$$
e se, dados instantes $t_1 < t_2 < \ldots < t_n < t_{n+1}$ pertencentes a $I$ e dados eventos $E_1, \ldots, E_n$, vale
$$
\mathbb{E}\left[X_{t_{n+1}} | X_{t_1}\in E_1, \ldots, X_{t_n}\in E_n\right] = X_{t_n}.
$$

No caso contínuo, a segunda condição pode ser informalmente escrita na forma
$$
\mathbb{E}\left[X_{t + \tau} | \{X_s; s\in I, \;s\geq t\}\right] = X_t, \quad \forall \tau \geq 0.
$$
Formalmente, a condicional $\{X_s; s\in I, \;s\geq t\}$ deve ser escrita na forma
$$
\mathbb{E}\left[X_{t + \tau} | X \in E_t\right] = X_t, \quad \forall \tau \geq 0,
$$
para qualquer $\{X \in E_t\}$ em uma $\sigma$-algebra $\mathcal{F}_t$ associada a uma filtração, como a **filtração natural** dada pela $\sigma$-algebra gerada por (i.e. a menor $\sigma$-algebra contendo) $\{X_s^{-1}(E); s\in I, \; s \leq t, \; E\in \mathcal{E}\}$.

O exemplo clássico de Martingale é o passeio aleatório. Se $\{X_n\}_{n\in \mathbb{Z}^*}$ denota o passeio aleatório, então, dado $X_n$, podemos ter $X_{n+1} = X_n + 1$ ou $X_n - 1$ com iguais probabilidades, de modo que
$$
\mathbb{E}[X_{n+1}|X_n] = X_n, \qquad \forall n.
$$
Além disso, o conhecimento de posições anteriores $X_j$, $j = 0, \ldots, n - 1$ não modifica esse valor esperado. Ou seja,
$$
\mathbb{E}[X_{n+1}|A_n] = X_n, \qquad \forall n,
$$
para qualquer $A_n$ na filtração natural até $n$.

Um processo Martingale não depende de valores anteriores. Mas ele não é necessariamente um processo de Markov, pois outras informações estatísticas diferentes do valor esperado podem depender de informações anteriores. E processos de Markov não são necessariamente Martingales, pois o valor esperado só depende da informação atual mas pode ser diferente do estado atual do processo.

## Processos de Wiener

Um **processo de Wiener**, ou **processo Browniano**, é um processo estocástico real $\{W_t\}_{t \geq 0}$ tal que, para algum $x\_0\in \mathbb{R}$,
1. $W_0 = x\_0$;
2. $\{W_t\}_{t\geq 0}$ possui incrementos independentes, i.e. para $t_j \geq 0$ e $\tau_j > 0$, onde $j = 1, \ldots, J$, $J\in\mathbb{N}$, temos que as variáveis aleatórias $\Delta W_j = W_{t_j + \tau_j} - W_{t_j}$, $j = 1, \ldots, J$, são independentes.
3. Para qualquer $\tau > 0$, os incrementos $W_{t + \tau} - W_t$ são identicamente distribuídos, com distribuição normal com média zero e desvio padrão $\tau$, i.e.
$$
W_{t + \tau} - W_t \sim \mathcal{N}(0, \tau), \quad \forall t \geq 0, \; \forall \tau > 0.
$$
4. Com probabilidade um, os caminhos amostrais são contínuos, i.e.
$$
\mathbb{P}(\{\omega \in \Omega; \; t \rightarrow W_t(\omega) \text{ é contínuo}\}) = 1.
$$

Quando $x_0 = 0$, ou seja,
$$
W_0 = 0,
$$
o processo $\{W_t\}_{t \geq 0}$ é chamado de **processo de Wiener padrão**, ou **processo Browniano padrão**. Dado um processo de Wiener padrão $\{W_t\}_{t\geq 0}$, o processo $\tilde W_t = x_0 + W_t$ é um processo de Wiener com $W_0 = x_0$.

Esse tipo de processo estocástico, como modelo para o movimento Browniano, foi introduzido por N. Wiener, nos anos 1920, junto com a demonstração de existência de tal processo. Veremos esse resultado de existência posteriormente.

Um processo de Wiener é um exemplo de processo Gaussiano. Para ver isso, dados $t_1, \ldots, t_n \geq 0$, podemos escrever cada $W_{t_1}, \ldots, W_{t_n}$ como combinação linear das normais independentes $W_{t_1} - W_{t_0}$, $W_{t_2} - W_{t_1}$, ..., $W_{t_n} - W_{t_{n-1}}$, onde $t_0 = 0$, i.e.
$$
W_{t_j} = W_{t_j} - W_{t_{j-1}} + \cdots + W_{t_1} - W_{t_0}.
$$
Dessa forma, a distribuição conjunta de $W_{t_1}, \ldots, W_{t_n}$ é dada por
$$
\mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} \leq x_n) = \mathbb{P}(W_{t_1} - W_{t_0} \leq x_1, \ldots, W_{t_n} - W_{t_{n-1}} + \cdots + W_{t_1} - W_{t_0} \leq x_n)
$$
Isso pode ser reescrito na forma
$$
\mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} \leq x_n) = \mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} - W_{t_{n-1}} \leq x_n - \cdots - x_1) = F(x_1, \ldots, x_n - \cdots - x_1),
$$
onde $F$ é a função de distribuição acumulada da normal multivariada associada às normais independentes $W_{t_1} - W_{t_0}, \ldots, W_{t_n} - W_{t_{n-1}}$. Portanto, $\{W_t\}_{t\geq 0}$ é um processo Gaussiano.

Note, ainda, que, como $W_0 = 0$ e $W_t - W_0 \sim \mathcal{N}(0, t)$, então
$$
\mathbb{E}[W_t] = \mathbb{E}[W_t - X_0] = 0
$$
e
$$
\mathrm{Var}(W_t) = \mathrm{Var}(W_t - W_0) = t.
$$
Além disso, para quaisquer $t \geq s \geq 0$, como os incrementos são independentes e, portanto, tem correlação nula,
$$
\begin{align*}
\mathrm{Cov}(W_t, W_s) & = \mathrm{Cov}(W_s + W_t - W_s, W_s) = \mathrm{Cov}(W_s, W_s) + \mathrm{Cov}(W_t - W_s, W_s) \\ & = \mathrm{Cov}(W_s - W_0, W_s - W_0) + \mathrm{Cov}(W_t - W_s, W_s - W_0) = \mathrm{Var}(W_s - W_0) = s.
\end{align*}
$$
Observe que, se $t = s > 0$, então o segundo termo se anula pois $W_t - W_s = 0$. Já se $t \geq s = 0$, então todos os termos se anulam, já que $W_s - W_0 = 0$. De qualquer forma, podemos escrever, para $t, s \geq 0$ quaisquer,
$$
\mathrm{Cov}(W_t, W_s) = \min\{t, s\}.
$$

Observe que, por definição, dois incrementos $W_{t_3} - W_{t_2}$ e $W_{t_1} - W_{t_0}$ são independentes quando $t_3 > t_2 = t_1 > t_0$. Isso se estende ao caso em que $t_2 > t_1$, pois basta acrescentar $W_{t_2} - W_{t_1}$ que teremos três incrementos independentes $W_{t_3} - W_{t_2}$, $W_{t_2} - W_{t_1}$ e $W_{t_1} - W_{t_0}$, e quaisquer dois deles também são independentes. Mas os incrementos $W_{t_3} - W_{t_2}$ e $W_{t_1} - W_{t_0}$ não são independentes quando $t_0 < t_2 < t_1 < t_3$. De fato, nesse caso, temos
$$
\begin{align*}
\mathbb{E}((W_{t_3} - W_{t_2})(W_{t_1} - W_{t_0})) & = \mathbb{E}(W_{t_3}W_{t_1} - W_{t_2}W_{t_1} - W_{t_3}W_{t_0} + W_{t_0}W_{t_2}) \\
& = \min\{t_3, t_1\} - \min\{t_2, t_1\} - \min\{t_3, t_0\} + \min\{t_0, t_2\} \\
& = t_1 - t_2 + t_0 - t_0 = t_1 - t_2 > 0.
\end{align*}
$$
Novamente, vemos que, se $t_1 = t_2$, então essa correlação se anula.

Um processo de Wiener não é estacionário, pois, em particular, os processos $W_t$ não tem a mesma lei de probabilidades. E também não é fracamente estacionário, já que, apesar de $\mathbb{E}[W_t] = 0$ ser constante, temos, para $t, s\geq 0$ e $\tau > 0$, que
$$
\begin{align*}
\mathbb{E}[W_{t + \tau}W_{s + \tau}] & = \mathbb{E}[(W_{t + \tau} - \mathbb{E}[W_{t + \tau}])(W_{s + \tau} - \mathbb{E}[W_{s + \tau}])] \\
& = \mathrm{Cov}(W_{t + \tau}, W_{s + \tau}) = \min\{t + \tau, s + \tau\} = \min\{t, s\} + \tau,
\end{align*}
$$
Ou seja, $\mathbb{E}[W_{t + \tau}W_{s + \tau}]$ depende de $\tau$.

Vamos concluir afirmando que um processo Gaussiano $\{W_t\}_{t\geq 0}$ com $\mathbb{E}[W_t] = 0$ e $\mathbb{E}[W_t W_s] = \min\{t, s\}$, para todo $t, s \geq 0$, é um processo de Wiener. A demonstração, no entanto, não é tão imediata e não a faremos aqui.

## Processos de Lévy

Um **processo de Lévy** é um processo estocástico contínuo $\{X_t\}_{t\geq 0}$ tal que
1. $X_0 = 0$;
2. Os incrementos são independentes, i.e. para quaisquer $0 \leq t_0 < t_1, \ldots, t_n$, os incrementos $X_{t_1} - X_{t_0}$, $X_{t_2} - X_{t_1}$, ..., $X_{t_n} - X_{t_{n-1}}$ são variáveis aleatórias independentes;
3. Os incrementos são estacionários, i.e. para quaisquer $0 \leq t_1, \ldots, t_n$ e $\tau > 0$, os incrementos $X_{t_1 + \tau} - X_{t_1}$, ..., $X_{t_n + \tau} - X_{t_n}$ tem distribuição conjunta de probabilidades independente de $\tau$;
4. $\{X_t\}_{t\geq 0}$ é contínuo em probabilidade, i.e. $\mathbb{P}(|X_{t + \tau} - X_t| > \varepsilon) \rightarrow 0$, quando $\tau \rightarrow 0$.

Processos de Wiener são processos de Lévy, com incrementos normais com média zero e variância proporcional ao intervalo de tempo.

Processos de Poisson são processos de Lévy, com incrementos dados por uma distribuição de Poisson, com valor esperado proporcional ao intervalo de tempo.

Processos de Lévy podem ser caracterizados através de uma representação chamada de *fórmula de Lévy-Khintchine*, para a sua função característica.

## Ruído branco

O conceito de processo do tipo **ruído branco** é delicado. A ideia está associada à cor branca, que é obtida pela mistura uniforme de todas as cores visíveis, i.e. combinando-se, igualmente, todos os comprimentos de onda do espectro visível. No caso de um "ruído", pensamos em um processo $\{X_t\}_t$, com variável *temporal* $t$ contínua, digamos $t \geq 0$. O espectro é obtido através das suas correlações, ou por suas covariâncias, como faremos a seguir. Pede-se, de início, que o processo tenha valor esperado nulo, $\mathbb{E}[X_t] = 0$, para todo $t \geq 0$. Assim, as suas covariâncias são dadas por
$$
\mathrm{Cov}(X_t, X_s) = \mathbb{E}(X_tX_s), \qquad t, s \geq 0.
$$
Pede-se, ainda, que seja um processo estacionário, de modo que as covariâncias só dependam do intervalo de tempo $t - s$, podendo ser escritas na forma
$$
\mathrm{Cov}(X_t, X_s) = c(t - s),
$$
para alguma função $c:\mathbb{R} \rightarrow \mathbb{R}$. Observe que $\mathrm{Cov}(X_t, X_s) = \mathrm{Cov}(X_s, X_t)$, de modo que $t, s \geq 0$ podem ser arbitrários e $t-s$ pode, de fato, assumir qualquer valor real.

Caso não haja nenhuma correlação entre os sinais em instantes diferentes, teremos
$$
c(\tau) = 0, \qquad \forall t \neq 0.
$$
Naturalmente,
$$
\sigma_0^2 \stackrel{\mathrm{def}}{=} c(0) = \mathrm{Cov}(X_t, X_t) = \mathbb{E}(X_t^2) = \mathrm{Var}(X_t) > 0 \text{ é constante.}
$$

Um exemplo de processo que satisfaz essas condições é o processo $X_t = \sin(Ut)$, onde $U \sim \mathrm{Unif}([0, 2\pi))$. Apesar dos caminhos amostrais serem simples senoidais, este é um exemplo de ruído branco no sentido acima. De fato, temos
$$
\mathbb{E}[X_t] = \int_\mathbb{R} x \;\mathbb{P}_{X_t}(\mathrm{d}x) = \frac{1}{2\pi}\int_0^{2\pi} \sin(ut) \;\mathrm{d}u = 0;
$$
$$
\mathrm{Var}(X_t) = \int_\mathbb{R} x^2 \;\mathbb{P}_{X_t}(\mathrm{d}x) = \frac{1}{2\pi}\int_0^{2\pi} \sin(ut)^2 \;\mathrm{d}u = \frac{1}{2\pi}\int_0^{2\pi} \frac{1 + \cos(2ut)}{2} \;\mathrm{d}u = \frac{1}{2};
$$
e
$$
\mathrm{Cov}(X_t, X_s) = \frac{1}{2\pi}\int_0^{2\pi} \sin(ut)\sin(us) \;\mathrm{d}u = 0; \quad t \neq s.
$$

No entanto, não podemos dizer que uma função $c(\cdot)$ satisfazendo $c(\tau) = 0$, quando $\tau \neq 0$, e $c(0) = 1/2$ tenha um espectro contínuo. As condições acima dão, na verdade, um ruído branco em um sentido mais fraco.

Para que seja um ruído branco "genuíno", a função de covariância $c(\cdot)$ não está definida no sentido clássico. É necessário que seja uma *distribuição*, com
$$
c(\tau) = \sigma_0^2\delta_0,
$$
para alguma $\sigma_0 > 0$ e onde $\delta_0$ é a delta de Dirac. Assim, o seu espectro $\hat c(\omega)$ é, de fato, constante (usamos $\omega$, aqui, para denotar a frequência, como de costume nesse contexto, ao invés de denotar um elemento do espaço amostral):
$$
\hat c(\omega) = \frac{1}{\sqrt{2\pi}} \int_{-\infty}^\infty c(\tau) e^{-i\omega \tau} \;\mathrm{d}\tau = \frac{1}{2\pi}\sigma_0^2, \quad \forall \omega \in \mathbb{R}.
$$

Algumas definições pedem, ainda, que os eventos, em instantes diferentes, sejam independentes entre si.

Não vamos nos aprofundar nesse assunto tão delicado, mas veremos argumentos de que a "derivada" de um processo de Wiener pode ser considerada um ruído branco nesse sentido mais forte. Seguimos, aqui, a derivação feita no Capítulo 3.8 de Higham & Kloeden (2021).

Vamos considerar as diferenças finitas de um processo de Wiener $\{W_t\}_{t\geq 0}$:
$$
D_h^+(t) = \frac{W(t+h) - W(t)}{h}.
$$
Defina
$$
c_h(t, s) = \mathbb{E}\left[ D_h^+(t)D_h^+(s)\right] = \mathbb{E}\left[ \left(\frac{W(t+h) - W(t)}{h} \right) \left(\frac{W(s+h) - W(s)}{h}\right)\right].
$$
Expandindo, temos
$$
c_h(t, s) = \frac{1}{h^2}\mathbb{E}\left[ W(t+h)W(s + h) - W(t)W(s + h) - W(t + h)W(s) + W(t)W(s)\right].
$$
Usando a expressão para a covariância de um processo de Wiener, obtemos
$$
c_h(t, s) = \frac{1}{h^2}\left( \min\{t + h, s + h\} - \min\{t, s + h\} - \min\{t + h, s\} + \min\{t, s\}\right).
$$
Observe que, se $t \leq s - h$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (t + h) - t - (t + h) + t \right) = 0.
$$
Se $s - h \leq t \leq s$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (t + h) - t - s + t \right) = \frac{t + h - s}{h^2},
$$
que é linearmente crescente, de $0$ a $1/h$. Se $s \leq t \leq s + h$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (s + h) - t - s + s \right) = \frac{h + s - t}{h^2},
$$
que é linearmente decrescente, de $1/h$ a $0$. Por último, se $t \geq s + h$, então
$$
c_h(t, s) = \frac{1}{h^2}\left( (s + h) - (s + h) - s + s \right) = 0.
$$

Assim,
$$
c_h(t, s) = \frac{1}{h^2}\begin{cases}
0, & t \leq s - h, \\
t + h - s, & s - h \leq t \leq s, \\
h + s - h, & s \leq t \leq s + h, \\
0, & t \geq s + h.
\end{cases}
$$

```julia:diffwiener_hatfunction
#hideall
using Plots
theme(:ggplot2)
t0 = 0.0
t1 = 4.0
s = 2.0
h = 0.5
tt = range(t0, t1, length = 200)
dh(t, s, h) = (min(t+h, s+h) - min(t, s+h) - min(t+h, s) + min(t,s))/h^2

plot(tt, t -> dh(t, s, h), xaxis = "tempo", yaxis = "valor", title = "Covariância Dₕ⁺(t, s) das diferenças finitas de um processo de Wiener\ncom s = $s e h = $h", titlefont = 8, label = false)
savefig(joinpath(@OUTPUT, "diffwiener_hatfunction.svg"))
```
\fig{diffwiener_hatfunction}

Observe, ainda, que
$$
\int_\mathbb{R} c_h(t, s) \;\mathrm{d}t = 1, \qquad \forall s\in \mathbb{R}.
$$
Ou seja, no limite, temos, de fato, uma delta de Dirac:
$$
c_h(\cdot, s) \rightarrow \delta_s, \qquad h \rightarrow 0.
$$

## Exercícios

1. Mostre que, se $\{X_n\}_n$ é um processo *i.i.d.* e $k \in \mathbb{N}$, o processo $Y_n = X_n + \cdots + X_{n + k}$ é estacionário mas não é *i.i.d.*.