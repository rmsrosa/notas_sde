# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
p = 0.4
N = 40
M = 10
nn = 1:N
X = Array{Int}(undef, N, M)
rng = Xoshiro(123)
X[1, :] = rand(rng, M) .< p
for j in 2:N
    X[j, :] .= X[j-1, :] .+ (rand(rng, M) .< p )
end
plot(nn, X, xlims = (0, N+1), ylims = (-1, N+1), title = "Caminhos amostrais de uma contagem binomial com p = $p", titlefont = 10, label = false, linetype=:steppost)
savefig(joinpath(@OUTPUT, "contagem_binomial_caminhos.svg"))