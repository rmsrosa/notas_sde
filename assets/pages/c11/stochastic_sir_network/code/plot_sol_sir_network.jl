# This file was generated, do not modify it. # hide
plot(xlabel = "time (days)", ylabel = "population fraction", ylims = (0.0, 1.0))
for (j, s) in zip(1:3, 'A':'C')
    plot!(getindex.(SIR_network_sol.u, 1, j)/pop[j], label = "Site $s")
end
plot!(title = "Fraction of susceptible individuals in each site", titlefont = 10)
savefig(joinpath(@OUTPUT, "plot_sol_sir_network_1.svg")) # hide

plot(xlabel = "time (days)", ylabel = "population fraction")
for (j, s) in zip(1:3, 'A':'C')
    plot!(getindex.(SIR_network_sol.u, 2, j)/pop[j], label = "Site $s")
end
plot!(title = "Fraction of infected individuals in each site", titlefont = 10)
savefig(joinpath(@OUTPUT, "plot_sol_sir_network_2.svg")) # hide