# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)

x = 0.7
tt = range(-2π, 6π, length = 200)

p1 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x", title = "\$\\mathbb{P}_U(\\sin(U + t) \\leq $x),\$ para \$U \\sim \\operatorname{Unif}(0, 2\\pi)\$", titlefont = 8)
tt1 = 2.5π:0.01:4.5π
plot!(p1, tt1, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2, fill=true, label=false)
plot!(p1, tt1 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ 2π, color = 2, label = false)
plot!(p1, tt1, u -> 1/2π * (sin(u) ≤ x), color = 2, fill=true, label=false)

p2 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x", title = "\$\\mathbb{P}_U(\\sin(U) \\leq $x),\$ para \$U \\sim \\operatorname{Unif}(0, 2\\pi)\$", titlefont = 8)
tt2 = 0.0:0.01:2π
plot!(p2, tt2, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2,fill=true, label=false)
plot!(p2, tt2 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ 2π, color = 2, label = false)
plot!(p2, tt2, u -> 1/2π * (sin(u) ≤ x), color = 2, fill=true, label=false)

p3 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x", title = "\$\\mathbb{P}_{U'}(\\sin(U') ≤ $x),\$ para \$U' \\sim \\operatorname{Unif}(-\\pi, \\pi)\$", titlefont = 8)
tt3 = -π:0.01:π
plot!(p3, tt3, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2,fill=true, label=false)
plot!(p3, tt3 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ 2π, color = 2, label = false)
plot!(p3, tt3, u -> 1/2π * (sin(u) ≤ x), color = 2, fill=true, label=false)

p4 = plot(tt, sin, ylims = (-1.2, 1.2), label=false, xaxis = "u", yaxis="x", title = "\${\\mathbb{P}}_{U''}(\\sin(U'') ≤ $x),\$ para \$U'' \\sim \\operatorname{Unif}(-\\pi/2, \\pi/2)", titlefont = 8)
tt4 = -π/2:0.01:π/2
plot!(p4, tt4, u -> sin(u) * (sin(u) ≤ x), color = 1, alpha = 0.2,fill=true, label=false)
plot!(p4, tt4 |> tt -> [tt[begin], tt[end], tt[end], tt[begin], tt[begin]], [0, 0, 1, 1, 0] ./ π , color = 2, label = false)
plot!(p4, tt4, u -> 1/π * (sin(u) ≤ x), color = 2, fill=true, label=false)

plot(p1, p2, p3, p4, layout = (2, 2), size = (900, 500))
savefig(joinpath(@OUTPUT, "processo_sintUcdf.svg"))