# This file was generated, do not modify it. # hide
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

μ, σ = 2.0, 0.5
x0 = 0.03

Xt = Matrix{Float64}(undef, N, M)
Xt[1, :] .= x0

x = x0 .* exp.(μ .* tt)

dWt = zeros(M)
for n in 2:N
    dWt .= √dt * randn(rng, M)
    Xt[n, :] .= Xt[n-1, :] .* (
        1 
        .+ (μ .* Xt[n-1, :]) * dt
        .+ (σ .* Xt[n-1, :]) .* dWt
    )
end

plot(tt, Xt, xaxis = "tempo", yaxis = "posição", title = "Movimento browniano geométrico \$\\mathrm{d}X_t = \\mu X_t \\;\\mathrm{d}t + \\sigma X_t \\;\\mathrm{d}W_t\$,\ncom μ = $μ, σ = $σ, \$X_0 = \$ $x0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topleft)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
savefig(joinpath(@OUTPUT, "geometric_brownian.svg"))