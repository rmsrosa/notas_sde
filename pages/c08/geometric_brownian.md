@def title = "Movimento Browniano geométrico e o preço de ações"

# {{ get_title }}

Um modelo clássico para o preço $P_t$ de uma ação é o de que a mudança relativa (ou específica) de preço $\mathrm{d}P_t / P_t$ satisfaz
$$
\frac{\mathrm{d}P_t}{P_t} = \mu\;\mathrm{d}t + \sigma\;\mathrm{d}W_t,
$$
onde $\mu > 0$ é o *drift* (tendência?) e $\sigma,$ a *volatilidade* da ação. Desse modo,
$$
\mathrm{d}P_t = \mu P_t \;\mathrm{d}t + \sigma P_t\;\mathrm{d}W_t,
$$
com condição inicial sendo o preço atual da ação:
$$
\left.P_t\right|_{t = 0} = p_0.
$$

Essa equação é linear e a sua solução é
$$
P_t = p_0 e^{\left(\mu - \frac{1}{2} \sigma^2\right)t + \sigma W_t}.
$$

## Crescimento populacional estocástico

O modelo clássico de crescimento populacional natural tem a forma
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = \mu x,
$$
onde $\mu > 0$ é a taxa de crescimento específico da espécie, que também depende das condições do meio. Mais geralmente, considerando perturbações aleatórias nessas condições, podemos substituir $\mu$ por um processo estocástico $\mu_t.$ Mais especificamente, podemos considerar que $\mu_t$ flutua em torno de um valor base $\mu,$ com perturbações aleatórias dadas por um ruído branco com uma determinada amplitude $\sigma,$ i.e.
$$
\mu_t = \mu + \sigma_0\xi_t,
$$
Interpretando $\xi_t$ como a "derivada" de um processo de Wiener , podemos escrever
$$
\mu_t \;\mathrm{d}t = \mu \;\mathrm{d}t + \sigma_0 \;\mathrm{d}W_t.
$$
Assim, chegamos à equação diferencial estocástica
$$
\mathrm{d}X_t = \mu X_t \;\mathrm{d}t + \sigma X_t \;\mathrm{d}W_t,
$$
que tem a mesma forma da equação acima para o preço de uma ação.

## Resolução

A solução segue da fórmula geral obtida na seção anterior, com $f_0 = 0,$ $f_1 = \mu,$ $g_0 = 0$ e $g_1 = \sigma.$ Podemos, também, chegar nessa solução através de um fator de integração, visto que a equação é linear. Escrevemos
$$
\mathrm{d}X_t - \mu X_t \;\mathrm{d}t = \sigma X_t\;\mathrm{d}W_t.
$$
Analogamente ao caso determinístico (pense em $x' - \mu x = g(t)$), podemos considerar o fator de integração $e^{-\mu t}.$ Observe que, derivando o produto $Y_t = X_t e^{-\mu t}$ pela fórmula de Itô, temos
$$
\begin{align*}
\mathrm{d}X_t & = \mathrm{d}(X_t e^{-\mu t}) \\
& = -\mu X_t e^{-\mu t}\;\mathrm{d}t + e^{-\mu t}\;\mathrm{d}X_t \\
& = -\mu X_t e^{-\mu t}\;\mathrm{d}t + e^{-\mu t}(\mu X_t \;\mathrm{d}t + \sigma X_t\;\mathrm{d}W_t) \\
& = \sigma e^{-\mu t} X_t \;\mathrm{d}W_t \\
& = \sigma Y_t \;\mathrm{d}W_t.
\end{align*}
$$
Vimos, anteriormente, que a solução da equação
$$
\mathrm{d}Y_t = \sigma Y_t \;\mathrm{d}W_t
$$
é
$$
Y_t = Y_0 e^{-\frac{1}{2}\sigma^2 t + \sigma W_t},
$$
sendo que $Y_0 = X_0$ nesse caso. Assim,
$$
X_t = e^{\mu t}Y_t = X_0 e^{\mu t} e^{-\frac{1}{2}\sigma^2 t + \sigma W_t} = X_0 e^{\left(\mu - \frac{1}{2} \sigma^2\right)t + \sigma W_t}.
$$

## Valor esperado

Vamos, agora, calcular o valor esperado de $P_t.$ Para isso, escrevemos a equação integral associada à equação diferencial estocástica:
$$
X_t = X_0 + \mu \int_0^t X_s \;\mathrm{d}s + \sigma \int_0^t X_s\;\mathrm{d}W_s.
$$
Tomando o valor esperado, obtemos
$$
\mathbb{E}\left[X_t\right] = \mathbb{E}[X_0] + \int_0^t \mathbb{E}[X_s]\;\mathrm{d}s.
$$
A solução dessa equação integral é a função exponencial:
$$
\mathbb{E}\left[X_t\right] = \mathbb{E}[X_0]e^{\mu t},
$$
que é, também, a solução da equação diferencial ordinária obtida eliminando-se o ruído da equação estocástica ($\sigma = 0$).

## Variância

Observe que $X_t^2$ é, também, um movimento Browniano geométrico. De fato, segue dá fórmula de solução que
$$
X_t^2 = X_0^2 e^{\left(2\mu - \sigma^2\right)t + 2\sigma W_t} = X_0^2 e^{\left(2\mu + \sigma^2 - 2\sigma^2\right)t + 2\sigma W_t} = X_0^2 e^{\left(2\mu + \sigma^2 - \frac{1}{2}(2\sigma)^2\right)t + 2\sigma W_t} = X_0^2 e^{\left(\tilde \mu - \frac{1}{2}{\tilde \sigma}^2\right)t + \tilde\sigma W_t},
$$
o que nos dá um movimento Browniano com condição inicial $X_0^2$ e parâmetros
$$
\tilde \mu = 2\mu + \sigma^2, \qquad \tilde\sigma = 2\sigma.
$$
De outra maneira, usando a fórmula de Itô aplicada a $X_t \mapsto X_t^2,$
$$
\mathrm{d}X_t^2 = 2X_t\;\mathrm{d}X_t + \sigma^2 X_t^2\;\mathrm{d}t = 2X_t (\mu X_t\;\mathrm{d}t + \sigma X_t\;\mathrm{d}W_t) + \sigma^2 X_t^2\;\mathrm{d}t,
$$
de maneira que
$$
\mathrm{d}X_t^2 = (2\mu + \sigma^2)X_t^2\;\mathrm{d}t + 2\sigma X_t^2\;\mathrm{d}W_t.
$$
Isso nos dá que $Y_t = X_t^2$ é solução da equação do movimento Browniano geométrico
$$
\mathrm{d}Y_t = \tilde \mu Y_t\;\mathrm{d}t + \tilde\sigma Y_t\;\mathrm{d}W_t.
$$

Assim, do valor esperado de um movimento Browniano geométrico com condição inicial $X_0^2$ e parâmetros $\tilde\mu$ and $\tilde\sigma,$ obtemos
$$
\mathbb{E}[X_t^2] = \mathbb{E}[X_0^2] e^{(2\mu + \sigma^2)t}, \quad t \geq 0.
$$

Portanto, a variância é dada por
$$
\operatorname{Var}(X_t) = \mathbb{E}[X_t^2] - \mathbb{E}[X_t]^2 = \mathbb{E}[X_0^2] e^{(2\mu + \sigma^2)t} - \mathbb{E}[X_0]^2 e^{2\mu t}
$$
que também pode ser escrita de outras formas,
$$
\operatorname{Var}(X_t) = \mathbb{E}[X_0^2]e^{2\mu t}(e^{\sigma^2 t} - 1) + \operatorname{Var}(X_0)e^{2\mu t} = \mathbb{E}[X_0]^2e^{2\mu t}(e^{\sigma^2 t} - 1) + \operatorname{Var}(X_0)e^{(2\mu + \sigma^2)t}.
$$

Caso $X_0 = x_0$ seja fixo, temos $\operatorname{Var}(X_0) = 0$ e $\mathbb{E}[X_0^2] = \mathbb{E}[X_0]^2 = x_0^2,$ de modo que
$$
\operatorname{Var}(X_t) = x_0^2 e^{2\mu t}(e^{\sigma^2 t} - 1).
$$

```julia:geometric_brownian
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

M = 100
N = 200
t0 = 0.0
tf = 5.0
tt = range(t0, tf, length = N)
dt = Float64(tt.step)

μ, σ = 0.5, 0.2
x0 = 0.1

Wt = Matrix{Float64}(undef, N, M)
Wt[1, :] .= 0
for n in 2:N
    Wt[n, :] .= Wt[n-1, :] .+ √dt * randn(rng, M)
end

Xt = x0 * exp.((μ - σ^2/2) * tt .+ σ * Wt)
Yt = Matrix{Float64}(undef, N, M)
Yt[1, :] .= x0

x = x0 .* exp.(μ .* tt)
std = abs(x0) .* exp.(μ .* tt) .* sqrt.( exp.( σ^2 .* tt ) .- 1 )

dWt = zeros(M)
for n in 2:N
    dWt .= √dt * randn(rng, M)
    Yt[n, :] .= Yt[n-1, :] .* (
        1 
        .+ μ * dt
        .+ σ .* dWt
    )
end

plot(tt, Xt, xaxis = "tempo", yaxis = "posição", title = "Movimento browniano geométrico \$\\mathrm{d}X_t = \\mu X_t \\;\\mathrm{d}t + \\sigma X_t \\;\\mathrm{d}W_t\$,\ncom μ = $μ, σ = $σ, \$X_0 = \$ $x0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topleft)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, x, color = 3, label = "valor esperado")
plot!(tt, x .+ std, color = 4, label = "valor esperado ± desvio padrão")
plot!(tt, x .- std, color = 4, label = false)
savefig(joinpath(@OUTPUT, "geometric_brownian.svg"))
```
\fig{geometric_brownian}
