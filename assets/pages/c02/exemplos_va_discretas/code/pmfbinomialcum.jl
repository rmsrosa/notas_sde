# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 6
ii = 1:n
bar(ii, i -> sum(p .^ (1:i) .* ( 1 - p ) .^ (n .- (1:i))), title = "Função distribuição acumulada da Binomial (n = $n, p = $p)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbinomialcum.svg"))