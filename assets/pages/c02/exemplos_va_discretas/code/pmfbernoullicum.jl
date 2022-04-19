# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
bar([0, 1], [1/2, 1], ylims = (0, 1), title = "Função distribuição acumulada de Bernoulli", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbernoullicum.svg"))