# This file was generated, do not modify it. # hide
using StochasticDiffEq
using Plots
theme(:ggplot2) # hide

let
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
    sols = solve(ensembleprob, RandomEM(), EnsembleThreads(), trajectories=100, dt=1/100)
    plot(title = "soluções da equação logística aleatória", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
    plot!(sols, color = 1, alpha = 0.1)
    plot!(sols[1])
    savefig(joinpath(@OUTPUT, "rode_via_sciml_pop_ensemb_trajectories.svg"))
    # hide

    sols = solve(ensembleprob, RandomEM(), EnsembleThreads(), trajectories=1000, dt=1/100)

    summ95 = EnsembleSummary(sols)
    summ68 = EnsembleSummary(sols; quantiles=[0.16,0.84])
    plot(title = "valor esperado e intervalos de amostras", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
    plot!(summ95, label = "95% das amostras")
    plot!(summ68, label = "68% das amostras", legend = :bottomright)

    savefig(joinpath(@OUTPUT, "rode_via_sciml_pop_ensemb.svg")) # hide
end