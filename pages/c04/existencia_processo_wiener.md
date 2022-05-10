@def title = "Existência"

# {{ get_title }}

O processo conhecido atualmente como processo de Wiener foi introduzido, como modelo para o movimento Browniano, por N. Wiener, nos anos 1920, junto com a demonstração de existência de tal processo. Vamos, a seguir, discutir uma demonstração dada por Paul Lévy, conforme apresentada em Morters & Peres (2010).

A demonstração é obtida por um processo de limite, a partir de um processo estocástico discreto que é interpolado para um processo contínuo. A construção essencial é feita no intervalo $I = [0, 1]$.

## Partição diádica do intervalo unitário

Consideramos uma partição, ou malha, desse intervalo $[0, 1]$ definida pelos pontos *diádicos* (i.e. números racionais cujo denominador é uma potência de 2)
$$
D_n = \left\{\frac{k}{2^{n-1}}; \; k = 0, 1, \ldots, 2^{n-1}\right\}, \qquad n\in \mathbb{N}.
$$
E a união de todos esses pontos é denotada por
$$
D = \cup_{n\in \mathbb{N}} D_n.
$$

```julia:dyadic_points
#hideall
using Plots
theme(:ggplot2)
N = 4
tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:N]
plot(title = "Malha formada por pontos diádicos", titlefont = 10, xaxis = "t", yaxis = "n")
for n in 1:N
    scatter!(tt[n], [0], markersize = 16 - 3n, label = "D$n")
end
savefig(joinpath(@OUTPUT, "dyadic_points.svg"))
```
\fig{dyadic_points}

## Processo discreto i.i.d.

Como dito, o processo de Wiener será obtido como limite de processos obtidos por interpolação de partes finitas de um processo discreto i.i.d. definido em $D$.

Com esse fim, considere um processo discreto *i.i.d.* $\{Z_d\}_{d\in D}$, onde as variáveis $Z_d$ são mutuamente independentes e dadas por $Z_d \sim \mathcal{N}(0, 1)$. Como $D$ é enumerável, podemos considerar o conjunto $\Omega = \mathbb{R}^D$ como espaço amostral, e por $\mathcal{A}$ a $\sigma$-álgebra gerada por $\pi_d^{-1}(\mathcal{E})$, onde $E$ é mensurável e $\pi_d : \Omega \rightarrow \mathbb{R}$ leva um caminho $x\in \Omega$ no elemento $\pi_d x = x(d)$, em $d\in D$.

## Sequência de processos

Para cada $n\in \mathbb{N}$, definimos o processo discreto $\{W_d^n\}_{d\in D_n}$, na malha finita $D_n$, da seguinte forma.

Primeiramente, sendo $D_1 = \{0, 1\}$, definimos
$$
W_0^1 = 0, \quad W_1^1 = Z_1.
$$
Para $n = 2$, temos $D_2 = \{0, 1/2, 1\}$. A ideia é estender $\{W_d^1\}_{d\in D_1}$ para um $\{W_d^2\}_{d\in D_2}$, em $D_2\supset D_1$. Fazemos
$$
W_0^2 = W_0^1, \quad W_1^2 = W_1^1, \quad W_{1/2}^2 = \frac{W_0 + W_1}{2} + \frac{Z_{1/2}}{2^{n/2}}.
$$

Agora, continuamos por indução, para estender o processo $\{W_d^n\}_{d\in D_n}$, em $D_n$, para um processo $\{W_d^{n+1}\}_{d\in D_{n+1}}$, em $D_{n+1}$. Para isso, começamos fazendo, naturalmente,
$$
W_d^{n+1} = W_d^n, \qquad \forall d\in D_n.
$$
Agora, para $d \in D_{n+1} \setminus D_n$, tomamos a média em relação aos valores adjacentes $d \pm 1/2^{n+1}$ e somamos uma fração apropriada de $Z_d$:
$$
W_d^{n+1} = \frac{W_{d - 1/2^{n+1}} + W_{d + 1/2^{n+1}}}{2} + \frac{Z_d}{2^{n/2+1}}.
$$

```julia:sequenciaWn
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 4
tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:N]
W = [[0, randn()]]
for n in 2:N
    push!(W, zeros(2^(n-1) + 1))
    W[end][begin:2:end] .= W[end-1]
    W[end][begin+1:2:end-1] .= (W[end][begin:2:end-2] + W[end][begin+2:2:end])/2 .+ randn()
end
plot(tt, W, title = "Sequência W_d^n para n = 1:$N", titlefont = 10, xaxis = "t", yaxis = "W", marker = :circle, label = permutedims(1:N), legend = :topleft)
savefig(joinpath(@OUTPUT, "sequenciaWn.svg"))
```
\fig{sequenciaWn}

