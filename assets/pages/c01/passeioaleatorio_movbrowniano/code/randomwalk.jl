# This file was generated, do not modify it. # hide
#hideall

t = 1.0
nmax = 16
a = 1.0
xmax = sqrt(2 * a * t * nmax)
mm = -2*div(nmax,2):2:2*div(nmax,2)

anim = @animate for n in 2:2:nmax
    factn = factorial(n)
    tau = t / n
    ell = sqrt(2 * a * tau)

    plot(titlefont = 10, xaxis = "\$x\$", yaxis = "\$p\$", xlims = (-xmax, xmax), ylims = (-0.1, 0.6), legend = false, size = (800, 500))

    plot!([m * ell for m in mm], [( abs(m) ≤ n ) ? factn / ( 2 * ell * 2^n * factorial(div(n+m, 2)) * factorial(div(n-m, 2)) ) : 0 for m in mm], linetype = :stepmid, title="Distribuição \$p_n(t,x)\$ para \$a=$a,\$ \$t=$t\$ e \$n=$n\$")
    plot!(range(-xmax, xmax, length=100), x -> exp(-x^2 / (2 * a * t)) / sqrt( 4 * pi * a * t))
end

gif(anim, fps=1, joinpath(@OUTPUT, "randomwalklimit.gif"))