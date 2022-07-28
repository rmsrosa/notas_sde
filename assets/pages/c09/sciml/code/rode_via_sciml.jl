# This file was generated, do not modify it. # hide
using StochasticDiffEq
using Plots
theme(:ggplot2) # hide

let
    f(u, p, t, W) = sin(W) * u

    u0 = 1.0
    tspan = (0.0, 5.0)
    prob = RODEProblem(f, u0, tspan)

    sol = solve(prob, RandomEM(), dt=1/100)

    plot(sol, title = "solução da equação diferencial aleatória `u' = sin(W)u` com `u(0) = 1.0`", titlefont = 10, xaxis = "t", yaxis = "x", label = false, size = (800, 600))

    savefig(joinpath(@OUTPUT, "rode_via_sciml.svg")) # hide
end