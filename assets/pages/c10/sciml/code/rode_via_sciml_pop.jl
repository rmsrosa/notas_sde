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

    u0 = 1.0
    p = (3.0, 2.0, 0.1, 0.2)
    tspan = (0.0, 5.0)
    prob = RODEProblem(f, u0, tspan, p)

    sol = solve(prob, RandomEM(), dt=1/100)

    plot(sol, title = "solução da equação logística aleatória", titlefont = 10, xaxis = "t", yaxis = "x", label = false, size = (800, 600))

    savefig(joinpath(@OUTPUT, "rode_via_sciml_pop.svg")) # hide
end