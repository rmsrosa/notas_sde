# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
a = 1
b = 4
xx = 0:0.01:5
plot(xx, x -> (a <= x < b) / (b - a), ylims = (0, 1), fill = true, title = "Função densidade de probabilidades da distribuição uniforme em [$a, $b)", titlefont = 10, label = false)
savefig(joinpath(@OUTPUT, "cdfuniform.svg"))