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
W_0^2 = W_0^1, \quad W_1^2 = W_1^1, \quad W_{1/2}^2 = \frac{W_0^2 + W_1^2}{2} + \frac{Z_{1/2}}{2^{n/2}}.
$$

Agora, continuamos por indução, para estender o processo $\{W_d^n\}_{d\in D_n}$, em $D_n$, para um processo $\{W_d^{n+1}\}_{d\in D_{n+1}}$, em $D_{n+1}$. Para isso, começamos fazendo, naturalmente,
$$
W_d^{n+1} = W_d^n, \qquad \forall d\in D_n.
$$
Agora, para $d \in D_{n+1} \setminus D_n$, tomamos a média em relação aos valores adjacentes $d \pm 1/2^{n+1}$ e somamos uma fração apropriada de $Z_d$:
$$
W_d^{n+1} = \frac{W_{d - 1/2^{n+1}}^n + W_{d + 1/2^{n+1}}^n}{2} + \frac{Z_d}{2^{n/2+1}}.
$$

```julia:sequenciaWn
#hideall
using Plots
using Random
theme(:ggplot2)
rng = Xoshiro(123)
N = 3
plts = []
for j in 1:4
    ttn = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:2*j]
    Wn = [[0, randn(rng)]]
    for n in 2:2*j
        push!(Wn, zeros(2^(n-1) + 1))
        Wn[end][begin:2:end] .= Wn[end-1]
        Wn[end][begin+1:2:end-1] .= (Wn[end][begin:2:end-2] + Wn[end][begin+2:2:end])/2 .+ randn(rng, 2^(n-2))
    end
    push!(
        plts,
        plot(ttn, Wn, title = "Caminhos amostrais de Wⁿ, n = 1, ..., $(2j)", titlefont = 10, xaxis = "t", yaxis = "W", ylims = (-3, 3), marker = :circle, markersize = 3, label = false)
    )
end
plot(plts..., layout = (2, 2), size = (800, 600))
savefig(joinpath(@OUTPUT, "sequenciaWn.svg"))
```
\fig{sequenciaWn}

## Independência

Observe que cada $W_d^n$ só depende das variáveis $\{Z_d\}_{d\in D_n}$, que são independentes de $\{Z_d\}_{d \in D \setminus D_n}$. Portanto, os processos $(W_d^n)_{d\in D_n}$ e $\{Z_d\}_{d \in D \setminus D_n}$ são independentes.

Agora, vamos ver que os incrementos de cada processo $\{W_d^n\}_{d\in D_n}$ são independentes. Para $n = 1$, isso é trivial, já que só há um incremento, $W_1^1 - W_0^0 = Z_1$. Para $n = 2$, temos apenas dois incrementos,
$$
\Delta_{1/2}^2 = W_1^2 - W_{1/2}^2 = W_1^2 - \frac{W_0^2 + W_1^2}{2} - \frac{Z_{1/2}}{2^{n/2+1}} = \frac{W_1^2 - W_0^2}{2} - \frac{Z_{1/2}}{2^{n/2+1}} = \frac{1}{2}Z_1 - \frac{Z_{1/2}}{2^{n/2+1}}
$$
e
$$
\Delta_0^2 = W_{1/2}^2 - W_0^2 = \frac{W_0^2 + W_1^2}{2} + \frac{Z_{1/2}}{2^{n/2+1}} - W_0^2 = \frac{W_1^2 - W_0^2}{2} + \frac{Z_{1/2}}{2^{n/2+1}} = \frac{1}{2}Z_1 + \frac{Z_{1/2}}{2^{n/2+1}}.
$$
Aparentemente, não são independentes. Mas observe que
$$
\Delta_{1/2}^2 + \Delta_0^2 = Z_1 \qquad \Delta_{1/2}^2 - \Delta_0^2 = -\frac{Z_{1/2}}{2^{n/2}}.
$$
Como $Z_0$ e $Z_1$ são independentes, a soma e a diferença dos incrementos são indendentes entre si. Como são normais, os incrementos em si também tem que ser independentes entre si.


Além disso, dados $d_1, d_2, d_3 \in D_n$ consecutivos, i.e. com $d_j = d_{j-1} + 1/2^{n-1}$, $j = 2, 3$, temos
$$
W_{d_3}^n - W_{d_2}^n = 
$$