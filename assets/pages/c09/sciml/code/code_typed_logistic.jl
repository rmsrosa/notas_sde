# This file was generated, do not modify it. # hide
using InteractiveUtils # hide
let u = 1.0; p = (1.5, 2.0); t = 3.0
    println("Code typed for `f_logistic1($u, $p, $t)):")
    println(@code_typed(f_logistic1(u, p, t)))
    println()
    println("Code typed for `f_logistic2($u, $p, $t))")
    println(@code_typed(f_logistic2(u, p, t)))
end