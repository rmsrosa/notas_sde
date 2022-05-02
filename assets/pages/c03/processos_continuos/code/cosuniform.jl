# This file was generated, do not modify it. # hide
#hideall
using Random
using Plots
theme(:ggplot2)
t = 10.0
M = 100_000
rng = Xoshiro(123)
U = 2π * rand(rng, M)
X_t = cos.(t .+ U)

nbins = 100

histogram(X_t, label = "histograma", xaxis = "X_T", yaxis = "contagem", title = "Histograma e PDF normalizada de X_t = cos(t + U), U ∼ Unif([0, 2π))\ncom $M realizações", titlefont = 8, bins = nbins, legend = :top)

avg_per_bin = 2 * M / nbins # take interval [-1, 1] length into account

plot!(-0.99:0.01:0.99, x -> avg_per_bin_per_length / sqrt(1 - x^2) / π, label = "PDF = (2/π)1/√(1-x^2)")

savefig(joinpath(@OUTPUT, "cosuniform.svg"))