# This file was generated, do not modify it. # hide
#hideall
using Random
using Plots
theme(:ggplot2)
rng = Xoshiro(123)

mu1 = 3.0
sigma1 = 1.0
mu2 = -2.0
sigma2 = 2.0

a = 2.0
T = 4π / a
N = 100
tt = range(0.0, T, length = N)

x = mu1 * cos.(a * tt) .+ mu2 * sin.(a * t)
sigma = sqrt.(sigma1^2 .* cos.(a * tt) .^2 .+ sigma2^2 .* sin.(a * tt) .^2)

plot(tt, x, ribbon = sigma, xaxis = "t", yaxis = "x", label = false, title = "Evolução da média e do desvio-padrão de X_t = cos(at)Y_1 + sin(at)Y_2\na = $a e Y1 ∼ N($mu1, $(sigma1^2)), Y2 ∼ N($mu2, $(sigma2^2))", titlefont = 10)

savefig(joinpath(@OUTPUT, "gaussian_dance.svg"))