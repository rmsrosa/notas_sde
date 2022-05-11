@def title = "Existência"

# {{ get_title }}

O processo conhecido atualmente como processo de Wiener foi introduzido, como modelo para o movimento Browniano, por N. Wiener, em 1923, junto com a demonstração de existência de tal processo. Vamos, a seguir, discutir uma demonstração dada por Paul Lévy, conforme apresentada em Morters & Peres (2010) e Evans (2013).

A demonstração é obtida por um processo de limite, a partir de um processo estocástico discreto que é interpolado para um processo contínuo. A construção essencial é feita no intervalo $I = [0, 1]$.

## Partição diádica do intervalo unitário

Consideramos uma partição, ou malha, desse intervalo $[0, 1]$ definida pelos pontos *diádicos* (números racionais cujo denominador é uma potência de 2)
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

Como dito, o processo de Wiener será obtido como limite de processos obtidos por interpolação de partes finitas de um processo discreto i.i.d., que vamos definir em $D$.

Com esse fim, considere um processo discreto *i.i.d.* $\{Z_d\}_{d\in D\setminus \{0\}}$, onde as variáveis $Z_d$ são mutuamente independentes e dadas por $Z_d \sim \mathcal{N}(0, 1)$. Como $D$ é enumerável, podemos considerar o conjunto $\Omega = \mathbb{R}^D$ como espaço amostral, e por $\mathcal{A}$ a $\sigma$-álgebra gerada por $\pi_d^{-1}(\mathcal{E})$, onde $E$ é mensurável e $\pi_d : \Omega \rightarrow \mathbb{R}$ leva um caminho $x\in \Omega$ no elemento $\pi_d x = x(d)$, em $d\in D$.

## Sequência de processos

Para cada $n\in \mathbb{N}$, definimos o processo discreto $\{W_d^n\}_{d\in D_n}$, na malha finita $D_n$, da seguinte forma.

Primeiramente, sendo $D_1 = \{0, 1\}$, definimos
$$
W_0^1 = 0, \quad W_1^1 = Z_1.
$$
Para $n = 2$, temos $D_2 = \{0, 1/2, 1\}$. A ideia é estender $\{W_d^1\}_{d\in D_1}$ para um $\{W_d^2\}_{d\in D_2}$, em $D_2\supset D_1$. Fazemos
$$
W_0^2 = W_0^1, \quad W_1^2 = W_1^1, \quad W_{1/2}^2 = \frac{W_0^1 + W_1^1}{2} + \frac{Z_{1/2}}{2}.
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
\Delta_{1/2}^2 = W_1^2 - W_{1/2}^2 = W_1^1 - \frac{W_0^1 + W_1^1}{2} - \frac{Z_{1/2}}{2} = \frac{W_1^1 - W_0^1}{2} - \frac{Z_{1/2}}{2} = \frac{Z_1}{2} - \frac{Z_{1/2}}{2}
$$
e
$$
\Delta_0^2 = W_{1/2}^2 - W_0^2 = \frac{W_0^1 + W_1^1}{2} + \frac{Z_{1/2}}{2} - W_0^2 = \frac{W_1^1 - W_0^1}{2} + \frac{Z_{1/2}}{2} = \frac{Z_1}{2} + \frac{Z_{1/2}}{2}.
$$
Aparentemente, não são independentes. Mas como $Z_1$ e $Z_{1/2}$ são independentes e são normais identicamente distribuídas (ambas são $\mathcal{N}(0,1)$), a soma e a diferença de $Z_1/2$ e $Z_{1/2}/2$, que são exatamente os incrementos, são, também, normais independentes e identicamente distribuídas, com distribuição $\mathcal{N}(0, 1/2^2)$, e independentes de $\{Z_d\}_{d \in D \setminus D_2}$.

Agora, considerando $d \in D_{n+1}\setminus D_n$, lembremos que
$$
W_d^{n+1} = \frac{W_{d - 1/2^{n+1}}^n + W_{d + 1/2^{n+1}}^n}{2} + \frac{Z_d}{2^{n/2+1}}.
$$
Podemos escrever dois incrementos consecutivos como
$$
W_d^{n+1} - W_{d - 1/2^{n+1}}^n = \frac{W_{d + 1/2^{n+1}}^n - W_{d - 1/2^{n+1}}^n}{2} + \frac{Z_d}{2^{n/2+1}}
$$
e
$$
W_{d + 1/2^{n+1}}^{n+1} - W_d^{n+1} = \frac{W_{d + 1/2^{n+1}}^n - W_{d - 1/2^{n+1}}^n}{2} - \frac{Z_d}{2^{n/2+1}}.
$$

Assumindo, por indução, que $W_{d + 1/2^{n+1}}^n - W_{d - 1/2^{n+1}}^n$ e $Z_d$ são independentes e que $W_{d + 1/2^{n+1}}^n - W_{d - 1/2^{n+1}}^n \sim \mathcal{N}(0, 1/2^n)$, então
$$
\frac{W_{d + 1/2^{n+1}}^n - W_{d - 1/2^{n+1}}^n}{2} \quad \text{e} \quad \frac{Z_d}{2^{n/2+1}}
$$
são independentes e identicamente distribuídas, com distribuição $\mathcal{N}(0, 1/2^{n+1})$. Assim, as suas somas e diferenças, que são exatamente dois passos consecutivos, também são independentes e identicamente distribuídos, com distribuição $\mathcal{N}(0, 1/2^{n+1})$.

Isso mostra que dois passos consecutivos de $\{W_d^{n+1}\}_{d\in D_{n+1}}$, com ponto em comum $d$ em $d \in D_{n+1}\setminus D_n$, são independentes. Agora, se $d \in D_n$, então $d \pm 1/2^{n+1} \in D_{n+1} \setminus D_n$. FALTA ARGUMENTAR QUE ESSES SÃO INDEPENDENTES.

Agora que sabemos que quaisquer dois passos consecutivos são independentes e com a mesma distribuição normal, segue que todos os passos são mutuamente independentes, já que são Gaussianas.

Disso segue, também, que passos "largos" disjuntos $W_{d_2}^{n+1} - W_{d_1}^{n+1}$, $W_{d_3}^{n+1} - W_{d_2}^{n+1}$, ..., com $d_1 < d_2 < d_3 < \ldots < d_n$ em $D_{n+1}$, também são independentes.

## Representação em termos de wavelets

A sequência de processos $\{W_d^n\}_{d\in D_n}$ construída acima pode ser expressa de outra forma.

Começamos interpolando linearmente os processos em $\{0, Z_1\}$ e $\{Z_d\}_{d\in D_n \setminus D_{n-1}}$, para $n \in \mathbb{N}$. Mais precisamente, definimos
$$
Y_t^1 = tZ_1, \qquad 0 \leq t \leq 1,
$$
e
$$
Y_t^n = \begin{cases}
  \displaystyle \frac{1}{2^{(n+1)/2}} Z_d, & t = d \in D_n \setminus D_{n-1}, \\
  0, & t \in D_{n-1}, \\
  \textrm{linear}, & t \in [0, 1] \setminus D_n.
\end{cases}
$$

Também podemos escrever cada $Y_t^n$ como combinação linear de wavelets conhecidas da **base de Faber–Schauder**. Mais precisamente, temos
$$
Y_t^n = \sum_{d\in D_n} Z_d s_d(t),
$$
onde cada função $s_d(\cdot)$ é uma "cabana" definida no intervalo $[0, 1]$ da seguinte forma:
$$
s_0(t) = 0, \quad s_1(t) = t, \quad s_{1/2}(t) = \min\{t, 2 - t\},
$$
e, para $d \in D_j \setminus D_{j-1}$,
$$
s_d(t) = 2^{(j-1)/2}\begin{cases}
  0, & t \leq d - \frac{1}{2^j}, \\
  t - d + \frac{1}{2^j}, & d - \frac{1}{2^j} \leq t \leq d, \\
  d + \frac{1}{2^j} - t, & d \leq t \leq d + \frac{1}{2^j}, \\
  0, & t \geq d + \frac{1}{2^j}
\end{cases} \qquad d \in D_{j+1} \setminus D_{j}, \; j \in \mathbb{N}.
$$
Observe que, fazendo $\tau = t - d + 1/2^j$, 
$$
\int_0^1 s_d(t)^2 \;\mathrm{d}t = 2 \times 2^{j-1} \times \left.\frac{\tau^2}{2}\right|_{\tau = 0}^{s = 1/2^j} = 2^{j-1}\frac{1}{2^{2j}} = \frac{1}{2^{j + 1}}.
$$

Cada $s_d$ pode ser visto como uma primitiva de outra base de wavelets, a **base de Haar**, formada por funções constantes por partes,
$$
\psi_1(t) = 1, \quad 
\psi_d(t) = \frac{\mathrm{d}s_d}{\mathrm{d}t} = \begin{cases}
  0, & t \leq d - \frac{1}{2^{j-1}}, \\
  2^{j/2}, & d - \frac{1}{2^{j-1}} \leq t \leq d, \\
  - 2^{j/2}, & d \leq t \leq d + \frac{1}{2^{j-1}}, \\
  0, & t \geq d + \frac{1}{2^{j-1}}
\end{cases} \qquad d \in D_{j+1} \setminus D_j, \; j\in \mathbb{N}.
$$
Observe que
$$
\int_0^1 \psi_d(t)^2 \;\mathrm{d}t = 2 \times (2^{j/2})^2 \frac{1}{2^{j-1}} = 1.
$$

Agora, observamos que
$$
W_d^n = \sum_{j = 1}^n Y_d^j, \qquad d \in D_n.
$$
Podemos provar isso por indução. Temos, primeiramente, para $n = 1$, como $Y_t^1 = tZ_1$,
$$
W_0^1 = 0 = Y_0, \qquad W_1^1 = Z_1 = Y_1^1.
$$
Agora, supondo o resultado válido até $n\in \mathbb{N}$, vamos prová-lo para $n+1$. Consideramos, primeiro, $d \in D_n$. Nesses pontos, $W_d^{n+1} = W_d^n$, de modo que, pela hipótese de indução,
$$
W_d^{n+1} = W_d^n = \sum_{j=1}^n Y_d^j.
$$
Agora, para $d \in D_{n+1} \setminus D_n$,
$$
W_d^{n+1} = \frac{W_{d - 1/2^{n+1}}^n + W_{d + 1/2^{n+1}}^n}{2} + \frac{Z_d}{2^{n/2+1}} = \frac{1}{2}\sum_{j=1}^n \left( Y_{d - 1/2^{n+1}}^j + Y_{d + 1/2^{n+1}}^j \right) + + \frac{Z_d}{2^{n/2+1}}.
$$
Como $Z_d/2^{(n+1)/2} = Y_d^{n+1}$, temos
$$
W_d^{n+1} = \frac{1}{2}\sum_{j=1}^n \left( Y_{d - 1/2^{n+1}}^j + Y_{d + 1/2^{n+1}}^j \right) + Y_d^{n+1}.
$$
FALTA ARGUMENTAR QUE O SOMATÓRIO É IGUAL A $\sum_{j=1}^n Y_d^j$, PARA DEDUZIRMOS QUE
$$
W_d^{n+1} = \sum_{j=1}^{n+1} Y_d^j.
$$

## Estimativa para as variáveis aleatórias i.i.d. normais

Para a convergência, precisamos, antes, obter uma estimativa para as variáveis aleatórias do processo $\{Z_d\}_{d\in D}$.

Como $Z_d \sim \mathcal{N}(0, 1)$ e a função de densidade de probabilidade dessa distribuição é simétrica em relação a origem e é dada pela Gaussiana padrão, temos, para $r \geq 0$,
$$
\mathbb{P}(|Z_d| \geq r) = \frac{2}{\sqrt{2\pi}}\int_{r}^\infty e^{-\frac{s^2}{2}} \;\mathrm{d}s \leq \frac{2}{\sqrt{2\pi}}e^{-\frac{r^2}{2}} \int_{r}^\infty e^{-\frac{s^2}{4}} \;\mathrm{d}s.
$$
Podemos limitar a integral por
$$
\int_0^\infty e^{-\frac{s^2}{4}} \;\mathrm{d}s = \frac{1}{2} \int_\mathbb{R} e^{-\frac{s^2}{4}} \;\mathrm{d}s = \frac{\sqrt{2}}{2}\int_\mathbb{R} e^{-\frac{\tau^2}{2}} \;\mathrm{d}\tau = \frac{\sqrt{2}}{2}.
$$

Assim,
$$
\mathbb{P}(|Z_d| \geq r) \leq \frac{2}{\sqrt{2\pi}}e^{-\frac{r^2}{2}} \frac{\sqrt{2}}{2} = \frac{1}{\sqrt{\pi}}e^{-\frac{r^2}{2}}.
$$

## Convergência






