# This file was generated, do not modify it. # hide
using StochasticDiffEq
using Plots
theme(:ggplot2)

function f(u, p, t, W)
    a, b, δ, ε = p
    Y = W / (1 + abs(W))
    Z = sin(W)
    A = a + δ * Y
    B = b + ε * Z
    du = (A - B * u) * u
    return du
end

u0 = 0.01
p = (3.0, 2.0, 0.1, 0.2)
tspan = (0.0, 8.0)
prob = RODEProblem(f, u0, tspan, p)

ensembleprob = EnsembleProblem(prob)
sol = solve(ensembleprob, RandomEM(), EnsembleThreads(), trajectories=100, dt=1/100)
plot(title = "conjunto de caminhos amostrais e um caminho em destaque", titlefont = 12, xaxis = "t", yaxis = "população")
plot!(sol, color = 1, alpha = 0.1)
plot!(sol[1])
savefig(joinpath(@OUTPUT, "rode_via_sciml_pop_ensemb_trajectories.svg")) # hide

sol = solve(ensembleprob, RandomEM(), EnsembleThreads(), trajectories=1000, dt=1/100)

summ95 = EnsembleSummary(sol)
summ50 = EnsembleSummary(sol; quantiles=[0.25,0.75])
plot(title = "valor esperado e intervalos de amostras", titlefont = 12, xaxis = "t", yaxis = "população")
plot!(summ95, label = "95% das amostras")
plot!(summ50, label = "50% das amostras")

savefig(joinpath(@OUTPUT, "rode_via_sciml_pop_ensemb.svg")) # hide