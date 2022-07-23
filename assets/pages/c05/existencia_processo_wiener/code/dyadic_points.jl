# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
N = 4
tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:N]
plot(title = "Malhas formadas por pontos diádicos", titlefont = 10, xaxis = "\$t\$", yaxis = "\$n\$")
for n in 1:N
    scatter!(tt[n], [n], ylims = (0, n+2), markersize = 16 - 3n, label = "\$D_$n\$")
end
savefig(joinpath(@OUTPUT, "dyadic_points.svg"))