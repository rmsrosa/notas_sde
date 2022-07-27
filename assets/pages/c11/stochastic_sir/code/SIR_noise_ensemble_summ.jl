# This file was generated, do not modify it. # hide
summ95 = EnsembleSummary(SIR_stochastic_ensemble_sol, 0:1:360)
summ50 = EnsembleSummary(SIR_stochastic_ensemble_sol, 0:1:360; quantiles=[0.25,0.75])
summ3 = EnsembleSummary(SIR_stochastic_ensemble_sol, 0:1:360; quantiles=[0.49,0.51])

plot(summ95, labels=["" "Middle 95%"])
plot!(summ50, labels=["" "Middle 50%"], legend=true)
plot!(summ3, labels=["" "Median"], legend=true)
savefig(joinpath(@OUTPUT, "SIR_noise_ensemble_summ.svg")) # hide