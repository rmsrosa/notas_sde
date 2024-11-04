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

plot(tt, Yt, xaxis = "\$t\$", yaxis = "\$Y_t\$", title = "Velocidade \$\\{Y_t\\}_t\$ de acordo com\nOrnstein-Uhlenbeck \$\\mathrm{d}Y_t = -\\nu Y_t \\;\\mathrm{d}t + \\sigma Y_t \\;\\mathrm{d}W_t\$,\ncom ν = $ν, σ = $σ, \$Y_0 = \$ $y0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topright)
plot!(tt, Yt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, y, color = 3, label = "valor esperado")
savefig(joinpath(@OUTPUT, "ornstein_uhlenbeck_vel.svg"))

plot(tt, Xt, xaxis = "\$t\$", yaxis = "\$X_t\$", title = "Posição \$\\{X_t\\}_t\$ de acordo com o sistema\n\$\\mathrm{d}X_t = Y_t\\;\\mathrm{d}t\$ e \$\\mathrm{d}Y_t = -\\nu Y_t \\;\\mathrm{d}t + \\sigma Y_t \\;\\mathrm{d}W_t\$,\ncom ν = $ν, σ = $σ, \$X_0 = \$ $x0, \$Y_0 = \$ $y0", titlefont = 10, label = permutedims(["caminhos amostrais"; fill(nothing, M-1)]), color = 1, alpha = 0.1, legend = :topleft)
plot!(tt, Xt[:, 1], color = 2, label = "um caminho amostral")
plot!(tt, x, color = 3, label = "valor esperado")
savefig(joinpath(@OUTPUT, "ornstein_uhlenbeck_pos.svg"))