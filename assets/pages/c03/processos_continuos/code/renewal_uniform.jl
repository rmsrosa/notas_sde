# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 20
M = 5
tt = range(0.0, div(N, 2), length = 200)
S = 0.5 .+ rand(rng, N, M)
T = accumulate(+, S, dims = 1)
X = reduce(vcat, count(T .< t, dims = 1) for t in tt)
plot(tt, X, ylims = (0, div(3N, 4)), xaxis = "tempo", yaxis = "nível", title = "Caminhos amostrais do processo de renovação com saltos Sj ∼ Unif(0.5,1)", titlefont = 10, label = false, linetype=:steppost)
savefig(joinpath(@OUTPUT, "renewal_uniform.svg"))