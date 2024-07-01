@def title = "O método de Monte-Carlo no estudo de variáveis aleatórias"

# {{ get_title }}

A distribuição de algumas variáveis aleatórias clássicas (normal, beta, exponencial, gama, chi, etc.) é bem conhecida, mas muitas variáveis aleatórias obtidas através de funções dessas variáveis aleatórias, ou de outros processos, são de mais difícil entendimento. Uma técnica útil nessa investigação é o método de Monte-Carlo. Ele consiste em considerar um número grande amostras, calcular o valor da variável nessas amostras e inferir a distribuição, ou alguma informação estatística, a partir dessa amostra. Dessa forma, podemos estimar o valor esperado, a variância e até mesmo a distribuição de probabilidades da variável aleatória em questão.

## Estimando o valor esperado

Considere, por exemplo, uma variável aleatória com distribuição uniforme, $X \sim \mathrm{Unif}(0, 1)$ e seja $Y = X^2.$ Nesse caso, podemos calcular o valor esperado de $Y$ diretamente:
$$
\mathbb{E}[Y] = \mathbb{E}[X^2] = \int_{-\infty}^\infty X^2 \;\mathrm{d}F(x) = \int_0^1 x^2 \;\mathrm{d}x = \left.\frac{x^3}{3}\right|_0^1 = \frac{1}{3}.
$$

Vamos agora ver como funciona o método de Monte-Carlo nesse caso. Calculamos um certo número $n$ de amostras $X(\omega_j),$ $j = 1, \ldots, n,$ da distribuição uniforme e tomamos o *valor esperado da amostra* $Y_j = Y(\omega_j) = X(\omega_j)^2$:

$$
\mathbb{E}[Y_j] = \mathbb{E}[X(\omega_j)^2] = \frac{1}{n}\sum_{j=1}^n X(\omega_j)^2.
$$

A estimativa melhora com um número maior de amostras, conforme ilustrado nas simulações a seguir.

```julia:esperancauniformsquare
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

ps = 1:5
esperancas = Vector{Float64}(undef, length(ps))

ns = 2 .^ (1:18)

esperancas = [sum(rand(n) .^ 2) / n for n in ns]

plot(ylims = (0.0, 1.0), xscale = :log10, xaxis = "número de amostras", yaxis = "valor esperado", title = "Estimativa do valor esperado via método de Monte-Carlo", titlefont = 10, legend = :topright)
scatter!(ns, esperancas, label = "valor esperado das amostras")
hline!([1/3], label = "valor esperado exato")
savefig(joinpath(@OUTPUT, "esperancauniformsquare.svg"))
```
\fig{esperancauniformsquare}

## O Teorema Central do Limite e a distribuição das médias amostrais

