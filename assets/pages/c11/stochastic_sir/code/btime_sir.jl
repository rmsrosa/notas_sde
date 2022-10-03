# This file was generated, do not modify it. # hide
using BenchmarkTools

let u = [800.0, 200.0]; p = (1000.0, 0.2, 0.15, 0.15, 0.1); t = 1.0; du = Vector{Float64}(undef, 2); du_noise = Matrix{Float64}(undef, 2, 2)
    println("Benchmark SIR!")
    println(@btime SIR!($du, $u, $p, $t))
    println("\nBenchmark SIR_noise!")
    println(@btime SIR_noise!($du_noise, $u, $p, $t))
end