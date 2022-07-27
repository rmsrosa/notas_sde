# This file was generated, do not modify it. # hide
num_trajectories = 100
SIR_stochastic_ensemble_prob = EnsembleProblem(SIR_stochastic_prob)
SIR_stochastic_ensemble_sol = solve(SIR_stochastic_ensemble_prob, EM(), dt=0.1, EnsembleThreads(), trajectories=num_trajectories)

plot(SIR_stochastic_ensemble_sol, color =  repeat(1:2, 200)', alpha = 0.2)
# plot!(SIR_stochastic_ensemble_sol[2], color = 2, alpha = 0.2)
savefig(joinpath(@OUTPUT, "solve_SIR_noise_ensemble.svg")) # hide