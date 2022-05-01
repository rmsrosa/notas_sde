@def title = "Processos contínuos"

# {{ get_title }}

Vimos vários processos discretos que foram definidos por indução nos passos. Naturalmente, o mesmo não pode ser feito com tanta facilidade para processos contínuos. Vários processos contínuos aparecem naturalmente como soluções de equações aleatórios e de equações estocásticas. Mas podemos exemplificar com alguns processos definidos mais diretamente, como veremos a seguir.

Vamos ver alguns exemplos em que o processo pode ser construído explicitamente a partir de uma única variável aleatória ou de algumas poucas variáveis aleatórias.

## Processos constantes

 Por exemplo, seja $Y$ uma variável aleatória em $(\Omega, \mathcal{A}, \mathbb{P})$, com valores no espaço de estados $(\Sigma, \mathcal{E})$. Como feito no caso discreto, podemos definir o **processo constante**
$$
X_t = Y, \quad \forall t\in I,
$$
onde $I\subset \mathbb{R}$ é um intervalo real qualquer. Uma vez sorteado $Y(\omega)$, temos o caminho amostral constante $X_t(\omega) = Y(\omega)$, $t\in I$.

```julia:processo_constante
#hideall
using Plots
using Random
theme(:ggplot2)
N = 40
M = 20
nn = 1:N
X = Array{Float64}(undef, N, M)
rng = Xoshiro(123)
X = permutedims(repeat(randn(rng, M), 1, N))
plot(nn, X, xlims = (0, N+1), ylims = (-3, 3), title = "Caminhos amostrais de um processo constante X_t = Y ∼ N(0,1)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_constante.svg"))
```
\fig{processo_constante}

## Transporte de uma variável aleatória

Mais geralmente, dada uma variável aleatória $Y$ e uma função *mensurável* $f:I\times \Sigma \rightarrow \Sigma$, podemos definir o processo
$$
X_t = f(t, Y), \quad \forall t\in I.
$$
Uma vez sorteado $Y(\omega)$, temos o caminho amostral determinado por $X_t(\omega) = f(t, Y(\omega))$, $t\in I$. Nesse caso, a lei para cada $X_t$ é dada pelo *transporte* da lei de $Y$ por $f(t, \cdot)$.

### Transporte sin(t + U)

Um caso interessante é dado por uma variável aleatória uniforme $U \sim \mathrm{Uniforme}([0, 2\pi))$, com distribuição uniforme em $[0, 2\pi)$, e com $f(t, x) = \sin(t + x)$, ou seja,
$$
X_t = \sin(t + U).
$$

```julia:processo_sintplusU
#hideall
using Plots
using Random
theme(:ggplot2)

N = 50
M = 10
tt = range(0.0, 10.0, length = N+1)
rng = Xoshiro(123)
X = permutedims(sin.(tt' .+ 2π * rand(rng, M)))

plot(tt, X, title = "Caminhos amostrais do processo X_t = sin(t + U), U ∼ Unif(0,2π)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_sintplusU.svg"))
```
\fig{processo_sintplusU}

Como o seno é periódico com período $2\pi$, os processos $X_t$ tem sempre a mesma distribuição:
$$
X_t \sim \sin(\mathrm{Uniforme}([0, 2\pi))).
$$
O processo $\{X_t\}_{t\in \mathbb{R}}$ assume valores em $\mathbb{R}$, mas apenas valores entre $-1 \leq x \leq 1$ são realizáveis. A lei de cada $X_t$ não é uniforme; há mais chances dos valores estarem próximos de $\pm 1$ do que de zero. De fato, $X_t$ segue a distribuição arcoseno:
$$
X_t \sim \mathrm{Arcsin}(-1, 1), \quad \forall t\in \mathbb{R},
$$
cuja função acumulada de probabilidade é dada por:
$$
F_{X_t}(x) = \frac{2}{\pi}\arcsin\sqrt{2x - 1} = \frac{1}{2} + \frac{\arcsin(2x - 1)}{\pi}, \quad \forall t\in \mathbb{R}.
$$

Para ver isso, observe que
$$
F_{X_0}(x) = \mathbb{P}(X_0 \leq x) = \mathbb{P}(\sin(U) \leq x) = 
$$


```julia:cosuniform
#hideall
using Random
using Plots
theme(:ggplot2)
t = 10.0
M = 100_000
rng = Xoshiro(123)
U = 2π * rand(rng, M)
X_t = cos.(t .+ U)

histogram(X_t, label = false, xaxis = "X_T", yaxis = "contagem", title = "Histograma de X_t = cos(t + U), U ∼ Unif([0, 2π)), com $M realizações", titlefont = 8, bins = 100)

savefig(joinpath(@OUTPUT, "cosuniform.svg"))
```
\fig{cosuniform}

### Transporte cos(Ut)

Um outro exemplo importante é dado por
$$
X_t \sim \cos(Ut),
$$
onde, novamente, $U \sim \mathrm{Uniforme}([0, 2\pi))$. Cada caminho amostral é um simples cosseno, $t \mapsto X_t(\omega) = \cos(U(\omega)t)$.

A lei continua sendo dada pela distribuição arcoseno, em cada tempo, de modo que esse processo não é independente mas ainda é um processo identicamente distribuído. O mais significativo, no entanto, é que, como a frequência de cada seno é dada aleatoriamente, o conjunto de trajetórias dispersa, a ponto das estatísticas conjuntas serem não triviais. Veremos que esse é, surpreendentemente, um exemplo de um *ruído branco*.

```julia:processo_sinttimesU
#hideall
using Plots
using Random
theme(:ggplot2)
N = 200
M = 5
tt = range(0.0, π, length = N+1)
rng = Xoshiro(123)
X = permutedims(sin.(tt' .* 2π .* rand(rng, M)))
plot(tt, X, title = "Caminhos amostrais do processo X_t = sin(Ut), U ∼ Unif(0,2π)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_sinttimesU.svg"))
```
\fig{processo_sinttimesU}

## Gaussiana dançante

Também podemos construir processos contínuos a partir de mais de uma variável aleatória. Considere, por exemplo, duas variáveis aleatórias quaisquer, $Y_1$ e $Y_2$, em um mesmo espaço amostral e com valores em um espaço de estados comum. Considere $a\in \mathbb{R}$ e defina
$$
X_t = \cos(at)Y_1 + \sin(at)Y_2, \quad t\in \mathbb{R}.
$$
No caso em que $Y_1$ e $Y_2$ têm distribuição normal independente, temos que $X_t$ também é uma distribuição normal, com média e desvio padrão dados por
$$
\mathbb{E}[X_t] = \cos(at)\mathbb{E}[Y_1] + \sin(at)\mathbb{E}[Y_2], \qquad \mathrm{Var}[X_t] = \cos^2(at)\mathrm{Var}[Y_1] + \sin^2(at)\mathrm{Var}[Y_2].
$$
Veremos, em outro momento, que $\{X_t\}_{t\in \mathbb{R}}$ é um exemplo de *processo Gaussiano.*

```julia:gaussian_dance
#hideall
using Random
using Plots
theme(:ggplot2)
rng = Xoshiro(123)

mu1 = 3.0
sigma1 = 1.0
mu2 = -2.0
sigma2 = 2.0

a = 2.0
T = 12π / a
N = 100
tt = range(0.0, T, length = N)

x = mu1 * cos.(a * tt) .+ mu2 * sin.(a * t)
sigma = sqrt.(sigma1^2 .* cos.(a * tt) .^2 .+ sigma2^2 .* sin.(a * tt) .^2)

plot(tt, x, ribbon = var, xaxis = "t", yaxis = "x", label = false, title = "Evolução da média e do desvio-padrão de X_t = cos(at)Y_1 + sin(at)Y_2\na = $a e Y1 ∼ N($mu1, $(sigma1^2)), Y2 ∼ N($mu2, $(sigma2^2))", titlefont = 10)

savefig(joinpath(@OUTPUT, "gaussian_dance.svg"))
```
\fig{gaussian_dance}

## Processo de renovação

Os processos de renovação são processos contínuos com estados discretos e são dados a partir de uma sequência de variáveis aleatórias discretas representando intervalos tempo para "saltos" de estado. Mais precisamente, sejam $\{Y_j\}_{j\in \mathbb{N}}$ variáveis aleatórias positivas, independentes e identicamente distribuídas e com esperança finita, $\mathbb{E}(Y_j) < \infty$. Para cada $n$, definimos os instantes de salto
$$
Z_n = \sum_{j = 1}^n Y_j.
$$
Cada $Y_j$ representa um intervalo de tempo entre saltos consecutivos e cada $Z_n$ indica o instante do $n$-ésimo salto, que é o acumulado dos intervalos de salto.

O processo de renovação baseado nessas saltos é dado por
$$
X_t = \sum_{n\in \mathbb{N}} \chi_{\{Z_n \leq t\}} = \sup\{n; \; Z_n \leq t\},
$$
onde $\chi_{\{Z_n \leq t\}}$ é a função característica do conjunto $\{Z_n \leq t\}$.

```julia:renewal_uniform
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 10
M = 5
tt = range(0.0, div(N, 2), length = 200)
Y = rand(rng, N, M)
Z = accumulate(+, Y, dims = 1)
X = reduce(vcat, count(Z .< t, dims = 1) for t in tt)
plot(tt, X, ylims = (0, div(3N, 2)), xaxis = "tempo", yaxis = "nível", title = "Caminhos amostrais do processo de renovação com saltos Yj ∼ Unif(0,1)", titlefont = 10, label = false, linetype=:steppost)
savefig(joinpath(@OUTPUT, "renewal_uniform.svg"))
```
\fig{renewal_uniform}