# This file was generated, do not modify it. # hide
SIR_stochastic_prob = SDEProblem(SIR!, SIR_noise!, u0, tspan, parm_sir_noise, noise_rate_prototype=zeros(2,2))
SIR_stochastic_sol = solve(SIR_stochastic_prob, EM(), dt=0.01)

plot(
    SIR_stochastic_sol, ylims = (0.0, N),
    xlabel = "time (days)", ylabel = "population", label = ["suscetíveis" "infectados"]
)
savefig(joinpath(@OUTPUT, "solve_sir_noise_1.svg")) # hide

plot(
    SIR_stochastic_sol, vars = 2, c = :red,
    xlabel = "time (days)", ylabel = "population", label = "Infected"
)
savefig(joinpath(@OUTPUT, "solve_sir_noise_2.svg")) # hide