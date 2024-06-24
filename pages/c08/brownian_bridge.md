@def title = "Ponte Browniana"

# {{ get_title }}

Uma outra equação clássica é a da **ponte Browniana** *(Brownian Bridge)*
$$
\mathrm{d}B_t = - \frac{B_t}{1-t}\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
com condição inicial
$$
B_0 = 0.
$$

## Resolução

Esta é uma equação linear e cuja solução pode ser obtida, também, via fator de integração, tendo a forma
$$
B_t = (1 - t)\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s, \quad 0 \leq t < 1.
$$

Isso pode ser verificado diretamente, já que a integral de Itô acima é explícita. De fato,
$$
\mathrm{d}B_t = - \int_0^t \frac{1}{1-s}\;\mathrm{d}W_s + (1 - t)\frac{\mathrm{d}W_t}{1 - t} = - \frac{1}{1-t}B_t + \;\mathrm{d}W_t.
$$

Para deduzir a solução via fator de integração, observe que uma primitiva de $p(t) = 1/(1-t)$ é $-\ln(1-t) = \ln((1-t)^{-1})$, de modo que o fator de integração é $I(t) = e^{\int^t 1/(1-s)\;\mathrm{d}s} = (1-t)^{-1}$. Dividindo, então, a equação por $1-t$, temos
$$
\frac{1}{1-t}\mathrm{d}B_t + \frac{B_t}{(1-t)^2}\;\mathrm{d}t = \frac{1}{1-t}\;\mathrm{d}W_t.
$$
O lado esquerdo é a derivada do termo $Y_t = B_t/(1-t)$, de modo que
$$
\mathrm{d}Y_t = \frac{1}{1-t}\;\mathrm{d}W_t.
$$
A solução é a primitiva do lado direito:
$$
Y_t = \int_0^t \frac{1}{1-s}\;\mathrm{d}W_s.
$$
Voltando para $B_t$, temos
$$
B_t = (1-t)Y_t = (1-t)\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s.
$$

## A ponte

O motivo do nome desse processo vem do fato de que
$$
\lim_{t \rightarrow 1} B_t = 0,
$$
quase certamente. Ou seja, o processo $\{B_t\}_{0 \leq t < 1}$ faz uma "ponte", saindo da origem e voltando à origem, com caminhos contínuos quase certamente. Para mostrar esse resultado, observe, primeiro, que
$$
\mathbb{E}[B_t] = (1-t)\mathbb{E}\left[\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s\right] = 0.
$$
Temos, também, pela isometria de Itô, que
$$
\begin{align*}
\mathrm{Var}(B_t) & = \mathbb{E}[B_t^2] \\
& = (1-t)^2\mathbb{E}\left[\left(\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s\right)^2\right] \\
& = (1 - t)^2\int_0^t \frac{1}{(1-s)^2}\;\mathrm{d}s \\
& = (1 - t)^2 \left.\left( \frac{1}{1-s} \right)\right|_{s = 0}^{t} \\
& = (1 - t)^2 \left(\frac{1}{(1 - t)} - 1 \right) \\
& = (1 - t) - (1 - t)^2 \\
& = t(1 - t).
\end{align*}
$$
Em particular,
$$
\lim_{t \rightarrow 0} \mathbb{E}\left[B_t^2\right] = 0, \qquad \lim_{t \rightarrow 1} \mathbb{E}\left[B_t^2\right] = 0.
$$
Portanto,
$$
\lim_{t \rightarrow 0} B_t = 0, \qquad \lim_{t \rightarrow 1} B_t = 0,
$$
em probabilidade. Como os caminhos amostrais são contínuos, obtemos a convergência quase certamente.

Observe, ainda, que a variância é simétrica em relação ao instante médio $t = 1/2$ e alcança o seu máximo exatamente nesse ponto.

```julia:brownian_bridge
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

M = 20
N = 200
t0 = 0.0
tf = 1.0
tt = range(t0, tf, length = N)
dt = Float64(tt.step)

Yt = Matrix{Float64}(undef, N, M)
Yt[1, :] .= 0

dWt = zeros(M)
for n in 2:N
    dWt .= √dt * randn(rng, M)
    Yt[n, :] .= (
        Yt[n-1, :]
        .- (Yt[n-1, :] ./ (1 - tt[n-1])) * dt
        .+ dWt
    )
end

plot(tt, Yt, xaxis = "tempo", yaxis = "posição", title = "Ponte browniana no intervalo [0, 1]", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.25, legend = :topleft)
plot!(tt, Yt[:, 1], color = 2, label = "um caminho amostral")
savefig(joinpath(@OUTPUT, "brownian_bridge.svg"))
```
\fig{brownian_bridge}

## Outras representações

Uma ponte browniana também tem outras representações, como 
$$
B_t = W_t - t W_1 =  (1-t)W_{t/(1-t)}.
$$
Por sua vez, um processo de Wiener também pode ser escrito em termos de pontes brownianas, como em 
$$
W_t = B_t + t N, \quad 0\leq t < 1,
$$
onde $N$ é uma variável aleatória normal e independente de $\{B_t\}_{t \geq 0}$, e
$$
W_t = (1 + t)B_{t/(1 + t)}, \quad t \geq 0.
$$
Mas deixamos isso a cargo do leitor mais interessado.

## Exercícios

1. Uma ponte browniana pode ser definida, mais geralmente, em um intervalo $[0, T)$, como solução da equação
$$
\mathrm{d}B_t = - \frac{B_t}{T-t}\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
com condição inicial $B_0 = 0$. Ache uma fórmula explíta para $B_t$ como uma integral de Itô e encontro a variância $\mathrm{V}(B_t)$, ao longo de $0 \leq t < T$.