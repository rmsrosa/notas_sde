# This file was generated, do not modify it. # hide
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