# This file was generated, do not modify it. # hide
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)

nmax = 10

anim = @animate for n in 0:nmax
    factn = factorial(n)
    pwr2n = 2^n
    plt = plot(titlefont = 10, xaxis = "\$m\$", yaxis = "\$p_n(m)\$", xlims = (-nmax-1, nmax+1), ylims = (-0.1, 1.1), legend = false, size = (800, 500))

    bar!(plt, -nmax:nmax, m -> ( iseven(n+m) && abs(m) ≤ n ) ? factn / factorial(div(n+m, 2)) / factorial(div(n - m, 2)) / pwr2n : 0, title="Distribuição \$p_n(m)\$ no passo \$n=$n\$")
end

gif(anim, fps=2, joinpath(@OUTPUT, "randomwalkdistrib.gif"))