# This file was generated, do not modify it. # hide
#hideall

t = 1.0
nmax = 20
a = 1.0
xmax = sqrt(2 * a * t * nmax)
mm = -2*div(nmax,2):2:2*div(nmax,2)

anim = @animate for n in 1:nmax
    factn = factorial(n)
    tau = t / n
    ell = sqrt(2 * a * tau)

    plot(title="Convergência das distribuições para \$a=$a,\$ em \$t=$t\$", titlefont = 10, xaxis = "\$x\$", yaxis = "\$p\$", xlims = (-xmax, xmax), ylims = (-0.1, 0.6), size = (800, 500))

    plot!([(m-rem(n+m,2)) * ell for m in mm], [( abs(m-rem(n+m,2)) ≤ n ) ? factn / ( 2 * ell * 2^n * factorial(div(n+m-rem(n+m, 2), 2)) * factorial(div(n-m+rem(n+m,2), 2)) ) : 0 for m in mm], linetype = :stepmid, label="\$\\tilde p_n(t, x) (n=$(lpad(n, 2, '0')))\$")
    plot!([(m-rem(n+m,2)) * ell for m in mm], [( abs(m-rem(n+m,2)) ≤ n ) ? factn / ( 2 * ell * 2^n * factorial(div(n+m-rem(n+m, 2), 2)) * factorial(div(n-m+rem(n+m,2), 2)) ) : 0 for m in mm],label="\$p_n(t, x) (n=$(lpad(n, 2, '0')))\$")
    plot!(range(-xmax, xmax, length=100), x -> exp(-x^2 / (4 * a * t)) / sqrt( 4 * pi * a * t), label="\$\\mathcal{N}(x; 0, 2at)\$")
end

gif(anim, fps=4, joinpath(@OUTPUT, "randomwalklimit.gif"))