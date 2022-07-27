# This file was generated, do not modify it. # hide
plot(summ95, labels=["" "Middle 95%"], ylims = (0.0, 5000.0))
plot!(summ50, labels=["" "Middle 50%"], legend=true)
plot!(summ3, labels=["" "Median"], legend=true)
savefig(joinpath(@OUTPUT, "SIR_noise_ensemble_summ_closeup.svg")) # hide