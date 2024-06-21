# This file was generated, do not modify it. # hide
function f_logistic1(u, p, t)
    α, β = p
    du = (α - β  * u) * u
    return du
end

f_logistic2(u, p, t) = (p[1] - p[2] * u) * u