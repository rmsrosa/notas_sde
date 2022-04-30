@def title = "Processos contínuos"

# {{ get_title }}

Vimos vários processos discretos que foram definidos por indução nos passos. Naturalmente, o mesmo não pode ser feito com tanta facilidade para processos contínuos. Vários processos contínuos aparecem naturalmente como soluções de equações aleatórios e de equações estocásticas. Mas podemos exemplificar com alguns processos definidos mais diretamente, como veremos a seguir.

## Processos decididos na partida

Uma classe de processos pode ser construída a partir de uma única variável aleatório. Por exemplo, seja $Y$ uma variável aleatória em $(\Omega, \mathcal{A}, \mathbb{P})$, com valores no espaço de estados $(\Sigma, \mathcal{E})$.

Como feito no caso discreto, podemos definir o **processo constante**
$$
X_t = Y, \quad \forall t\in I,
$$
onde $I\subset \mathbb{R}$ é um intervalo real qualquer. Uma vez sorteado $Y(\omega)$, temos o caminho amostral constante $X_t(\omega) = Y(\omega)$, $t\in I$.

Mais geralmente, dada uma função $f:I\times \Sigma \rightarrow \Sigma$, podemos definir o processo
$$
X_t = f(t, Y), \quad \forall t\in I.
$$
Uma vez sorteado $Y(\omega)$, temos o caminho amostral determinado por $X_t(\omega) = f(t, Y(\omega))$, $t\in I$. Nesse caso, a lei para cada $X_t$ é dada pelo transporte da lei de $Y$ por $f(t, \cdot)$.

Um caso interessante é dado por uma variável aleatória uniforme $U \sim \mathrm{Uniforme}([0, 2\pi))$, com distribuição uniforme em $[0, 2\pi)$, e com $f(t, x) = \cos(t + x)$, ou seja,
$$
X_t = \cos(t + U).
$$
Como o cosseno é periódico com período $2\pi$, os processos $X_t$ tem sempre a mesma distribuição:
$$
X_t \sim \cos(\mathrm{Uniforme}([0, 2\pi))).
$$
O processo $\{X_t\}_{t\in \mathbb{R}}$ assume valores em $\mathbb{R}$, mas apenas valores entre $-1 \leq x \leq 1$ são realizáveis. A lei de cada $X_t$ não é, obviamente, uniforme; há mais chances dos valores estarem próximos de $\pm 1$ do que de zero.

```julia:cosuniform
#hideall
using Random
using Plots
theme(:ggplot2)
t = 10.0
M = 1_000_000
rng = Xoshiro(123)
U = 2π * rand(rng, M)
X_t = cos.(t .+ U)

histogram(X_t, label = false, xaxis = "X_T", yaxis = "contagem", title = "Histograma de X_t = cos(t + U), U ∼ Uniforme([0, 2π))", titlefont = 10, bins = 100)

savefig(joinpath(@OUTPUT, "cosuniform.svg"))
```
\fig{cosuniform}

Um outro processo interessante é dado por
$$
X_t \sim \cos(Ut),
$$
onde, novamente, $U \sim \mathrm{Uniforme}([0, 2\pi))$. Caso caminho amostral é um simples cosseno, $t \mapsto X_t(\omega) = \cos(U(\omega)t)$. Porém, a estatística é não trivial. Veremos que esse é, surpreendentemente, um exemplo de um *ruído branco*.

```julia:ruidobranco_caminhossuaves
#hideall
using Random
using Plots
theme(:ggplot2)
t = 10.0
M = 1_000_000
rng = Xoshiro(123)
U = 2π * rand(rng, M)
X_t = cos.(t .* U)

histogram(X_t, label = false, xaxis = "X_T", yaxis = "contagem", title = "Histograma de X_t = cos(tU), U ∼ Uniforme([0, 2π))", titlefont = 10, bins = 100)

savefig(joinpath(@OUTPUT, "ruidobranco_caminhossuaves.svg"))
```
\fig{ruidobranco_caminhossuaves}

Também podemos construir processos contínuos a partir de mais de uma variável aleatória. Considere, por exemplo, duas variáveis aleatórias quaisquer, $Y_1$ e $Y_2$, em um mesmo espaço amostral e com valores em um espaço de estados comum. Considere $a\in \mathbb{R}$ e defina
$$
X_t = cos(at)Y_1 + \sin(at)Y_2, \quad t\in \mathbb{R}.
$$
No caso em que $Y_1$ e $Y_2$ têm distribuição normal, veremos que $\{X_t\}_{t\in \mathbb{R}}$ é um exemplo de *processo Gaussiano.*

```julia:gaussian_simple
#hideall
using Random
using Plots
theme(:ggplot2)
t = 4.0
M = 1_000_000
rng = Xoshiro(123)
U1 = 3.0 .+ 1.0 * randn(rng, M)
U2 = - 2.0 .+ 4.0 *randn(rng, M)
a = 20.0
X_t = cos(a * t) .* U1 + sin(a * t) .* U2

histogram(X_t, label = false, xaxis = "X_T", yaxis = "contagem", title = "Histograma de X_t = cos(at)U1 + sin(at)U2, U1, U2 ∼ Uniforme([0, 2π))", titlefont = 10, bins = 100)

savefig(joinpath(@OUTPUT, "gaussian_simple.svg"))
```
\fig{gaussian_simple}