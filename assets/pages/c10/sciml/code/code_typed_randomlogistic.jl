# This file was generated, do not modify it. # hide
using InteractiveUtils # hide

function f_randomlogistic1(u, p, t, W)
    a, b, δ, ε = p
    Y = W / (1 + abs(W))
    Z = sin(W)
    A = a + δ * Y
    B = b + ε * Z
    du = (A - B * u) * u
    return du
end

f_randomlogistic2(u, p, t, W) = (p[1] + p[3] * W / (1 + abs(W)) - (p[2] + p[3] * sin(W)) * u) * u

let u = 1.0; p = (1.5, 2.0, 0.2, 0.1); t = 3.0; w = 0.5
    println("Code typed for `f_randomlogistic1($u, $p, $t, $w)):")
    println(@code_typed(f_randomlogistic1(u, p, t, w)))
    println()
    println("Code typed for `f_randomlogistic2($u, $p, $t, $w))")
    println(@code_typed(f_randomlogistic2(u, p, t, w)))
end