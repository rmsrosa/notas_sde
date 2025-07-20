@def title = "Ponte Browniana"

# {{ get_title }}

Uma outra equação clássica é a da **ponte Browniana** *(Brownian Bridge),* que é definida pelo processo de Wiener restrito a um determinado intervalo e com valores condicionados nos extremos do intervalo. A ponte Browniana padrão é definida no intervalo $[0, 1]$ e condicionada a $W_t = 1,$ ou seja, é o processo
$$
    B_t = W_t |_{W_1 = 0}, \quad 0 \leq t \leq 1.
$$
É possível mostrar que esse processo satisfaz a equação diferencial estocástica (veja os exercícios)
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

Para deduzir a solução via fator de integração, observe que uma primitiva de $p(t) = 1/(1-t)$ é $-\ln(1-t) = \ln((1-t)^{-1}),$ de modo que o fator de integração é $I(t) = e^{\int^t 1/(1-s)\;\mathrm{d}s} = (1-t)^{-1}.$ Dividindo, então, a equação por $1-t,$ temos
$$
\frac{1}{1-t}\mathrm{d}B_t + \frac{B_t}{(1-t)^2}\;\mathrm{d}t = \frac{1}{1-t}\;\mathrm{d}W_t.
$$
O lado esquerdo é a derivada do termo $Y_t = B_t/(1-t),$ de modo que
$$
\mathrm{d}Y_t = \frac{1}{1-t}\;\mathrm{d}W_t.
$$
A solução é a primitiva do lado direito:
$$
Y_t = \int_0^t \frac{1}{1-s}\;\mathrm{d}W_s.
$$
Voltando para $B_t,$ temos
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
Caso $0 \leq s \leq t \leq 1,$ dividimos a integral exterior de $0$ a $s$ e de $s$ a $t.$ Como os incrementos no intervalo $[s, t]$ são independentes dos incrementos no intervalo $[0, s],$ temos
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

## Conexão com a definição via condicionamento nos extremos do intervalo

Vimos acima que a solução $\{B_t\}_t$ da equação diferencial estocástica acima é um processo Gaussiano caracterizado por ter média zero ao longo do intervalo e covariância dada por
$$
\operatorname{Cov}(B_t, B_s) = \mathbb{E}[B_tB_s] = \min\{s, t\} - st, \qquad 0 \leq s, t \leq 1.
$$

Para mostrar que essa é, de fato, a ponte Browniana definida por
$$
    B_t = W_t |_{W_1 = 0}, \quad 0 \leq t \leq 1,
$$
basta mostrar que esse último também é um processo Gaussiano com média zero e mesma covariância. Como o processo de Wiener é Gaussiano, então esse processo condicionado também o é. Para analisar a média e a covariância, vamos usar a PDF do vetor aleatório $(W_t, W_s, W_1).$

Na verdade, vamos apenas verificar que $\mathbb{E}[B_t] = 0$ e $\mathbb{E}[B_t^2] = t(1 - t).$ Deixamos a covariância como exercício. Para essas duas propriedades estatísticas, basta analisarmos o processo multivariado $V_t = (W_t, W_1).$ A média é zero,
$$
    \mathbb{E}[V_t] = (\mathbb{E}[W_t], \mathbb{E}[W_1]) = (0, 0).
$$
A matriz de covariância é dada por
$$
    \Sigma(t) = \begin{bmatrix} \mathbb{E}[W_t^2] & \mathbb{E}[W_tW_1] \\
    \mathbb{E}[W_tW_1] & \mathbb{E}[W_1^2] \end{bmatrix} = \begin{bmatrix} t & t \\ t & 1 \end{bmatrix},
$$
onde usamos que $0 \leq t \leq 1.$ Temos
$$
    \det(\Sigma(t)) = t(1 - t), \qquad \Sigma^{-1} = \frac{1}{t(1-t)}\begin{bmatrix} 1 & -t \\ -t & t \end{bmatrix}.
$$
Assim, a PDF $p(t, x, y)$ de $V_t=(W_t, W_1)$ é dada por 
$$
    p(t, x, y) = \frac{1}{2\pi \det(\Sigma)^{1/2}} e^{-\frac{1}{2}\begin{pmatrix} x,  y\end{pmatrix} \Sigma^{-1}\begin{pmatrix} x \\ y\end{pmatrix} } = \frac{1}{2\pi t^{1/2}(1 - t)^{1/2}} e^{-\frac{1}{2}\frac{1}{t(1-t)} (x^2 - 2txy + t^2y^2) }
$$
onde o espaço de eventos é descrito por $(x, y)\in \mathbb{R}^2.$ A marginal correspondendo ao condicionamento $W_1 = 0$ é
$$
    p(t, x, 0) = \frac{1}{2\pi t^{1/2}(1 - t)^{1/2}} e^{-\frac{1}{2}\frac{1}{t(1-t)} x^2 }.
$$
Com essa marginal, podemos calcular
$$
    \mathbb{E}[B_t] = \int_{-\infty}^\infty x p(t, x, 0) \;\mathrm{d}x = 0,
$$
pela simetria da marginal, e
$$
    \begin{align*}
        \mathbb{E}[B_t^2] & = \int_{-\infty}^\infty x^2 p(t, x, 0) \;\mathrm{d}x \\
        & = \frac{1}{2\pi t^{1/2}(1 - t)^{1/2}} \int_{-\infty}^\infty x^2 e^{-\frac{1}{2}\frac{1}{t(1-t)} x^2 } \;\mathrm{d}x \\
        & = \frac{t(1 - t)}{2\pi t^{1/2}(1 - t)^{1/2}} \int_{-\infty}^\infty e^{-\frac{1}{2}\frac{1}{t(1-t)} x^2 } \;\mathrm{d}x \\
        & = t(1 - t).
    \end{align*}
$$

Para a covariância entre instantes $s$ e $t,$ podemos considerar $V_{s,t} = (W_s, W_t, W_1).$ Por simetria, podemos assumir $0 \leq s \leq t \leq 1.$ Nesse caso, também temos $\mathbb{E}[V_{s, t}] = (0, 0, 0)$ e a covariância toma a forma
$$
    \Sigma(s, t) = \begin{bmatrix} s & s & s \\ s & t & t \\ s & t & 1 \end{bmatrix}.
$$
A inversa (e o determinante) pode ser calculado via escalonamento da matriz
$$
    \begin{align*}
        \left[ \begin{matrix} s & s & s \\ s & t & t \\ s & t & 1 \end{matrix} \;\middle\vert\; \begin{matrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{matrix} \right] & \mapsto  \left[ \begin{matrix} s & 0 & 0 \\ 0 & t-s & 0 \\ 0 & 0 & 1-t \end{matrix} \;\middle\vert\; \begin{matrix} \frac{t}{t-s} & -\frac{s}{t-s} & 0 \\ -1 & \frac{1-s}{1-t} & -\frac{t-s}{1-t} \\ 0 & -1 & 1 \end{matrix} \right] \\
        & \mapsto  \left[ \begin{matrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{matrix} \;\middle\vert\; \begin{matrix} \frac{t}{s(t-s)} & -\frac{1}{t-s} & 0 \\ -\frac{1}{t-s} & \frac{1-s}{(t-s)(1-t)} & -\frac{1}{1-t} \\ 0 & -\frac{1}{1-t} & \frac{1}{1-t} \end{matrix} \right].
    \end{align*}
$$
Portanto,
$$
    \det\Sigma(s, t) = s(t-s)(1-t), \qquad \Sigma^{-1} = \frac{1}{s(t-s)(1-t)}\begin{bmatrix} t(1-t) & s(1-t) & 0 \\ -s(1-t) & s(1-s) & -s(t-s) \\ 0 & -s(t-s) & s(t-s) \end{bmatrix}
$$

Assim, a PDF de $V_{s,t}=(W_s, W_t, W_1)$ é dada por 
$$
    p(x_s, x_t, x_1) = \frac{1}{2\pi \det(\Sigma)^{1/2}} e^{-\frac{1}{2}\begin{pmatrix} x_s, x_t,  x_1 \end{pmatrix} \Sigma^{-1}\begin{pmatrix} x_s \\ x_t \\ x\end{pmatrix} }.
$$
onde o espaço de eventos é descrito por $x = (x_s, x_t, x_1)\in \mathbb{R}^3.$ Não precisamos explicitar toda a PDF pois estamos interessados apenas na marginal correspondendo ao condicionamento $W_1 = 0,$ que é
$$
    p(x_s, x_t, 0) = \frac{1}{2\pi s^{1/2}(t-s)^{1/2}(1 - t)^{1/2}} e^{-\frac{1}{2}\frac{1}{s(t-s)(1-t)} \left( t(1-t)x_s^2 - 2s(1-t)x_tx_s + s(1-s)x_t^2\right) }.
$$

A covariância, ainda com $1 < s < t < 1,$ pode ser calculada, agora, via
$$
    \mathbb{E}[B_sB_t] = \int_{-\infty}^\infty \int_{-\infty}^\infty x_sx_t p(x_s, x_t, 0) \;\mathrm{d}x_t\;\mathrm{d}x_s.
$$
Deixamos como exercício a verificação de que $\mathbb{E}[B_sB_t] = s - st.$
Por simetria, para $1 < t < s < 1,$ obtemos $\mathbb{E}[B_sB_t] = t - st.$ Com isso, e juntando com os cálculos anteriores, obtemos, para $0 \leq t \leq s \leq 1,$
$$
    \mathbb{E}[B_sB_t] = \min\{s, t\} - st.
$$
Isso conclui a demonstração de que $B_t = W_t |_{W_1 = 0}$ é o mesmo processo que é solução da equação diferencial estocástica inicial.

## Exercícios

1. Uma ponte Browniana, sendo um processo gaussiano, também pode ser definido através da sua covariância, ou seja, como sendo um processo Gaussiano $\{B_t\}_{0 \leq t \leq 1}$ com caminhos contínuous quase certamente;  satisfazendo $B_0 = B_1 = 0$ quase certamente; $\mathbb{E}[B_t] = 0,$ para todo $0 \leq t \leq 1;$ e $\operatorname{Cov}(B_t, B_s) = \min\{s, t\} - st,$ para $0 \leq s, t \leq 1.$ (i) Usando essa caracterização, mostre que, se $\{W_t\}_{t\geq 0}$ é um processo de Wiener, então $B_t = W_t - tW_1,$ $0\leq t \leq 1,$ é uma ponte Browniana. (ii) Por sua vez, mostre que se $\{B_t\}_{0\leq t \leq 1}$ é uma ponte Browniana segundo essa definição via caracterização da covariância e $N\sim \mathcal{N}(0, 1)$ é independente dessa ponte, então $W_t = B_t + tZ,$ $0\leq t \leq 1,$ é um processo de Wiener no intervalo $[0, 1].$ (iii) Por último, assumindo, novamente, que $\{B_t\}_{0\leq t \leq 1}$ é uma ponte Browniana segundo essa definição via caracterização da covariância, considere o processo $V_t = \int_0^t B_s / (1 - s) \;\mathrm{d}s$ e mostre que $W_t = B_t + V_t$ é um processo de Wiener, concluindo que $B_t$ satisfaz a equação diferencial estocástica $\mathrm{d}B_t = - B_t / (1 - t) \;\mathrm{d}t + \mathrm{d}W_t.$
2. Uma ponte browniana também pode ser considerada em um intervalo $[0, T],$ cuja equação toma a forma $\mathrm{d}B_t = - \frac{B_t}{T-t}\;\mathrm{d}t + \;\mathrm{d}W_t,$ com condições inicial e final $B_0 = B_T = 0.$ Ache uma fórmula explícita para $B_t$ como uma integral de Itô ao longo de $0 \leq t \leq T$ e, usando essa fórmula, encontre a variância e a covariância desse processo.
3. Seja $\{W_t\}_{t\geq 0}$ um processo de Wiener e considere o processo $\{B_t\}_{0\leq t \leq T}$ definido por $B_t = W_t - t W_T / T,$ para $0 \leq t \leq T.$ Mostre que $\{B_t\}_{0\leq t \leq T}$ é independente de $\{W_t\}_{t \geq T}$ e calcule a variância e a covariância desse processo.
4. Considere, agora, a ponte Browniana no intervalo $[0, T]$ definida através de $B_t = W_t |_{W_T = 0},$ $0 \leq t \leq T.$ Usando a PDF $p(t, x, y)$ do processo $\{(W_t, W_T)\}_{0\leq t \leq T},$ calcule a variância $\mathrm{Var}(B_t)$ desse processo, conforme feito acima no caso $T=1.$
5. Mais geralmente, uma ponte Browniana pode ser definida ligando valores distintos e não necessariamente nulos, e.g. $B_{t_0} = a$ e $B_{t_1} = b,$ com $t_0 < t_1$ e $a, b\in\mathbb{R}$ arbitrários. Nesse caso, o processo $\tilde B_t = B_t - a(t_1 - t) / (t_1 - t_0) - b(t - t_0)/(t_1 - t_0)$ é uma ponte Browniana ligando $\tilde B_{t_0} = 0$ a $\tilde B_{t_1} = 0.$ Calcule a média $\mathbb{E}[B_t]$ e a variância $\mathrm{Var}(B_t)$ de $\{B_t\}_{t_0\leq t\leq t_1}$ e faça uma implementação numérica dessa ponte Browniana, exibindo uma variedade de caminhos aleatórios, junto com o valor esperado e o desvio padrão teóricos, ao longo de $t_0 \leq t \leq t_1,$ escolhendo valores quaisquer não nulos e distintos $a$ e $b$ e instantes $t_0 < t_1.$

