# This file was generated, do not modify it. # hide
using OrdinaryDiffEq
using Plots
theme(:ggplot2) # hide

let
    function f_logistic(u, p, t)
        α, β = p
        du = (α - β * u) * u
        return du
    end

    u0 = 0.01
    α = 3.0
    β = 2.0
    p = (α, β)
    tspan = (0.0, 5.0)
    prob = ODEProblem(f_logistic, u0, tspan, p)

    sol = solve(prob, Tsit5())

    plot(sol, title = "solução da equação logística determinística", titlefont = 10, xaxis = "t", yaxis = "x", label = false, size = (800, 600))

    savefig(joinpath(@OUTPUT, "ode_via_sciml_pop.svg")) # hide
end