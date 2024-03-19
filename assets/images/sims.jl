using Random
using Plots

function logistic(a, b, x0, tt)
    x = Vector{Float64}(undef, length(tt))
    x[1] = x0
    for i in 2:length(tt)
        x[i] = x[i-1] + tt.step * ( a - b * x[i-1] ) * x[i-1]
    end
    return x
end

function processesWY(rng, tt)
    wt = Vector{Float64}(undef, length(tt))
    wt[1] = 0.0
    sqrtdt = √Float64(tt.step)
    for i in 2:length(tt)
        wt[i] = wt[i-1] + sqrtdt * randn(rng)
    end
    yt = wt ./ (1 .+ abs.(wt))
    return wt, yt
end

function logistic_rode(rng, a, b, e, x0, tt)
    x = Vector{Float64}(undef, length(tt))
    x[1] = x0
    wt = 0.0
    sqrtdt = √Float64(tt.step)
    for i in 2:length(tt)
        yt = wt / (1 + abs(wt))
        at = a * (1 + e * yt)
        x[i] = x[i-1] + tt.step * ( at - b * x[i-1] ) * x[i-1]
        wt += sqrtdt * randn(rng)
    end
    return x
end

function logistic_sde(rng, a, b, e, x0, tt)
    x = Vector{Float64}(undef, length(tt))
    x[1] = x0
    dwt = 0.0
    for i in 2:length(tt)
        dwt = √Float64(tt.step) * randn(rng)
        x[i] = x[i-1] + tt.step * ( a - b * x[i-1] ) * x[i-1] + e * dwt
    end
    return x
end

trunc(x) = min(1.0, max(-1.0, x))

rng = Xoshiro(321)

a, b, e = 4.0, 2.0, 0.2
x0 = 0.4
tt = 0.0:0.01:3.0

s = 0.2
xx_0 = x0 .+ s * trunc.(randn(rng, 50))
xx_0[1] = x0

##

x = logistic(a, b, x0, tt)
plt1 = plot(title="\nEDO", titlefont=8, xaxis="\$t\$", yaxis="\$x\$")
plot!(plt1, tt, x, color=2, ylims=(0, 3b/2), axis=true, grid=true, legend=false)

##


xx = logistic.(a, b, xx_0, Ref(tt))
plt2 = plot(title="\nRODE com parâmetros aleatórios", titlefont=8, xaxis="\$t\$", yaxis="\$x\$")
plot!(plt2, tt, xx, ylims=(0, 3b/2), alpha=0.2, color=1, axis=true, grid=true, legend=false)
plot!(plt2, tt, xx[1], color=2, linewidth=2, label=false)

##

xx = logistic_rode.(rng, a, b, e, xx_0, Ref(tt))
plt3 = plot(title="\nRODE com parâmetros estocásticos", titlefont=8, xaxis="\$t\$", yaxis="\$x\$")
plot!(plt3, tt, xx, ylims=(0, 3b/2), alpha=0.2, color=1, axis=true, grid=true, legend=false)
plot!(plt3, tt, xx[1], color=2, linewidth=2, label=false)

##

xx = logistic_sde.(rng, a, b, e, xx_0, Ref(tt))
### END SOLUTION
plt4 = plot(title="\nSDE", titlefont=8, xaxis="\$t\$", yaxis="\$x\$")
plot!(plt4, tt, xx, ylims=(0, 3b/2), alpha=0.2, color=1, axis=true, grid=true, legend=false) 
plot!(plt4, tt, xx[1], color=2, linewidth=2, label=false)

plt = plot(plt1, plt2, plt3, plt4, size=(800, 300))

##

savefig("sims.png")
nothing