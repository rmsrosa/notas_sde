@def title = "Existência de processos de Wiener"

# {{ get_title }}

O tipo de processo conhecido atualmente como processo de Wiener foi introduzido, como modelo para o movimento Browniano, por Norbert Wiener, em 1923, junto com a demonstração de existência de tal processo. A demonstração de Wiener é baseada em uma expansão senoidal a partir da lei de distribuição dos coeficientes de Fourier do processo. Essa expansão é feita no intervalo $[0, 2\pi]$ e toma a forma
$$
    W_t = \frac{t}{\sqrt{2\pi}} Z_0 + \frac{2}{\sqrt{2\pi}}\sum_{n=1}^\infty \frac{\sin(\frac{1}{2}nt)}{n}Z_n, \qquad 0 \leq t \leq 2\pi,
$$
onde $\{Z_n\}_{n\in\mathbb{N}}$ são normais $\mathcal{N}(0, 1)$ independentes e identicamente distribuídas. É possível mostrar que essa série converge para um processo de Wiener.

A motivação para a expansão acima vem da derivada ser, pelo menos formalmente, um *ruído branco,* com os coeficientes da série de mesma amplitude, em um sentido probabilístico. De fato, derivando formalmente a série acima, temos
$$
    \frac{\mathrm{d} W_t}{\mathrm{d}t} = \frac{1}{\sqrt{2\pi}} Z_0 + \frac{1}{\sqrt{2\pi}}\sum_{n=1}^\infty \sin(\frac{1}{2}nt)Z_n, \qquad 0 \leq t \leq 2\pi,
$$
de modo que os coeficientes são normais independentes identicamente distribuídas,
$$
    \frac{1}{\sqrt{2\pi}}Z_n \sim \mathcal{N}\left(0, \frac{1}{2\pi}\right).
$$

Da mesma forma que séries de Fourier de funções determinísticas, expansões em séries senoidas podem ser feitas para outros processos estocásticos, a partir dos trabalhos seguintes de Wiener, em conjunto com Zygmund e Paley e levam, atualmente, o nome de representação de Paley-Wiener.

Outra demonstração possível é via limite de passeios aleatórios devidamente reescalados,
$$
    W_t^{(n)} = \frac{1}{\sqrt{n}}\sum_{1 \leq k \leq nt} Z_k, \qquad 0\leq t \leq 1.
$$
O intervalo $[0, 1]$ é dividido em $n$ subintervalos de tamanho $1/n$ e passos $Z_k/\sqrt{n} \sim \mathcal{N}(0, 1/n)$ são dados a cada subintervalo. Pelo Teorema Central do Limite, para cada $t,$ as variáveis aleatórias $W_t^{(n)}$ convergem para $\mathcal{N}(0, t),$ mas isso não resolve a questão toda, da convergência do processo como um todo e dos passos serem independentes e identicamente distribuídos, com a distribuição correta. Para isso, é preciso explorar certas simetrias do passeio aleatório e usar uma norma apropriada para mostrar a convergência dos caminhos amostrais em um espaço adequado. Esse resultado de que, de fato, esses processos $\{W_t^{(n)}\}_t,$ $n\in\mathbb{N},$ convergem para um processo de Wiener é devido a Monroe Donsker (1951, 1952).

Vamos, no entanto, discutir, a seguir, uma demonstração mais simples, dada por Paul Lévy, e inspirada nas demonstrações apresentadas em Morters & Peres (2010) e Evans (2013). A demonstração é feita por um processo de limite, a partir de um processo estocástico discreto que é interpolado para um processo contínuo. A construção crucial é feita no intervalo $I = [0, 1].$ A partir daí, podemos transladar e concatenar processos independentes em $[0, 1]$ para obter um processo de Wiener em $[0, \infty).$

Veremos duas formas de escrever essa sequência aproximante de processos no intervalo $[0, 1].$ Uma facilita mostrarmos que os incrementos são normais independentes e identicamente distribuídos, enquanto que a outra facilita a demonstração de convergência da sequência.

Vale ressaltar que um processo de Wiener não é único, assim como não há uma única variável aleatória normal. Podemos, naturalmente, ter várias normais, independentes umas das outras. No caso do processo de Wiener, podemos, por exemplo, contruir um processo através do limite de interpolações de diferentes sequências de variáveis normais, obtendo diferentes processos de Wiener.

## Partição diádica do intervalo unitário

A aproximação é feita a partir de malhas formadas por números *diádicos* (números racionais cujo denominador é uma potência de 2) entre zero e um. Mais precisamente, considere os conjuntos
$$
D_n = \left\{\frac{k}{2^{n-1}}; \; k = 0, 1, \ldots, 2^{n-1}\right\}, \qquad n\in \mathbb{N}.
$$
A união de todos esses pontos é um conjunto enumerável denso no intervalo $[0, 1]$ e é denotada por
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

Como dito, um processo de Wiener pode ser obtido como limite de processos obtidos por interpolação de um processo discreto i.i.d., que vamos definir em $D.$

Com esse fim, considere um processo discreto *i.i.d.* $\{Z_d\}_{d\in D\setminus \{0\}},$ onde as variáveis $Z_d$ são mutuamente independentes e dadas por normais $Z_d \sim \mathcal{N}(0, 1).$ Como $D$ é enumerável, podemos considerar o conjunto
$$
\Omega = \mathbb{R}^D
$$
como espaço amostral, e por $\mathcal{A}$ a $\sigma$-álgebra gerada por $\pi_d^{-1}(\mathcal{B}),$ onde $\mathcal{B}$ são os conjuntos borelianos em $\mathbb{R}$ e $\pi_d : \Omega \rightarrow \mathbb{R}$ são as projeções levam um caminho $\omega\in \Omega$ no elemento $\pi_d \omega = \omega(d),$ em $d\in D.$ Denotamos a medida de probabilidade do processo $\{Z_d\}_{d\in D\setminus \{0\}}$ por $\mathbb{P}.$ Para simplificar, escrevemos $Z_0 = 0,$ já que queremos que o processo de Wiener limite satisfaça $W_0 = Z_0 = 0.$

## Sequência aproximante de processos discretos

Vamos primeiro construir uma sequência de processos discretos, cada um com parâmetro em $D_n,$ $n\in\mathbb{N}.$ Estes processos serão interpolados para processos em $[0, 1].$ Por motivo de clareza, vamos denotar esses processos discretos por $\{X_d^{(n)}\}_{d\in D_n}.$ As interpolações contínuas serão denotadas por $\{W_t^{(n)}\}_{t\in [0, 1]}.$ E, no limite, teremos o processo contínuo $\{W_t\}_{t\in [0, 1]}.$ Por serem extensões, teremos $W_d = W_d^{(n)} = X_d^{(n)},$ nos pontos diádicos $d\in D_n.$ Observe que os processos $\{X_d^{(n)}\}_{d\in D_n}$ são, na verdade, vetores aleatórios, já que cada $D_n$ é finito.

Para cada $d\in D_n,$ esperamos ter $X_d^{(n)} = W_d = W_d - W_0 \sim \mathcal{N}(0, d).$ Então seria natural pensarmos em definir $X_d^{(n)}$ como $Z_d / \sqrt{d},$ já que $Z_d \sim \mathcal{N}(0, 1),$ de modo que $Z_d/\sqrt{d} \sim \mathcal{N}(0, d),$ e interpolar, de alguma forma, para $t\in I \setminus D_n.$ Apesar disso convergir para um processo, este não terá a distribuição correta dos passos. E nem os seus passos serão independentes. Mas uma variação disso funciona. Essa variação se baseia no fato de que se $A$ e $B$ são duas variáveis normais independentes com mesma variância, então $A+B$ e $A-B$ também são independentes e com o dobro da variância de $A$ e $B.$

Mais precisamente, definimos, para cada $n\in \mathbb{N},$ o processo discreto $\{X_d^{(n)}\}_{d\in D_n},$ na malha finita $D_n,$ da seguinte forma. Primeiramente, sendo $D_1 = \{0, 1\},$ definimos
$$
X_0^{(1)} = 0, \quad X_1^{(1)} = Z_1.
$$
Para $n = 2,$ temos $D_2 = \{0, 1/2, 1\}.$ A ideia é estender $\{X_d^{(1)}\}_{d\in D_1}$ para um $\{X_d^{(2)}\}_{d\in D_2},$ em $D_2\supset D_1,$ mantendo os processos $X_0^{(1)}, X_1^{(1)}$ em $d = 0, 1$ e adicionando uma fração de $Z_{1/2}$ à interpolação linear de $X_0^{(1)} = 0$ e $X_1^{(1)} = Z_1,$ em $d = 1/2.$ Mais precisamente, fazemos
$$
X_0^{(2)} = X_0^{(1)}, \quad X_1^{(2)} = X_1^{(1)}, \quad X_{1/2}^{(2)} = \frac{X_0^{(1)} + X_1^{(1)}}{2} + \frac{Z_{1/2}}{2}.
$$

Agora, continuamos por indução, estendendo o processo $\{X_d^{(n)}\}_{d\in D_n},$ em $D_n,$ para um processo $\{X_d^{(n+1)}\}_{d\in D_{n+1}},$ em $D_{n+1}.$ Para isso, começamos fazendo
$$
X_d^{(n+1)} = X_d^{(n)}, \qquad \forall d\in D_n.
$$
Agora, para $d \in D_{n+1} \setminus D_n,$ tomamos a média em relação aos valores adjacentes $d \pm 1/2^n$ e somamos uma fração apropriada de $Z_d$:
$$
X_d^{(n+1)} = \frac{X_{d - 1/2^n}^{(n)} + X_{d + 1/2^n}^{(n)}}{2} + \frac{Z_d}{2^{(n + 1)/2}}.
$$

Observe que, com $n = 1,$ esta fórmula coincide com a fórmula acima dada explicitamente para $\{X_d^{(2)}\}_{d\in D_2}.$

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

Observe que cada $X_d^{(n)}$ só depende das variáveis $\{Z_d\}_{d\in D_n},$ que são independentes de $\{Z_d\}_{d \in D \setminus D_n}.$ Portanto, os processos $(X_d^{(n)})_{d\in D_n}$ e $\{Z_d\}_{d \in D \setminus D_n}$ são independentes.

Agora, vamos ver que os incrementos de cada processo $\{X_d^{(n)}\}_{d\in D_n}$ são independentes. Para $n = 1,$ isso é vácuo, já que só há um incremento, $X_1^{(1)} - X_0^{(1)} = Z_1.$ Para $n = 2,$ temos apenas dois incrementos,
$$
\Delta_{1/2}^{(2)} = X_1^{(2)} - X_{1/2}^{(2)} = X_1^{(1)} - \frac{X_0^{(1)} + X_1^{(1)}}{2} - \frac{Z_{1/2}}{2} = \frac{X_1^{(1)} - X_0^{(1)}}{2} - \frac{Z_{1/2}}{2} = \frac{Z_1}{2} - \frac{Z_{1/2}}{2}
$$
e
$$
\Delta_0^{(2)} = X_{1/2}^{(2)} - X_0^{(2)} = \frac{X_0^{(1)} + X_1^{(1)}}{2} + \frac{Z_{1/2}}{2} - X_0^{(2)} = \frac{X_1^{(1)} - X_0^{(1)}}{2} + \frac{Z_{1/2}}{2} = \frac{Z_1}{2} + \frac{Z_{1/2}}{2}.
$$
Aparentemente, esses incrementos poderiam não ser independentes, mas são. Como $Z_1$ e $Z_{1/2}$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1),$ então $Z_1/2$ e $Z_{1/2}/2$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1/4).$ Assim, a soma e a diferença de $Z_1/2$ e $Z_{1/2}/2,$ que são exatamente os incrementos, são, também, normais independentes e identicamente distribuídas, com distribuição $\mathcal{N}(0, 1/2).$ Além disso, também são independentes de $\{Z_d\}_{d \in D \setminus D_2}.$

Agora, vamos assumir, em um argumento de indução, que os incrementos de $\{X_d^{(n)}\}_{d \in D_n}$ são independentes e identicamente distribuídos, com distribuição
$$
X_{d + 1/2^{n-1}}^{(n)} - X_d^{(n)} \sim \mathcal{N}\left(0, \frac{1}{2^{n-1}}\right).
$$
Além disso, assumimos que são independentes de $\{Z_d\}_{d\in D \setminus D_n}.$

Vamos mostrar que o mesmo vale para $\{X_d^{(n+1)}\}_{d\in D_{n+1}},$ com incrementos consecutivos sendo normais independentes com média zero, variância $1/2^n$ e independentes de $\{Z_d\}_{d\in D \setminus D_{n+1}}.$

Considere $d \in D_{n+1}\setminus D_n,$ lembremos que
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

Observe que $X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}$ é um passo consecutivo do processo $\{X_d^{(n)}\}_{d\in D_n}.$ Assim, usando a hipótese de indução, temos que $X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}$ e $Z_d$ são independentes e que $X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)} \sim \mathcal{N}(0, 1/2^{n-1}).$ Assim, temos
$$
\frac{X_{d + 1/2^n}^{(n)} - X_{d - 1/2^n}^{(n)}}{2} \quad \text{e} \quad \frac{Z_d}{2^{(n+1)/2}} \sim \mathcal{N}\left(0, \frac{1}{2^{n+1}}\right).
$$

Portanto, as suas somas e diferenças, que são exatamente os dois passos consecutivos, também são independentes e identicamente distribuídos, com distribuição $\mathcal{N}(0, 1/2^{n+1} + 1/2^{n+1}) = \mathcal{N}(0, 1/2^n).$

Isso mostra que dois passos consecutivos de $\{X_d^{(n+1)}\}_{d\in D_{n+1}},$ com ponto em comum $d$ em $d \in D_{n+1}\setminus D_n,$ são independentes e a distribuição dada como na indução. Agora, se $d \in D_n\setminus,$ então $d \pm 1/2^n \in D_{n+1} \setminus D_n.$ Nesse caso, os passos consecutivos envolvem um estêncil de cinco pontos diádicos:
$$
X_d^{(n+1)} - X_{d - 1/2^n}^{(n+1)} = X_d^{(n)} - \frac{X_{d}^{(n)} + X_{d - 1/2^{n-1}}^{(n)}}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}} = \frac{X_{d}^{(n)} - X_{d - 1/2^{n-1}}^{(n)}}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}}
$$
e
$$
X_{d + 1/2^n}^{(n+1)} - X_d^{(n+1)} = \frac{X_{d + 1/2^{n-1}}^{(n)} - X_d^{(n)}}{2} + \frac{Z_{d+1/2^n}}{2^{(n+1)/2}}.
$$
Observe que os dois incrementos no lado direito das duas expressões acima são incrementos consecutivos do processo $\{X_d^{(n)}\}_{d\in D_n}$ e que os termos restantes são variáveis distintas de $\{Z_d\}_{d\in D\setminus D_n}.$ Pela hipótese de indução, todas essas variáveis são mutuamente independentes. Portanto, os dois incrementos acima de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$ também são independentes entre si. Além disso, como esses termos do lado direito tem distribuição normal $\mathcal{N}(0, 1/2^{n+1}),$ então os incrementos tem distribuição normal $\mathcal{N}(0, 1/2^n).$

Provamos que quaisquer dois incrementos consecutivos de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$ são independentes dois a dois. Como a distribuição conjunta é normal, segue, da independência dois a dois, que todos os incrementos consecutivos são mutuamente independentes.

Disso segue, também, que incrementos disjuntos a "passos largos" $X_{d_2}^{n+1} - X_{d_1}^{n+1},$ $X_{d_3}^{n+1} - X_{d_2}^{n+1},$ ..., com $d_1 < d_2 < d_3 < \ldots < d_n$ em $D_{n+1},$ também são independentes, pois cada incremento desses é combinação linear de passos "curtos" independentes distintos.

Finalmente, como eles só envolvem $\{Z_d\}_{d\in D \setminus D_{n+1}},$ então os incrementos de $\{X_d^{(n+1)}\}_{d\in D_{n+1}}$ e os processos restantes $\{Z_d\}_{d\in D \setminus D_{n+1}}$ também são mutuamente independentes.

### Comentário sobre a definição da distribuição no ponto médio

A definição de $X_d^{(n+1)}$ em $d\in D_{n+1}\setminus D_n$ como a média entre $X_{d - 1/2^n}^{(n)}$ e $X_{d + 1/2^n}^{(n)}$ mais uma normal independente está ligada a distribuição *ponte* do processo de Wiener em um instante $t'$ dados os valores em outros dois pontos em torno de $t'.$ Mais precisamente, tomemos, por exemplo, $t'= 1/2,$ como ponto médio entre $0$ e $1.$ Então
$$
    \begin{cases}
        W_1 - W_{1/2} = S_0 \sim \mathcal{N}(0, 1/2), \\
        W_{1/2} - W_0 = S_1 \sim \mathcal{N}(0, 1/2),
    \end{cases}
$$
com os passos $S_0$ e $S_1$ independentes.
Subtraindo, obtemos
$$
    W_1 + W_0 - 2W_{1/2} = S_1 - S_0.
$$
Com isso,
$$
    W_{1/2} = \frac{W_0 + W_1}{2} + \frac{S^-}{2}, \qquad S^- = S_1 - S_0 \sim \mathcal{N}(0, 1).
$$
Além disso,
$$
    W_0 + W_1 = W_0 + W_0 + W_1 - W_0 = 2W_0 + S_1 + S_0 = 2W_0 + S^+,
$$
onde
$$
    S^+ = S_1 + S_0 \sim \mathcal{N}(0, 1),
$$
com $S^+$ e $S^-$ independentes, de modo que
$$
    \frac{W_0 + W_1}{2} \quad \textrm{e} \quad \frac{S^-}{2}
$$
são independentes.

Observe que, nesse exemplo específico, $W_0 = 0,$ mas em outros pontos, de forma mais geral, teríamos um $W_{t_0}$ não necessariamente nulo mas, de qualquer forma, independente dos passos futuros e dos $S_1, S_2, S^+, S^-$ correspondentes.

## Interpolação

Definimos $\{W_t^{(n)}\}_{0\leq t \leq 1}$ como sendo a interpolação linear por partes do processo (digo, vetor aleatório) $\{X_d^{(n)}\}_{d\in D_n}.$ Tal interpolação pode ser representada por
$$
    W_t^{(n)} = \sum_{d\in D_n} \varphi_{n,d}(t) X_d^{(n)},
$$
onde cada $\varphi_{n,d}=\varphi_{n,d}(t)$ é a função "tenda"
$$
    \varphi_{n,d}(t) = \max\{0, 1 - 2^{n-1}|t - d|\} = \begin{cases}
      0, & |t - d| \geq 1/2^{n-1}, \\
      1 - 2^{n-1}(d - t), & d - 1/2^{n-1} \leq t \leq d, \\
      1 - 2^{n-1}(t - d), & d \leq t \leq d + 1/2^{n-1},
    \end{cases},
$$
que se anula para $|t - d| \geq 1/2^{n-1},$ vale $1$ em $t = d$ e é linear nos intervalos da malha diádica $D_n.$

Mas essa representação não nos será tão útil. Vamos usar uma outra representação, diretamente em termos de $\{Z_d\}_{d\in D},$ que pode ser obtida por indução. Como todos os $X_d^{(n)}$ são definidos em termos das variáveis $Z_d,$ $d\in D_n,$ então, substituindo recursivamente o processo discreto chegamos a
$$
    W_t^{(n)} = \sum_{d\in D_n} s_d(t) Z_d,
$$
para funções de interpolação apropriadas $s_d=s_d(t).$ A questão é como obter essas funções de maneira mais explícita. Vejamos o primeiro processo $\{W_t^{(1)}\}_{0\leq t \leq 1}.$ Este é um interpolação linear entre
$$
    X_0^{(1)} = Z_0 = 0, \quad X_1^{(1)} = Z_1.
$$
A interpolação linear entre esses pontos toma a forma
$$
    W_t^{(1)} = (1 - t)Z_0 + tZ_1, \quad 0 \leq t \leq 1.
$$

De outra maneira, podemos escrever
$$
    W_t^{(1)} = s_0(t)Z_0 + s_1(t)Z_1,
$$
com as funções estendidas à toda a reta e escrita em termos das funções-tenda anteriores,
$$
    s_0(t) = \varphi_{1,0}(t) = \max\{0, 1 - |t|\}, \quad s_1(t) = \varphi_{1,1}(t) = \max\{0, 1 - |t - 1|\}.
$$
Podemos juntar as duas expressões na fórmula
$$
    s_d(t) = \max\{0, 1 - |t - d|\}, \quad d = 0, 1.
$$

Para $\{W_t^{(2)}\}_{0\leq t \leq 1},$ observamos que $\{X_d^{(2)}\}_{d\in D_2}$ é obtido a partir de $\{X_d^{(1)}\}_{d\in D_1}$ acresentando $Z_{1/2}/2$ à média entre os valores em $t=0$ e $t=1,$ de modo que
$$
    W_t^{(2)} = W_t^{(1)} + s_{1/2}(t)Z_{1/2}.
$$
Isso, de fato, vale em geral e segue direto da própria expansão que queremos explicitar,
$$
    W_t^{(n+1)} = \sum_{d\in D_{n+1}} s_d(t) Z_d = \sum_{d\in D_{n}} s_d(t) Z_d + \sum_{d\in D_{n+1}\setminus D_{n}} s_d(t) Z_d = W_t^{(n)} + \sum_{d\in D_{n+1}\setminus D_{n}} s_d(t) Z_d.
$$

O termo que estamos somando,
$$
    s_{1/2}(t)Z_{1/2},
$$
é uma interpolação entre $Z_{1/2}/2$ no ponto médio $t=1/2$ e o valor nulo nos extremos $t=0$ e $t=1.$ Assim, $s_{1/2}(t)$ é um interpolação linear por partes entre $s_{1/2}(0) = s_{1/2}(1) = 0$ e $s_{1/2}(1/2) = 1/2.$ Tal função pode ser escrita na forma
$$
    s_{1/2}(t) = \frac{1}{2}\max\{0, 1 - 2|t - 1/2|\} = \min\{0, t, 1 - t\}.
$$
Assim,
$$
    W_t^{(2)} = s_0(t)Z_0 + s_1(t)Z_1 + s_{1/2}Z_{1/2},
$$
com as funções $s_0, s_1, s_{1/2}$ definidas por
$$
    s_d(t) = \max\{0, 1 - |t - d|\}, \; d = 0, 1, \qquad s_{1/2}(t) = \frac{1}{2}\max\{0, 1 - 2|t - 1/2|\}.
$$

Agora, assumindo, em um argumento de indução, que tenhamos, para um dado $n,$ as fórmulas para $s_d(t),$ $d\in D_n,$ e a expansão
$$
    W_t^{(n)} = \sum_{d\in D_n} s_d(t) Z_d,
$$
vamos usar que
$$
    W_t^{(n+1)} = W_t^{(n)} + \sum_{d\in D_{n+1}\setminus D_{n}} s_d(t) Z_d
$$
para encontrar as funções no nível $D_{n+1}\setminus D_{n}.$ Em tal nível, cada $s_d(t)$ em $d\in D_{n+1}\setminus D_{n}$ é um interpolação que se anula em todos os subintervalos da partição diádica exceto no intervalo $(d - 1/2^n, d + 1/2^n),$ no qual ele tem uma forma de tenda, se anulando nos extremos desse intervalo e valendo
$$
    s_d(d) = \frac{1}{2^{(n+1)/2}},
$$
no centro do subintervalo. Uma tal função linear por partes pode ser escrita como um múltiplo $1/2^{(n+1)/2}$ de uma função "tenda" que vale $1$ no centro, portanto com inclinações $2^n$ e $-2^n,$ nos subintervalos $(d - 1/2^n, d)$ e $(d, d + 1/2^n),$ respectivamente. Isso pode ser escrito na forma sucinta
$$
    s_d(t) = \frac{1}{2^{(n+1)/2}}\max\{0, 1 - 2^n|t - d|\}, \quad d\in D_{n+1}\setminus D_n.
$$
Observe que essa fórmula inclui as fórmulas para $s_0(t),$ $s_1(t)$ e $s_{1/2}(t)$ explicitadas acima. Dessa maneira, obtemos a expansão desejada
$$
    W_t^{(n)} = \sum_{d\in D_n} s_d(t) Z_d,
$$
com
$$
    s_d(t) = \frac{1}{2^{(n+1)/2}}\max\{0, 1 - 2^n|t - d|\}, \quad d\in D_{n+1}\setminus D_n,
$$
para $n\in \mathbb{N}$ arbitrário.

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

A razão de explicitarmos essas funções é que precisaremos fazer estimativas para mostrar a convergência dessas aproximações. Com isso, precisamos de estimativas para essas funções de interpolação.

Com isso em mente, observe que cada $s_d(t)$ é não negativa e com ponto máximo em $t=d.$ Para $d\in D_{n+1}\setminus D_n,$ o valor máximo, obtido em $t=d,$ é 
$$
  s_d(d) = \frac{1}{2^{(n+1)/2}}.
$$
Assim,
$$
    0 \leq s_d(t) \leq \frac{1}{2^{(n+1)/2}}, \qquad t\in\mathbb{R}.
$$
Além disso, as funções de interpolação em um mesmo nível $D_{n+1}\setminus D_n$ têm suportes que não se sobrepõe (não encaixantes ou *non overlapping*). Com isso, podemos somar as funções de interpolação em cada nível sem aumentar essa cota, i.e.
$$
    0 \leq \sum_{d\in D_{n+1}\setminus D_n} s_d(t) \leq \frac{1}{2^{(n+1)/2}}, \quad \forall n\in\mathbb{N}.
$$

Cada $s_d$ pode ser visto como uma primitiva de uma base de wavelets, a **base de Haar**, formada por funções constantes por partes,
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

### Representação em série

Obtivemos, acima, então, que
$$
W_t^{(n)} = \sum_{d\in D_n} s_d(t) Z_d, \qquad 0 \leq t \leq 1
$$
é uma representação para a interpolação linear do processo discreto $\{X_d^{(n)}\}_{d\in D_n},$ i.e. $W_d^{(n)} = X_d^{(n)},$ para todo $d\in D_n$ e que $W_t^{(n)}$ é linear em cada intervalo $[d, d + 1/2^n]$ com $d, d + 1/2^n\in D_n.$

## Limite

A ideia, agora, é passar ao limite e definir o processo de Wiener $\{W_t\}_{t\in [0, 1]}$ através da série
$$
W_t = \sum_{d\in D} s_d(t) Z_d, \qquad 0 \leq t \leq 1.
$$

Para isso, precisamos mostrar a convergência dessa série. Vamos mostrar que, com probabilidade $1,$ essa convergência se dá uniformemente em $0 \leq t \leq 1.$ Podemos escrever isso como
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

A ideia é obter uma estimativa para a sequência de Cauchy em termos de um processo discreto $(A_n)_{n\in\mathbb{N}}$ com valores não-negativos e com $A_n \rightarrow 0$ quase sempre, definido no mesmo espaço amostral $\Omega,$ i.e.
$$
\max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| \leq A_n(\omega), \quad \forall m \geq n,
$$
com
$$
A_n \rightarrow 0,
$$
quase certamente.

### Processo $A_n$

Para obter a estimativa acima, usamos a representacão em série de $\{W_t^{(n)}\}_n$ para estimar, para $m\geq n,$
$$
|W_t^{(m)} - W_t^{(n)}| = \left|\sum_{d\in D_m\setminus D_n} s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \sum_{d\in D_{k+1}\setminus D_k} \left| s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \left(\max_{d\in D_{k+1}\setminus D_k} |Z_d|\sum_{d\in D_{k+1}\setminus D_k} s_d(t)\right).
$$
para todo $0\leq t \leq 1.$ Como visto acima, em cada nível $D_{k+1}\setminus D_k,$ as funções $s_d=s_d(t)$ têm suportes não encaixantes e o somatório é limitado pelo máximo dessas funções, que é exatamente $1/2^{(k+1)/2},$ ou seja,
$$
0 \leq \sum_{d\in D_{k+1}\setminus D_k} s_d(t) \leq \frac{1}{2^{(k+1)/2}}.
$$
Portanto,
$$
|W_t^{(m)} - W_t^{(n)}| = \left|\sum_{d\in D_m\setminus D_n} s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \sum_{d\in D_{k+1}\setminus D_k} \left| s_d(t) Z_d \right| \leq \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d|.
$$

O lado direito é independente de $t$ e de $m \geq n.$ Assim, podemos escrever
$$
\max_{m\geq n} \sup_{0\leq t \leq 1} |W_t^{(m)} - W_t^{(n)}| \leq A_n,
$$
onde
$$
A_n = \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d|.
$$
Para obter que $A_n \rightarrow 0,$ basta mostrar que a série converge quase sempre.

### Convergência da série

Queremos mostrar, portanto, que
$$
\sum_{k = 1}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d| < \infty
$$
quase sempre. A ideia para isso é mostrar que podemos estimar, quase sempre,
$$
|Z_d| \leq r_k, \quad \forall d\in D_{k+1}\setminus D_k, \;\forall k \geq N,
$$
para algum $N=N(\omega)$ e para uma série apropriada $r_k.$ Se isso for possível, então, quase sempre, teremos
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

Precisamos, assim, obter uma estimativa para as variáveis aleatórias $Z_d$ do processo $\{Z_d\}_{d\in D}.$ Como elas são independentes, a função de densidade de probabilidade das marginais desse processo é dada pela Gaussiana padrão. Assim, para cada $d\in D$ e para $r \geq 0$ arbitrário,
$$
\mathbb{P}(|Z_d| \geq r) = \frac{1}{\sqrt{2\pi}}\int_{|s|\geq r} e^{-\frac{s^2}{2}} \;\mathrm{d}s \leq \frac{1}{\sqrt{2\pi}}e^{-\frac{r^2}{4}} \int_{|s| \geq r} e^{-\frac{s^2}{4}} \;\mathrm{d}s.
$$
Limitando a integral e fazendo a mudança de variáveis $s = \sqrt{2}\sigma,$ obtemos
$$
\mathbb{P}(|Z_d| \geq r) \leq \frac{1}{\sqrt{2\pi}}e^{-\frac{r^2}{4}} \int_\mathbb{R} e^{-\frac{s^2}{4}} \;\mathrm{d}s = \frac{\sqrt{2}}{\sqrt{2\pi}}e^{-\frac{r^2}{4}}\int_\mathbb{R} e^{-\frac{\sigma^2}{2}} \;\mathrm{d}\sigma = \sqrt{2} e^{-\frac{r^2}{4}}.
$$

Em particular,
$$
\mathbb{P}(|Z_d| > r_k) \leq \sqrt{2} e^{-\frac{r_k^2}{4}},
$$
para um $r_k \geq 0$ qualquer.

### Escolha dos $r_k$

Assim, removendo o fator $\sqrt{2}$ que é independente de $k,$ precisamos encontrar $\{r_k\}_{k\in\mathbb{N}}$ tais que
$$
\sum_{k = 1}^\infty \frac{1}{2^{k/2}}r_k < \infty, \quad \textrm{e} \quad \sum_{k=1}^\infty 2^k e^{-\frac{r_k^2}{4}} < \infty.
$$
Observe que $r_k$ tem que crescer suficientemente rápido para que a exponencial ganhe da potência de dois, no segundo somatório, mas não pode crescer muito rápido, para não ganhar do denominador no primeiro somatório. Procurando um crescimento potencial $r_k = k^\alpha,$ vemos que qualquer valor $\alpha>1/2$ é suficiente, já que é subexponencial, perdendo pro decrescimento exponencial $1/2^k,$ e $r_k^2 \geq k^{2\alpha},$ de tal forma que $e^{-r_k^2} \leq e^{-k^{2\alpha}},$ que ganha de $2^k.$ Também podemos escolher $\alpha=1/2$ desde que multipiquemos a sequência por um fator apropriado. Essa escolha nos dá a taxa de decrescimento dos coeficientes a mais rápida possível. Observe que, escolhendo $r_k = 2\sqrt{k},$ temos
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
quase sempre. Isso demonstra que a série é uniformenente convergente para quase todo $\omega\in\mathbb{R}^D.$ Portanto, podemos definir $\{W_t\}_{t\in [0, 1]}$ por
$$
W_t = \sum_{d\in D} s_d(t) Z_d, \qquad 0 \leq t \leq 1.
$$
Além disso, para quase todo $\omega,$ o caminho amostral $W_t(\omega)$ é o limite uniforme dos caminhos contínuos $W_t^{(n)}(\omega),$ sendo, também, contínuo.

### Mais explicitamente

Podemos ser um pouco mais explícitos e considerar o conjunto "bom"
$$
    G = \bigcup_{n\in\mathbb{N}}\bigcap_{m \geq n} \bigcap_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| \leq r_k\}.
$$
Nesse conjunto, i.e. para todo $\omega\in G,$ temos que existe $N=N(\omega)$ tal que
$$
    \bigcap_{m \geq N(\omega)} \bigcap_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| \leq r_k\}.
$$
Como esses conjuntos são não crescentes em $n,$ temos, de fato, que
$$
    \bigcap_{m \geq n} \bigcap_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| \leq r_k\}, \qquad \forall n \geq N(\omega).
$$
Assim,
$$
    \max_{m \geq n}\max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(N(\omega))}(\omega)| \leq A_{n}(\omega) = \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}}\max_{d\in D_{k+1}\setminus D_k} |Z_d(\omega)| \leq \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}} r_k,
$$
Como a série é convergente para $r_k = 2\sqrt{k},$ temos que o rabo da série decai para zero, i.e. 
$$
    \max_{m \geq n}\max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(N(\omega))}(\omega)| \leq \sum_{k = n}^\infty \frac{1}{2^{(k+1)/2}} r_k \rightarrow 0, \quad n\rightarrow \infty.
$$
Ou seja,
$$
    \lim_{m, n\rightarrow 0} \max_{0\leq t\leq 1} |W_t^{(m)}(\omega) - W_t^{(n)}(\omega)| = 0, \quad \forall \omega \in G.
$$

Falta mostrar que $G$ tem probabilidade total, $\mathbb{P}(G) = 1,$ ou seja, $\mathbb{P}(\Omega \setminus G) = 0.$ Para tal, observe que
$$
    \Omega \setminus G = \bigcap_{n\in\mathbb{N}}\bigcup_{m \geq n} \bigcup_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| > r_k\} = \limsup_{k\rightarrow \infty} \left(\bigcup_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| > r_k\}\right).
$$
Assim, estamos no contexto do Lema de Borel-Cantelli. Basta provar que
$$
    \sum_{k\in \mathbb{N}} \mathbb{P}\left( \bigcup_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| > r_k\} \right) < \infty
$$
para deduzir que
$$
    \mathbb{P}\left(\Omega \setminus G\right) = \mathbb{P}\left(\limsup_{k\rightarrow \infty} \left(\bigcup_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| > r_k\}\right)\right) = 0.
$$
Para ver que o somatório é finita, observamos que
$$
    \begin{align*}
        \sum_{k\in \mathbb{N}} \mathbb{P}\left( \bigcup_{d\in D_{k+1}\setminus D_k} \{\omega; \;|Z_d(\omega)| > r_k\} \right) & \leq \sum_{k\in \mathbb{N}} \sum_{d\in D_{k+1}\setminus D_k} \mathbb{P}\left(\{\omega; \;|Z_d(\omega)| > r_k\} \right) \\
        & \leq \sum_{k\in \mathbb{N}} \sum_{d\in D_{k+1}\setminus D_k} \sqrt{2}e^{-r_k^2/4} \\
        & \leq \sqrt{2}\sum_{k\in \mathbb{N}} 2^k e^{-r_k^2/4} \\
        & = \sqrt{2}\sum_{k\in \mathbb{N}} e^{k\ln(2)} e^{-k} \\
        & = \sqrt{2}\sum_{k\in\mathbb{N}} e^{-k(1 - \ln(2))} \\
        & < \infty,
    \end{align*}
$$
dada a escolha $r_k = 2\sqrt{k}.$

Assim, mostramos que, com probabilidade $1,$ a sequência converge uniformemente.

## Processo de Wiener no intervalo unitário

Resta mostrar que $\{W_t\}_{t\in [0, 1]}$ tem todas as propriedades desejadas para que seja um processo de Wiener no intervalo $[0, 1].$ Para mostrarmos isso, vamos explorar a convergência obtida acima, que implica em convergência em distribuição, para passar ao limite as propriedades já estabelecidas para os processos discretos $\{X_d^{(n)}\}_{d\in D_n},$ usando, também, que $D$ é denso em $I=[0,1].$

### Processo inicial

Como $s_d(0) = 0,$ para todo $d\in D,$ segue imediatamente que
$$
W_0 = \sum_{d\in D} s_d(0)Z_d = 0
$$

### Continuidade dos caminhos amostrais

Construímos $\{W_t^{(n)}\}_{t\in [0,1]}$ de tal forma que, para todo $\omega\in \Omega,$ o caminho amostral $t \mapsto W_t^{(n)}(\omega)$ é contínuo. Obtivemos, ainda, que cada caminho amostral $t \mapsto W_t(\omega)$ é limite uniforme de $t \mapsto W_t^{(n)}(\omega).$ Portanto, para todo $\omega\in\Omega,$ o caminho amostral $t \mapsto W_t(\omega)$ também contínuo. Em particular,
$$
\mathbb{P}(\{\omega; \;t \mapsto W_t(\omega) \textrm{ é contínuo}\}) = 1.
$$

As outras hipóteses da definição de um processo de Wiener, em particular as hipóteses do processo ser Gaussiano e dos incrementos serem normais com média zero e variância igual ao tamanho do passo temporal, não garantem que os caminhos sejam, quase certamente, contínuos, mas segue do *Teorema de Continuidade de Kolmogorov* que uma *modificação* quase sempre do processo tem caminhos que são Hölder contínuos com expoente arbitrariamente próximo de $1/2.$ Portanto, é possível obter um processo de Wiener (com a hipótese de continuidade quase certamente) modificando um processo Gaussiano que satisfaça as outras hipóteses. A demonstração acima nos dá isso mais diretamente. 

### Independência dos incrementos

Sejam $0 \leq t_0 < t_1 < \ldots < t_n \leq 1,$ onde $n\in \mathbb{N},$ $n \geq 2.$ Dados eventos $E_1, \ldots, E_n\in \mathbb{A},$ vamos considerar a probabilidade conjunta dos incrementos $W_{t_j} - W_{t_{j-1}},$ $j = 1, \ldots, n.$
$$
\mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n).
$$

Considere sequências $\{t_j^k\}_{k\in \mathbb{N}}$ tais que $t_j^k\in D,$ $0 \leq t_0^k < t_1^k < \ldots < t_n^k \leq 1$ e $t_j^k \rightarrow t_j,$ quando $k \rightarrow \infty,$ para qualquer $j = 0, \ldots, n.$

Como os caminhos amostrais são contínuos, temos que $W_{t_j^k}$ converge quase-sempre para $W_{t_j},$ quando $k \rightarrow \infty.$ Como cada incremento é Gaussiano e a função de distribuição de probabilidades de uma Gaussiana é contínua, seque que
$$
\mathbb{P}(W_{t_j^k} - W_{t_{j-1}^k} \in E_1) \rightarrow \mathbb{P}(W_{t_j} - W_{t_{j-1}} \in E_1), \quad k \rightarrow \infty.
$$
Da mesma forma, o conjunto de incrementos é uma Gaussiana multivariada e a função de distribuição de probabilidades de uma Gaussiana multivariada também é contínua, de modo que
$$
\mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1, \ldots, W_{t_n^k} - W_{t_{n-1}^k} \in E_n) \rightarrow \mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n), \quad k \rightarrow \infty.
$$

Já vimos que, em pontos diádicos, $W_{t_j^k} = W_{t_j^k}^{n_k} = X_{t_j^k}^{n_k},$ para algum $n_k$ tal que $t_j^k\in D_{n_k},$ para todo $j = 0, \ldots, n$ e para todo $k\in \mathbb{N}.$ Já vimos, também, que os incrementos de $\{X_d^{(n)}\}_{d\in D_n}$ são independentes. Portanto,
$$
\mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1, \ldots, W_{t_n^k} - W_{t_{n-1}^k} \in E_n) = \mathbb{P}(W_{t_1^k} - W_{t_0^k} \in E_1) \times \cdots \times \mathbb{P}(W_{t_n^k} - W_{t_{n-1}^k} \in E_n).
$$
Passando ao limite $k \rightarrow \infty$ dos dois lados da igualdade acima, obtemos
$$
\mathbb{P}(W_{t_1} - W_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n) = \mathbb{P}(W_{t_1} - W_{t_0} \in E_1) \times \cdots \times \mathbb{P}(W_{t_n} - W_{t_{n-1}} \in E_n),
$$
mostrando a independência dos incrementos.

### Distribuição dos incrementos

Sejam $t$ e $\tau$ tais que $0\leq t < t + \tau \leq 1.$ Considere sequências $\{t^k\}_{k\in \mathbb{N}},$ $\{\tau_k\}_{k\in \mathbb{N}}$ tais que $t^k \rightarrow t,$ $\tau^k \rightarrow \tau,$ $0 \leq t^k < t^k + \tau^k \leq 1$ e $t^k, t^k + \tau^k \in D.$ Para cada $k,$ temos, de fato, $t^k, t^k + \tau^k\in D_{n_k},$ para $n_k\in \mathbb{N}$ suficientemente grande.

Conforme argumentado acima, temos
$$
\mathbb{P}(W_{t^k + \tau^k} - W_{t^k} \leq x) \rightarrow \mathbb{P}(W_{t + \tau} - W_t \leq x), \quad k \rightarrow \infty,
$$
para todo $x \in \mathbb{R}.$ Por outro lado, sabemos que $W_{t^k + \tau^k} - W_{t^k} = X_{t^k + \tau^k}^{n_k} - X_{t^k}^{n_k} \sim \mathcal{N}(0, \tau^k),$ de forma que
$$
\mathbb{P}(W_{t^k + \tau^k} - W_{t^k} \leq x) = F_{\tau_k}(x),
$$
onde $F_{\sigma^2}(\cdot)$ denota a função de distribuição acumulada da normal $\mathcal{N}(0, \sigma^2),$ $\sigma > 0.$ Passando ao limite em $k\rightarrow \infty,$ obtemos
$$
\mathbb{P}(W_{t + \tau} - W_{t} \leq x) = F_{\tau}(x).
$$
Portanto,
$$
W_{t + \tau} - W_{t} \sim \mathcal{N}(0, \tau).
$$

Isso completa a demonstração de que $\{W_t\}_{t\in [0, 1]}$ é um processo de Wiener em $[0, 1].$

## Extensão para a semireta

Construímos um processo $\{W_t\}_{t\in [0, 1]}$ com todas as propriedades de um processo de Wiener, exceto que só está definido no intervalo $[0, 1].$ Podemos construir um processo de Wiener em $[0, \infty)$ simplesmente transladando e concatenando processos em $[0, 1].$

Sejam, então, $\{W_t^k\}_{t \in [0, 1]},$ $k\in \mathbb{N},$ processos independentes com as propriedades de um processo de Wiener no intervalo $0\leq t \leq 1.$ Podem ser construídos através de uma família $\{Z_d^{(n)}\}_{d\in D, n\in \mathbb{N}}$ de processos independentes normais, com $Z_d^{(n)} \sim \mathcal{N}(0, 1)$ e $Z_0^{(n)} = 0 \sim \mathcal{N}(0, 0),$ com espaço amostral $\tilde\Omega = \Omega^{\mathbb{N}} = \mathbb{R}^{D^{\mathbb{N}}}.$

Definimos cada $\{W_t^{(n)}\}_{0 \leq t \leq 1}$ a partir de $\{Z_d^{(n)}\}_{d\in D}$ e, em seguida, concatenamo-los através da fórmula
$$
W_t = \sum_{k = 1}^{[t]} W_1^k + W_{t - [t]}^{[t]+1}, \qquad \forall t \geq 0,
$$
onde $[t] = \max\{n \leq t, n \in \mathbb{Z}\}$ é o maior inteiro menor do que $t \geq 0.$

Isso define um processo estocástico contínuo com todos as condições necessárias para ser um processo de Wiener. A demonstração disso fica como exercício.

## Exercícios

1. Faça os detalhes da demonstração por indução de que os processos contínuos definidos por
$$
W_t^{(n+1)} = W_t^{(n)} + \sum_{d\in D_{n+1}\setminus D_n} s_d(t)Z_d = \sum_{d\in D_{n+1}} s_d(t)Z_d
$$
são interpolações dos processos discretos $\{X_d^{(n)}\}_{d\in D_n},$ i.e. $W_d^{(n)} = X_d^{(n)},$ para todo $d\in D_n$ e todo $n\in\mathbb{N}.$

2. Sejam $\{W_t^k\}_{t \in [0, 1]},$ $k\in \mathbb{N},$ processos de Wiener, em $[0, 1],$ independentes. Faça os detalhes da demonstração de que $W_t = \sum_{k = 1}^{[t]} W_1^k + W_{t - [t]}^{[t]+1}$ é um processo de Wiener em $[0, \infty).$

3. Na construção, definimos $X_{d}^{n+1},$ para $d \in D_{n+1}\setminus D_n,$ pela fórmula $(X_{d - 1/2^n}^{(n)} + X_{d + 1/2^n}^{(n)})/2 + Z_d/2^{(n + 1)/2},$ com os $Z_d$'s sendo mutamente independentes. Essa construção não é arbitrária. Mostre que se $\{W_t\}_{t\geq 0}$ é um processo de Wiener e $0 \leq s < t,$ então
$$
W_{(t + s)/2} - \frac{W_s + W_t}{2}
$$
é independente de $W_\tau,$ para $\tau \leq s$ e para $\tau \geq t.$

4. Além de pontos médios, mostre, usando a independência de incrementos disjuntos, que $W_t - tW_1$ e $W_1$ são mutuamente independentes, para $0 < t < 1.$