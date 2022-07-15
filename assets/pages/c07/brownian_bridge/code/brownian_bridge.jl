# This file was generated, do not modify it. # hide
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