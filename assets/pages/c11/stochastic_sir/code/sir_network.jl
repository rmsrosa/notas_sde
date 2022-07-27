# This file was generated, do not modify it. # hide
function SIR_network!(du, u, p, t)
    S, I = eachrow(u)
    M = length(S)
    Nd, phi, beta, gamma = p
    for i in 1:M
        infections_i = sum(
            [beta[j] * phi[i,j] * phi[k,j] * S[i] * I[k] / Nd[j] for k=1:M, j=1:M]
        )
        du[1,i] = dS = - infections_i
        du[2,i] = dI = infections_i - gamma[i] * I[i]
    end
end