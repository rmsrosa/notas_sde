# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
t = range(0.0, 1.0, length = 200)
s_1 = copy(t) ## n = 1
s_1_2 = 2^(1/2) * min.(t, 1 .- t) ## n  = 2
s_1_4 = 2 * max.(0, min.(t, 1/2 .- t)) ## n = 3
s_3_4 = 2 * max.(0, min.(t .- 1/2, 1 .- t)) ## n = 3
s_1_8 = 2^(3/2) * max.(0, min.(t, 1/4 .- t)) ## n = 4
s_3_8 = 2^(3/2) * max.(0, min.(t .- 1/4, 1/2 .- t)) ## n = 4
s_5_8 = 2^(3/2) * max.(0, min.(t .- 1/2, 3/4 .- t)) ## n = 4
s_7_8 = 2^(3/2) * max.(0, min.(t .- 3/4, 1 .- t)) ## n = 4
plot(title = "Funções da base de Faber–Schauder", titlefont = 10, xaxis = "\$t\$", ylims = (0.0, 1.0), legend = :topleft)
plot!(t, s_1, label = "\$s_1(t)\$")
plot!(t, s_1_2, label = "\$s_{1/2}(t)\$")
plot!(t, s_1_4, label = "\$s_{1/4}(t)\$")
plot!(t, s_3_4, label = "\$s_{3/4}(t)\$")
plot!(t, s_1_8, label = "\$s_{1/8}(t)\$")
plot!(t, s_3_8, label = "\$s_{3/8}(t)\$")
plot!(t, s_5_8, label = "\$s_{5/8}(t)\$")
plot!(t, s_7_8, label = "\$s_{7/8}(t)\$")
savefig(joinpath(@OUTPUT, "faberschauder.svg"))