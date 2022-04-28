# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
mu = 10.0
sigma = 2.0
N = 20
M = 5
nn = 1:N
X = Array{Float64}(undef, N, M)
rng = Xoshiro(321)
X[1, :] .= 10.0 .+ 2.0 .* randn(rng, M)
for j in 2:N
    X[j, :] .= X[1, :] ./ j
end
plot(nn, X, xlims = (0, N+1), ylims = (-1, mu + sigma), title = "Caminhos amostrais de um processo X_n = Y/n decidido na partida com Y = N($mu, $(sigma^2))", titlefont = 8, label = false, marker = :circle)
savefig(joinpath(@OUTPUT, "partida_decaimento.svg"))