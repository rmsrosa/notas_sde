@def title = "Equação logística aleatória"

# {{ get_title }}

Vamos considerar, agora, a equação diferencial aleatória
$$
\frac{\mathrm{d}X_t}{\mathrm{d}t} = (A_t - B_t X_t)X_t
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$
Assumimos que $\{A_t\}_{t\geq 0}$ e $\{B_t\}_{t \geq 0}$ são processos limitados satisfazendo, quase certamente, as desigualdades
$$
a - \delta \leq A_t \leq a + \delta, \quad b - \varepsilon \leq B_t \leq b + \varepsilon.
$$

Por exemplo, podemos considerar
$$
A_t = a + \delta Y_t, \qquad B_t = b + \varepsilon Z_t,
$$
com
$$
a, b, \delta, \varepsilon > 0, \quad a - \delta > 0, \quad b - \varepsilon > 0,
$$
e onde
$$
Y_t = \frac{W_t}{1 + |W_t|}, \quad Z_t = \sin(W_t).
$$
Como ambos $\{Y_t\}_{t \geq 0}$ e $\{Z_t\}_{t \geq 0}$ estão concentrados no intervalo $[-1, 1]$, as condições acima são satisfeitas.

Em relação a $X_0$, assumimos que $X_0 \geq 0$ quase certamente. Por exemplo, podemos tomar a condição como sendo uma log-normal:
$$
X_0 = e^{c + d N},
$$
onde
$$
c \in \mathbb{R}, \quad d > 0, \quad N \sim \mathcal{N}(0, 1).
$$
Ou uma distribuição uniforme $X_0 \sim Unif(c, d)$, com $d > c > 0$.

## Existência

Sob essas condições, temos, para quase todo $\omega$, que
$$
X_0(\omega), A_t(\omega), B_t(\omega) > 0.
$$
Dessa forma, a solução $t \mapsto X_t(\omega)$ do problema de valor inicial da equação diferencial ordinária
$$
\begin{cases}
\displaystyle \frac{\mathrm{d}X_t(\omega)}{\mathrm{d}t} = (A_t(\omega) - B_t(\omega)X_t(\omega))X_t(\omega), \quad t \geq 0, \\
X_t(\omega)|_{t = 0} = X_0(\omega),
\end{cases}
$$
está definida para todo $t \geq 0$.

Assim, $\{X_t\}_{t \geq 0}$ nos dá um processo definido em toda a reta e que é solução da equação diferencial aleatória.

## Comportamento assintótico

Além disso, para cada $\omega$, temos
$$
A_t(\omega) - B_t(\omega)x \geq a - \delta - (b + \delta) x > 0,
$$
para
$$
0 < x < \frac{a - \delta}{b + \delta}.
$$
Ou seja,
$$
\lim_{t \rightarrow \infty} X_t(\omega) \geq \frac{a - \delta}{b + \delta}.
$$

Analogamente,
$$
A_t(\omega) - B_t(\omega)x \leq a + \delta - (b - \delta) x < 0,
$$
para
$$
x > \frac{a + \delta}{b - \delta}.
$$
Ou seja,
$$
\lim_{t \rightarrow \infty} X_t(\omega) \leq \frac{a + \delta}{b - \delta}.
$$

Portanto, para quase todo caminho amostral, temos
$$
\frac{a - \delta}{b + \delta} \leq \lim_{t \rightarrow \infty} X_t(\omega) \leq \frac{a + \delta}{b - \delta}.
$$

Abaixo, uma simulação de Monte Carlo exibindo diversos alguns caminhos amostrais (em azul) e com um deles em destaque (em vermelho).

```julia:logistic_rode
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

M = 150
N = 200
t0 = 0.0
tf = 10.0
tt = range(t0, tf, length = N)
dt = Float64(tt.step)
a, b, δ, ε = 4.0, 2.0, 0.1, 0.05
c, d = 0.1, 0.2

X0 = c .+ (d - c) * rand(M)
Xt = Matrix{Float64}(undef, N, M)
Xt[1, :] .= X0

Wt = zeros(M)
Yt = similar(Wt)
Zt = similar(Wt)
At = similar(Wt)
Bt = similar(Wt)
for n in 2:N
    Wt .+= √dt * randn(M)
    Yt .= Wt ./ (1 .+ abs.(Wt))
    Zt .= sin.(Wt)
    At .= a .+ δ * Yt
    Bt .= b .+ ε * Zt
    Xt[n, :] .= Xt[n-1, :] .* (1 .+ dt * (At .- Bt .* Xt[n-1, :])) 
end

plot(tt, Xt, xaxis = "tempo", yaxis = "população", title = "Evolução da equação logística aleatória \$X' = (A_t - B_t X_t)X_t\$,\ncom distribuição inicial uniforme \$X_0 \\sim \\mathrm{Unif}($c, $d)\$\ne parâmetros limitados \$A_t = $a + $δ W_t/(1 + W_t)\$, \$B_t = $b + $ε\\sin(W_t),\nonde \$W_t\$ é um processo de Wiener", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.2, legend = :bottomright)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
savefig(joinpath(@OUTPUT, "logistic_rode.svg"))
```
\fig{logistic_rode}
