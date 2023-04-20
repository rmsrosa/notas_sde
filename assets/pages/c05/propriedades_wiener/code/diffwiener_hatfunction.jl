# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
t0 = 0.0
t1 = 4.0
s = 2.0
h = 0.5
tt = range(t0, t1, length = 200)
dh(t, s, h) = (min(t+h, s+h) - min(t, s+h) - min(t+h, s) + min(t,s))/h^2

plot(tt, t -> dh(t, s, h), xaxis = "tempo", yaxis = "valor", title = "Covariância Dₕ⁺(t, s) das diferenças finitas de um processo de Wiener\ncom s = $s e h = $h", titlefont = 8, label = false)
savefig(joinpath(@OUTPUT, "diffwiener_hatfunction.svg"))