# This file was generated, do not modify it. # hide
inf0 = 10
popinf0 = [0.8, 0.2, 0.0] * inf0
pop0 = [pop' - popinf0'; popinf0']

t0 = 0.0
tf = 360.0
tspan = (t0, tf)

SIR_network_prob = ODEProblem(SIR_network!, pop0, tspan, parm_network)