# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
p = 1//4
n = 6
ii = 1:n
bar(ii, p .^ ii .* ( 1 - p ) .^ (n .- ii), title = "Função massa de probabilidade da distribuição Binomial (n = $n, p = $p)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "pmfbinomial.svg"))