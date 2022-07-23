# This file was generated, do not modify it. # hide
#hideall
using Plots
##theme(:ggplot2)
tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:2:3]
plot(title = "Malhas formadas por pontos diádicos", titlefont = 10, xaxis = "\$t\$", yaxis = false, xticks = (0.0:0.25:1.0, ""), xlims = (-0.05, 1.05), ylims = (-1, 1))
scatter!([j/4 for j in 0:4], [0], markersize = 4, label = false)
scatter!([0.0, 1.0], [0], markersize = 6, label = false)
annotate!([(0.0, -0.2, ("\$\\frac{(k-1)}{2^n}\$", 8)), (0.25, -0.2, ("\$\\frac{(k-1)}{2^n}\$", 8)), (0.5, -0.2, ("\$\\frac{k}{2^n}\$", 8)), (0.75, -0.2, ("\$\\frac{(k+1)}{2^n}\$", 8)), (1.0, -0.2, ("\$\\frac{(k+2)}{2^n}\$", 8))])
annotate!([(0.0, 0.25, ("\$\\frac{2^{-2}(k-1)}{2^{n-2}}\$", 8)), (1.0, 0.25, ("\$\\frac{2^{-2}(k-1) + 1}{2^{n-2}}\$", 8))])
savefig(joinpath(@OUTPUT, "dyadic_points.svg"))