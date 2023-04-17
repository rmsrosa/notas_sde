# This file was generated, do not modify it. # hide
#hideall
using Plots
theme(:ggplot2)
t = range(0.0, 1.0, length = 200)
s_d = Dict(n => Dict(d => 2^(max(0,(n-1)/2)) .* max.(0.0, min.(t .- d .+ 1/2^n, d .+ 1/2^n .- t)) for d in Rational.(0:1/2^(n):1) if (n == 0 || d ∉ Rational.(0:1/2^(n-1):1))) for n in 0:4)
plot(title = "Funções da base de Faber–Schauder", titlefont = 10, xaxis = "\$t\$", ylims = (0.0, 1.0), legend = :topleft, legendfontsize=6)
for (n, sdn) in sort(s_d)
    for (d, sd) in sort(sdn)
        plot!(t, sd, label="\$s_{$d}(t)\$")
    end
end
savefig(joinpath(@OUTPUT, "faberschauder.svg"))