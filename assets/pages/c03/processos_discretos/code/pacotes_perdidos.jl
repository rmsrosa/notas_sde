# This file was generated, do not modify it. # hide
#hideall
p = 0.1
N = 1000
l = 120
s = Float64(sum(p^k * (1-p)^(N - k) * binomial(big(N), big(k)) for k in l+1:N))
println("Há $(100 * round(s, digits = 4))% de chances de algum pacote ser perdido.")