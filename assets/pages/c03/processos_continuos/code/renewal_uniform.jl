# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 10
M = 5
tt = range(0.0, div(N, 2), length = 200)
Y = rand(rng, N, M)
Z = accumulate(+, Y, dims = 1)
X = reduce(vcat, count(Z .< t, dims = 1) for t in tt)
plot(tt, X, ylims = (0, div(3N, 2)), xaxis = "tempo", yaxis = "nível", title = "Caminhos amostrais do processo de renovação com saltos Yj ∼ Unif(0,1)", titlefont = 10, label = false, linetype=:steppost)
savefig(joinpath(@OUTPUT, "renewal_uniform.svg"))