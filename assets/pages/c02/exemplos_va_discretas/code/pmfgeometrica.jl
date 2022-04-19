# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 20
ii = 1:n
bar(ii, ( 1 - p ) .^ (ii .- 1) * p, title = "Função massa de probabilidade da distribuição Geométrica (p = $p)\nchance de sucesso só no lançamento n", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfgeometrica.svg"))