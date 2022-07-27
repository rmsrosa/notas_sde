# This file was generated, do not modify it. # hide
SIR_network_sol = solve(SIR_network_prob, Tsit5())

SIR_network_sol.retcode