# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
N = 100+1
M = 40
nn = 0:N-1
X = Array{Int}(undef, N, M)
rng = Xoshiro(123)
X[1, :] .= 0
for j in 2:N
    X[j, :] .= X[j-1, :] .+ rand(rng, (-1:1), M)
end
plot(X, nn, xlims = (-div(N+1,2), div(N+1,2)), ylims = (-1, N+1), xaxis = "posição", yaxis = "passo", title = "Caminhos amostrais de um passeio aleatóro", titlefont = 12, label = false, linetype=:steppre, size = (600,600), color=:navyblue)
plot!(X[:,1], nn, xlims = (-div(N+1,2), div(N+1,2)), ylims = (-1, N+1), title = "Caminhos amostrais de um passeio aleatóro", titlefont = 10, label = false, linetype=:steppre, size = (600,600), color=:red, linewidth=2)
savefig(joinpath(@OUTPUT, "passeio_aleatorio.svg"))