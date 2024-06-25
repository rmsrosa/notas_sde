@def title = "Ponte Browniana"

# {{ get_title }}

Uma outra equação clássica é a da **ponte Browniana** *(Brownian Bridge)*
$$
\mathrm{d}B_t = - \frac{B_t}{1-t}\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
no intervalo $[0, 1],$ com condição inicial
$$
B_0 = 0.
$$
Em forma integral, temos
$$
B_t = \int_0^t \frac{B_s}{1 - s}\;\mathrm{d}s + W_t, \quad 0 \leq t \leq 1.
$$

Observe que a equação diferencial estocástica, em si, não faz sentido em $t = 1,$ pois o denominador de um dos termos se anula, mas a forma integral faz, pelo menos no espaço de processos estocásticos de quadrado integrável, visto que, nesse caso,
$$
\mathbb{E}\left[ \int_0^t \frac{B_s}{1 - s}\;\mathrm{d}s\right] \leq \left(\int_0^T \mathbb{E}[B_s^2] \;\mathrm{d}s\right)^{1/2} \left(\int_0^T \frac{1}{(1-s)^2}\;\mathrm{d}s\right)^{1/2} < \infty.
$$

## Resolução

Esta é uma equação linear e cuja solução pode ser obtida, também, via fator de integração, tendo a forma
$$
B_t = (1 - t)\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s, \quad 0 \leq t \leq 1.
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

O motivo do nome desse processo vem do fato de que $B_0 = B_1 = 0,$ ou seja, é um processo que sai de zero e termina em zero, com um movimento estocástico no meio.  E, mais ainda, os caminhos são, quase certamente, contínuos em $[0, 1],$ com
$$
\lim_{t \rightarrow 1} B_t = 0,
$$
quase certamente. Ou seja, o processo $\{B_t\}_{0 \leq t < 1}$ faz uma "ponte", saindo da origem e voltando à origem, com caminhos contínuos quase certamente. Para mostrar o limite acima, observe, primeiro, que
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

Por fim, podemos calcular a covariância entre instantes $0 \leq s, t \leq 1.$ Nesse caso, temos
$$
\mathbb{E}[B_tB_s] = (1 - t)(1 - s)\mathbb{E}\left[ \int_0^t \int_0^s \frac{1}{(1-\xi)(1-\tau)}\;\mathrm{d}W_\xi \mathrm{d}W_\tau\right]
$$
Caso $0 \leq s \leq t \leq 1,$ dividimos a integral exterior de $0$ a $s$ e de $s$ a $t$. Como os incrementos no intervalo $[s, t]$ são independentes dos incrementos no intervalo $[0, s],$ temos
$$
\mathbb{E}\left[ \int_s^t \int_0^s \frac{1}{(1-\xi)(1-\tau)}\;\mathrm{d}W_\xi \mathrm{d}W_\tau \right],
$$
de modo que
$$
\mathbb{E}[B_tB_s] = (1 - t)(1 - s)\mathbb{E}\left[ \int_0^s \int_0^s \frac{1}{(1-\xi)(1-\tau)}\;\mathrm{d}W_\xi \mathrm{d}W_\tau \right] = (1 - t)(1 - s) \mathbb{E}\left[ \left(\int_0^s \frac{1}{(1-\tau)}\;\mathrm{d}W_\tau\right)^2\right].
$$
Usando a fórmula de Itô para dois processos, temos
$$
\mathbb{E}[B_tB_s] = (1 - t)(1 - s)\int_0^s \frac{1}{(1-\tau)^2}\;\mathrm{d}\tau = (1 - t)(1 - s)\left(\frac{1}{1 - \tau}\right)\bigg|_{\tau = 0}^{\tau = s} = (1 - t) - (1 - t)(1 - s) = (1 - t)s.
$$
Caso $0 \leq t \leq s \leq 1,$ obtemos, por simetria,
$$
\mathbb{E}[B_tB_s] = (1 - s)t
$$
De modo geral, como a ponte Browniana tem esperança nula, temos
$$
\operatorname{Cov}(B_t, B_s) = \mathbb{E}[B_tB_s] = \min\{s, t\} - st, \qquad 0 \leq s, t \leq 1.
$$

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
onde $N$ é uma variável aleatória normal e independente de $\{B_t\}_{t \geq 0}.$ Deixamos a verificação desses fatos como exercício.

Uma outra representação é
$$
W_t = (1 + t)B_{t/(1 + t)}, \quad t \geq 0.
$$

## Exercícios

1. Uma ponte Browniana, sendo um processo gaussiano, também pode ser definido através da sua covariância, ou seja, como sendo um processo Gaussiano $\{B_t\}_{0 \leq t \leq 1}$ com caminhos contínuous quase certamente;  satisfazendo $B_0 = B_1 = 0$ quase certamente; $\mathbb{E}[B_t] = 0,$ para todo $0 \leq t \leq 1;$ e $\operatorname{Cov}(B_t, B_s) = \min\{s, t\} - st,$ para $0 \leq s, t \leq 1.$ (i) Usando essa caracterização, mostre que, se $\{W_t\}_{t\geq 0}$ é um processo de Wiener, então $B_t = W_t - tW_1,$ $0\leq t \leq 1,$ é uma ponte Browniana. (ii) Por sua vez, mostre que se $\{B_t\}_{0\leq t \leq 1}$ é uma ponte Browniana segundo essa definição via caracterização da covariância e $N\sim \mathcal{N}(0, 1)$ é independente dessa ponte, então $W_t = B_t + tZ,$ $0\leq t \leq 1,$ é um processo de Wiener no intervalo $[0, 1].$ (iii) Por último, assumindo, novamente, que $\{B_t\}_{0\leq t \leq 1}$ é uma ponte Browniana segundo essa definição via caracterização da covariância, considere o processo $V_t = \int_0^t B_s / (1 - s) \;\mathrm{d}s$ e mostre que $W_t = B_t + V_t$ é um processo de Wiener, concluindo que $B_t$ satisfaz a equação diferencial estocástica $\mathrm{d}B_t = - B_t / (1 - t) \;\mathrm{d}t + \mathrm{d}W_t.$
2. Uma ponte browniana também pode ser considerada em um intervalo $[0, T]$, cuja equação toma a forma $$ \mathrm{d}B_t = - \frac{B_t}{T-t}\;\mathrm{d}t + \;\mathrm{d}W_t, $$ com condições inicial e final $B_0 = B_T = 0$. Ache uma fórmula explícita para $B_t$ como uma integral de Itô ao longo de $0 \leq t \leq T$ e encontre a variância e a covariância desse processo.
3. Seja $\{W_t\}_{t\geq 0}$ um processo de Wiener e considere o processo $\{B_t\}_{0\leq t \leq T}$ definido por $B_t = W_t - t W_T / T,$ para $0 \leq t \leq T.$ Mostre que $\{B_t\}_{0\leq t \leq T}$ é independente de $\{W_t\}_{t \geq T}.$
4. Mais geralmente, uma ponte Browniana pode ser definida ligando valores distintos e não necessariamente nulos, e.g. $B_{t_0} = a$ e $B_{t_1} = b,$ com $t_0 < t_1$ e $a, b\in\mathbb{R}$ arbitrários. Nesse caso, o processo $\tilde B_t = B_t - a(t_1 - t) / (t_1 - t_0) - b(t - t_0)/(t_1 - t_0)$ é uma ponte Browniana ligando $\tilde B_{t_0} = 0$ a $\tilde B_{t_1} = 1.$ Faça uma implementação numérica da ponte Browniana $\{B_t\}_{t_0 \leq t \leq t_1},$ exibindo uma variedade de caminhos aleatórios, junto com o valor esperado $\mathbb{E}[B_t]$ e o desvio padrão $\sigma(B_t),$ ao longo de $t_0 \leq t \leq t_1,$ escolhendo valores quaisquer não nulos e distintos $a$ e $b$ e instantes $t_0 < t_1.$

