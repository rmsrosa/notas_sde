# This file was generated, do not modify it. # hide
using InteractiveUtils

let u = [800, 200]; p = (1000.0, 0.2, 0.15, 0.15, 1//10); t = 1.0; du = Vector{Float64}(undef, 2); du_noise = Matrix{Float64}(undef, 2, 2)
    println("@code_warntype for SIR!")
    println(@code_warntype SIR!(du, u, p, t))
    println("\n@code_warntype for SIR_noise!")
    println(@code_warntype SIR_noise!(du_noise, u, p, t))
end