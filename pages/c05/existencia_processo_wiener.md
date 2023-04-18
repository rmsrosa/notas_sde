@def title = "Existência de processos de Wiener"

# {{ get_title }}

O tipo de processo conhecido atualmente como processo de Wiener foi introduzido, como modelo para o movimento Browniano, por Norbert Wiener, em 1923, junto com a demonstração de existência de tal processo. A demonstração de Wiener é baseada em uma expansão em série de senos e cossenos a partir da lei de distribuição dos coeficientes de Fourier do processo.

Vamos, no entanto, discutir, a seguir, uma demonstração mais simples, dada por Paul Lévy, conforme apresentada em Morters & Peres (2010) e Evans (2013). A demonstração é feita por um processo de limite, a partir de um processo estocástico discreto que é interpolado para um processo contínuo. A construção crucial é feita no intervalo $I = [0, 1]$. A partir daí, podemos transladar e concatenar processos independentes em $[0, 1]$ para obter um processo de Wiener em $[0, \infty)$.

Veremos duas formas de escrever essa sequência aproximante de processos no intervalo $[0, 1]$. Uma facilita mostrarmos que os incrementos são normais independentes e identicamente distribuídos, enquanto que a outra facilita a demonstração de convergência da sequência.

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

## Processo discreto i.i.d. e espaço amostral

Como dito, um processo de Wiener pode ser obtido como limite de processos obtidos por interpolação de partes finitas de um processo discreto i.i.d., que vamos definir em $D$.

Com esse fim, considere um processo discreto *i.i.d.* $\{Z_d\}_{d\in D\setminus \{0\}}$, onde as variáveis $Z_d$ são mutuamente independentes e dadas por $Z_d \sim \mathcal{N}(0, 1)$. Como $D$ é enumerável, podemos considerar o conjunto
$$
\Omega = \mathbb{R}^D
$$
como espaço amostral, e por $\mathcal{A}$ a $\sigma$-álgebra gerada por $\pi_d^{-1}(\mathcal{E})$, onde $E$ é mensurável e $\pi_d : \Omega \rightarrow \mathbb{R}$ leva um caminho $x\in \Omega$ no elemento $\pi_d x = x(d)$, em $d\in D$. Denotamos a medida de probabilidade por $\mathbb{P}$. Para simplificar, escrevemos $Z_0 = 0$, já que queremos que o processo de Wiener limite satisfaça $W_0 = Z_0 = 0$.

## Sequência aproximante de processos discretos

Vamos primeiro construir uma sequência de processos discretos, cada um com parâmetro em $D_n$, $n\in\mathbb{N}$. Estes processos serão interpolados para processos em $[0, 1]$. Por motivo de clareza, vamos denotar os processos discretos por $\{X_d^{(n)}\}_{d\in D_n}$. As interpolações contínuas serão denotadas por $\{W_t^{(n)}\}_{t\in [0, 1]}$. E, no limite, teremos o processo contínuo $\{W_t\}_{t\in [0, 1]}$. Por serem extensões, teremos $W_d = W_d^{(n)} = X_d^{(n)}$, nos pontos diádicos $d\in D_n$.

Para cada $d\in D_n$, esperamos ter $X_d^{(n)} = W_d = W_d - W_0 \sim \mathcal{N}(0, d)$. Então seria natural pensarmos em definir $X_d^{(n)}$ como $Z_d / \sqrt{d}$, já que $Z_d \sim \mathcal{N}(0, 1)$, de modo que $Z_d/\sqrt{d} \sim \mathcal{N}(0, d)$, e interpolar, de alguma forma, para $t\in I \setminus D_n$. Apesar disso convergir para um processo, este não terá a distribuição correta dos passos. Mas uma variação disso funciona. Essa variação se baseia no fato de que se $A$ e $B$ são duas variáveis normais independentes com mesma variância, então $A+B$ e $A-B$ também são independentes e com o dobro da variância de $A$ e $B$.

Mais precisamente, definimos, para cada $n\in \mathbb{N}$, o processo discreto $\{X_d^{(n)}\}_{d\in D_n}$, na malha finita $D_n$, da seguinte forma. Primeiramente, sendo $D_1 = \{0, 1\}$, definimos
$$
X_0^{(1)} = 0, \quad X_1^{(1)} = Z_1.
$$
Para $n = 2$, temos $D_2 = \{0, 1/2, 1\}$. A ideia é estender $\{X_d^{(1)}\}_{d\in D_1}$ para um $\{X_d^{(2)}\}_{d\in D_2}$, em $D_2\supset D_1$, mantendo os processos $X_0^{(1)}, X_1^{(1)}$ em $d = 0, 1$ e adicionando uma fração de $Z_{1/2}$ à interpolação linear de $X_0^{(1)} = 0$ e $X_1^{(1)} = Z_1$, em $d = 1/2$. Mais precisamente, fazemos
$$
X_0^{(2)} = X_0^{(1)}, \quad X_1^{(2)} = X_1^{(1)}, \quad X_{1/2}^{(2)} = \frac{X_0^{(1)} + X_1^{(1)}}{2} + \frac{Z_{1/2}}{2}.
$$

Agora, continuamos por indução, estendendo o processo $\{X_d^{(n)}\}_{d\in D_n}$, em $D_n$, para um processo $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$, em $D_{n+1}$. Para isso, começamos fazendo
$$
X_d^{(n+1)} = X_d^{(n)}, \qquad \forall d\in D_n.
$$
Agora, para $d \in D_{n+1} \setminus D_n$, tomamos a média em relação aos valores adjacentes $d \pm 1/2^n$ e somamos uma fração apropriada de $Z_d$:
$$
X_d^{(n+1)} = \frac{X_{d - 1/2^n}^{(n)} + X_{d + 1/2^n}^{(n)}}{2} + \frac{Z_d}{2^{(n + 1)/2}}.
$$

Observe que, com $n = 1$, esta fórmula coincide com a fórmula acima dada explicitamente para $\{X_d^{(2)}\}_{d\in D_2}$.

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
        plot(ttn, Wn, title = "Caminhos amostrais de \$\\{W_d^{(n)}\\}_{d\\in D_n}\$, \$n = 1, \\ldots, $(2j)\$", titlefont = 10, xaxis = "\$t\$", yaxis = "\$W\$", ylims = (-3, 3), marker = :circle, markersize = 3, label = false)
    )
end
plot(plts..., layout = (2, 2), size = (800, 600))
savefig(joinpath(@OUTPUT, "sequenciaWn.svg"))
```
\fig{sequenciaWn}

### Processos discretos e incrementos são Gaussianos

Observe que os processos são construídos como combinações lineares de variáveis normais independentes. Sendo assim, os processos $\{X_d^{(n)}\}_{d\in D_n}$ são processos Gaussianos, i.e. a sua distribuição conjunta é uma normal multivariada (note que cada $D_n$ é finito, então esses processos são *vetores* aleatórios).

É importante ressaltar, no entanto, que cada $\{X_d^{(n)}\}_{d\in D_n}$ não é formado por variáveis aleatórias independentes.

Da mesma forma, os incrementos são combinações lineares de normais independentes, portanto também são normais multivariadas. Em princípio, também não seriam independentes. Mas veremos a seguir que os incrementos têm uma estrutura particular, de tal forma que são, sim, independentes.

### Independência e distribuição dos incrementos

Observe que cada $X_d^{(n)}$ só depende das variáveis $\{Z_d\}_{d\in D_n}$, que são independentes de $\{Z_d\}_{d \in D \setminus D_n}$. Portanto, os processos $(X_d^{(n)})_{d\in D_n}$ e $\{Z_d\}_{d \in D \setminus D_n}$ são independentes.

Agora, vamos ver que os incrementos de cada processo $\{X_d^{(n)}\}_{d\in D_n}$ são independentes. Para $n = 1$, isso é vácuo, já que só há um incremento, $X_1^{(1)} - X_0^{(1)} = Z_1$. Para $n = 2$, temos apenas dois incrementos,
$$
\Delta_{1/2}^{(2)} = X_1^{(2)} - X_{1/2}^{(2)} = X_1^{(1)} - \frac{X_0^{(1)} + X_1^{(1)}}{2} - \frac{Z_{1/2}}{2} = \frac{X_1^{(1)} - X_0^{(1)}}{2} - \frac{Z_{1/2}}{2} = \frac{Z_1}{2} - \frac{Z_{1/2}}{2}
$$
e
$$
\Delta_0^{(2)} = X_{1/2}^{(2)} - X_0^{(2)} = \frac{X_0^{(1)} + X_1^{(1)}}{2} + \frac{Z_{1/2}}{2} - X_0^{(2)} = \frac{X_1^{(1)} - X_0^{(1)}}{2} + \frac{Z_{1/2}}{2} = \frac{Z_1}{2} + \frac{Z_{1/2}}{2}.
$$
Aparentemente, esses incrementos poderiam não ser independentes, mas são. Como $Z_1$ e $Z_{1/2}$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1)$, então $Z_1/2$ e $Z_{1/2}/2$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1/4)$. Assim, a soma e a diferença de $Z_1/2$ e $Z_{1/2}/2$, que são exatamente os incrementos, são, também, normais independentes e identicamente distribuídas, com distribuição $\mathcal{N}(0, 1/2)$. Além disso, também são independentes de $\{Z_d\}_{d \in D \setminus D_2}$.

Agora, vamos assumir, em um argumento de indução, que os incrementos de $\{X_d^{(n)}\}_{d \in D_n}$ são independentes e identicamente distribuídos, com distribuição
$$
X_{d + 1/2^{n-1}}^{(n)} - X_d^{(n)} \sim \mathcal{N}\left(0, \frac{1}{2^{n-1}}\right).
$$
Além disso, assumimos que são independentes de $\{Z_d\}_{d\in D \setminus D_n}$.

Vamos mostrar que o mesmo vale para $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$, com incrementos consecutivos sendo normais independentes com média zero, variância $1/2^n$ e independentes de $\{Z_d\}_{d\in D \setminus D_{n+1}}$.

Considere $d \in D_{n+1}\setminus D_n$, lembremos que
$$
X_d^{(n+1)} = \frac{X_{d - 1/2^n}^{(n)} + X_{d + 1/2^n}^{(n)}}{2} + \frac{Z_d}{2^{(n+1)/2}}.
$$
Os dois incrementos consecutivos com ponto comum $d$ são
$$
X_d^{(n+1)} - X_{d - 1/2^n}^{(n+1)} = \frac{X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}}{2} + \frac{Z_d}{2^{(n+1)/2}}
$$
e
$$
X_{d + 1/2^n}^{(n+1)} - X_d^{(n+1)} = \frac{X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}}{2} - \frac{Z_d}{2^{(n+1)/2}}.
$$

Observe que $X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}$ é um passo consecutivo do processo $\{X_d^{(n)}\}_{d\in D_n}$. Assim, usando a hipótese de indução, temos que $X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}$ e $Z_d$ são independentes e que $X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)} \sim \mathcal{N}(0, 1/2^{n-1})$. Assim, temos
$$
\frac{X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}}{2} \quad \text{e} \quad \frac{Z_d}{2^{(n+1)/2}} \sim \mathcal{N}\left(0, \frac{1}{2^{n+1}}\right).
$$

Portanto, as suas somas e diferenças, que são exatamente os dois passos consecutivos, também são independentes e identicamente distribuídos, com distribuição $\mathcal{N}(0, 1/2^{n+1} + 1/2^{n+1}) = \mathcal{N}(0, 1/2^n)$.

Isso mostra que dois passos consecutivos de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$, com ponto em comum $d$ em $d \in D_{n+1}\setminus D_n$, são independentes e a distribuição dada como na indução. Agora, se $d \in D_n\setminus$, então $d \pm 1/2^n \in D_{n+1} \setminus D_n$. Nesse caso, os passos consecutivos envolvem um estêncil de cinco pontos diádicos:
$$
X_d^{(n+1)} - X_{d - 1/2^n}^{(n+1)} = X_d^{(n)} - \frac{X_{d}^{(n)} + X_{d - 1/2^{n-1}}^{(n)}}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}} = \frac{X_{d}^{(n)} - X_{d - 1/2^{n-1}}^{(n)}}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}}
$$
e
$$
X_{d + 1/2^n}^{(n+1)} - X_d^{(n+1)} = \frac{X_{d + 1/2^{n-1}}^{(n)} - X_d^{(n)}}{2} + \frac{Z_{d+1/2^n}}{2^{(n+1)/2}}.
$$
Observe que os dois incrementos no lado direito das duas expressões acima são incrementos consecutivos do processo $\{X_d^{(n)}\}_{d\in D_n}$ e que os termos restantes são variáveis distintas de $\{Z_d\}_{d\in D\setminus D_n}$. Pela hipótese de indução, todas essas variáveis são mutuamente independentes. Portanto, os dois incrementos acima de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$ também são independentes entre si. Além disso, como esses termos do lado direito tem distribuição normal $\mathcal{N}(0, 1/2^{n+1})$, então os incrementos tem distribuição normal $\mathcal{N}(0, 1/2^n)$.

Provamos que quaisquer dois incrementos consecutivos de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$ são independentes dois a dois. Como a distribuição conjunta é normal, segue, da independência dois a dois, que todos os incrementos consecutivos são mutuamente independentes.

Disso segue, também, que incrementos disjuntos a "passos largos" $X_{d_2}^{n+1} - X_{d_1}^{n+1}$, $X_{d_3}^{n+1} - X_{d_2}^{n+1}$, ..., com $d_1 < d_2 < d_3 < \ldots < d_n$ em $D_{n+1}$, também são independentes, pois cada incremento desses é combinação linear de passos "curtos" independentes distintos.

Finalmente, como eles só envolvem $\{Z_d\}_{d\in D \setminus D_{n+1}}$, então os incrementos de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$ e os processos restantes $\{Z_d\}_{d\in D \setminus D_{n+1}}$ também são mutuamente independentes.

## Interpolação e representação em termos de wavelets

A sequência de processos $\{X_d^{(n)}\}_{d\in D_n}$ construída acima pode ser expressa de outra forma e que nos será útil na demonstração da convergência dessa sequência. Vejamos os dois primeiros termos $\{X_d^{(1)}\}_{d\in D_1}$ e $\{X_d^{(2)}\}_{d\in D_2}$:
$$
X_0^{(1)} = Z_0 = 0, \quad X_1^{(1)} = Z_1,
$$
e
$$
\begin{cases}
    X_0^{(2)} = Z_0 = 0, \\
    X_{1/2}^{(2)} = \displaystyle \frac{X_0^{(1)} + X_1^{(1)}}{2} + \frac{1}{2}Z_{1/2} = \frac{1}{2}Z_0 + \frac{1}{2}Z_1 + \frac{1}{2}Z_{1/2}, \\
    X_1^{(2)} = Z_1.
\end{cases}
$$
Começamos interpolando o primeiro termo de forma linear, para obter o processo contínuo
$$
W_t^{(1)} = tZ_1, \qquad 0 \leq t \leq 1.
$$
Visando a generalização que queremos obter, escrevemos isso na forma
$$
W_t^{(1)} = s_0 Z_0 + s_1(t)Z_1 = \sum_{d \in D_1} s_d(t)Z_d, \qquad 0\leq t \leq 1.
$$
onde $Z_0 = 0$ e
$$
s_0(t) = 1 - t, \quad s_1(t) = t, \qquad 0 \leq t \leq 1.
$$

Para $W_t^{(2)},$ observe que, além de
$$
W_0^{(2)} = X_0^{(1)}, \qquad W_1^{(2)} = X_1^{(1)},
$$
podemos escrever o ponto médio como
$$
W_{1/2}^{(2)} = \frac{1}{2}Z_0 + \frac{1}{2}Z_1 + \frac{1}{2}Z_{1/2} = s_0(1/2)Z_0 + s_1(1/2)Z_1 + \frac{1}{2} Z_{1/2} = X_{1/2}^{(2)} + \frac{1}{2} Z_{1/2}.
$$
Assim, podemos escrever a interpolação de $\{X_d^{(2)}\}_{d\in D_2}$ na forma
$$
W_t^{(2)} = W_t^{(1)} + s_{1/2}(t)Z_{1/2} = s_0(t) Z_0 + s_1(t)Z_1 + s_{1/2}(t)Z_{1/2} = \sum_{d\in D_2} s_d(t) Z_d,
$$
onde $s_{1/2}(\cdot)$ é uma função linear por partes que se anula em $t = 0$ e $t = 1$ e vale $1/2$ em $t = 1/2$. Ou seja, $s_{1/2}(\cdot)$ é a função "cabana"
$$
s_{1/2}(t) = \min\{t, 1 - t\}, \qquad 0 \leq t \leq 1,
$$
que pode ser escrita, para $n=1$ e $d=1/2\in D_{n+1}\setminus D_n$, na forma
$$
s_d(t) = 2^{(n-1)/2}\min\{t - d + 1/2^n, d + 1/2^n - t\}, \qquad 0 \leq t \leq 1.
$$

Agora, vejamos os termo de $X_d^{(3)}$:
$$
\begin{cases}
    X_0^{(3)} = 0, \\
    X_{1/4}^{(3)} = \frac{1}{4}Z_1 + \frac{1}{4}Z_{1/2} + \frac{1}{2^{3/2}}Z_{1/4}, \\
    X_{1/2}^{(3)} = \frac{1}{2}Z_1 + \frac{1}{2}Z_{1/2}, \\
    X_{3/4}^{(3)} = \frac{3}{4}Z_1 + \frac{1}{4}Z_{1/2} + \frac{1}{2^{3/2}}Z_{3/4}, \\
    X_1^{(3)} = Z_1;
\end{cases}
$$
Observe que esse processo pode ser visto como os valores, em $D_3$, do processo contínuo obtido por interpolação linear por partes dado por
$$
W_t^{(3)} = W_t^{(2)} + s_{1/4}(t)Z_{1/4} + s_{3/4}(t)Z_{3/4} = s_0(t) Z_0 + s_1(t)Z_1 + s_{1/2}(t)Z_{1/2} + s_{1/4}(t)Z_{1/4} + s_{3/4}(t)Z_{3/4},
$$
onde $s_{1/4}(\cdot)$ e $s_{3/4}(\cdot)$ são, também, funções do tipo cabana, com suporte em $[0, 1/2]$ e $[1/2, 1]$ e valor máximo $1/2^{3/2}$:
$$
s_{1/4}(t) = 2^{1/2}\max\{0, \min\{t, 1/2 - t\}\}, \quad s_{3/4}(t) = 2^{1/2}\max\{0, \min\{t - 1/2, 1 - t\}.\}
$$

```julia:faberschauder
#hideall
using Plots
theme(:ggplot2)
t = range(0.0, 1.0, length = 200)
s_d = Dict(n => Dict(d => 2^(max(0,(n-1)/2)) .* max.(0.0, min.(t .- d .+ 1/2^n, d .+ 1/2^n .- t)) for d in Rational.(0:1/2^(n):1) if (n == 0 || d ∉ Rational.(0:1/2^(n-1):1))) for n in 0:4)
plot(title = "Funções da base de Faber–Schauder", titlefont = 10, xaxis = "\$t\$", ylims = (0.0, 1.0), legend = :topleft, legendfontsize=6)
for (n, sdn) in sort(s_d)
    for (d, sd) in sort(sdn)
        plot!(t, sd, label="\$s_{$d}(t)\$")
    end
end
savefig(joinpath(@OUTPUT, "faberschauder.svg"))
```
\fig{faberschauder}


Mais geralmente, definimos, para $d \in D_{n+1} \setminus D_n$, $n \in \mathbb{N}$,
$$
s_d(t) = 2^{(n-1)/2} \max\{0, \min\{t - d + 1/2^n, d + 1/2^n - t\}\} = 2^{(n-1)/2} \times \begin{cases}
  0, & t \leq d - \frac{1}{2^n}, \\
  t - d + \frac{1}{2^n}, & d - \frac{1}{2^n} \leq t \leq d, \\
  d + \frac{1}{2^n} - t, & d \leq t \leq d + \frac{1}{2^n}, \\
  0, & t \geq d + \frac{1}{2^n}
\end{cases}
$$
Note que essa fórmula não inclui $s_d(t)$ para $d\in D_1$. Para incluir esses pontos, podemos permitir $n=0$ e modificar o fator multiplicativo para $2^{\max\{0, n-1\}/2}.$

Observe, ainda, que o ponto máximo de $s_d(t)$, para $d\in D_{n+1}\setminus D_n,$ é $t=d,$ com 
$$
  s_d(d) = 2^{(n-1)/2} \times \frac{1}{2^n} = \frac{1}{2^{(n+1)/2}}.
$$

O que fizemos acima foi mostrar os primeiros passos do processo de indução para provar que os processos contínuos definidos por
$$
W_t^{(n+1)} = W_t^{(n)} + \sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d = \sum_{d\in D_{n+1}} s_d(t)Z_d
$$
são interpolações dos processos discretos $\{X_d^{(n)}\}_{d\in D_n}$, i.e. $W_d^{(n)} = X_d^{(n)}$, para todo $d\in D_n$ e todo $n\in\mathbb{N}$. Deixamos a prova completa como exercício. Apenas ressaltamos que os pontos cruciais são (i) observar que cada $s_d(\cdot)$ com $d\in D_{n+1}\setminus D_n$ se anula em todos os pontos $d'\in D_n$ e, também, em $d'\in D_n$ tal que $d' \neq d$, i.e. $s_d(d') = 0$, para todo $d, d'\in D_{n+1}$, $d' \neq d$; (ii) vale $s_d(d) = 1/2^{(n+1)/2}$, para $d\in D_{n+1}\setminus D_n$; e (iii) cada $s_d(\cdot)$ é linear em $[d-1/2^n, d]$ e $[d, d+1/2^n]$, para $d\in D_{n+1}\setminus D_n$.

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

### Representação em série de wavelets

Obtivemos, acima, então, que
$$
W_t^{(n)} = \sum_{d\in D_n} s_d(t) Z_d, \qquad 0 \leq t \leq 1
$$
é uma representação para a interpolação linear do processo discreto $\{X_d^{(n)}\}_{d\in D_n}$, i.e. $W_d^{(n)} = X_d^{(n)}$, para todo $d\in D_n$ e que $W_t^{(n)}$ é linear em cada intervalo $[d, d + 1/2^n]$ com $d, d + 1/2^n\in D_n$.

## Limite

A ideia, agora, é passar ao limite e definir o processo de Wiener $\{W_t\}_{t\in [0, 1]}$ através da série
$$
W_t = \sum_{d\in D} s_d(t) Z_d, \qquad 0 \leq t \leq 1.
$$

Para isso, precisamos mostrar a convergência dessa série. Vamos mostrar que, com probabilidade $1$, essa convergência se dá uniformemente em $0 \leq t \leq 1$. Podemos escrever isso como
$$
\mathbb{P}\left( \lim_{m, n\rightarrow 0} \max_{0\leq t\leq 1} |W_t^{(m)} - W_t^{(n)}| = 0\right) = 1.
$$
Ou, então, que
$$
\lim_{m, n\rightarrow 0} \max_{0\leq t\leq 1} |W_t^{(m)} - W_t^{(n)}| = 0 \quad \textrm{quase sempre,}
$$
ou, mais explicitamente,
$$
\lim_{m, n\rightarrow 0} \max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| = 0 \quad \textrm{para quase todo } \omega \in \mathbb{R}^D.
$$

### Plano para a demonstração

Dado um processo discreto $(A_n)_{n\in\mathbb{N}}$ com valores não-negativos e com $A_n \rightarrow 0$ quase sempre, definido no mesmo espaço amostral $\Omega$, temos que
$$
\max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| \leq A_n(\omega), \;\forall m \geq n \;\Longrightarrow \;  \lim_{m, n\rightarrow 0} \max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| = 0,
$$
Ou seja,
$$
\left\{\omega; \;\max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| \leq A_n(\omega), \; \forall m \geq n \right\} \;\textrm{\Large $\subset$ }  \left\{\omega; \;\lim_{m, n\rightarrow 0} \max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| = 0\right\},
$$
Então basta mostrar que
$$
\mathbb{P}\left( \bigcap_{m \geq n} \left\{\max_{0\leq t\leq 1} |W_t^{(m)} - W_t^{(n)}| \leq A_n\right\}\right) = 1,
$$
para alguma tal sequência $A_n\rightarrow 0$, ou, de outra forma, que
$$
\max_{m \geq n}\max_{0\leq t\leq 1} |W_t^{(m)} - W_t^{(n)}| \leq A_n \rightarrow 0,
$$
quase sempre.

### Processo $A_n$

Para obter a estimativa acima, usamos a representacão em wavelets de $\{W_t^{(n)}\}_n$ para estimar, para $m\geq n$,
$$
|W_t^{(m)} - W_t^{(n)}| = \left|\sum_{d\in D_m\setminus D_n} s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \sum_{d\in D_{k+1}\setminus D_k} \left| s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \left(\max_{d\in D_{k+1}\setminus D_k} |Z_d|\sum_{d\in D_{k+1}\setminus D_k} s_d(t)\right).
$$
para todo $0\leq t \leq 1$. Em cada nível $D_{k+1}\setminus D_k$, as funções $s_d=s_d(t)$ têm suportes disjuntos e o somatório é limitado pelo máximo dessas funções, que é exatamente $1/2^{(k+1)/2}$, ou seja,
$$
0 \leq \sum_{d\in D_{k+1}\setminus D_k} s_d(t) \leq \frac{1}{2^{(k+1)/2}}.
$$
Portanto,
$$
|W_t^{(m)} - W_t^{(n)}| = \left|\sum_{d\in D_m\setminus D_n} s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \sum_{d\in D_{k+1}\setminus D_k} \left| s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d|.
$$

O lado direito é independente de $t$ e de $m \geq n$. Assim, podemos escrever
$$
\max_{m\geq n} \sup_{0\leq t \leq 1} |W_t^{(m)} - W_t^{(n)}| \leq A_n,
$$
onde
$$
A_n = \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d|.
$$
Para obter que $A_n \rightarrow 0$, basta mostrar que a série converge quase sempre.

### Convergência da série

Queremos mostrar, portanto, que
$$
\sum_{k = 1}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d| < \infty
$$
quase sempre. A ideia para isso é mostrar que podemos estimar, quase sempre,
$$
|Z_d| \leq r_k, \quad \forall d\in D_{k+1}\setminus D_k, \;\forall k \geq N,
$$
para algum $N=N(\omega)$ e para uma série apropriada $r_k$. Se isso for possível, então, quase sempre, teremos
$$
\sum_{k = 1}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d| \leq \sum_{k = 1}^\infty \frac{1}{2^{(k+1)/2}}r_k.
$$

Assim, precisamos mostrar que existe uma sequência $\{r_k\}_{k\in\mathbb{N}}$ de números reais tais que o somatório ao lado direito acima seja finito e que a estimativa
$$
|Z_d| \leq r_k, \quad \forall d\in D_{k+1}\setminus D_k, \;\forall k \geq N,
$$
valha quase sempre, para alguma variável aleatória $N=N(\omega)$ com valores nos números naturais. Isso é equivalente a mostrar que
$$
\left\{ \exists d \in D_{k+1}\setminus D_k, \; |Z_d| > r_k \textrm{ infinitas vezes} \right\}.
$$
tem probabilidade nula. Ou seja, que
$$
\mathbb{P}\left(\limsup_{k\rightarrow \infty} \left\{\exists d \in D_{k+1}\setminus D_k, \; |Z_d| > r_k\right\} \right) = 0.
$$
Isso está no contexto do Lema de Borel-Cantelli, cuja condição é que
$$
\sum_{k=1}^\infty \mathbb{P}\left(\exists d \in D_{k+1}\setminus D_k, \; |Z_d| > r_k \right) < \infty
$$
Observe que 
$$
\sum_{k=1}^\infty \mathbb{P}\left(\exists d \in D_{k+1}\setminus D_k, \; |Z_d| > r_k \right) = \mathbb{P}\left(\bigcup_{d \in D_{k+1}\setminus D_k}\left\{|Z_d| > r_k\right\}\right) \leq \sum_{k=1}^\infty \sum_{d \in D_{k+1}\setminus D_k} \mathbb{P}\left( |Z_d| > r_k \right) < \sum_{k=1}^\infty 2^{k-1} \mathbb{P}\left( |Z_d| > r_k \right).
$$

Portanto, precisamos achar uma sequência $\{r_k\}_{k\in\mathbb{N}}$ de números positivos tais que
$$
\sum_{k = 1}^\infty \frac{1}{2^{(k+1)/2}}r_k < \infty
$$
e
$$
\sum_{k=1}^\infty 2^{k-1} \mathbb{P}\left( |Z_d| > r_k \right) < \infty.
$$

### Estimativa para a concentração de processos i.i.d. normais

Precisamos, assim, obter uma estimativa para as variáveis aleatórias $Z_d$ do processo $\{Z_d\}_{d\in D}$. Como elas são independentes, a função de densidade de probabilidade das marginais desse processo é dada pela Gaussiana padrão. Assim, para cada $d\in D$ e para $r \geq 0$ arbitrário,
$$
\mathbb{P}(|Z_d| \geq r) = \frac{1}{\sqrt{2\pi}}\int_{|s|\geq r} e^{-\frac{s^2}{2}} \;\mathrm{d}s \leq \frac{1}{\sqrt{2\pi}}e^{-\frac{r^2}{4}} \int_{|s| \geq r} e^{-\frac{s^2}{4}} \;\mathrm{d}s.
$$
Limitando a integral e fazendo a mudança de variáveis $s = \sqrt{2}\sigma$, obtemos
$$
\mathbb{P}(|Z_d| \geq r) \leq \frac{1}{\sqrt{2\pi}}e^{-\frac{r^2}{4}} \int_\mathbb{R} e^{-\frac{s^2}{4}} \;\mathrm{d}s = \frac{\sqrt{2}}{\sqrt{2\pi}}e^{-\frac{r^2}{4}}\int_\mathbb{R} e^{-\frac{\sigma^2}{2}} \;\mathrm{d}\sigma = \sqrt{2} e^{-\frac{r^2}{4}}.
$$

Em particular,
$$
\mathbb{P}(|Z_d| > r_k) \leq \sqrt{2} e^{-\frac{r_k^2}{4}},
$$
para um $r_k \geq 0$ qualquer.

### Escolha dos $r_k$

Assim, removendo o fator $\sqrt{2}$ que é independente de $k$, precisamos encontrar $\{r_k\}_{k\in\mathbb{N}}$ tais que
$$
\sum_{k = 1}^\infty \frac{1}{2^{k/2}}r_k < \infty, \quad \textrm{e} \quad \sum_{k=1}^\infty 2^k e^{-\frac{r_k^2}{4}} < \infty.
$$
Observe que $r_k$ tem que crescer suficientemente rápido para que a exponencial ganhe da potência de dois, no segundo somatório, mas não pode crescer muito rápido, para não ganhar do denominador no primeiro somatório. Procurando um crescimento potencial $r_k = k^\alpha$, vemos que qualquer valor $\alpha>1/2$ é suficiente, já que é subexponencial, perdendo pro decrescimento exponencial $1/2^k$, e $r_k^2 \geq k^{2\alpha}$, de tal forma que $e^{-r_k^2} \leq e^{-k^{2\alpha}}$, que ganha de $2^k$. Também podemos escolher $\alpha=1/2$ desde que multipiquemos a sequência por um fator apropriado. Essa escolha nos dá a taxa de decrescimento dos coeficientes a mais rápida possível. Observe que, escolhendo $r_k = 2\sqrt{k}$, temos
$$
\sum_{k=1}^\infty 2^k e^{-\frac{r_k^2}{4}} \leq \sum_{k=1}^\infty 2^k e^{-k} \leq \sum_{k=1}^\infty e^{k\ln 2} e^{-k} = \sum_{k=1}^\infty e^{- (1 - \ln 2)k} < \infty,
$$
já que $\ln 2 < 1.$ Por outro lado,
$$
\sum_{k = 1}^\infty \frac{1}{2^{k/2}}r_k \leq \sum_{k = 1}^\infty \frac{1}{2^{k/2}}2\sqrt{k} < \infty.
$$

### Concluindo a demonstração de convergência

Recapitulando. Provamos que
$$
\max_{m \geq n \geq N}\max_{0\leq t\leq 1} |W_t^{(m)} - W_t^{(n)}| \leq A_n \rightarrow 0
$$
quase sempre, de modo que
$$
\lim_{m, n \rightarrow \infty} \max_{0\leq t\leq 1} |W_t^{(m)} - W_t^{(n)}| = 0
$$
quase sempre. Isso demonstra que a série é uniformenente convergente para quase todo $\omega\in\mathbb{R}^D$. Portanto, podemos definir $\{W_t\}_{t\in [0, 1]}$ por
$$
W_t = \sum_{d\in D} s_d(t) Z_d, \qquad 0 \leq t \leq 1.
$$
Além disso, para quase todo $\omega$, o caminho amostral $W_t(\omega)$ é o limite uniforme dos caminhos contínuos $W_t^{(n)}(\omega)$, sendo, também, contínuo.

## Processo de Wiener no intervalo unitário

Resta mostrar que $\{W_t\}_{t\in [0, 1]}$ tem todas as propriedades desejadas para que seja um processo de Wiener no intervalo $[0, 1]$. Para mostrarmos isso, vamos explorar a convergência obtida acima, que implica em convergência em distribuição, para passar ao limite as propriedades já estabelecidas para os processos discretos $\{X_d^{(n)}\}_{d\in D_n}$, usando, também, que $D$ é denso em $I=[0,1]$.

### Processo inicial

Como $s_d(0) = 0$, para todo $d\in D$, segue imediatamente que
$$
W_0 = \sum_{d\in D} s_d(0)Z_d = 0
$$

### Continuidade dos caminhos amostrais

Construímos $\{W_t^{(n)}\}_{t\in [0,1]}$ de tal forma que, para todo $\omega\in \Omega$, o caminho amostral $t \mapsto W_t^{(n)}(\omega)$ seja contínuo. Obtivemos, ainda, que cada caminho amostral $t \mapsto W_t(\omega)$ é limite uniforme de $t \mapsto W_t^{(n)}(\omega)$. Portanto, para todo $\omega\in\Omega$, o caminho amostral $t \mapsto W_t(\omega)$ também contínuo. Em particular,
$$
\mathbb{P}(\{\omega; \;t \mapsto W_t(\omega) \textrm{ é contínuo}\}) = 1.
$$

### Independência dos incrementos

Sejam $0 \leq t_0 < t_1 < \ldots < t_n \leq 1$, onde $n\in \mathbb{N}$, $n \geq 2$. Dados eventos $E_1, \ldots, E_n\in \mathbb{A}$, vamos considerar a probabilidade conjunta dos incrementos $W_{t_j} - W_{t_{j-1}}$, $j = 1, \ldots, n$.
$$
\mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n).
$$

Considere sequências $\{t_j^k\}_{k\in \mathbb{N}}$ tais que $t_j^k\in D$, $0 \leq t_0^k < t_1^k < \ldots < t_n^k \leq 1$ e $t_j^k \rightarrow t_j$, quando $k \rightarrow \infty$, para qualquer $j = 0, \ldots, n$.

Como os caminhos amostrais são contínuos, temos que $W_{t_j^k}$ converge quase-sempre para $W_{t_j}$, quando $k \rightarrow \infty$. Como cada incremento é Gaussiano e a função de distribuição de probabilidades de uma Gaussiana é contínua, seque que
$$
\mathbb{P}(W_{t_j^k} - W_{t_{j-1}^k} \in E_1) \rightarrow \mathbb{P}(W_{t_j} - W_{t_{j-1}} \in E_1), \quad k \rightarrow \infty.
$$
Da mesma forma, o conjunto de incrementos é uma Gaussiana multivariada e a função de distribuição de probabilidades de uma Gaussiana multivariada também é contínua, de modo que
$$
\mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1, \ldots, W_{t_n^k} - W_{t_{n-1}^k} \in E_n) \rightarrow \mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n), \quad k \rightarrow \infty.
$$

Já vimos que, em pontos diádicos, $W_{t_j^k} = W_{t_j^k}^{n_k} = X_{t_j^k}^{n_k}$, para algum $n_k$ tal que $t_j^k\in D_{n_k}$, para todo $j = 0, \ldots, n$ e para todo $k\in \mathbb{N}$. Já vimos, também, que os incrementos de $\{X_d^{(n)}\}_{d\in D_n}$ são independentes. Portanto,
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

Construímos um processo $\{W_t\}_{t\in [0, 1]}$ com todas as propriedades de um processo de Wiener, exceto que só está definido no intervalo $[0, 1]$. Podemos construir um processo de Wiener em $[0, \infty)$ simplesmente transladando e concatenando processos em $[0, 1]$.

Sejam, então, $\{W_t^k\}_{t \in [0, 1]}$, $k\in \mathbb{N}$, processos independentes com as propriedades de um processo de Wiener no intervalo $0\leq t \leq 1.$ Podem ser construídos através de uma família $\{Z_d^{(n)}\}_{d\in D, n\in \mathbb{N}}$ de processos independentes normais, com $Z_d^{(n)} \sim \mathcal{N}(0, 1)$ e $Z_0^{(n)} = 0 \sim \mathcal{N}(0, 0)$, com espaço amostral $\tilde\Omega = \Omega^{\mathbb{N}} = \mathbb{R}^{D^{\mathbb{N}}}$.

Definimos cada $\{W_t^{(n)}\}_{0 \leq t \leq 1}$ a partir de $\{Z_d^{(n)}\}_{d\in D}$ e, em seguida, concatenamo-los através da fórmula
$$
W_t = \sum_{k = 1}^{[t]} W_1^k + W_{t - [t]}^{[t]+1}, \qquad \forall t \geq 0,
$$
onde $[t] = \max\{n \leq t, n \in \mathbb{Z}\}$ é o maior inteiro menor do que $t \geq 0$.

Isso define um processo estocástico contínuo com todos as condições necessárias para ser um processo de Wiener. A demonstração disso fica como exercício.

## Exercícios

1. Faça os detalhes da demonstração por indução de que os processos contínuos definidos por
$$
W_t^{(n+1)} = W_t^{(n)} + \sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d = \sum_{d\in D_{n+1}} s_d(t)Z_d
$$
são interpolações dos processos discretos $\{X_d^{(n)}\}_{d\in D_n}$, i.e. $W_d^{(n)} = X_d^{(n)}$, para todo $d\in D_n$ e todo $n\in\mathbb{N}$.

2. Sejam $\{W_t^k\}_{t \in [0, 1]}$, $k\in \mathbb{N}$, processos de Wiener, em $[0, 1]$, independentes. Faça os detalhes da demonstração de que $W_t = \sum_{k = 1}^{[t]} W_1^k + W_{t - [t]}^{[t]+1}$ é um processo de Wiener em $[0, \infty)$.

3. Na construção, definimos $X_{d}^{n+1}$, para $d \in D_{n+1}\setminus D_n$, pela fórmula $(X_{d - 1/2^n}^{(n)} + X_{d + 1/2^n}^{(n)})/2 + Z_d/2^{(n + 1)/2}$, com os $Z_d$'s sendo mutamente independentes. Essa construção não é arbitrária. Mostre que se $\{W_t\}_{t\geq 0}$ é um processo de Wiener e $0 \leq s < t,$ então
$$
\frac{W_s + W_t}{2} + W_{(t + s)/2}
$$
é independente de $W_\tau,$ para $\tau \leq s$ e $\tau \geq t$.

