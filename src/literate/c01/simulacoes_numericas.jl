# # Simulações numéricas

# Vamos ilustrar a resolução numérica via método de Euler descrito na seção anterior.

# O único pacote que precisaremos é o [`Plots.jl`](https://docs.juliaplots.org/stable/), para visualização das soluções.

using Plots

# ## Equações diferenciais ordinárias

# Consideramos o problema de crescimento populacional
# $$
# \begin{cases}
#   \displaystyle \frac{\mathrm{d}x}{\mathrm{d}t} = \mu x, \quad t > 0,\\
#   x(0) = x_0
# \end{cases}
# $$
#
# Com $\mu > 0$ fixo, a solução é $x(t) = x_0 e^{\mu t}$, para $t \geq 0$.
#
# Resolvendo-o pelo método de Euler, num intervalo $0 \leq t \leq T$, com $T > 0$ e um passo de tempo $\Delta t > 0$, obtemos a sequência de valores aproximados
# $$
# x_{n+1} = x_n + \mu \Delta t x_n, \quad n = 0, 1, \dots, T/\Delta t, 
# $$
# onde $\Delta t > 0$.
#

# Escolhemos valores para $T$, $\mu$ e $x_0$:
t0 = 0.0
T = 20.0
μ = 0.1
x₀ = 0.2
nothing

# Escolhemos, também, um valor para o passo de tempo, obtendo a malha temporal:
Δt = 0.2
t = t0:Δt:T

# Isso nos $N+1$ pontos na malha, onde
N = Int(round(T/Δt))

# Com isso, podemos pré-alocar a solução numérica em um vetor:

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

plot(t, x, title="Crescimento exponencial (x₀ = $x₀, μ = $μ, T = $T, Δt = $Δt)", titlefont = 10, xlabel = "t", ylabel="x", label="aproximação")

plot!(t, t -> x₀ * exp(μ * t), label="sol. exata")

# ## Parâmetros aleatórios

# Agora, vamos assumir uma incerteza em relação ao parâmetro, dada por uma distribuição normal, com média $\mu_0$ e desvio padrão $\sigma$: $\mu = \mathcal{N}(\mu_0, \sigma_0)$.

# Façamos uma amostragem de um certo número de valores e resolvamos a equação para cada valor sorteado.

n_a = 20
μ₀ = 0.1
σ₀ = 0.02
μ = μ₀ .+ σ₀ * randn(n_a)

histogram(μ, bins = 10)

Δt = 0.2
t = t0:Δt:T
N = Int(round(T/Δt))
x = Array{Float64}(undef, N+1, n_a)

x[1, :] .= x₀
for n in 2:N+1
    x[n, :] .= (1.0 .+ μ * Δt) .* x[n-1, :]
end

plot(t, x, alpha = 0.2, legend = nothing, color=1) 

#

μ = μ₀ .+ σ₀ * randn(N, n_a)

histogram(vec(μ), bins = 20)


x[1, :] .= x₀
for n in 2:N+1
    x[n, :] .= (1.0 .+ μ[n-1, :] * Δt) .* x[n-1, :]
end

plot(t, x, alpha = 0.2, legend = nothing, color=1)

plot!(t, x[:, 1], legend = nothing, color=2)