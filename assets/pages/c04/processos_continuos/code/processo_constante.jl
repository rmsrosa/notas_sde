# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
rng = Xoshiro(123)
theme(:ggplot2)
N = 40
M = 20
nn = 1:N
X = Array{Float64}(undef, N, M)
X = permutedims(repeat(randn(rng, M), 1, N))
plot(nn, X, xlims = (0, N+1), ylims = (-3, 3), title = "Caminhos amostrais de um processo constante \$X_t = Y \\sim \\mathcal{N}(0,1)\$", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_constante.svg"))