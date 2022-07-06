# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
N = 3
tt = -4:0.01:4
xx = [
    m * ifelse.(tt .≤ 0, exp.( m * tt), 0) for m in 1:N
]
plot(tt, xx, title = "aproximações da identidade \$t \\rightarrow m e^{m t}\$", titlefont = 10, xaxis = "\$t\$", yaxis = "\$x\$", label=reshape("m = " .* string.(1:N), 1, :))
savefig(joinpath(@OUTPUT, "aprox_id_exp.svg"))