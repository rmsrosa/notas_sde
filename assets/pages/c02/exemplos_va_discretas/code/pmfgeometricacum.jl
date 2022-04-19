# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 20
ii = 1:n
bar(ii, i -> sum(( 1 - p ) .^ ((1:i) .- 1) * p), title = "Função distribuição acumulada da geométrica (p = $p)\nchance de sucesso até o lançamento n", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfgeometricacum.svg"))