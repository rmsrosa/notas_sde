@def title = "Transformações de variáveis aleatórias"

# {{ get_title }}

A partir de uma ou mais variáveis aleatórias, podemos obter novas variáveis aleatórias aplicando transformações no espaço de eventos.

## Transformação de uma variável aleatória

Por exemplo, se $X$ é uma variável aleatória com espaço de eventos $(\Sigma_1, \mathcal{E_1})$ e $f:(\Sigma_1, \mathcal{E_1}) \rightarrow (\Sigma_2, \mathcal{E_2})$ é uma função mensurável desse espaço em outro, então
$$
Y = f(X)
$$
denota uma variável aleatória com eventos em $\Sigma_2$. Dado um evento $E \in \mathcal{E}_2$, a probabilidade de $Y$ assumir valores em $E$ é dada por
$$
\mathbb{P}_Y(Y \in E) = \mathbb{P}_X(f(X) \in E) = \mathbb{P}_X(X \in f^{-1}(E)),
$$
onde
$$
f^{-1}(E) = \{x \in \Sigma_1; \;f(x)\in E\}.
$$

Um dos exemplos mais triviais possíveis é
$$
Y = aX + b
$$
No caso de $X$ ser uma distribuição uniforme, então $Y$ também será uniforme:
$$
X \sim \mathrm{Unif}(x_1, x_2) \quad \Longrightarrow \quad Y \sim \mathrm{Unif}(b + ax_1, b + ax_2).
$$
No caso de $X$ ser normal, então $Y$ também será normal:
$$
X \sim \mathcal{N}(\mu, \sigma^2) \quad \Longrightarrow \quad Y \sim \mathcal{N}(b + a\mu, a^2\sigma^2).
$$
Observe, por exemplo, que
$$
\mathbb{E}[Y] = \mathbb{E}[aX + b] = a\mathbb{E}[X] + b = a\mu + b
$$
e
$$
\mathbb{E}[(Y - \mathbb{E}[Y])^2] = \mathbb{E}[(aX + b - a\mu - b)^2] = a^2\mathbb{E}[(X-\mu)^2] = a^2\sigma^2.
$$

Mas isso não mostra que $Y$ é uma normal. Para ver isso, seja $F$ a função de probabilidade acumulada de $X$, i.e.
$$
F_X(x) = \mathbb{P}(X \leq x) = \frac{1}{\sqrt{2\pi \sigma^2}}\int_{-\infty}^x e^{- \frac{(\xi - \mu)^2}{2\sigma^2}}\;\mathrm{d}\xi.
$$
Então a função de probabilidade acumulada de $Y$ é
$$
F_Y(y) = \mathbb{P}(Y \leq y) = \mathbb{P}(aX + b \leq y) = \mathbb{P}\left(X \leq \frac{y - b}{a}\right) = F_X\left(\frac{y - b}{a}\right) = \frac{1}{\sqrt{2\pi \sigma^2}}\int_{-\infty}^{\frac{y - b}{a}} e^{- \frac{(\xi - \mu)^2}{2\sigma^2}}\;\mathrm{d}\xi.
$$
Fazendo $\eta = b + a\xi$, de modo que $(\eta - b)/a = \xi$ e $\mathrm{d}\xi = \mathrm{d}\eta / a$, temos
$$
F_Y(y) = \frac{1}{\sqrt{2\pi a^2\sigma^2}}\int_{-\infty}^y e^{- \frac{(\eta - b - a\mu)^2}{2a^2\sigma^2}}\;\mathrm{d}\eta.
$$
Isso prova que $Y \sim \mathbb{N}(b + a\mu, a^2\sigma^2)$.

## Transformação de várias variáveis aleatórias

Também podemos fazer isso para várias variáveis aleatórias, digamos $X_1, \ldots, X_n$, em espaços de probabilidades $(\Omega_j, \mathcal{A}_j, \mathbb{P}_{X_1})$, com valores em $(\Sigma_j, \mathcal{E}_j)$, através de uma função mensurável
$$
f: \Sigma_1 \times \cdots \times \Sigma_2 \rightarrow \Sigma,
$$
em um espaço de eventos $(\Sigma, \mathcal{E})$. O caso mais comum é quando todos os espaços de amostras são idênticos e quando todos os espaços de eventos também são idênticos, mas isso não é necessário.

Com isso, podemos definir uma variável aleatória
$$
Y = f(X_1, \ldots, X_n).
$$
Nesse caso, dado um evento $E\in \mathcal{E}$, temos
$$
\mathbb{P}_Y(Y \in E) = \mathbb{P}((X_1, \dots, X_n) \in f^{-1}(E)),
$$
onde $\mathbb{P}$ se refere à probabilidade conjunta $\mathbb{P} = \mathbb{P}_1 \times \cdots \times \mathbb{P}_n$, na $\sigma$-algebra $\mathcal{A} = \mathcal{A}_1 \times \cdots \mathcal{A}_n$ gerada no espaço produto $\Omega = \Omega_1 \times \cdots \times \Omega_n$.

De fato, este pode ser visto como um caso particular do primeiro, considerando-se a variável aleatória vetorial $X = (X_1, \ldots, X_n)$ em $(\Omega, \mathcal{A}, \mathbb{P})$, com $f:\Sigma_1 \times \cdots \times \Sigma_n \rightarrow \Sigma$.

## Combinação linear de distribuições normais independentes

Como exemplo, sejam $X_1$ e $X_2$ duas distribuições normais independentes, digamos $X_1, X_2 \sim \mathcal{N}(0, 1)$. Definimos
$$
X = a_1 X_1 + a_2 X_2,
$$
onde $a_1, a_2 \in \mathbb{R}$. Dados $\omega = (\omega_1, \omega_2)$ no espaço amostral $\Omega_1 \times \Omega_2$, temos uma realização
$$
X(\omega) = a_1 X_1(\omega_1) + a_2 X(\omega_2).
$$

Podemos mostrar que $X$ também é uma normal, com
$$
X \sim \mathcal{N}(0, a_1^2 + a_2^2).
$$
Mais geralmente, 
$$
X_1 \sim \mathcal{N}(\mu_1, \sigma_1^2), \; X_2 \sim \mathcal{N}(\mu_2, \sigma_2^2) \quad \Longrightarrow \quad a_1 X_1 + a_2 X_2 \sim \mathcal{N}(a_1\mu_1 + a_2\mu_2, a_1^2\sigma_1^2 + a_2^2\sigma_2^2).
$$
Naturalmente, isso pode ser generalizado para uma combinação linear de um número arbitrário de normais.

Há várias demonstrações desse fato, através de cálculo explícito da função acumulada de probabilidade ou da função característica, por exemplo. Mas a mais simples e elegante usa argumentos de simetria da normal, mais precisamente de argumentos de simetria por rotação da função densidade de probabilidades conjuntas de normais independentes com mesma variância. Mesmo que elas não tenham a mesma variância, podemos reescaloná-las. Vamos seguir, aqui, a demonstração como feita em Eisenberg & Sullivan (2008). Veja esse mesmo artigo para comentários sobre outras demonstrações.

Se $X_1 \sim \mathcal{N}(\mu_1, \sigma_1^2)$ e $X_2 \sim \mathcal{N}(\mu_2, \sigma_2^2)$, então podemos escrever $X_1 = \mu_1 + \sigma_1 Y_1$ e $X_2 = \mu_2 + \sigma_2 Y_2$, com $Y_1, Y_2 \sim \mathcal{N}(0, 1)$. Assim,
$$
X = a_1\mu_1 + a_2\mu_2 + a_1\sigma_1 Y_1 + a_2\sigma_2 Y_2.
$$
Nesse caso, $X$ é apenas uma translação de uma combinação de normais com média zero e variância um:
$$
X - a_1\mu_1 + a_2\mu_2 = a_1\sigma_1 Y_1 + a_2\sigma_2 Y_2
$$
Então basta mostrar que
$$
b_1 Y_1 + b_2 Y_2 \sim \mathcal{N}(0, b_1^2 + b_2^2),
$$
com $b_1 = a_1\sigma_1$ e $b_2 = a_2\sigma_2$. Para provar isso, trabalhamos com a função acumulada de probabilidade (conjunta)
$$
F(x) = \mathbb{P}(b_1 Y_1 + b_2 Y_2 \leq x).
$$
Como a função densidade de probabilidades da distribuição conjunta é simétrica em relação a rotações em torno da origem e como a reta $b_1 Y_1 + b_2 Y_2 = x$ está a uma distância
$$
d = \frac{x}{\sqrt{b_1^2 + b_2^2}}
$$
da origem, então podemos fazer uma rotação do semiplano $b_1 Y_1 + b_2 Y_2 \leq x$ para o semiplano $Y_1 \leq d$.

```julia:combinacao_linear_normais_rotacao
#hideall
using Plots
theme(:ggplot2)

b1 = 2.4
b2 = 1.0
c = 2.0

t = range(0.0, 2π, length = 100)
x = c / sqrt(b1^2 + b2^2) .* cos.(t)
y = c / sqrt(b1^2 + b2^2) .* sin.(t)

p1 = plot(xlims = (-3, 3), ylims = (-3, 3), title = "b₁ Y₁ + b₂ Y₂ ≤ c; b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
hline!(p1, [0], color = :gray70, linewidth = 1, label = false)
vline!(p1, [0], color = :gray70, linewidth = 1, label = false)
plot!(p1, -3:3, x -> (c - b1 * x) / b2, label = false, color = 1)
scatter!(p1, (0, 0), label = false, color = 2)
plot!(p1, x, y, label = false, color = 3)

p2 = plot(xlims = (-3, 3), ylims = (-3, 3), title = "x ≤ c / √(b₁² + b₂²); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
hline!(p2, [0], color = :gray70, linewidth = 1, label = false)
vline!(p2, [0], color = :gray70, linewidth = 1, label = false)
vline!(p2, [c / sqrt(b1^2 + b2^2)], color = 1, label = false)
scatter!(p2, (0, 0), label = false, color = 2)
plot!(p2, x, y, label = false, color = 3)
plot(p1, p2, layout = 2, size = (800, 400))

savefig(joinpath(@OUTPUT, "combinacao_linear_normais_rotacao.svg"))
```
\fig{combinacao_linear_normais_rotacao}

Fazendo isso, teremos a mesma probabilidade:
$$
F(x) = \mathbb{P}(b_1 Y_1 + b_2 Y_2 \leq x) = \mathbb{P}(Y_1 \leq d) = F_{Y_1}\left(\frac{x}{\sqrt{b_1^2 + b_2^2}}\right) = F_{(b_1^2 + b_2^2)Y_1}(x).
$$
Ou seja, $F$ é igual à função de densidade de probabilidades da normal $\mathcal{N}(0, b_1^2 + b_2^2)$, concidindo, portanto, com essa normal.

```julia:combinacao_linear_normais
#hideall
using Plots
theme(:ggplot2)

xx = range(-3, 3, length = 100)
yy = range(-3, 3, length = 100)

b1 = 2.4
b2 = 1.0
c = 2.0

f(x, y) = exp(-(x^2 + y^2)/2) / sqrt(2π)

wireframe(xx, yy, (x, y) -> (b1 * x + b2 * y ≤ c) * f(x, y), zlims=(0, 1), display_option=Plots.GR.OPTION_SHADED_MESH, color = :reds, title = "ℙ(b₁ Y₁ + b₂ Y₂ ≤ c); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
savefig(joinpath(@OUTPUT, "combinacao_linear_normais1.svg"))

wireframe(xx, yy, (x, y) -> (x ≤ c / sqrt(b1^2 + b2^2)) * f(x, y), zlims=(0, 1), display_option=Plots.GR.OPTION_SHADED_MESH, color = :reds, title = "ℙ( Y₁  ≤ c / √(b₁² + b₂²)); b₁ = $b1, b₂ = $b2, c = $c", titlefont = 10)
savefig(joinpath(@OUTPUT, "combinacao_linear_normais2.svg"))
```
\fig{combinacao_linear_normais1}
\fig{combinacao_linear_normais2}

Um caso particular que será explorado na demonstração de existência de um processo de Wiener é a independência da soma e da diferença de normais independentes e identicamente distribuídas com média zero.

Sejam $X, Y \sim \mathcal{N}(0, \sigma^2)$ independentes. Defina
$$
Z = X + Y, \qquad W = X - Y.
$$

Primeiramente, como combinações lineares de normais, temos, pelo que acabamos de ver, que $Z$ e $W$ também são normais. Como $X$ e $Y$ têm média zero e variância $\sigma^2$, então $Z$ e $W$ também têm média zero e variância $a^2\sigma_1^2 + b^2\sigma_2^2 = 2\sigma^2$, onde $\sigma_1 = \sigma_2 = \sigma$, $a = 1$ e $b = \pm 1$. Assim,
$$
Z, W \sim \mathcal{N}(0, 2\sigma^2).
$$

Agora, para ver a independência entre $Z$ e $W$, ...

## Exercícios

1. Seja $Y$ uma variável aleatória real e defina $X = \sin(Y)$. Suponha que $\mathbb{E}[Y] = 0$. Mostre que $\mathbb{E}[X] = 0$ e $\mathrm{Var}(X) \leq \mathrm{Var}(Y)$.
