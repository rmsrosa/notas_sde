@def title = "Existência de processos de Wiener"

# {{ get_title }}

O tipo de processo conhecido atualmente como processo de Wiener foi introduzido, como modelo para o movimento Browniano, por Norbert Wiener, em 1923, junto com a demonstração de existência de tal processo. Vamos, a seguir, discutir uma demonstração dada por Paul Lévy, conforme apresentada em Morters & Peres (2010) e Evans (2013).

A demonstração é obtida por um processo de limite, a partir de um processo estocástico discreto que é interpolado para um processo contínuo. A construção crucial é feita no intervalo $I = [0, 1]$. A partir daí, podemos transladar e concatenar processos independentes em $[0, 1]$ para obter um processo de Wiener em $[0, \infty)$.

Veremos duas formas de definir essa sequência aproximante de processos no intervalo $[0, 1]$. Uma facilita mostrarmos que os incrementos são normais independentes e identicamente distribuídos, enquanto que a outra facilita a demonstração de convergência da sequência.

Vale ressaltar que um processo de Wiener não é único, assim como não há uma única variável aleatória normal. Podemos, naturalmente, ter várias normais, independentes umas das outras. No caso do processo de Wiener, podemos, por exemplo, contruir um processo através do limite de interpolações de diferentes sequências de variáveis normais, obtendo diferentes processos de Wiener.

## Partição diádica do intervalo unitário

A interpolação é feita a partir de malhas formadas por números *diádicos* (números racionais cujo denominador é uma potência de 2) entre zero e um. Mais precisamente, considere os conjuntos
$$
D_n = \left\{\frac{k}{2^{n-1}}; \; k = 0, 1, \ldots, 2^{n-1}\right\}, \qquad n\in \mathbb{N}.
$$
A união de todos esses pontos é denotada por
$$
D = \cup_{n\in \mathbb{N}} D_n.
$$

```julia:dyadic_points
#hideall
using Plots
theme(:ggplot2)
N = 4
tt = [[j/2^(n-1) for j in 0:2^(n-1)] for n in 1:N]
plot(title = "Malhas formadas por pontos diádicos", titlefont = 10, xaxis = "\$t\$", yaxis = "\$n\$")
for n in 1:N
    scatter!(tt[n], [n], ylims = (0, n+2), markersize = 16 - 3n, label = "\$D_$n\$")
end
savefig(joinpath(@OUTPUT, "dyadic_points.svg"))
```
\fig{dyadic_points}

## Processo discreto i.i.d.

Como dito, um processo de Wiener pode ser obtido como limite de processos obtidos por interpolação de partes finitas de um processo discreto i.i.d., que vamos definir em $D$.

Com esse fim, considere um processo discreto *i.i.d.* $\{Z_d\}_{d\in D\setminus \{0\}}$, onde as variáveis $Z_d$ são mutuamente independentes e dadas por $Z_d \sim \mathcal{N}(0, 1)$. Como $D$ é enumerável, podemos considerar o conjunto $\Omega = \mathbb{R}^D$ como espaço amostral, e por $\mathcal{A}$ a $\sigma$-álgebra gerada por $\pi_d^{-1}(\mathcal{E})$, onde $E$ é mensurável e $\pi_d : \Omega \rightarrow \mathbb{R}$ leva um caminho $x\in \Omega$ no elemento $\pi_d x = x(d)$, em $d\in D$. Denotamos a medida de probabilidade por $\mathbb{P}$. Para simplificar, escrevemos $Z_0 = 0$, já que queremos que o processo de Wiener limite satisfaça $W_0 = Z_0 = 0$.

## Sequência de processos discretos

Vamos primeiro construir uma sequência de processos discretos, cada um com parâmetro em $D_n$, $n\in\mathbb{N}$. Estes processos serão interpolados para processos em $[0, 1]$. Por motivo de clareza, vamos denotar os processos discretos por $\{X_d^n\}_{d\in D_n}$. As interpolações contínuas serão denotadas por $\{W_t^n\}_{t\in [0, 1]}$. E, no limite, teremos o processo contínuo $\{W_t\}_{t\in [0, 1]}$. Por serem extensões, teremos $W_d = X_d^n = X_d^n$, nos pontos diádicos $d\in D_n$.

Para cada $d\in D_n$, esperamos ter $X_d^n = W_d = W_d - W_0 \sim \mathcal{N}(0, d)$. Então seria natural pensarmos em definir $X_d^n$ como $Z_d / \sqrt{d}$ (já que $Z_d \sim \mathcal{N}(0, 1)$, de modo que $Z_d/\sqrt{d} \sim \mathcal{N}(0, d)$) e interpolar, de alguma forma, para $t\in I \setminus D_n$. Apesar disso convergir para um processo, este não terá as propriedades desejadas. Mas uma variação disso funciona.

Vamos, então, definir, para cada $n\in \mathbb{N}$, o processo discreto $\{X_d^n\}_{d\in D_n}$, na malha finita $D_n$, da seguinte forma. Primeiramente, sendo $D_1 = \{0, 1\}$, definimos
$$
X_0^1 = 0, \quad X_1^1 = Z_1.
$$
Para $n = 2$, temos $D_2 = \{0, 1/2, 1\}$. A ideia é estender $\{X_d^1\}_{d\in D_1}$ para um $\{X_d^2\}_{d\in D_2}$, em $D_2\supset D_1$, mantendo os processos $X_0^1, X_1^1$ em $d = 0, 1$ e adicionando uma fração de $Z_{1/2}$ à interpolação linear de $X_0^1 = 0$ e $X_1^1 = Z_1$, em $d = 1/2$. Mais precisamente, fazemos
$$
X_0^2 = X_0^1, \quad X_1^2 = X_1^1, \quad X_{1/2}^2 = \frac{X_0^1 + X_1^1}{2} + \frac{Z_{1/2}}{2}.
$$

Agora, continuamos por indução, estendendo o processo $\{X_d^n\}_{d\in D_n}$, em $D_n$, para um processo $\{X_d^{n+1}\}_{d\in D_{n+1}}$, em $D_{n+1}$. Para isso, começamos fazendo
$$
X_d^{n+1} = X_d^n, \qquad \forall d\in D_n.
$$
Agora, para $d \in D_{n+1} \setminus D_n$, tomamos a média em relação aos valores adjacentes $d \pm 1/2^n$ e somamos uma fração apropriada de $Z_d$:
$$
X_d^{n+1} = \frac{X_{d - 1/2^n}^n + X_{d + 1/2^n}^n}{2} + \frac{Z_d}{2^{(n + 1)/2}}.
$$

Observe que, com $n = 1$, esta fórmula coincide com a fórmula acima dada explicitamente para $\{X_d^2\}_{d\in D_2}$.

A escolha da fração $1/2^{(n+1)/2}$ no termo $Z_d$ é para que esta fração tenha a variância adequada, como veremos a seguir.

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
        plot(ttn, Wn, title = "Caminhos amostrais de \$\\{W_d^n\\}_{d\\in D_n}\$, \$n = 1, \\ldots, $(2j)\$", titlefont = 10, xaxis = "\$t\$", yaxis = "\$W\$", ylims = (-3, 3), marker = :circle, markersize = 3, label = false)
    )
end
plot(plts..., layout = (2, 2), size = (800, 600))
savefig(joinpath(@OUTPUT, "sequenciaWn.svg"))
```
\fig{sequenciaWn}

## Processos discretos e incrementos são Gaussianos

Observe que os processos são construídos como combinações lineares de variáveis normais independentes. Sendo assim, os processos $\{X_d^n\}_{d\in D_n}$ são processos Gaussianos, i.e. a sua distribuição conjunta é uma normal multivariada (note que cada $D_n$ é finito, então esses processos são *vetores* aleatórios).

É importante ressaltar, no entanto, que cada $\{X_d^n\}_{d\in D_n}$ não é formado por variáveis aleatórias independentes.

Da mesma forma, os incrementos são combinações lineares de normais independentes, portanto também são normais multivariadas. Em princípio, também não seriam independentes. Mas veremos a seguir que os incrementos têm uma estrutura particular, de tal forma que são, sim, independentes.

## Independência e distribuição dos incrementos

Observe que cada $X_d^n$ só depende das variáveis $\{Z_d\}_{d\in D_n}$, que são independentes de $\{Z_d\}_{d \in D \setminus D_n}$. Portanto, os processos $(X_d^n)_{d\in D_n}$ e $\{Z_d\}_{d \in D \setminus D_n}$ são independentes.

Agora, vamos ver que os incrementos de cada processo $\{X_d^n\}_{d\in D_n}$ são independentes. Para $n = 1$, isso é vácuo, já que só há um incremento, $X_1^1 - X_0^0 = Z_1$. Para $n = 2$, temos apenas dois incrementos,
$$
\Delta_{1/2}^2 = X_1^2 - X_{1/2}^2 = X_1^1 - \frac{X_0^1 + X_1^1}{2} - \frac{Z_{1/2}}{2} = \frac{X_1^1 - X_0^1}{2} - \frac{Z_{1/2}}{2} = \frac{Z_1}{2} - \frac{Z_{1/2}}{2}
$$
e
$$
\Delta_0^2 = X_{1/2}^2 - X_0^2 = \frac{X_0^1 + X_1^1}{2} + \frac{Z_{1/2}}{2} - X_0^2 = \frac{X_1^1 - X_0^1}{2} + \frac{Z_{1/2}}{2} = \frac{Z_1}{2} + \frac{Z_{1/2}}{2}.
$$
Aparentemente, esses incrementos poderiam não ser independentes, mas são. Como $Z_1$ e $Z_{1/2}$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1)$, então $Z_1/2$ e $Z_{1/2}/2$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1/4)$. Assim, a soma e a diferença de $Z_1/2$ e $Z_{1/2}/2$, que são exatamente os incrementos, são, também, normais independentes e identicamente distribuídas, com distribuição $\mathcal{N}(0, 1/2)$. Além disso, também são independentes de $\{Z_d\}_{d \in D \setminus D_2}$.

Agora, vamos assumir, em um argumento de indução, que os incrementos de $\{X_d^n\}_{d \in D_n}$ são independentes e identicamente distribuídos, com, em particular, 
$$
X_{d + 1/2^{n-1}}^n - X_d^n \sim \mathcal{N}\left(0, \frac{1}{2^{n-1}}\right).
$$
Além disso, assumimos que são independentes de $\{Z_d\}_{d\in D \setminus D_n}$.

Vamos mostrar que o mesmo vale para $\{X_d^{n+1}\}_{d\in D_{n+1}}$, com incrementos consecutivos sendo normais independentes com média zero, variância $1/2^n$ e independentes de $\{Z_d\}_{d\in D \setminus D_{n+1}}$.

Considere $d \in D_{n+1}\setminus D_n$, lembremos que
$$
X_d^{n+1} = \frac{X_{d - 1/2^n}^n + X_{d + 1/2^n}^n}{2} + \frac{Z_d}{2^{(n+1)/2}}.
$$
Os dois incrementos consecutivos com ponto comum $d$ são
$$
X_d^{n+1} - X_{d - 1/2^n}^{n+1} = \frac{X_{d + 1/2^n}^n - X_{d - 1/2^n}^n}{2} + \frac{Z_d}{2^{(n+1)/2}}
$$
e
$$
X_{d + 1/2^n}^{n+1} - X_d^{n+1} = \frac{X_{d + 1/2^n}^n - X_{d - 1/2^n}^n}{2} - \frac{Z_d}{2^{(n+1)/2}}.
$$

Observe que $X_{d + 1/2^n}^n - X_{d - 1/2^n}^n$ é um passo consecutivo do processo $\{X_d^n\}_{d\in D_n}$. Assim, usando a hipótese de indução, temos que $X_{d + 1/2^n}^n - X_{d - 1/2^n}^n$ e $Z_d$ são independentes e que $X_{d + 1/2^n}^n - X_{d - 1/2^n}^n \sim \mathcal{N}(0, 1/2^n)$. Assim, temos
$$
\frac{X_{d + 1/2^n}^n - X_{d - 1/2^n}^n}{2} \quad \text{e} \quad \frac{Z_d}{2^{(n+1)/2}} \sim \mathcal{N}\left(0, \frac{1}{2^{n+1}}\right).
$$

Portanto, as suas somas e diferenças, que são exatamente os dois passos consecutivos, também são independentes e identicamente distribuídos, com distribuição $\mathcal{N}(0, 1/2^{n+1})$.

Isso mostra que dois passos consecutivos de $\{X_d^{n+1}\}_{d\in D_{n+1}}$, com ponto em comum $d$ em $d \in D_{n+1}\setminus D_n$, são independentes e a distribuição dada como na indução. Agora, se $d \in D_n\setminus$, então $d \pm 1/2^n \in D_{n+1} \setminus D_n$. Nesse caso, os passos consecutivos envolvem um estêncil de cinco pontos diádicos:
$$
X_d^{n+1} - X_{d - 1/2^n}^{n+1} = X_d^n - \frac{X_{d}^n + X_{d - 1/2^{n-1}}^n}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}} = \frac{X_{d}^n - X_{d - 1/2^{n-1}}^n}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}}
$$
e
$$
X_{d + 1/2^n}^{n+1} - X_d^{n+1} = \frac{X_{d + 1/2^{n-1}}^n - X_d^n}{2} + \frac{Z_{d+1/2^n}}{2^{(n+1)/2}}.
$$
Observe que os dois incrementos no lado direito das duas expressões acima são incrementos consecutivos do processo $\{X_d^n\}_{d\in D_n}$ e que os termos restantes são variáveis distintas de $\{Z_d\}_{d\in D\setminus D_n}$. Pela hipótese de indução, todas essas variáveis são mutuamente independentes. Portanto, os dois incrementos acima de $\{X_d^{n+1}\}_{d\in D_{n+1}}$ também são independentes entre si. Além disso, como esses termos do lado direito tem distribuição normal $\mathcal{N}(0, 1/2^{n+1})$, então os incrementos tem distribuição normal $\mathcal{N}(0, 1/2^n)$.

Provamos que quaisquer dois incrementos consecutivos de $\{X_d^{n+1}\}_{d\in D_{n+1}}$ são independentes dois a dois. Como a distribuição conjunta é normal, segue, da independência dois a dois, que todos os incrementos consecutivos são mutuamente independentes.

Disso segue, também, que incrementos disjuntos a "passos largos" $X_{d_2}^{n+1} - X_{d_1}^{n+1}$, $X_{d_3}^{n+1} - X_{d_2}^{n+1}$, ..., com $d_1 < d_2 < d_3 < \ldots < d_n$ em $D_{n+1}$, também são independentes, pois cada incremento desses é combinação linear de passos "curtos" independentes distintos.

Finalmente, como eles só envolvem $\{Z_d\}_{d\in D \setminus D_{n+1}}$, então os incrementos de $\{X_d^{n+1}\}_{d\in D_{n+1}}$ e os processos restantes $\{Z_d\}_{d\in D \setminus D_{n+1}}$ também são mutuamente independentes.

## Interpolação e representação em termos de wavelets

A sequência de processos $\{X_d^n\}_{d\in D_n}$ construída acima pode ser expressa de outra forma e que nos será útil na demonstração da convergência dessa sequência. Vejamos os dois primeiros termos $\{X_d^1\}_{d\in D_1}$ e $\{X_d^2\}_{d\in D_2}$:
$$
X_0^1 = 0, \quad X_1^1 = Z_1,
$$
e
$$
X_0^2 = 0, \quad X_{1/2}^2 = \frac{1}{2}Z_1 + \frac{1}{2}Z_{1/2}, \quad X_1^2 = Z_1.
$$
Começamos interpolando o primeiro termo de forma linear, para obter o processo contínuo
$$
W_t^1 = tZ_1, \qquad 0 \leq t \leq 1.
$$
Visando a generalização que queremos obter, escrevemos isso na forma
$$
W_t^1 = s_1(t)Z_1, \qquad 0\leq t \leq 1,
$$
onde
$$
s_1(t) = t, \qquad 0 \leq t \leq 1.
$$

Agora, observe que, além de $W_0^1 = X_0^1$, $W_1^1 = X_1^1$, podemos escrever o ponto médio como $W_{1/2}^1 = Z_1/2 = s_1(1/2)Z_1$, que é exatamente o primeiro termo de $X_{1/2}^2$. Assim, podemos pensar na interpolação de $\{X_d^2\}_{d\in D_2}$ dada por
$$
W_t^2 = W_t^{1/2} + s_{1/2}(t)Z_{1/2} = s_1(t)Z_1 + s_{1/2}(t)Z_{1/2},
$$
onde $s_{1/2}(\cdot)$ é uma função linear por partes que se anula em $t = 0$ e $t = 1$ e vale $1/2$ em $t = 1/2$. Ou seja, $s_{1/2}(\cdot)$ é a função "cabana"
$$
s_{1/2}(t) = \min\{t, 1 - t\}, \qquad 0 \leq t \leq 1.
$$

Agora, vejamos os termo de $X_d^3$:
$$
X_0^3 = 0, \; X_{1/4}^2 = \frac{1}{4}Z_1 + \frac{1}{4}Z_{1/2} + \frac{1}{4}Z_{1/4}, \; X_{1/2}^2 = \frac{1}{2}Z_1 + \frac{1}{2}Z_{1/2}, \; X_{3/4}^3 = \frac{3}{4}Z_1 + \frac{1}{4}Z_{1/2} + \frac{1}{4}Z_{3/4}, \; X_1^3 = Z_1;
$$
Observe que esse processo pode ser visto como os valores, em $D_3$, do processo contínuo obtido por interpolação linear por partes dado por
$$
W_t^3 = W_t^2 + s_{1/4}(t)Z_{1/4} + s_{3/4}(t)Z_{3/4} = s_1(t)Z_1 + s_{1/2}(t)Z_{1/2} + s_{1/4}(t)Z_{1/4} + s_{3/4}(t)Z_{3/4},
$$
onde $s_{1/4}(\cdot)$ e $s_{3/4}(\cdot)$ são, também, funções do tipo cabana, com suporte em $[0, 1/2]$ e $[1/2, 1]$ e valor máximo $1/4$:
$$
s_{1/4}(t) = \max\{0, \min\{t, 1/2 - t\}\}, \quad s_{3/4}(t) = \max\{0, \min\{t - 1/2, 1 - t\}.\}
$$

```julia:faberschauder
#hideall
using Plots
theme(:ggplot2)
t = range(0.0, 1.0, length = 200)
s_1 = copy(t) ## n = 1
s_1_2 = 2^(1/2) * min.(t, 1 .- t) ## n  = 2
s_1_4 = 2 * max.(0, min.(t, 1/2 .- t)) ## n = 3
s_3_4 = 2 * max.(0, min.(t .- 1/2, 1 .- t)) ## n = 3
s_1_8 = 2^(3/2) * max.(0, min.(t, 1/4 .- t)) ## n = 4
s_3_8 = 2^(3/2) * max.(0, min.(t .- 1/4, 1/2 .- t)) ## n = 4
s_5_8 = 2^(3/2) * max.(0, min.(t .- 1/2, 3/4 .- t)) ## n = 4
s_7_8 = 2^(3/2) * max.(0, min.(t .- 3/4, 1 .- t)) ## n = 4
plot(title = "Funções da base de Faber–Schauder", titlefont = 10, xaxis = "\$t\$", ylims = (0.0, 1.0), legend = :topleft)
plot!(t, s_1, label = "\$s_1(t)\$")
plot!(t, s_1_2, label = "\$s_{1/2}(t)\$")
plot!(t, s_1_4, label = "\$s_{1/4}(t)\$")
plot!(t, s_3_4, label = "\$s_{3/4}(t)\$")
plot!(t, s_1_8, label = "\$s_{1/8}(t)\$")
plot!(t, s_3_8, label = "\$s_{3/8}(t)\$")
plot!(t, s_5_8, label = "\$s_{5/8}(t)\$")
plot!(t, s_7_8, label = "\$s_{7/8}(t)\$")
savefig(joinpath(@OUTPUT, "faberschauder.svg"))
```
\fig{faberschauder}

Mais geralmente, definimos, para $d \in D_{n+1} \setminus D_n$, $n \in \mathbb{N}$,
$$
s_d(t) = \max\{0, \min\{t - d - 1/2^n, d + 1/2^n - t\}\} = 2^{(n-1)/2}\begin{cases}
  0, & t \leq d - \frac{1}{2^n}, \\
  t - d + \frac{1}{2^n}, & d - \frac{1}{2^n} \leq t \leq d, \\
  d + \frac{1}{2^n} - t, & d \leq t \leq d + \frac{1}{2^n}, \\
  0, & t \geq d + \frac{1}{2^n}
\end{cases}
$$

O que fizemos acima foi mostrar os primeiros passos do processo de indução para provar que os processos contínuos definidos por
$$
W_t^{n+1} = W_t^{n} + \sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d = \sum_{d\in D_{n+1}} s_d(t)Z_d
$$
são interpolações dos processos discretos $\{X_d^n\}_{d\in D_n}$, i.e. $W_d^n = X_d^n$, para todo $d\in D_n$ e todo $n\in\mathbb{N}$. Deixamos a prova completa como exercício. Apenas ressaltamos que os pontos cruciais são (i) observar que cada $s_d(\cdot)$ com $d\in D_{n+1}\setminus D_n$ se anula em todos os pontos $d'\in D_n$ e, também, em $d'\in D_n$ tal que $d' \neq d$, i.e. $s_d(d') = 0$, para todo $d, d'\in D_{n+1}$, $d' \neq d$; (ii) vale $s_d(d) = 1/2^{(n+1)/2}$, para $d\in D_{n+1}\setminus D_n$; e (iii) cada $s_d(\cdot)$ é linear em $[d-1/2^n, d]$ e $[d, d+1/2^n]$, para $d\in D_{n+1}\setminus D_n$.

Observe que, fazendo $\tau = t - d + 1/2^n$, temos, para $d\in D_{n+1}\setminus D_n$,
$$
\int_0^1 s_d(t)^2 \;\mathrm{d}t = 2 \times 2^{n-1} \times \left.\frac{\tau^2}{2}\right|_{\tau = 0}^{s = 1/2^n} = 2^{n-1}\frac{1}{2^{2n}} = \frac{1}{2^{n + 1}}.
$$
Cada $s_d$ pode ser visto como uma primitiva de outra base de wavelets, a **base de Haar**, formada por funções constantes por partes,
$$
\psi_1(t) = 1, \quad 
\psi_d(t) = \frac{\mathrm{d}s_d}{\mathrm{d}t} = \begin{cases}
  0, & t \leq d - \frac{1}{2^n}, \\
  2^{(n-1)/2}, & d - \frac{1}{2^n} \leq t \leq d, \\
  - 2^{(n-1)/2}, & d \leq t \leq d + \frac{1}{2^n}, \\
  0, & t \geq d + \frac{1}{2^n}
\end{cases} \qquad d \in D_{n+1} \setminus D_n, \; n\in \mathbb{N}.
$$
Observe, também, que
$$
\int_0^1 \psi_d(t)^2 \;\mathrm{d}t = 2 \times (2^{(n-1)/2})^2 \frac{1}{2^n} = 1.
$$

## Estimativa para as variáveis aleatórias i.i.d. normais

Para a convergência, precisamos, antes, obter uma estimativa para as variáveis aleatórias do processo $\{Z_d\}_{d\in D}$, para que sejam usadas em $\{W_t^n\}$.

Como $Z_d \sim \mathcal{N}(0, 1)$ e a função de densidade de probabilidade dessa distribuição é simétrica em relação a origem e é dada pela Gaussiana padrão, temos, para $r \geq 0$,
$$
\mathbb{P}(|Z_d| \geq r) = \frac{1}{\sqrt{2\pi}}\int_{|s|\geq r} e^{-\frac{s^2}{2}} \;\mathrm{d}s \leq \frac{1}{\sqrt{2\pi}}e^{-\frac{r^2}{4}} \int_{|s| \geq r} e^{-\frac{s^2}{4}} \;\mathrm{d}s.
$$
Limitando a integral e fazendo a mudança de variáveis $s = \sqrt{2}\tau$, obtemos
$$
\mathbb{P}(|Z_d| \geq r) \leq \frac{1}{\sqrt{2\pi}}e^{-\frac{r^2}{4}} \int_\mathbb{R} e^{-\frac{s^2}{4}} \;\mathrm{d}s = \frac{\sqrt{2}}{\sqrt{2\pi}}e^{-\frac{r^2}{4}}\int_\mathbb{R} e^{-\frac{\tau^2}{2}} \;\mathrm{d}\tau = \sqrt{2} e^{-\frac{r^2}{4}}.
$$

A partir disso, obtemos a seguinte estimativa para cada subprocesso $\{Z_d\}_{d\in D_n}$, considerando que $D_n$ tem $2^{n-1} + 1$ elementos:
$$
\mathbb{P}\left(\{\omega; \;\exists d \in D_n, \;|Z_d(\omega)| \geq c\sqrt{n}\}\right) = \mathbb{P}\left(\bigcup_{d\in D_n} \left\{|Z_d| \geq c\sqrt{n}\right\}\right) \leq \sum_{d\in D_n} \mathbb{P}(|Z_d| \geq c\sqrt{n}) \leq (2^{n-1}+1)\sqrt{2} e^{-\frac{c^2 n}{4}}.
$$
Considerando que $2^{n-1} + 1 \leq 2^n$, temos, para $c^2 > 4\ln(2)$, que
$$
\sum_{n\in \mathbb{N}} \mathbb{P}(\exists d \in D_n, \;|Z_d| \geq c\sqrt{n}) \leq \sqrt{2}\sum_{n\in \mathbb{N}}2^n e^{-\frac{c^2 n}{2}} = \sqrt{2}\sum_{n\in \mathbb{N}}e^{n\ln 2} e^{-\frac{c^2 n}{4}} = \sqrt{2}\sum_{n\in \mathbb{N}}e^{-\frac{\left(c^2 - 4\ln(2)\right)n}{4}}< \infty
$$
Com essa estimativa, segue, do Lema de Borel-Cantelli, que
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} \left\{\exists d \in D_n, \;|Z_d| \geq c\sqrt{n}\right\}\right) = 0.
$$
Lembremos que o limsup de uma sequência de conjuntos $E_n$ é 
$$
\limsup_{n\rightarrow \infty} E_n = \bigcap_{n\in\mathbb{N}}\left(\bigcup_{j \geq n} E_n\right).
$$
No caso, temos $E_n = \{\omega\in \Omega; \;\exists d \in D_n, \;|Z_d(\omega)| \geq c\sqrt{n}\}$. Podemos escrever, também, que
$$
\mathbb{P}\left(\Omega \setminus \limsup_{n\rightarrow \infty} E_n\right) = 1.
$$
Dessa forma,
$$
1 = \mathbb{P}\left(\bigcup_{n\in \mathbb{N}} \left(\Omega \setminus \bigcup_{j \geq n} E_n\right)\right) = \mathbb{P}\left(\bigcup_{n\in \mathbb{N}} \left(\bigcap_{j \geq n} \Omega \setminus E_n\right)\right) = \mathbb{P}\left(\left\{\omega\in\Omega; \;\exists N(\omega)\in \mathbb{N}; |Z_d(\omega)| \leq 2c\sqrt{n}, \;\forall n\geq N\right\}\right)
$$

Em outras palavras, para $N=N(\omega)\in \mathbb{N}$ aleatório suficientemente grande,
$$
\mathbb{P}(|Z_d| \leq c\sqrt{n}, \forall d\in D_n) = 1, \qquad \forall n \geq N.
$$

## Convergência

Definimos os processos $\{W_t^n\}_{t \in [0, 1]}$ por
$$
W_t^{n+1} = W_t^{n} + \sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d = \sum_{d\in D_{n+1}} s_d(t)Z_d.
$$
Queremos, agora, passar ao limite e construir um processo contínuo definido pela série
$$
\sum_{d\in D} s_d(t)Z_d, \quad 0 \leq t \leq 1.
$$
Vamos mostrar que essa série converge quase sempre.

Começamos estimando cada termo do somatório. As funções $s_d$, para $d\in D_{n+1}\setminus D_n$, são não negativas, têm suporte disjunto e alcançam um valor máximo $s_d(d) = 1/2^{(n+1)/2}$. Assim,
$$
\left|\sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d\right| \leq \frac{1}{2^{(n+1)/2}}\max_{d\in D_{n+1}\setminus D_n} |Z_d|, \quad \forall 0\leq t \leq 1.
$$

Isso implica em
$$
\mathbb{P}\left(\max_{0\leq t\leq 1} \left|\sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d\right| \leq \frac{c\sqrt{n}}{2^{(n+1)/2}}\right) \geq \mathbb{P}(|Z_d| \leq c\sqrt{n}, \forall d\in D_n) = 1, \qquad \forall n \geq N.
$$

Portanto, a estimativa a seguir vale quase sempre:
$$
\max_{0\leq t\leq 1} \left|\sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d\right| \leq \frac{c\sqrt{n}}{2^{(n+1)/2}}, \qquad \forall n \geq N.
$$

Agora, podemos ver a consequência disso para todo o rabo da série:
$$
\max_{0\leq t\leq 1} \left|\sum_{d\in D\setminus D_N} s_d(t)Z_d\right| \leq \sum_{n \geq N}\frac{c\sqrt{n}}{2^{(n+1)/2}} < \infty.
$$

Com essa estimativa, vemos que a série converge quase-sempre (uniformemente em $t\in [0, 1]$) e nos define um processo contínuo $\{W_t\}_{t\in [0,1]}$:
$$
W_t = \sum_{d\in D} s_d(t)Z_d, \quad 0 \leq t \leq 1.
$$

Isso implica, também, na convergência em probabilidade (uniforme em $t$):
$$
\mathbb{P}\left(\max_{0\leq t \leq 1} |W_t - W_t^n| > \varepsilon\right) \rightarrow 0, \quad n \rightarrow \infty, \; \forall \varepsilon > 0.
$$

## Processo de Wiener no intervalo unitário

Resta mostrar que $\{W_t\}_{t\in [0, 1]}$ tem todas as propriedades desejadas para que seja um processo de Wiener no intervalo $[0, 1]$. Para mostrarmos isso, vamos explorar a convergência obtida acima, que implica em convergência em distribuição, para passar ao limite as propriedades já estabelecidas para os processos discretos $\{X_d^n\}_{d\in D_n}$, usando, também, que $D$ é denso em $I=[0,1]$.

### Processo inicial

Como $s_d(0) = 0$, para todo $d\in D$, segue imediatamente que
$$
W_0 = \sum_{d\in D} s_d(0)Z_d = 0
$$

### Continuidade dos caminhos amostrais

Construímos $\{W_t^n\}_{t\in [0,1]}$ de tal forma que, para todo $\omega\in \Omega$, o caminho amostral $t \mapsto W_t^n(\omega)$ seja contínuo. Obtivemos, ainda, que cada caminho amostral $t \mapsto W_t(\omega)$ é limite uniforme de $t \mapsto W_t^n(\omega)$. Portanto, para todo $\omega\in\Omega$, o caminho amostral $t \mapsto W_t(\omega)$ também contínuo. Em particular,
$$
\mathbb{P}(\{\omega; \;t \mapsto W_t(\omega) \textrm{ é contínuo}\}) = 1.
$$

A construção que fizemos, em particular escolhendo $\Omega = \mathbb{R}^D$ como espaço amostral, nos levou a que todos os caminhos amostrais sejam contínuos. Mas, em geral, podemos ter um espaço amostral maior (e.g. $\Omega = \mathbb{R}^\mathbb{R}$), mas com a medida concentrada em amostras associadas a caminhos contínuos, ou seja, com probabilidade um, mas sem necessariamente ser todo o conjunto.

### Independência dos incrementos

Sejam $0 \leq t_0 < t_1 < \ldots < t_n \leq 1$, onde $n\in \mathbb{N}$, $n \geq 2$. Dados eventos $E_1, \ldots, E_n\in \mathbb{A}$, vamos considerar a probabilidade conjunta dos incrementos $W_{t_j} - W_{t_{j-1}}$, $j = 1, \ldots, n$.
$$
\mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n).
$$

Considere sequências $\{t_j^k\}_{k\in \mathbb{N}}$ tais que $t_j^k\in D$, $0 \leq t_0^k < t_1^k < \ldots < t_n^k \leq 1$ e $t_j^k \rightarrow t_j$, quando $k \rightarrow \infty$, para qualquer $j = 0, \ldots, n$.

Como os caminhos amostrais são contínuos, temos que $W_{t_j^k}$ converge quase-sempre para $W_{t_j}$, quando $k \rightarrow \infty$. Como cada incremento é Gaussiano e a função de distribuição de probabilidades de uma Gaussiana é contínua, seque que
$$
\mathbb{P}(W_{t_j^k} - W_{t_{j-1}^k} \in E_1) \rightarrow \mathbb{P}(W_{t_j} - W_{t_{j-1}} \in E_1), \quad k \rigtharrow \infty.
$$
Da mesma forma, o conjunto de incrementos é uma Gaussiana multivariada e a função de distribuição de probabilidades de uma Gaussiana multivariada também é contínua, de modo que
$$
\mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1, \ldots, W_{t_n^k} - W_{t_{n-1}^k} \in E_n) \rightarrow \mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n), \quad k \rightarrow \infty.
$$

Já vimos que, em pontos diádicos, $W_{t_j^k} = W_{t_j^k}^{n_k} = X_{t_j^k}^{n_k}$, para algum $n_k$ tal que $t_j^k\in D_{n_k}$, para todo $j = 0, \ldots, n$ e para todo $k\in \mathbb{N}$. Já vimos, também, que os incrementos de $\{X_d^n\}_{d\in D_n}$ são independentes. Portanto,
$$
\mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1, \ldots, W_{t_n^k} - W_{t_{n-1}^k} \in E_n) = \mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1) \times \cdots \times \mathbb{P}(W_{t_n^k} - W_{t_{n-1}^k} \in E_n).
$$
Passando ao limite $k \rightarrow \infty$ dos dois lados da igualdade acima, obtemos
$$
\mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n) = \mathbb{P}(W_{t_1} - W_{t_0} \in E_1) \times \cdots \times \mathbb{P}(W_{t_n} - W_{t_{n-1}} \in E_n),
$$
mostrando a independência dos incrementos.

### Distribuição dos incrementos

Sejam $t$ e $\tau$ tais que $0\leq t < t + \tau \leq 1$. Considere sequências $\{t^k\}_{k\in \mathbb{N}}$, $\{\tau_k\}_{k\in \mathbb{N}}$ tais que $t^k \rightarrow t$, $\tau^k \rightarrow \tau$, $0 \leq t^k < t^k + \tau^k \leq 1$ e $t^k, t^k + \tau^k \in D$. Para cada $k$, temos, de fato, $t^k, t^k + \tau^k\in D_{n_k}$, para $n_k\in \mathbb{N}$ suficientemente grande.

Conforme argumentado acima, temos
$$
\mathbb{P}(W_{t^k + \tau^k} - W_{t^k} \leq x) \rightarrow \mathbb{P}(W_{t + \tau} - W_t \leq x), \quad k \rightarrow \infty,
$$
para todo $x \in \mathbb{R}$. Por outro lado, sabemos que $W_{t^k + \tau^k} - W_{t^k} = X_{t^k + \tau^k}^{n_k} - X_{t^k}^{n_k} \sim \mathcal{N}(0, \tau^k)$, de forma que
$$
\mathbb{P}(W_{t^k + \tau^k} - W_{t^k} \leq x) = F_{\tau_k}(x),
$$
onde $F_{\sigma^2}(\cdot)$ denota a função de distribuição acumulada da normal $\mathcal{N}(0, \sigma^2)$, $\sigma > 0$. Passando ao limite em $k\rightarrow \infty$, obtemos
$$
\mathbb{P}(W_{t + \tau} - W_{t} \leq x) = F_{\tau}(x).
$$
Portanto,
$$
W_{t + \tau} - W_{t} \sim \mathcal{N}(0, \tau).
$$

Isso completa a demonstração de que $\{W_t\}_{t\in [0, 1]}$ é um processo de Wiener em $[0, 1]$.

## Extensão para a semireta

Construímos um processo $\{W_t\}_{t\in [0, 1]}$ com todas as propriedades de um processo de Wiener, exceto que só está definido no intervalo $[0, 1]$. Podemos construir um processo de Wiener, em $[0, \infty)$, transladando e concatenando processos em $[0, 1]$.

Sejam, então, $\{W_t^k\}_{t \in [0, 1]}$, $k\in \mathbb{N}$, processos independentes em $[0, 1]$ com as propriedades de um processo de Wiener. (Podem ser construídos, de forma que sejam independentes, a partir de processos $\{Z_d\}_{d \in D^\mathbb{N}}$).

Definimos
$$
W_t = W_{t - [t]}^{[t]} + \sum_{k = 0}^{[t]-1} W_1^k, \qquad \forall t \geq 0,
$$
onde $[t] = \max\{n \leq t, n \in \mathbb{Z}\}$ é o maior inteiro menor do que $t \geq 0$.

Isso define um processo estocástico contínuo com todos as condições necessárias para ser um processo de Wiener.

## Exercícios

1. Faça os detalhes da demonstração por indução de que os processos contínuos definidos por
$$
W_t^{n+1} = W_t^{n} + \sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d = \sum_{d\in D_{n+1}} s_d(t)Z_d
$$
são interpolações dos processos discretos $\{X_d^n\}_{d\in D_n}$, i.e. $W_d^n = X_d^n$, para todo $d\in D_n$ e todo $n\in\mathbb{N}$.

2. Sejam $\{W_t^k\}_{t \in [0, 1]}$, $k\in \mathbb{N}$, processos de Wiener, em $[0, 1]$, independentes. Faça os detalhes da demonstração de que $W_t = W_{t - [t]}^{[t]} + \sum_{k = 0}^{[t]-1} W_1^k$ é um processo de Wiener em $[0, \infty)$.

3. Na construção, definimos $X_{d}^{n+1}$, para $d \in D_{n+1}\setminus D_n$, pela fórmula $(X_{d - 1/2^n}^n + X_{d + 1/2^n}^n)/2 + Z_d/2^{(n + 1)/2}$, com os $Z_d$'s sendo mutamente independentes. Essa construção não é arbitrária. Mostre que se $\{W_t\}_{t\geq 0}$ é um processo de Wiener e $0 \leq s < t,$ então
$$
\frac{W_s + W_t}{2} + W_{(t + s)/2}
$$
é independente de $W_\tau,$ para $\tau \leq s$ e $\tau \geq t$.

