# This file was generated, do not modify it. # hide
using StochasticDiffEq
using Plots
theme(:ggplot2) # hide

let T = 1.0
    f(u, p, t) = - u / (T - t)
    g(u, p, t) = 1.0

    u0 = 0.0
    tspan = (0.0, T)
    prob = SDEProblem(f, g, u0, tspan)

    ensembleprob = EnsembleProblem(prob)
    sols = solve(ensembleprob, EM(), EnsembleThreads(), trajectories=100, dt=1/100)
    plot(title = "soluções da ponte browniana", titlefont = 12, xaxis = "t", yaxis = "x", size = (800, 600))
    plot!(sols, color = 1, alpha = 0.1)
    plot!(sols[1])
    savefig(joinpath(@OUTPUT, "sde_via_sciml_pop_ensemb_trajectories.svg")) # hide

    sols = solve(ensembleprob, EM(), EnsembleThreads(), trajectories=1000, dt=1/100)

    summ95 = EnsembleSummary(sols)
    summ68 = EnsembleSummary(sols; quantiles=[0.16,0.84])
    plot(title = "valor esperado e intervalos de amostras", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
    plot!(summ95, label = "95% das amostras")
    plot!(summ68, label = "68% das amostras")
    plot!(range(tspan..., length = 200), [t -> sqrt(t * (1 - t)), t -> - sqrt(t * (1 - t))], color = 3, label = ["desvio padrão" nothing], legend = :topright)

    savefig(joinpath(@OUTPUT, "sde_via_sciml_pop_ensemb.svg")) # hide
end