@def title = "Aspectos Teóricos e Numéricos de Equações Diferenciais Estocásticas e Aleatórias"

@def nav = false
# {{ title }}

Bem vindos a este sítio dedicado às notas de aula sobre aspectos teóricos e numéricos de equações diferenciais estocásticas e aleatórias, disciplina a ser ministrada no Instituto de Matemática da Universidade Federal do Rio de Janeiro, em 2022/1.

```julia:sequenciaWn
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 3
plts = []
J = 8
ttn = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:J]
Wn = [[0, randn(rng)]]
for n in 2:J
    push!(Wn, zeros(2^(n-1) + 1))
    Wn[end][begin:2:end] .= Wn[end-1]
    Wn[end][begin+1:2:end-1] .= (Wn[end][begin:2:end-2] + Wn[end][begin+2:2:end])/2 .+ randn(rng, 2^(n-2))
end
plot(ttn, Wn, title = "Caminhos amostrais da sequência aproximante \$\\{W_d^n\\}_{d\\in D_n}\$, \$n = 1, \\ldots, $J\$, de um processo de Wiener", titlefont = 10, xaxis = "\$t\$", yaxis = "\$W\$", ylims = (-5, 5), marker = :circle, markersize = 3, label = false, size = (800, 500))
savefig(joinpath(@OUTPUT, "sequenciaWn.svg"))
```
\fig{sequenciaWn}