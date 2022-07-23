# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 200
M = 5
tt = range(0.0, π, length = N+1)
X = permutedims(sin.(tt' .* 2π .* rand(rng, M)))
plot(tt, X, title = "Caminhos amostrais do processo X_t = sin(Ut), U ∼ Unif(0,2π)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_sinttimesU.svg"))