# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
n = 2^12
plt = plot(title="Movimentos Brownianos", titlefont = 10, xaxis = "\$t\$", yaxis = "\$X\$", ylims = (-2, 2), linestyle = :dot, marker = :circle, markersize = 3, label = false, size = (800, 500))

tn = [j/n for j in 0:n]
steps = randn(n)
Xn = [0; cumsum(steps)] ./ sqrt(n)
for _ in 1:10
  plot!(tn, Xn, label=nothing, alpha=0.2, color=1)
  randn!(steps)
  Xn .= [0; cumsum(steps)] ./ sqrt(n)
end
plot!(tn, Xn, label="sample path", color=2)

savefig(joinpath(@OUTPUT, "pathWn.svg"))