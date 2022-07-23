# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

ps = 1:5
esperancas = Vector{Float64}(undef, length(ps))

ns = 2 .^ (1:18)

esperancas = [sum(rand(n) .^ 2) / n for n in ns]

plot(ylims = (0.0, 1.0), xscale = :log10, xaxis = "número de amostras", yaxis = "valor esperado", title = "Estimativa do valor esperado via método de Monte-Carlo", titlefont = 10, legend = :topright)
scatter!(ns, esperancas, label = "valor esperado das amostras")
hline!([1/3], label = "valor esperado exato")
savefig(joinpath(@OUTPUT, "esperancauniformsquare.svg"))