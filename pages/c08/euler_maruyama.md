@def title = "Método de Euler-Maruyama"

# {{ get_title }}

```julia:geometric_brownian
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

M = 100
N = 200
t0 = 0.0
tf = 2.0
tt = range(t0, tf, length = N)
dt = Float64(tt.step)

μ, σ = 2.0, 0.5
x0 = 0.03

Xt = Matrix{Float64}(undef, N, M)
Xt[1, :] .= x0

x = x0 .* exp.((μ - σ^2/2) * tt)

dWt = zeros(M)
for n in 2:N
    dWt .= √dt * randn(rng, M)
    Xt[n, :] .= Xt[n-1, :] .* (
        1 
        .+ μ * dt
        .+ σ * dWt
    )
end

plot(tt, Xt, xaxis = "tempo", yaxis = "posição", title = "Movimento browniano geométrico \$\\mathrm{d}X_t = \\mu X_t \\;\\mathrm{d}t + \\sigma X_t \\;\\mathrm{d}W_t\$,\ncom μ = $μ, σ = $σ, \$X_0 = \$ $x0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topleft)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, x, label = "valor esperado exato")
savefig(joinpath(@OUTPUT, "geometric_brownian.svg"))
```
\fig{geometric_brownian}

```julia:geometric_brownian2
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

M = 100
N = 201
t0 = 0.0
tf = 10.0
tt = range(t0, tf, length = N)
dt = Float64(tt.step)

μ, σ = 2.0, 0.5
x0 = 0.03

Xt = Matrix{Float64}(undef, N, M)
Xt[1, :] .= x0
Xit = Matrix{Float64}(undef, N, M)
Xit[1, :] .= 0.0

x = x0 .* exp.(μ .* tt)

dWt = zeros(M)
dWit = zeros(M)
for n in 2:2:N
    dWt .= √dt * randn(rng, M)
    dWit .= 0.0
    Xt[n, :] .= (
        Xt[n-1, :] 
        .+ (μ .* Xt[n-1, :]) * dt
        .+ (σ .* Xt[n-1, :]) .* dWt
        .- (σ .* Xit[n-1, :]) .* dWit
    )
    Xit[n, :] .= (
        Xit[n-1, :] 
        .+ μ * dt
        .+ (σ .* Xit[n-1, :]) .* dWt
        .+ (σ .* Xt[n-1, :]) .* dWit
    )
    dWt .= 0.0
    dWit .= √dt * randn(rng, M)
    Xt[n+1, :] .= (
        Xt[n, :] 
        .+ (μ .* Xt[n, :]) * dt
        .+ (σ .* Xt[n, :]) .* dWt
        .- (σ .* Xit[n, :]) .* dWit
    )
    Xit[n+1, :] .= (
        Xit[n, :] 
        .+ (μ .* Xit[n, :]) * dt
        .+ (σ .* Xit[n, :]) .* dWt
        .+ (σ .* Xt[n, :]) .* dWit
    )
end

plot(tt, Xt, xaxis = "tempo", yaxis = "posição", title = "Movimento browniano geométrico \$\\mathrm{d}X_t = \\mu X_t \\;\\mathrm{d}t + \\sigma X_t \\;\\mathrm{d}W_t\$,\ncom μ = $μ, σ = $σ, \$X_0 = \$ $x0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topleft)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, x, label = "valor esperado exato")
savefig(joinpath(@OUTPUT, "geometric_brownian2.svg"))
```
\fig{geometric_brownian2}
