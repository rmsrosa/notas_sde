@def title = "Processos em tempos contínuos"

# {{ get_title }}

Vimos vários processos discretos que foram definidos por indução nos passos. Naturalmente, o mesmo não pode ser feito com tanta facilidade para processos contínuos. Vários processos contínuos aparecem naturalmente como soluções de equações aleatórios e de equações estocásticas. Mas podemos exemplificar com alguns processos definidos mais diretamente, como veremos a seguir.

Vamos começar vendo alguns exemplos em que o processo pode ser construído explicitamente a partir de uma ou duas variáveis aleatórias. Em seguida veremos o exemplo de processo de renovação, construído a partir de uma quantidade enumerável de variáveis aleatórias.

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
rng = Xoshiro(123)
theme(:ggplot2)
N = 40
M = 20
nn = 1:N
X = Array{Float64}(undef, N, M)
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

Um caso interessante é dado por uma variável aleatória com distribuição uniforme em $[0, 2\pi)$, $U \sim \mathrm{Unif}([0, 2\pi))$, e com $f(t, x) = \sin(t + x)$, ou seja,
$$
X_t = \sin(t + U).
$$

```julia:processo_sintplusU
#hideall
using Plots
using Random
rng = Xoshiro(123)
theme(:ggplot2)

N = 50
M = 10
tt = range(0.0, 10.0, length = N+1)
X = permutedims(sin.(tt' .+ 2π * rand(rng, M)))

plot(tt, X, title = "Caminhos amostrais do processo X_t = sin(t + U), U ∼ Unif(0,2π)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_sintplusU.svg"))
```
\fig{processo_sintplusU}

Como o seno é periódico com período $2\pi$, os processos $X_t$ tem sempre a mesma distribuição:
$$
X_t \sim \sin(\mathrm{Unif}([0, 2\pi))).
$$

```julia:cosuniform
#hideall
using Random
using Plots
rng = Xoshiro(123)
theme(:ggplot2)

t = 10.0
M = 100_000
U = 2π * rand(rng, M)
X_t = cos.(t .+ U)

nbins = 100

histogram(X_t, label = "histograma", xaxis = "X_T", yaxis = "contagem", title = "Histograma e PDF normalizada de X_t = cos(t + U), U ∼ Unif([0, 2π))\ncom $M realizações", titlefont = 8, bins = nbins, legend = :top)

avg_per_bin = 2 * M / nbins

plot!(-0.99:0.01:0.99, x -> avg_per_bin / sqrt(1 - x^2) / π, label = "PDF = (2/π)1/√(1-x^2)")

savefig(joinpath(@OUTPUT, "cosuniform.svg"))
```
\fig{cosuniform}

O processo $\{X_t\}_{t\in \mathbb{R}}$ assume valores em $\mathbb{R}$, mas apenas valores entre $-1 \leq x \leq 1$ são realizáveis. A lei de cada $X_t$ não é uniforme; há mais chances dos valores estarem próximos de $\pm 1$ do que de zero. De fato, $X_t$ segue uma distribuição arcoseno:
$$
X_t \sim \mathrm{Arcsin}(-1, 1).
$$
Para ver isso, observe que $\sin(t + u) = \sin( (t + u) \mod 2\pi)$ e que a distribuição de $t + \mathrm{Unif}([0, 2\pi)) \mod 2\pi$ é a própria distribuição $\mathrm{Unif}([0, 2\pi))$. Assim,
$$
F_{X_t}(x) = \mathbb{P}(X_t \leq x) = \mathbb{P}(\sin(t + U) \leq x) = \mathbb{P}(\sin(U) \leq x).
$$
Como $\sin(U)$ só assume valores entre $-1$ e $1$, temos $F_{X_t}(x) = 0$, para $x < -1$ e $F_{X_t}(x) = 1$, para $x > 1$. Agora, para $-1 \leq x \leq 1,$ podemos usar a periodicidade e a simetria do seno para escrever essas probabilidades em função da distribuição uniforme em $[-\pi, \pi)$ e, em seguida, em $[-\pi/2, \pi/2)$:
$$
F_{X_t}(x) = 2\mathbb{P}(U \leq \arcsin(x), 0 \leq U \leq \pi) = 2\mathbb{P}_{\mathrm{Unif}([-\pi, \pi))}(U \leq \arcsin(x), -\pi/2 \leq U \leq \pi/2) = \mathbb{P}_{\mathrm{Unif}([-\pi/2, \pi/2))}(U \leq \arcsin(x)). 
$$

A figura abaixo ilustra essas identidades, com a caixa em laranja exibindo a distribuição uniforme considerada e as partes preenchidas ilustrando a região abaixo de um determinado valor $x$, indicando a probabilidade correspondente.

```julia:processo_sintUcdf
#hideall
using Plots
theme(:ggplot2)

x = 0.7
tt = range(-2π, 6π, length = 200)

p1 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x",title = "ℙ_U(sin(t + U) ≤ $x), para U ∼ Unif(0, 2π)", titlefont = 8)
tt1 = 2.5π:0.01:4.5π
plot!(p1, tt1, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2, fill=true, label=false)
plot!(p1, tt1 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ 2π, color = 2, label = false)
plot!(p1, tt1, u -> 1/2π * (sin(u) ≤ x), color = 2, fill=true, label=false)

p2 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x",title = "ℙ_U(sin(U) ≤ $x), para U ∼ Unif(0, 2π)", titlefont = 8)
tt2 = 0.0:0.01:2π
plot!(p2, tt2, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2,fill=true, label=false)
plot!(p2, tt2 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ 2π, color = 2, label = false)
plot!(p2, tt2, u -> 1/2π * (sin(u) ≤ x), color = 2, fill=true, label=false)

p3 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x", title = "ℙ_U'(sin(U') ≤ $x), para U' ∼ Unif(-π, π)", titlefont = 8)
tt3 = -π:0.01:π
plot!(p3, tt3, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2,fill=true, label=false)
plot!(p3, tt3 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ 2π, color = 2, label = false)
plot!(p3, tt3, u -> 1/2π * (sin(u) ≤ x), color = 2, fill=true, label=false)

p4 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x",title = "ℙ_U''(sin(U'') ≤ $x), para U'' ∼ Unif(-π/2, π/2)", titlefont = 8)
tt4 = -π/2:0.01:π/2
plot!(p4, tt4, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2,fill=true, label=false)
plot!(p4, tt4 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ π , color = 2, label = false)
plot!(p4, tt4, u -> 1/π * (sin(u) ≤ x), color = 2, fill=true, label=false)

plot(p1, p2, p3, p4, layout = (2, 2), size = (900, 500))
savefig(joinpath(@OUTPUT, "processo_sintUcdf.svg"))
```
\fig{processo_sintUcdf}

Agora, podemos calcular explicitamente
$$
F_{X_t}(x) = \mathbb{P}_{\mathrm{Unif}([-\pi/2, \pi/2))}(U \leq \arcsin(x)) = \frac{1}{\pi} \int_{-\pi/2}^{\arcsin(x)} \;\mathrm{d}s = \frac{1}{2} + \frac{1}{\pi}\arcsin(x).
$$
Essa distribuição possui a função de densidade de probabilidade
$$
\frac{\mathrm{d}}{\mathrm{d} x}F_{X_t}(x) = \frac{1}{\pi}\frac{1}{\sqrt{1 - x^2}}, \quad -1 < x < 1.
$$

### Transporte sin(Ut)

Um outro exemplo importante é dado por
$$
X_t = \sin(Ut),
$$
onde, novamente, $U \sim \mathrm{Unif}([0, 2\pi))$. Cada caminho amostral é um simples cosseno, $t \mapsto X_t(\omega) = \sin(U(\omega)t)$.

A lei continua sendo dada pela distribuição arcoseno, em cada tempo, de modo que esse processo não é independente mas ainda é um processo identicamente distribuído. O mais significativo, no entanto, é que, como a frequência de cada seno é dada aleatoriamente, o conjunto de trajetórias dispersa, a ponto das estatísticas conjuntas serem não triviais. Veremos que esse é, surpreendentemente, um exemplo de um *ruído branco*.

```julia:processo_sinttimesU
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 200
M = 5
tt = range(0.0, π, length = N+1)
X = permutedims(sin.(tt' .* 2π .* rand(rng, M)))
plot(tt, X, title = "Caminhos amostrais do processo X_t = sin(Ut), U ∼ Unif(0,2π)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_sinttimesU.svg"))
```
\fig{processo_sinttimesU}

## Gaussiana senoidal

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
using Plots
theme(:ggplot2)

mu1 = 3.0
sigma1 = 1.0
mu2 = -2.0
sigma2 = 2.0

a = 2.0
T = 4π / a
N = 100
tt = range(0.0, T, length = N)

x = mu1 * cos.(a * tt) .+ mu2 * sin.(a * t)
sigma = sqrt.(sigma1^2 .* cos.(a * tt) .^2 .+ sigma2^2 .* sin.(a * tt) .^2)

plot(tt, x, ribbon = sigma, line = 2, linecolor = :red, xaxis = "t", yaxis = "x", label = false, title = "Evolução da média e do desvio-padrão de X_t = cos(at)Y_1 + sin(at)Y_2\na = $a e Y1 ∼ N($mu1, $(sigma1^2)), Y2 ∼ N($mu2, $(sigma2^2))", titlefont = 10)

savefig(joinpath(@OUTPUT, "gaussian_dance.svg"))
```
\fig{gaussian_dance}

## Processo de renovação

Os processos de renovação são processos contínuos com estados discretos e são dados a partir de uma sequência de variáveis aleatórias discretas representando intervalos de tempo para "saltos" de estado. Mais precisamente, sejam $\{S_j\}_{j\in \mathbb{N}}$ variáveis aleatórias positivas, independentes e identicamente distribuídas e com esperança finita, $\mathbb{E}(S_j) < \infty$. Para cada $n$, definimos os instantes de salto
$$
T_n = \sum_{j = 1}^n S_j.
$$
Cada $S_j$ representa um intervalo de tempo entre saltos consecutivos e cada $T_n$ indica o instante do $n$-ésimo salto, que é o acumulado dos intervalos de salto.

O processo de renovação baseado nessas saltos é dado por
$$
X_t = \sum_{n\in \mathbb{N}} \chi_{\{T_n \leq t\}} = \sup\{n; \; T_n \leq t\},
$$
onde $\chi_{\{T_n \leq t\}}$ é a função característica do conjunto $\{T_n \leq t\}$.

```julia:renewal_uniform
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 20
M = 5
tt = range(0.0, div(N, 2), length = 200)
S = 0.5 .+ rand(rng, N, M)
T = accumulate(+, S, dims = 1)
X = reduce(vcat, count(T .< t, dims = 1) for t in tt)
plot(tt, X, ylims = (0, div(3N, 4)), xaxis = "tempo", yaxis = "nível", title = "Caminhos amostrais do processo de renovação com saltos Sj ∼ Unif(0.5,1)", titlefont = 10, label = false, linetype=:steppost)
savefig(joinpath(@OUTPUT, "renewal_uniform.svg"))
```
\fig{renewal_uniform}

Processos de renovação são usados para modelar sequências sucessivas de falhas de equipamentos (e.g. máquinas, velas, cabos, lâmpadas, etc.). Por exemplo, imagine um motor que precise de um cabo para movimentar uma polia. Sempre que um cabo arrebenta, a produção é interrompida, até que a troca seja feita. A vida útil de cada cabo é uma variável aleatória e as sucessivas quebras são assumidas independentes. Cada intervalo de tempo $Y_j$ representa a vida útil de um cabo. Cada $Z_n$ representa o momento da $n$-ésima quebra. A variável $X_t$ modela o número de quebras, ou trocas de cabo, até o instante $t$.

## Processo de renovação e recompensa

Junto com um processo de renovação $\{X_t\}_{t \geq 0}$ como acima, obtido a partir de variáveis aleatórias positivas independentes $\{Y_j\}_{j\in \mathbb{N}}$, podemos ter, a cada evento $Z_n = \sum_{j=1}^n Y_j$, uma "recompensa" $\{W_n\}_{n\in \mathbb{N}}$, que é uma variável aleatória real (ganhos e perdas). O total de recompensa após um tempo $t$ é dado por (lembrando que $X_t$ assume valores inteiros não negativos)
$$
Y_t = \sum_{i = 1}^{X_t} W_i.
$$
