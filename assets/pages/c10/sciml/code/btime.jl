# This file was generated, do not modify it. # hide
using BenchmarkTools

let u = [0.8, 0.2]; p = (0.2, 0.15); t = 1.0; du = similar(u)
    println("Benchmark fsir")
    println(@btime fsir($u, $p, $t))
    println("\nBenchmark fsir1!")
    println(@btime fsir1!($du, $u, $p, $t))
    println("\nBenchmark fsir2!")
    println(@btime fsir2!($du, $u, $p, $t))
    println("\nBenchmark fsir3!")
    println(@btime fsir3!($du, $u, $p, $t))
end