@def title = "Processos em tempos discretos"

# {{ get_title }}

A nossa intenção principal é trabalhar com processos contínuous e em tempos contínuos, já que equações diferenciais estocásticas e aleatórias envolvem variáveis independentes contínuas, gerando, portanto, processos contínuos. Mas é ilustrativo iniciar os estudos de processos estocásticos com processos discretos. Além disso, alguns processos estocásticos contínuos aparecem naturalmente como limites de processos discretos.

## Processo de Bernoulli em tempo finito

Vamos começar com um processo de Bernoulli em um tempo discreto e finito $I = \{1, 2, \ldots, N\},$ onde $N \in \mathbb{N}.$ Há dois estados possíveis, digamos $\Sigma = \{0, 1\},$ indicando, por exemplo, o resultado do lançamento de uma moeda ("coroa" ou "cara") ou de um teste de laboratório ("negativo", "positivo").

A cada passo, um *teste de Bernoulli* é feito, dando um resultado $1,$ com probabilidade $p,$ ou $0,$ com probabilidade $1 - p,$ onde $0 < p \leq 1.$ Assumimos que os testes sejam independentes, ou seja, o resultado do teste em um passo $n_1$ independe do resultado do teste no instante $n_2.$

Fazemos o teste $N$ vezes, obtendo uma sequência de resultados $x = (x_1, \ldots, x_N),$ onde $x_n \in \Sigma = \{0, 1\}.$ O conjunto de possíveis sequências forma o espaço amostral $\Omega = \{0, 1\}^N.$ Há $2^N$ sequências possíveis. Se $i = \#\{n; \; x_n = 1\}$ denota o número de vezes em que o resultado é $1$ e $j = \#\{n; \; x_n = 0\},$ o número de vezes em que o resultado é $0,$ então $i + j = n$ e a probabilidade dessa sequência $x$ ocorrer é
$$
\mathbb{P}(X = x) = p^i(1-p)^{n-i}, \qquad i = \#\{n; \; x_n = 1\}.
$$

Podemos interpretar o resultado do teste de Bernoulli em cada passo $n$ como uma variável aleatória $X_n$ nesse espaço $(\Omega, \mathcal{F}, \mathbb{P}).$ A sequência $\{X_n\}_{n = 1, \ldots, N}$ é um processo aleatório discreto. Um determinado resultado no instante $n$ tem probabilidades
$$
\mathbb{P}(X_n = 1) = \mathbb{P}(\{x \in \Omega; x_n = 1\}) = p,
$$
e
$$
\mathbb{P}(X_n = 0) = \mathbb{P}(\{x \in \Omega; x_n = 0\}) = 1 - p.
$$

A distribuição de probabilidades de $X_n$ é igual a de um único teste de Bernoulli. Podemos escrever
$$
X_n \sim \mathrm{Bernoulli}(p),
$$
onde $\mathrm{Bernoulli}(p)$ é a distribuição de Bernoulli com probabilidade de sucesso $p.$

Mas enquanto um teste de Bernoulli isolado pode ser pensado como uma variável aleatória no espaço amostral $\{0, 1\},$ o processo gerado por $N$ testes de Bernoulli é pensado como sendo definido no espaço de trajetórias. Além disso, dessa forma, podemos considerar probabilidades conjuntas. Por exemplo, no caso do resultado dos testes em dois instantes diferentes, temos
$$
\mathbb{P}(X_{n_1} = e_1, X_{n_2} = e_2) = \mathbb{P}(\{x \in \Omega; x_{n_1} = e_1, \;x_{n_2} = e_2\}) = p_1p_2,
$$
onde $p_n = p,$ se $e_n = 1,$ ou $p_n = 1 - p,$ se $e_n = 0.$

Como $I=\{1, \ldots, n\}$ é finito, podemos, na verdade, considerar $\{X_t\}_{t=1, \ldots, n}$ como um **vetor aleatório.** O interesse maior está no caso em que o conjunto de índices é infinito (enumerável ou não).

## Processo de Bernoulli em tempo infinito

Podemos, também, fazer um número infinito de testes de Bernoulli. Nesse caso, $I = \mathbb{N}$ e obtemos um processo $\{X_n\}_{n\in \mathbb{N}},$ onde, a cada $n,$ $X_n$ indica o resultado de um teste de Bernoulli. Como antes, $\{X_n\}_{n\in \mathbb{N}}$ é um processo estacionário e independente, com
$$
X_n \sim \mathrm{Bernoulli}(p).
$$

O espaço amostral também pode ser pensado como sendo o espaço de possíveis trajetórias,
$$
\Omega = \{0, 1\}^\mathbb{N} = \{x:\mathbb{N} \rightarrow \{0, 1\}\} = \{x = (x_1, x_2, \ldots); \; x_n = 0 \textrm{ ou } 1, \; n\in \mathbb{N}\}.
$$

Nesse caso, no entanto, esse espaço tem cardinalidade infinita. Mais precisamente, $\#2^\mathbb{N} = 2^{\aleph_0} = \aleph_1,$ que não é enumerável. A probabilidade de observamos uma sequência em particular é, portanto, necessariamente nula! Mas podemos observar conjuntos de sequências, em particular conjuntos que tenham uma mesma sequência finita. Isso é uma probabilidade conjunta, digamos
$$
\mathbb{P}(X_{n_1} = e_1, \ldots X_{n_N} = e_N) = \mathbb{P}(\{x = (x_1, x_2, \ldots) \in \{0, 1\}^\mathbb{N}; \; x_{n_1} = e_1, \ldots, x_{n_N} = e_N) \\ = p^i(1-p)^{N-1},
$$
onde $i = \#\{n \in \{n_1, \ldots, n_N\}; \; x_n = 1\}.$

## Passeio aleatório

Nesse caso, $I = \mathbb{Z}^+ = \mathbb{N}_0 = \{0, 1, 2, \ldots\},$ o conjunto de estados possíveis é $\Sigma = \mathbb{Z}$ e o espaço amostral pode ser tomado como $\Omega = \Sigma^I = \mathbb{Z}^{\mathbb{Z}^+} = \{x = (x_0, x_1, x_2, \ldots); \; x_n \in \mathbb{Z}, n = 0, 1, 2, \ldots\}.$ Novamente, $\Omega$ é incontável e a probabilidade da realização de cada trajetória específica é nula. Mas podemos deduzir a probabilidade do caminho passar pela posição $m,$ em um determinado instante $n$:
$$
\mathbb{P}(X_n = m) = \begin{cases}
  \displaystyle \frac{1}{2^n} \left(\begin{matrix} n \\ \frac{n + m}{2} \end{matrix}\right), & |m| \leq n \text{ e $m$ e $n$ com a mesma paridade} \\
  0, & |m| > n \text{ e/ou $m$ e $n$ com paridades diferentes.}
\end{cases}
$$

Saber a posição da partícula no instante $n$ nos dá a distribuição de probabilidades para a posição em $n+1,$ o que podemos escrever na forma
$$
\mathbb{P}(X_{n+1} = k | X_n = m) = \begin{cases} \displaystyle \frac{1}{2}, & k = m \pm 1, \\ 0, & k \neq m \pm 1. \end{cases}
$$

Um passeio aleatório pode ser definido de maneira mais explícita como
$$
X_n = \sum_{j=1}^n Y_j, \quad n = 0, 1, 2, \ldots,
$$
onde $\{Y_j\}_{j\in\mathbb{N}}$ é como um processo de Bernoulli com probabilidade $1/2,$ exceto que os valores possíveis são $-1$ e $1,$ ao invés de $0$ e $1.$ De outra forma, podemos escrever
$$
X_n = \sum_{j=1}^n Y_j, \qquad n = 0, 1, 2, \ldots, \quad Y_j = 2Z_j -1, \quad Z_j \sim \operatorname{Bernoulli}(1/2), \textrm{ independentes.}
$$

Com essa representação, podemos deduzir
$$
\mathbb{E}[X_n] = \sum_{j=1}^n \mathbb{E}[Y_j] = 0,
$$
visto que cada $Y_j$ tem média zero. Além disso, $Y_j^2 = (\pm 1)^2 = 1$ certamente, de modo que $\mathbb{E}[Y_j^2] = 1.$ Assim, usando a independência,
$$
\begin{align*}
    \mathbb{E}[X_n^2] & = \mathbb{E}\left[ \left(\sum_{j=1}^n Y_j\right)^2\right] = \mathbb{E}\left[ \left(\sum_{j=1}^n Y_j\right)\left(\sum_{i=1}^n Y_i\right)\right] = \mathbb{E}\left[\sum_{j, i=1}^n Y_j Y_i\right] \\
    & = \mathbb{E}\left[\sum_{i\neq j} Y_j Y_i\right] + \mathbb{E}\left[\sum_{i=j} Y_j Y_i\right]  = \mathbb{E}\left[\sum_{j=1}^n Y_j^2\right] = \sum_{j=1}^n\mathbb{E}\left[ Y_j^2\right] = \sum_{j=1}^n 1 = n.
\end{align*}
$$

```julia:passeio_aleatorio
#hideall
using Plots
using Random
theme(:ggplot2)
N = 100+1
M = 40
nn = 0:N-1
X = Array{Int}(undef, N, M)
rng = Xoshiro(123)
X[1, :] .= 0
for j in 2:N
    X[j, :] .= X[j-1, :] .+ rand(rng, (-1:1), M)
end
plot(X, nn, xlims = (-div(N+1,2), div(N+1,2)), ylims = (-1, N+1), xaxis = "posição", yaxis = "passo", title = "Caminhos amostrais de um passeio aleatóro", titlefont = 12, label = false, linetype=:steppre, size = (600,600), color=:navyblue)
plot!(X[:,1], nn, xlims = (-div(N+1,2), div(N+1,2)), ylims = (-1, N+1), title = "Caminhos amostrais de um passeio aleatóro", titlefont = 10, label = false, linetype=:steppre, size = (600,600), color=:red, linewidth=2)
savefig(joinpath(@OUTPUT, "passeio_aleatorio.svg"))
```
\fig{passeio_aleatorio}

## Processos decididos na partida

Esses processos aparecem naturalmente em sistemas determinísticos onde há uma incerteza na condição inicial. Escolhendo-se aleatoriamente o dado inicial, determina-se os estados futuros. Os estados futuros estão unicamente condicionados pelo dado inicial.

Isso aparece em particular em equações diferenciais determinísticas, mas podemos exemplificar a partir de regras explícitas. Por exemplo, dada uma variável aleatória $Y,$ em um espaço de probabilidades $(\Omega, \mathcal{F}, \mathbb{P}),$ com estados em $(\Sigma, \mathcal{E}),$ podemos definir o **processo constante** $X_n == Y$ também em $(\Omega, \mathcal{F}, \mathbb{P}),$ ou seja, onde os únicos caminhos amostrais observáveis possíveis são os caminhos constantes $n \mapsto X_n(\omega) = Y(\omega),$ para $\omega\in \Omega.$ Sorteamos $Y(\omega)$ inicialmente, de acordo com $\mathbb{P},$ e fazemos $X_n(\omega) = Y(\omega)$ constante ao longo de $n.$ Não custa ressaltar que isso não quer dizer apenas que cada $X_n$ tem lei igual a $Y$; isso define $X_n$ para todo $n$ de maneira determinada.

A lei de $\{X_n\}_n$ é denotada, também, por $\mathbb{P},$ com o entendimento de que
$$
\mathbb{P}(X_1 \in E_1, \ldots X_n \in E_n) = \mathbb{P}(Y \in E_1, \ldots, Y \in E_n) = \mathbb{P}(Y \in E_1 \cap \cdots \cap E_n).
$$
Em particular, a lei conjunta de probabilidade acumulada $F$ do processo é dada em função da lei $G$ de $Y$ por
$$
F_{t_1, \ldots, t_n}(x_1, \ldots, x_n) = \mathbb{P}(X_{t_1} \leq x_1, \ldots X_{t_n} \leq x_n) = \mathbb{P}(Y \leq \min\{t_1, \ldots, t_n\}) = G(\min\{x_1, \ldots, x_n\}).
$$

Podemos, também, definir processos não constantes. Por exemplo, $\{X_n\}_{n\in \mathbb{N}}$ dado por
$$
X_n = \frac{1}{n} Y.
$$
Nesse caso, dada uma amostra $\omega,$ obtemos a trajetória, ou caminho amostral, correspondente
$$
X_n(\omega) = \frac{1}{n} Y(\omega), \quad n\in \mathbb{N}.
$$
A probabilidade de uma observação no instante $t$ é definida pela observação inicial:
$$
\mathbb{P}(X_n \in E) = \mathbb{P}(Y \in nE),
$$
onde $nE = \{n x; \;\forall x\in E\},$ para um evento qualquer $E\in \mathcal{E}.$

```julia:partida_decaimento
#hideall
using Plots
using Random
theme(:ggplot2)
mu = 10.0
sigma = 2.0
N = 20
M = 5
nn = 1:N
X = Array{Float64}(undef, N, M)
rng = Xoshiro(321)
X[1, :] .= 10.0 .+ 2.0 .* randn(rng, M)
for j in 2:N
    X[j, :] .= X[1, :] ./ j
end
plot(nn, X, xlims = (0, N+1), ylims = (-1, mu + sigma), title = "Caminhos amostrais de um processo X_n = Y/n decidido na partida com Y = N($mu, $(sigma^2))", titlefont = 8, label = false, marker = :circle)
savefig(joinpath(@OUTPUT, "partida_decaimento.svg"))
```
\fig{partida_decaimento}

## Urna sem recomposição

Imagine um saco com cinco bolinhas vermelhas e cinco bolinhas pretas. Imagine, agora, retirarmos as dez bolinhas do saco, uma a uma. Seja $X_n$ a variável aleatória indicando a cor da bolinha retirada na $n$-ésima vez. Digamos que $X_n = 1$ para uma bolinha vermelha e $X_n = 2$ para uma bolinha preta. Isso nos leva a um processo estocástico $\{X_n\}_{n=1, \ldots, 2N},$ em $I=\{1, \ldots, 2N\},$ onde $N = 5$ é o número inicial de bolinhas da mesma cor. Podemos considerar o espaço amostral como sendo $\Omega = \{1, 2\}^N,$ com $\#\Omega = 2^{10} = 1024$ trajetórias possíveis.

Na primeira retirada, temos números iguais de bolinhas de cada cor, de modo que a probabilidade de cada uma sair é igual:
$$
\mathbb{P}(X_1 = 1) = \mathbb{P}(X_1 = 2) = \frac{1}{2}.
$$
Já nas retiradas seguintes, no entanto, as chances de cada uma vão mudar de acordo com quais bolinhas já foram retiradas. No segundo passo, se a primeira bolinha retirada foi preta, então sobraram cinco bolinhas vermelhas e quatro pretas, de maneira que as chances de tirarmos outra preta são de 4/9 enquanto que as chances de tirarmos uma vermelha são de 5/9. Analogamente, caso a primeira bolinha retirada tenha sido vermelha. Podemos escrever isso em termos de probabilidades condicionadas:
$$
\mathbb{P}(X_2 = 1 | X_1 = 1) = \mathbb{P}(X_2 = 2 | X_1 = 2) = \frac{4}{9}, \quad \mathbb{P}(X_2 = 1 | X_1 = 2) = \mathbb{P}(X_2 = 2 | X_1 = 1) = \frac{5}{9}.
$$
Após o passo $n,$ com $1 \leq n \leq 2N,$ se foram retiradas $i$ bolinhas vermelhas e $n - i$ bolinhas pretas, então as chances de tirarmos uma bolinha vermelha ou uma bolinha preta no passo $n+1$ são, respectivamente,
$$
\frac{N - i}{2N - n} \quad \text{e} \quad \frac{N - n + i}{2N - n}. 
$$
Podemos escrever isso em termos de probabilidade condicionada, em função de todas as retiradas passadas:
$$
\mathbb{P}(X_{n + 1} = x_{n+1} | X_1 = x_1, \ldots, X_n = x_n) = \frac{N - \#\{x_i = x_{n+1}; \; i = 1, \ldots, n\}}{2N - n}.
$$

Isso não nos impede de calcularmos a probabilidade de termos um certo resultado sem sabermos estados anteriores. Basta somarmos todas as possibilidades até o momento desejado.

Por exemplo, vamos buscar encontrar $\mathbb{P}(X_2 = 1).$ Temos
$$
\mathbb{P}(X_2 = 1) = \mathbb{P}(X_2 = 1 | X_1 = 1)\mathbb{P}(X_1 = 1) + \mathbb{P}(X_2 = 1 | X_1 = 2)\mathbb{P}(X_1 = 2) = \frac{4}{9}\times \frac{1}{2} + \frac{5}{9}\times\frac{1}{2} = \frac{1}{2}.
$$
Da mesma forma, $\mathbb{P}(X_2 = 2) = 1/2.$ Agora, quando a $X_3,$ temos
$$
\mathbb{P}(X_3 = 1) = \mathbb{P}(X_3 = 1 | X_2 = 1)\mathbb{P}(X_2 = 1) + \mathbb{P}(X_3 = 1 | X_2 = 2)\mathbb{P}(X_2 = 2).
$$
Temos, ainda,
$$
\mathbb{P}(X_3 = 1 | X_2 = 1) = \mathbb{P}(X_3 = 1 | X_2 = 1, X_1 = 1)\mathbb{P}(X_1 = 1) + \mathbb{P}(X_3 = 1 | X_2 = 1, X_1 = 2)\mathbb{P}(X_1 = 2) \\
= \frac{3}{8}\times\frac{1}{2} + \frac{4}{8}\times \frac{1}{2} = \frac{7}{16}
$$
e
$$
\mathbb{P}(X_3 = 1 | X_2 = 2) = \mathbb{P}(X_3 = 1 | X_2 = 2, X_1 = 1)\mathbb{P}(X_1 = 1) + \mathbb{P}(X_3 = 1 | X_2 = 2, X_1 = 2)\mathbb{P}(X_1 = 2) \\
= \frac{4}{8}\times\frac{1}{2} + \frac{5}{8}\times \frac{1}{2} = \frac{9}{16}.
$$
Logo,
$$
\mathbb{P}(X_3 = 1) = \frac{7}{16}\frac{1}{2} + \frac{9}{16}\frac{1}{2} = \frac{1}{2}.
$$
Analogamente,
$$
\mathbb{P}(X_3 = 2) = \frac{1}{2}.
$$

De fato, $\mathbb{P}(X_n = 1) = \mathbb{P}(X_n = 2) = 1/2,$ para qualquer $n = 1, \ldots, 2N.$ Basta pensar que, por simetria (as probabilidades devem ser as mesmas para cada cor de bolinha, já que não há viés para nenhuma delas), $\mathbb{P}(X_n = 1) = \mathbb{P}(X_n = 2).$ Além disso, a soma delas deve ser $1.$ Portanto, a única opção é cada uma ter probabilidade meio.

Observe, então, que as seguintes probabilidades são diferentes:
$$
\mathbb{P}(X_3 = 1) = \frac{1}{2}, \quad \mathbb{P}(X_3 = 1 | X_2 = 1) = \frac{4}{9}, \quad \mathbb{P}(X_3 = 1 | X_2 = 1, X_1 = 1) = \frac{3}{8}.
$$

## Contagem binomial

O processo aleatório de **contagem binomial** é obtido "contando-se" o número de sucessos de um processo de Bernoulli. Se $\{X_n\}_{n\in \mathbb{N}}$ é um processo de Bernoulli com probabilidade de sucesso $p,$ $0 < p \leq 1,$ então o processo $\{S_n\}_{n\in \mathbb{N}}$ de contagem binomial pode ser escrito por
$$
S_n = \sum_{j=1}^n X_n.
$$
O número de sucesso em $n$ tentativas binárias é dado pela distribuição binomial,
$$
S_n \sim B(n, p),
$$
ou seja,
$$
\mathbb{P}(S_n = k) = p^k(1 - p)^{n-k}\left(\begin{matrix} n \\ k \end{matrix}\right).
$$
O processo de Bernoulli pode ser obtido da contagem binomial através de
$$
X_n = S_n - S_{n-1}, \quad n \in \mathbb{N},
$$
com
$$
S_0 = 0
$$
O espaço de eventos da contagem binomial é, naturalmente, $\Sigma = \mathbb{Z}^+ = \{0, 1, 2, \ldots\}$ e o espaço amostral pode ser tomado com sendo o das sequências de inteiros não negativos, $\Omega = {\mathbb{Z}^+}^\mathbb{N} = \{x = (x_1, x_2, \dots); \; x_n \in \mathbb{Z}, \;x_n \geq 0\}.$

```julia:contagem_binomial
#hideall
using Plots
using Random
theme(:ggplot2)
p = 0.4
N = 40
M = 10
nn = 1:N
X = Array{Int}(undef, N, M)
rng = Xoshiro(123)
X[1, :] = rand(rng, M) .< p
for j in 2:N
    X[j, :] .= X[j-1, :] .+ (rand(rng, M) .< p )
end
plot(nn, X, xlims = (0, N+1), ylims = (-1, N+1), title = "Caminhos amostrais de uma contagem binomial com p = $p", titlefont = 10, label = false, linetype=:steppost)
savefig(joinpath(@OUTPUT, "contagem_binomial_caminhos.svg"))
```
\fig{contagem_binomial_caminhos}

O processo de contagem binomial pode ser usado para modelar a contagem de chegadas de pacotes em uma rede de comunicação. Digamos que, em uma determinada rede, em um determinado período, as chances de um pacote de dados chegar em um intervalo arbitrário de um milisegundo é de $\%10.$ Os pacotes chegam de fontes distintas e com frequência suficiente, de modo que é razoável assumir que as chegadas são independentes entre si. Assim, podemos assumir que a chegada de dados a cada milisegundo é um processo de Bernoulli com probabilidade de sucesso $p = 0.1.$ O número de pacotes recebidos em um intervalo de $n$ milisegundos é dado pela contagem binomial $S_n = X_1 + \ldots + X_n.$

O servidor tem uma capacidade limitada de resolver os pacotes. Digamos, então, que o servidor perca pacotes caso recebe mais de 120 pacotes por segundo. Quais as chances do servidor perder algum pacote nesse período?

Um intervalo de um segundo abrange iterações entre $n + 1$ e $n + 1000,$ já que cada passo de tempo considerado é de um milisegundo. Ou seja, $S_{n + 1000} - S_n = X_{n + 1} + \cdots + X_{n + 1000}.$ Como os incrementos são independentes, temos
$$
\mathbb{P}(S_{n + 1000} - S_n > 120) = \mathbb{P}(S_{1000} > 120) = \sum_{k = 121}^{1000} \mathbb{P}(S_{1000} = k) \\ = \sum_{k = 121}^{1000} p^k (1-p)^{1000 - k}\left(\begin{matrix} 1000 \\ k \end{matrix}\right)
$$

Podemos estimar esse número usando o Teorema Central do Limite, mas também podemos, nesse caso, calculá-lo diretamente no computador:
```julia:pacotes_perdidos
p = 0.1
N = 1000
l = 120
s = Float64(sum(p^k * (1-p)^(N - k) * binomial(big(N), big(k)) for k in l+1:N))
println("Há $(100 * round(s, digits = 4))% de chances de algum pacote ser perdido.")
```
\output{pacotes_perdidos}

## Exercícios

1. Seja $U \sim \operatorname{Uniform}(0, 1)$ uma variável aleatória distribuída uniformemente no intervalo $[0, 1].$ Considere a decomposição binária de um número $x\in [0, 1]$:
$$
x = \sum_{n = 1}^\infty b_n 2^{-n}.
$$
Essa decomposição não é, necessariamente, única, já que cada número com expansão finita $x = \sum_{n = 1}^N b_n 2^{-n}$ também pode ser representado pela expansão infinita $x = \sum_{n = 1}^\infty \tilde b_n 2^{-n},$ desde que $\tilde b_n = b_n$ para $n < N,$ $b_N = 0$ e $b_n = 1,$ para $n > N.$ Mas ela é única se impusermos que apenas $x = 0$ pode ser representado por uma sequência terminando em zeros. Assumindo essa representação única, podemos escrever a variável aleatória na forma $U = \sum_{n=1}^\infty B_n 2^{-n},$ para variáveis aleatórias $B_n,$ $n\in \mathbb{N}.$ Mostre que $\{B_n\}_{n\in \mathbb{N}}$ é um processo de Bernoulli, com $B_n \sim \operatorname{Bernoulli}(1/2).$