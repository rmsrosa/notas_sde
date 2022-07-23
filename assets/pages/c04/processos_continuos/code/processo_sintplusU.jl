# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
rng = Xoshiro(123)
theme(:ggplot2)

N = 50
M = 10
tt = range(0.0, 10.0, length = N+1)
X = permutedims(sin.(tt' .+ 2π * rand(rng, M)))

plot(tt, X, title = "Caminhos amostrais do processo X_t = sin(t + U), U ∼ Unif(0,2π)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "processo_sintplusU.svg"))