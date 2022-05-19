# # Simulações numéricas de modelos de crescimento natural

# Hora de implementarmos os métodos de Euler descritos na seção anterior.

# Vamos ver variações do modelo de crescimento natural. Primeiramente, vamos considerar o modelo clássico, de uma equação diferencial ordinária $\mathrm{d}x/\mathrm{d}t = \mu x$, com um parâmetro $\mu$ constante, representando a taxa de crescimento específico. Depois, vamos permitir que $\mu$ seja uma variável aleatória, representando uma incerteza no parâmetro. Em seguida, vamos considerar o caso em que $\mu = \{\mu_t\}_{t\geq 0}$ é um processo aleatório, representando uma variabilidade temporal aleatória no parâmetro. Por último, vamos considerar $\mu$ novamente constante mas com a equação perturbada por um termo estocástico, $\mathrm{d}x = \mu x \mathrm{d}t + \sigma \mathrm{d}W_t$.

# Usaremos apenas dois pacotes do Julia. Um é o [Plots.jl](https://docs.juliaplots.org/stable/), para visualização das soluções. O outro é o [Random](https://docs.julialang.org/en/v1/stdlib/Random/), da biblioteca padrão, apenas para fixar a reprodução das notas (gerar sempre os mesmos conjuntos de números aleatórios, por motivos didáticos e de controle de versão).

using Plots
theme(:ggplot2)
using Random
rng = Xoshiro(123)

# ## Modelo de equação diferencial ordinária

# Consideramos o problema de crescimento populacional
# $$
# \begin{cases}
#   \displaystyle \frac{\mathrm{d}x}{\mathrm{d}t} = \mu x, \quad t > 0,\\
#   x(0) = x_0.
# \end{cases}
# $$
#
# Para cada $\mu > 0$ fixo, temos a solução $x(t) = x_0 e^{\mu t}$, para $t \geq 0$.
#
# Resolvendo o problema de valor inicial pelo método de Euler, em um intervalo $t_0 \leq t \leq T$, com $t_0 = 0$, $T > 0$ e um passo de tempo $\Delta t > 0$, obtemos a sequência de valores aproximados
# $$
# x_{n+1} = x_n + \mu \Delta t x_n, \quad n = 0, 1, \dots, N,
# $$
# onde $N$ é um inteiro mais próximo de $T/\Delta t$.
#

# Escolhemos valores para $T$, $\mu$ e $x_0$, além de $t_0=0$:
t0 = 0.0
T = 20.0
μ = 0.1
x₀ = 0.2
nothing

# Escolhemos, também, um valor para o passo de tempo, obtendo a malha temporal:
Δt = 0.2
t = t0:Δt:T

# Isso nos dá $N+1$ pontos na malha, onde
N = Int(round(T/Δt))

# Podemos pré-alocar um vetor para a solução numérica:

x = Vector{Float64}(undef, N+1)
nothing

# Iniciando o vetor com o valor de $x_0$ e iterando de acordo com o método de Euler, obtemos a solução numérica aproximada:

x[1] = x₀
for n in 2:N+1
    x[n] = (1.0 + μ * Δt)x[n-1]
end

# De posse da solução podemos visualizar o crescimento exponencial e compará-lo com a solução exata

plot(t, x, title="Crescimento exponencial (x₀ = $x₀, μ = $μ, T = $T, Δt = $Δt)", titlefont = 10, xlabel = "t", ylabel="x", label="aproximação")

plot!(t, t -> x₀ * exp(μ * t), label="sol. exata")

# Refinando a malha, obtemos uma solução mais próxima, onde quase não vemos diferença:

Δt = 0.02
t = t0:Δt:T
N = Int(round(T/Δt))
x = Vector{Float64}(undef, N+1)

x[1] = x₀
for n in 2:N+1
    x[n] = (1.0 + μ * Δt)x[n-1]
end

plot(t, x, title="Crescimento exponencial (x₀ = $x₀, μ = $μ, T = $T, Δt = $Δt)", titlefont = 10, xlabel = "t", ylabel="x", label="aproximação", color=1)

# ## Modelo com parâmetros aleatórios

# Agora, vamos assumir uma incerteza em relação ao parâmetro, dada por uma distribuição normal, com média $\bar\mu$ e desvio padrão $\sigma$: $\mu = \mathcal{N}(\bar\mu, \sigma^2)$.

# Façamos uma amostragem de um certo número $M$ de valores.

M = 20
μ̄ = 0.1
σ = 0.02
μ = μ̄ .+ σ * randn(rng, M)

histogram(μ, bins = 10)

# Agora, vamos resolver a equação para cada valor sorteado.

Δt = 0.2
t = t0:Δt:T
N = Int(round(T/Δt))
x = Array{Float64}(undef, N+1, M)

x[1, :] .= x₀
for n in 2:N+1
    x[n, :] .= (1.0 .+ μ * Δt) .* x[n-1, :]
end

plot(t, x, alpha = 0.2, title="Conjunto de soluções (x₀ = $x₀, μ_t = N($μ̄, $σ), T = $T, Δt = $Δt)", titlefont = 10, xlabel = "t", ylabel="x", label=permutedims(["soluções"; fill(nothing, M-1)]), color=1) 
plot!(t, x[:, 1], label="uma realização", color=2)

# ## Modelo de equação diferencial aleatória

# Consideramos, agora, a equação aleatória
# $$
# \frac{\mathrm{d}X_t}{\mathrm{d}t} = \mu_t X_t,
# $$
# onde $\{\mu_t\}_t$ é um processo aleatório dado por $\mu_t = \bar\mu + \sigma \sin(W_t)$, onde $\bar\mu, \sigma > 0$ e $\{W_t\}_{t\geq 0}$ é tal que $W_0 = 0$, e $W_{t + \tau} - W_t \sim \mathcal{N}(0, \tau)$ independentes.

μ̄ = 0.1
σ = 0.1

for m in 1:M
    x[1, m] = x₀
    for n in 2:N+1
        μt = μ̄ + σ * randn(rng) * √Δt
        x[n, m] = (1.0 + μt * Δt) .* x[n-1, m]
    end
end

plot(t, x, alpha = 0.2, title="Soluções RODE (x₀ = $x₀, μ_t = $μ̄ + $σ W_t), T = $T, Δt = $Δt)", titlefont = 10, xlabel = "t", ylabel="x", label=permutedims(["soluções"; fill(nothing, M-1)]), color=1) 
plot!(t, x[:, 1], label="uma realização", color=2)

# ## Modelo de equação diferencial estocástica

# Finalmente, vamos considerar a equação estocástica
# $$
# \mathrm{d}X_t = \bar\mu X_t \mathrm{d}t + \sigma X_t \mathrm{d}W_t,
# $$
# onde $\{W_t\}_t$ é um processo aleatório. Mais especificamente, vamos assumir que $\{W_t\}_t$ é um **processo de Lévy**, tendo incrementos independentes e estacionários, com $\Delta W_t = W_{t + \Delta t} - W_t \sim \mathcal{N}(0, \Delta t)$.

μ̄ = 0.1
σ = 0.05

for m in 1:M
    x[1, m] = x₀
    for n in 2:N+1
        dw = randn(rng) * Δt^0.5
        x[n, m] = (1.0 + μ̄ * Δt) * x[n-1, m] + σ * x[n-1, m] * dw
    end
end

plot(t, x, alpha = 0.2, title="Soluções SDE (x₀ = $x₀, μ̄ = $μ̄, σ = $σ, dW_t = N(0, Δt), T = $T, Δt = $Δt)", titlefont = 9, xlabel = "t", ylabel="x", label=permutedims(["soluções"; fill(nothing, M-1)]), color=1) 
plot!(t, x[:, 1], label="uma realização", color=2)

# ## Exercícios
#
# 1. Resolva, via método de Euler, a equação diferencial 
# $$
# \frac{\mathrm{d}x}{\mathrm{d}t} = (\alpha - \beta x) x, \quad x(0) = x_0,
# $$
# com $\alpha, \beta > 0, 0 < x_0 < \alpha / \beta, t_0 = 0, T > 0, 0 < \Delta t \ll T $ de sua escolha. Trace o gráfico da solução.
#
# 2. Resolva, via método de Euler, a equação diferencial
# $$
# \mathrm{d}X_t/\mathrm{d}t = (\alpha - \beta X_t) X_t, \quad X_0 = \mathcal{N}(\bar{x}_0, \sigma_{x_0}^2),
# $$
# onde
# $$
# \alpha \sim \mathcal{N}(\bar\alpha, \sigma_\alpha^2), \beta \sim \mathcal{N}(\bar\beta, \sigma_\beta^2),
# $$
# com $\bar\alpha, \sigma_\alpha, \bar\beta, \sigma_\beta, \bar{x}_0, \sigma_{x_0} > 0, t_0 = 0, T > 0, 0 < \Delta t \ll T$ de sua escolha. Trace o gráfico de um conjunto de realizações dos parâmetros
#
# 3. Resolva, via método de Euler, a equação diferencial aleatória
# $$
# \mathrm{d}X_t/\mathrm{d}t = (A_t - b X_t) X_t, \quad X_0 = x_0,
# $$
# onde $A_t = a + \sigma\sin(W_t)$ e $W_{t + \tau} - W_t \sim \mathcal{N}(0, \tau)$, com $a, b, \sigma > 0$, $0 < x_0 < a / b$, $t_0 = 0$, $T > 0$ e $0 < \Delta t \ll T$ de sua escolha. Trace o gráfico de um conjunto de realizações dos parâmetros.
#
# 4. Resolva, via método de Euler, a equação diferencial estocástica
# $$
# \mathrm{d}X_t = (\alpha - \beta X_t) X_t \mathrm{d}t + \sigma X_t \mathrm{d}W_t, \quad X_0 = x_0,
# $$
# onde $W_{t + \tau} - W_t \sim \mathcal{N}(0, \tau)$, com $\alpha, \beta > 0$, $0 < x_0 < \alpha / \beta$, $\sigma > 0$, $t_0 = 0$, $T > 0$ e $0 < \Delta t \ll T$ de sua escolha. Trace o gráfico de um conjunto de realizações dos parâmetros.
