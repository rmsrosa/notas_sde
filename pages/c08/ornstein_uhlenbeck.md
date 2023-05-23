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

De fato, somando e subtraindo $1$ nos dois termos e renomeando a variável de integração, temos
$$
O_t = O_0 + \left(e^{-\nu t} - 1\right)O_0 + \sigma \int_0^t \left(e^{-\nu(t - \tau)} - 1\right)\;\mathrm{d}W_\tau + \sigma\int_0^t \;\mathrm{d}W_s.
$$
Usando o Teorema Fundamental do Cálculo, escrevemos
$$
O_t = O_0 - \nu\left(\int_0^t e^{-\nu s}\;\mathrm{d}s\right)O_0 - \nu \sigma \int_0^t \left(\int_{\tau}^t e^{-\nu(s - \tau)}\;\mathrm{d}s\right)\;\mathrm{d}W_\tau + \sigma\int_0^t \;\mathrm{d}W_s.
$$
Trocando a ordem de integração do terceiro termo e reescrevendo o segundo termo, obtemos
$$
O_t = O_0 - \nu\int_0^t e^{-\nu s}O_0\;\mathrm{d}s - \nu \sigma \int_0^t \int_0^s e^{-\nu(s - \tau)}\;\mathrm{d}W_\tau\;\mathrm{d}s + \sigma\int_0^t \;\mathrm{d}W_s
$$
Juntando o segundo e o terceiro termos, chegamos a
$$
O_t = O_0 - \nu\int_0^t \left(e^{-\nu s}O_0 + \sigma \int_0^s e^{-\nu(s - \tau)}\;\mathrm{d}W_\tau\right)\;\mathrm{d}s + \sigma\int_0^t \;\mathrm{d}W_s.
$$
O integrando do segundo termo é precisamente $O_s$, de modo que
$$
O_t = O_0 - \int_0^t \nu O_s\;\mathrm{d}s + \int_0^t \sigma\;\mathrm{d}W_s.
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

## Propriedades estatísticas

Da fórmula
$$
O_t = e^{-\nu t}O_0 + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s,
$$
como a esperança da integral de Itô é nula, deduzimos que
$$
\mathbb{E}[O_t] = e^{-\nu t}\mathbb{E}[O_0].
$$
Calculando o quadrado, temos
$$
O_t^2 = e^{-2\nu t}O_0^2 + 2\sigma e^{-\nu t}O_0\int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s + \sigma^2\left( \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_s\right).
$$
Usando que $O_0$ é independente do processo de Wiener, o termo misto também se anula. Assim, usando a isometria de Itô no último termo, obtemos
$$
\mathbb{E}[O_t^2] = e^{-2\nu t}\mathbb{E}[O_0^2] + \sigma^2 \int_0^t e^{-2\nu(t - s)}\;\mathrm{d}s = e^{-2\nu t}\mathbb{E}[O_0^2] + \frac{\sigma^2}{2\nu}\left(1 - e^{-2\nu t}\right).
$$
Com isso,
$$
\mathrm{Var}(O_t) = \mathbb{E}[O_t^2] - \mathbb{E}[O_t]^2 = e^{-2\nu t}\left(\mathbb{E}[O_0^2]-\mathbb{E}[O_0]^2\right) + \frac{\sigma^2}{2\nu}\left(1 - e^{-2\nu t}\right),
$$
de modo que
$$
\mathrm{Var}(O_t) = e^{-2\nu t}\mathrm{Var}(O_0) + \frac{\sigma^2}{2\nu}\left(1 - e^{-2\nu t}\right).
$$

Observe que
$$
\mathbb{E}[O_t] \rightarrow 0, \quad \mathrm{Var}(O_t) \rightarrow \frac{\sigma^2}{2\nu}, \qquad \textrm{quando } t \rightarrow \infty.
$$

Além disso, para $0 \leq t_1 < t_2$,
$$
O_{t_1}O_{t_2} = e^{-\nu (t_1 + t_2)}O_0^2 + \sigma e^{-\nu t_1}O_0\int_0^{t_2} e^{-\nu (t_2 - s)}\;\mathrm{d}W_s + \sigma e^{-\nu t_2}O_0\int_0^{t_1} e^{-\nu (t_1 - s)}\;\mathrm{d}W_s \\
+ \sigma^2 \left(\int_0^{t_1} e^{-\nu(t_1 - s)}\;\mathrm{d}W_s\right)\left(\int_0^{t_2} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s\right)
$$
Novamente, a esperança dos termos mistos se anula, nos dando
$$
\mathbb{E}[O_{t_1} O_{t_2}] = e^{-\nu (t_1+t_2)}\mathbb{E}[O_0^2] + \sigma^2\mathbb{E}[\left(\int_0^{t_1} e^{-\nu(t_1 - s)}\;\mathrm{d}W_s\right)\left(\int_0^{t_2} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s\right)].
$$
Como $t_2 > t_1$, separamos a segundo integral em duas partes,
$$
\int_0^{t_2} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s = \int_0^{t_1} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s + \int_{t_1}^{t_2} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s.
$$
Pela propriedade dos processos de Wiener, a segundo termo é independente da outra integral, ou seja,
$$
\mathbb{E}\left[ \left(\int_0^{t_1} e^{-\nu(t_1 - s)}\;\mathrm{d}W_s\right)\left(\int_{t_1}^{t_2} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s\right)\right] = \mathbb{E}\left[ \left(\int_0^{t_1} e^{-\nu(t_1 - s)}\;\mathrm{d}W_s\right)\right]\mathbb{E}\left[\left(\int_{t_1}^{t_2} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s\right)\right] = 0.
$$
Sobram, então,
$$
\mathbb{E}[O_{t_1} O_{t_2}] = e^{-\nu (t_1+t_2)}\mathbb{E}[O_0^2] + \sigma^2\mathbb{E}[\left(\int_0^{t_1} e^{-\nu(t_1 - s)}\;\mathrm{d}W_s\right)\left(\int_0^{t_1} e^{-\nu(t_2 - s)}\;\mathrm{d}W_s\right)].
$$
A isometria de Itô na versão de dois integrandos diferentes nos dá
$$
\mathbb{E}[O_{t_1} O_{t_2}] = e^{-\nu (t_1+t_2)}\mathbb{E}[O_0^2] + \sigma^2\int_0^{t_1} e^{-\nu(t_1 - s)} e^{-\nu(t_2 - s)}\;\mathrm{d}s = e^{-\nu (t_1 + t_2)} \mathbb{E}[O_0^2] + \sigma^2e^{-\nu (t_1 + t_2)}\int_0^{t_1} e^{2\nu s} \;\mathrm{d}s \\
  = e^{-\nu (t_1 + t_2)}\mathbb{E}[O_0^2] + \frac{\sigma^2}{2\nu}e^{-\nu (t_1 + t_2)}\left(e^{2\nu t_1} - 1\right)  = e^{-\nu (t_1 + t_2)}\mathbb{E}[O_0^2] + \frac{\sigma^2}{2\nu}\left( e^{-\nu (t_2 - t_1)} - e^{-\nu (t_1 + t_2)}\right).
$$
Para $t_1, t_2 \geq 0$ arbitrários, isso nos dá, por simetria,
$$
\mathrm{Cov}(O_{t_1}, O_{t_2}) = e^{-\nu (t_1 + t_2)}\mathrm{Var}(O_0) + \frac{\sigma^2}{2\nu}\left( e^{-\nu |t_2 - t_1|} - e^{-\nu (t_1 + t_2)}\right).
$$
Para $t_1 = t$ e $t_2 = t + \tau$,
$$
\mathrm{Cov}(O_{t}, O_{t+\tau}) = e^{-\nu (2t + \tau)}\mathrm{Var}(O_0) + \frac{\sigma^2}{2\nu}e^{-\nu \tau}\left( 1 - e^{-2\nu t}\right).
$$
Assintoticamente em $t\rightarrow \infty,$ temos
$$
\mathrm{Cov}(O_{t}, O_{t+\tau}) \sim \frac{\sigma^2}{2\nu}e^{-\nu \tau},
$$
ou seja, para $\tau \gg 1/\nu$, os processos estão essencialmente descorrelacionados. O parâmetro $1/\nu$ funciona como uma escala de tempo para o correlacionamento.

Veremos, abaixo, como isso pode ser usado para se obter uma aproximação de um ruído branco.

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

## Propriedade de reversão à média

O processo de Orstein-Uhlenbeck $\{O_t\}_{t \geq 0}$, conforme definido acima, tem a propriedade $\mathbb{E}[O_t] = \mathbb{E}[O_0] e^{-\nu t} \rightarrow 0$, quando $t \rightarrow \infty$ (veja os Exercícios). Nesse caso, podemos dizer que a média assintótica é nula e que o processo "reverte", assintoticamente, a essa média nula. Mais geralmente, podemos adicionar um termo extra $\nu\mu\;\mathrm{d}t$ de *drift* aditivo, nos levando à equação
$$
\mathbb{d}\hat O_t = - \nu (\hat O_t - \mu)\;\mathrm{d}t + \sigma \mathrm{d}W_t.
$$

Escrevendo $O_t = \hat O_t - \mu$, vemos que $\{O_t\}_{t \geq 0}$ é um processo de  Orstein-Uhlenbeck sem o termo extra:
$$
\mathbb{d} O_t = -\nu O_t \;\mathrm{d}t + \sigma \mathrm{d}W_t.
$$

Como $\mathbb{E}[O_t] \rightarrow 0$, quando $t \rightarrow 0$, então $\mathbb{E}[\hat O_t] = \mathbb{E}[O_t] + \mu \rightarrow \mu$, ou seja, a esperança de $\{\hat O_t\}_{t \geq 0}$ converge para a média $\mu$. Assim, o processo de Orstein-Uhlenbeck é um exemplo de *mean-reverting process,* ou "processo que reverte à média".

## Ornstein-Uhlenbeck como aproximação de ruído branco

O "ruído branco", como modelado pela "derivada" de um processo de Wiener, em um sentido apropriado de distribuições, é um processo comumente encontrado em diversos modelos. Em várias situações, no entanto, o ruído é "colorido", com algum decaimento característico do espectro de amplitudes.

Aqui, exploramos o processo de Ornstein-Uhlenbeck (OU) como aproximação de um ruído branco. Isso é obtido controlando-se uma *escala temporal* $\tau$. Mais precisamente, consideramos um processo $\{O_t\}_t$ satisfazendo a equação diferencial estocástica

$$
    \tau \mathrm{d}O_t = - \mathrm{d}t + \zeta \mathrm{d}W_t,
$$
onde $\{W_t\}_t$. Isso nos dá um processo de Ornstein-Uhlenbeck com termo de deriva $\nu = 1/\tau$ e difusão $\sigma = \zeta/\tau.$ Esse processo tem média e covariância dadas por
$$
\mathbb{E}[O_t] = 
\mathbb{E}[O_0] e^{-t/\tau}, \quad
\mathrm{Cov}(O_{t}, O_{t+s}) = e^{-(2t + s)/\tau}\mathrm{Var}(O_0) + \frac{\zeta^2}{2\tau}e^{- s/\tau}\left( 1 - e^{-2\nu t}\right)
$$
Assintoticamente em $t\rightarrow \infty,$ temos
$$
\mathbb{E}[O_t] \rightarrow 0  \quad
\mathrm{Cov}(O_{t}, O_{t+s}) \rightarrow \frac{\zeta^2}{2\tau}e^{- s/\tau}.
$$

Pensando como uma família de processo $O_t = O_t^{\tau, \zeta},$ temos, no limite
$$
\tau \rightarrow 0, \quad \textrm{com} \quad \frac{\zeta^2}{2\tau} \rightarrow 1,
$$
que esses processos se aproximam de um ruído branco. Isso é equivalente a
$$
\nu \rightarrow \infty, \quad \frac{\sigma^2}{2\nu} \rightarrow 1,
$$
em termos dos parâmetros usuais de deriva e de difusão do processo de Ornstein-Uhlenbeck.

## Cor do processo de Ornstein-Uhlenbeck

Considerando a correlação (assintótica)
$$
\mathrm{Cov}(O_{t}, O_{t+s}) \rightarrow f(s) = \frac{\sigma^2}{2\nu}e^{-\nu |s|},
$$
vemos que
$$
\hat f(\omega) = \frac{1}{2\pi}\int_{-\infty}^\infty f(s) e^{-i\omega s} \;\mathrm{d}s = \frac{\sigma^2}{2\nu}\frac{1}{2\pi}\int_{-\infty}^\infty e^{-\nu |s|} e^{-i\omega s} \;\mathrm{d}s = \frac{\sigma^2}{2\nu}\frac{1}{2\pi}\left( \frac{1}{\nu - i\omega} - \frac{1}{\nu + i\omega}\right) = \frac{\sigma^2}{2\nu}\frac{1}{\pi}\frac{\nu}{\nu^2 + \omega^2}.
$$
Portanto, 
$$
\hat f(\omega) \sim \frac{1}{\omega^2}, \quad \omega \rightarrow \pm \infty.
$$

## Exercícios

Nos exercícios abaixo, considere o sistema
$$
\begin{cases}
\mathrm{d}X_t = Y_t\;\mathrm{d}t, \\
\mathrm{d}Y_t = - \nu Y_t \;\mathrm{d}t + \sigma \;\mathrm{d}W_t,
\end{cases}
$$

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
