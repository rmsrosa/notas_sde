# This file was generated, do not modify it. # hide
function SIR!(du, u, p, t)
    S, I = u
    N, beta, gamma = p
    du[1] = -beta * S * I / N 
    du[2] = beta * S * I / N - gamma * I
end