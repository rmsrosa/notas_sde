# This file was generated, do not modify it. # hide
function SIR_noise!(du, u, p, t)
    S, I = u
    N, _, _, sigma_beta, sigma_gamma = p
    bW = sigma_beta * S * I / N
    gW = sigma_gamma * I
    du[1, 1] = -bW
    du[1, 2] = 0.0
    du[2, 1] = bW
    du[2, 2] = -gW
end