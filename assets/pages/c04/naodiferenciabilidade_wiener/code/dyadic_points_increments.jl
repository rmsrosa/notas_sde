# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
t0 = 0.07
t = range(0.27, 0.48, length = 20)
t1 = range(t0 + 0.02, 0.23, length = 10)
t2 = range(t0 + 0.02, 0.48, length = 30)
t3 = range(t0 + 0.02, 0.73, length = 50)
t4 = range(t0 + 0.02, 0.98, length = 70)

x = 0.25 * sin.(π * (t .- 0.25) ./ 0.25)
x1 = -0.05 * sin.(π * (t1 .- t0) ./ (0.25 - t0))
x2 = -0.2 * sin.(π * (t2 .- t0) ./ (0.50 - t0))
x3 = -0.45 * sin.(π * (t3 .- t0) ./ (0.75 - t0))
x4 = -0.8 * sin.(π * (t4 .- t0) ./ (1.0 - t0))

tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:2:3]

plot(title = "Incrementos", titlefont = 10, xaxis = "\$t\$", yaxis = false, xlims = (-0.05, 1.05), ylims = (-1, 1), xticks = (0.0:0.25:1.0, ""))

scatter!([j/4 for j in 0:4], [0], markersize = 4, label = false)
scatter!([0.0, 1.0], [0], markersize = 6, label = false)
scatter!((t0, 0.0), markersize = 4, color = :black, label = false)

plot!(t, x, color = :black, label = false)
plot!(0.25 .+ t, x, color = :black, label = false)
plot!(0.5 .+ t, x, color = :black, label = false)

plot!(t1, x1, color = :black, label = false)
plot!(t2, x2, color = :black, label = false)
plot!(t3, x3, color = :black, label = false)
plot!(t4, x4, color = :black, label = false)

annotate!([(0.0, -0.2, ("\$\\frac{(k-1)}{2^n}\$", 8)), (1.0, -0.2, ("\$\\frac{(k+2)}{2^n}\$", 8))])
annotate!([(0.15, 0.12, ("\$t_0\$", 8))])
savefig(joinpath(@OUTPUT, "dyadic_points_increments.svg"))