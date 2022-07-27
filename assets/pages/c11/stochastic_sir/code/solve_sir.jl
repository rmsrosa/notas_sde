# This file was generated, do not modify it. # hide
SIR_sol = solve(SIR_prob, Tsit5())

plot(
    SIR_sol, ylims = (0.0, N),
    xlabel = "time (days)", ylabel = "population", label = ["suscetíveis" "infectados"]
)
savefig(joinpath(@OUTPUT, "solve_sir_1.svg")) # hide

plot(
    SIR_sol, vars = 2, c = :red,
    xlabel = "time (days)", ylabel = "population", label = "Infected"
)
savefig(joinpath(@OUTPUT, "solve_sir_2.svg")) # hide