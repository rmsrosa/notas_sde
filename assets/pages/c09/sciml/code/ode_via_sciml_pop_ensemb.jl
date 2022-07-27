# This file was generated, do not modify it. # hide
using OrdinaryDiffEq
using Plots
theme(:ggplot2)

let

    function f_logistic(u, p, t)
        α, β = p
        du = (α - β * u) * u
        return du
    end

    u0 = 0.1
    α = 3.0
    β = 2.0
    p = (α, β)
    tspan = (0.0, 5.0)
    prob = ODEProblem(f_logistic, u0, tspan, p)

    prob_func(prob, i, repeat) = remake(prob, u0 = 0.2 + 0.1 * rand(), p = (3.0 + 0.01 * randn(), 2.0 + 0.02 * randn()))

    ensemble_prob = EnsembleProblem(prob; prob_func)

    sols = solve(ensemble_prob, Tsit5(), EnsembleThreads(), trajectories=20)

    plot(title = "soluções da equação logística", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
    plot!(sols, color = 1, alpha = 0.1)
    plot!(sols[1])
    savefig(joinpath(@OUTPUT, "ode_via_sciml_pop_ensemb_trajectories.svg"))
# hide

    sols = solve(ensemble_prob, Tsit5(), EnsembleThreads(), trajectories=250, saveat = range(tspan..., length = 200))

    summ95 = EnsembleSummary(sols)
    summ68 = EnsembleSummary(sols; quantiles=[0.16,0.84])
    plot(title = "valor esperado e intervalos de confiança", titlefont = 12, xaxis = "t", yaxis = "população", size = (800, 600))
    plot!(summ95, label = "95%")
    plot!(summ68, label = "68%", legend = :bottomright)

    savefig(joinpath(@OUTPUT, "ode_via_sciml_pop_ensemb.svg")) # hide
end