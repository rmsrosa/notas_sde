# This file was generated, do not modify it. # hide
N = 100_000
beta = 0.2
gamma = 0.15

parm_sir = (N, beta, gamma)

t0 = 0.0
tf = 360.0
tspan = (t0, tf)

inf0 = 10
u0 = Float64[N - inf0, inf0]

SIR_prob = ODEProblem(SIR!, u0, tspan, parm_sir)