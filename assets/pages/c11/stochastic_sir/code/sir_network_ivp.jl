# This file was generated, do not modify it. # hide
popinf0 = [0.8, 0.2, 0.0] * inf0

pop0 = [pop' - popinf0'; popinf0']
tspan = (0., 360.)

SIR_network_prob = ODEProblem(SIR_network!, pop0, tspan, parm_network)