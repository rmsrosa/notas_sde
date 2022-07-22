@def title = "O processo de Ornstein-Uhlenbeck e a equação de Langevin"

# {{ get_title }}

O modelo clássico (processo de Wiener) para o movimento Browniano de uma micro-partícula em um determinado meio é fundamentado na ação causada pelo bombardeamento aleatório das partículas do meio, mas não leva em consideração o momento da partícula. De fato, cada colisão acarreta diretamente em uma mudança de posição da micro-partícula, influenciando a taxa de variação de posição (i.e. velocidade), ao invés de acarretar em uma mudança na taxa de variação de momento (ou de aceleração). Uma alternativa a esse modelo é a **equação de Langevin**
$$
\frac{\mathrm{d}v_t}{\mathrm{d}t} = - \nu v_t + \sigma \xi_t
$$
onde $\nu > 0$, $\sigma > 0$, $v_t$ representa a velocidade da partícula no instante $t$ e $\xi_t$ é um *ruído branco*, modelado por $\mathrm{d}W_t/\mathrm{d}t$.

Essa é uma versão estocástica das equações de movimento de Newton. O primeiro termo do lado direito representa um termo viscoso, com uma resultante de forças proporcional à velocidade da partícula. O segundo termo do lado direito representa a ação causada pelo bombardeamento aleatório das partículas do meio. O termo viscoso representa um bombardeamento "médio" ordenado, condizente com a ideia de que a maior parte do bombardeamento ocorre à frente do objeto, conjugada com uma atração molecular das partículas que ficam para trás, puxando a partícula no sentido contrário ao do seu movimento. Em cima desse bombardeamento médio, gerando a viscosidade, temos as flutuações desordenadas dos bombardeamentos, representado pelo ruído branco.

Em termos da *posição* $x_t$ da partícula em cada instante $t$, o modelo de Langevin toma a forma
$$
\ddot x_t = - \nu \dot x_t + \sigma \eta_t.
$$

No entanto, a derivada de um processo de Wiener não está bem definida no sentido clássico, de modo que a equação de Langevin tem apenas um sentido heurístico. Um modelo rigoroso utilizado com esse mesmo sentido físico é o **processo de Ornstein-Uhlenbeck** $\{O_t\}_{t \geq 0}$, dado como solução da equação diferencial estocástica
$$
\mathbb{d}O_t = - \nu O_t\;\mathrm{d}t + \sigma \mathrm{d}W_t,
$$
onde $O_t$ é interpretado como sendo uma variável aleatória representando a velocidade da partícula no instante $t$.

## Resolução

A solução dessa equação é
$$
O_t = e^{-\nu t}O_0 + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s.
$$

De fato, observe que
$$
\begin{align*}
O_t & = O_0 + \left(e^{-\nu t} - 1\right)O_0 + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s \\
& = O_0 - \nu \int_0^t e^{-\nu s} O_0\;\mathrm{d}s + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s \\
& = O_0 - \nu \int_0^t \left( e^{-\nu s} O_0 + \sigma \int_0^s e^{-\nu(s - \tau)}\;\mathrm{d}W_\tau - \sigma \int_0^s e^{-\nu(s - \tau)}\;\mathrm{d}W_\tau\right)\;\mathrm{d}s + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s \\
& = O_0 - \nu \int_0^t O_s\;\mathrm{d}s + \nu \sigma \int_0^t \int_0^s e^{-\nu(s - \tau)}\;\mathrm{d}W_\tau\;\mathrm{d}s + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s \\
& = O_0 - \nu \int_0^t O_s\;\mathrm{d}s + \nu \sigma \int_0^t \int_0^s e^{-\nu(s - \tau)}\;\mathrm{d}W_\tau\;\mathrm{d}s + \sigma \int_0^t e^{-\nu(t - \tau)}\;\mathrm{d}W_\tau \\
& = O_0 - \nu \int_0^t O_s\;\mathrm{d}s + \nu \sigma \int_0^t \int_\tau^t e^{-\nu(s - \tau)}\;\mathrm{d}s\;\mathrm{d}W_\tau + \sigma \int_0^t e^{-\nu(t - \tau)}\;\mathrm{d}W_\tau \\
& = O_0 - \nu \int_0^t O_s\;\mathrm{d}s - \sigma \int_0^t \left(e^{-\nu(t - \tau)} - 1 \right)\;\mathrm{d}W_\tau + \sigma \int_0^t e^{-\nu(t - \tau)}\;\mathrm{d}W_\tau \\
& = O_0 - \nu \int_0^t O_s\;\mathrm{d}s + \sigma \int_0^t \;\mathrm{d}W_\tau. \\
\end{align*}
$$
Isso significa, exatamente, que $\{O_t\}_{t \geq 0}$, conforme definido acima, satisfaz a equação diferencial estocástica
$$
\mathrm{d}O_t = -\nu O_t\;\mathrm{d}t + \sigma\;\mathrm{d}W_t.
$$

De outra forma, escrevendo
$$
O_t = e^{-\nu t}O_0 + \sigma e^{-\nu t}\int_0^t e^{\nu s}\;\mathrm{d}W_t,
$$
e derivando informalmente os produtos, vemos que
$$
\begin{align*}
\mathrm{d}O_t & = -\nu e^{-\nu t}O_0 \;\mathrm{d}t - \sigma \nu e^{-\nu t}\;\mathrm{d}t \int_0^t e^{\nu s}\;\mathrm{d}W_t + \sigma \;\mathrm{d}W_t \\
& = -\nu O_t\;\mathrm{d}t + \sigma\;\mathrm{d}W_t.
\end{align*}
$$

## Posição e velocidade na forma de sistema

Interpretando um processo de Ornstein-Uhlenbeck como representando a evolução da velocidade de uma partícula, podemos obter a posição integrando esse processo. Nesse caso, é comum denotarmos o processo de Ornstein-Uhlenbeck, modelando a equação de Langevin, como $\{Y_t\}_{t \geq 0}$, de modo que a posição fica sendo dada por
$$
X_t = X_0 + \int_0^t Y_s \;\mathrm{d}s.
$$

Podemos, ainda escrever ambos os processos como solução do sistema de equações diferenciais estocásticas
$$
\begin{cases}
\mathrm{d}X_t = Y_t\;\mathrm{d}t, \\
\mathrm{d}Y_t = - \nu Y_t \;\mathrm{d}t + \sigma \;\mathrm{d}W_t,
\end{cases}
$$
com condições iniciais
$$
\left. X_t \right|_{t = 0} = X_0, \qquad \left. O_t \right|_{t = 0} = O_0.
$$

Essa é a versão rigorosa da equação de segunda ordem
$$
\ddot x_t = - \nu \dot x_t + \sigma \eta_t.
$$

```julia:ornstein_uhlenbeck
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

M = 100
N = 200
t0 = 0.0
tf = 10.0
tt = range(t0, tf, length = N)
dt = Float64(tt.step)

ν, σ = 1.5, 0.2
x0 = 0.1
y0 = 1.0

Wt = Matrix{Float64}(undef, N, M)
Wt[1, :] .= 0
for n in 2:N
    Wt[n, :] .= Wt[n-1, :] .+ √dt * randn(rng, M)
end

Xt = Matrix{Float64}(undef, N, M)
Yt = Matrix{Float64}(undef, N, M)
Xt[1, :] .= x0
Yt[1, :] .= y0

y = y0 .* exp.(-ν .* tt)
x = x0 .+ y0 .* (1 .- exp.(-ν .* tt)) ./ ν

dWt = zeros(M)
for n in 2:N
    dWt .= √dt * randn(rng, M)
    Yt[n, :] .= (
        Yt[n-1, :]
        .- ν * Yt[n-1, :] * dt
        .+ σ .* dWt
    )
    Xt[n, :] .= Xt[n-1, :] .+ Yt[n-1, :] * dt
end

plot(tt, Yt, xaxis = "tempo", yaxis = "posição", title = "Velocidade \$\\{Y_t\\}_t\$ de acordo com\nOrnstein-Uhlenbeck \$\\mathrm{d}Y_t = -\\nu Y_t \\;\\mathrm{d}t + \\sigma Y_t \\;\\mathrm{d}W_t\$,\ncom ν = $ν, σ = $σ, \$Y_0 = \$ $y0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topright)
plot!(tt, Yt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, y, color = 3, label = "valor esperado")
savefig(joinpath(@OUTPUT, "ornstein_uhlenbeck_vel.svg"))

plot(tt, Xt, xaxis = "tempo", yaxis = "posição", title = "Posição \$\\{X_t\\}_t\$ de acordo com o sistema\n\$\\mathrm{d}X_t = Y_t\\;\\mathrm{d}t\$ e \$\\mathrm{d}Y_t = -\\nu Y_t \\;\\mathrm{d}t + \\sigma Y_t \\;\\mathrm{d}W_t\$,\ncom ν = $ν, σ = $σ, \$X_0 = \$ $x0, \$Y_0 = \$ $y0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topleft)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, x, color = 3, label = "valor esperado")
savefig(joinpath(@OUTPUT, "ornstein_uhlenbeck_pos.svg"))
```
\fig{ornstein_uhlenbeck_vel}
\fig{ornstein_uhlenbeck_pos}

## Exercícios

1. Mostre que
$$
\mathbb{E}[Y_t] = \mathbb{E}[Y_0] e^{-\nu t}.
$$

2. Mostre que
$$
\mathbb{E}[X_t] = \mathbb{E}[X_0]  + \frac{1}{\nu}\mathbb{E}[Y_0] \left(1 - e^{-\nu t}\right).
$$

3. Para $Y_0 = y_0$ determinístico, calcule a variância $\mathrm{Var}(Y_t)$.

4. Para $X_0 = x_0$, $Y_0 = y_0$ determinísticos, calcule a variância $\mathrm{Var}(X_t)$.
