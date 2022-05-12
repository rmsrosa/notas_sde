@def title = "Existência"

# {{ get_title }}

O processo conhecido atualmente como processo de Wiener foi introduzido, como modelo para o movimento Browniano, por N. Wiener, em 1923, junto com a demonstração de existência de tal processo. Vamos, a seguir, discutir uma demonstração dada por Paul Lévy, conforme apresentada em Morters & Peres (2010) e Evans (2013).

A demonstração é obtida por um processo de limite, a partir de um processo estocástico discreto que é interpolado para um processo contínuo. A construção crucial é feita no intervalo $I = [0, 1]$. A partir daí, podemos concatenar processos independentes em $[0, 1]$ para obter um processo de Wiener em $[0, \infty)$.

Há, essencialmente, duas formas de definir essa sequência aproximante de processos no intervalo $[0, 1]$. Veremos as duas, já que uma facilita mostrarmos que os incrementos são normais independentes e identicamente distribuídas, enquanto que a outra facilita a demonstração de convergência da sequência.

## Partição diádica do intervalo unitário

A interpolação é feita a partir de malhas formadas por números *diádicos* (números racionais cujo denominador é uma potência de 2). Mais precisamente, considere os conjuntos
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
plot(title = "Malha formada por pontos diádicos", titlefont = 10, xaxis = "t", yaxis = "n")
for n in 1:N
    scatter!(tt[n], [0], markersize = 16 - 3n, label = "D$n")
end
savefig(joinpath(@OUTPUT, "dyadic_points.svg"))
```
\fig{dyadic_points}

## Processo discreto i.i.d.

Como dito, o processo de Wiener será obtido como limite de processos obtidos por interpolação de partes finitas de um processo discreto i.i.d., que vamos definir em $D$.

Com esse fim, considere um processo discreto *i.i.d.* $\{Z_d\}_{d\in D\setminus \{0\}}$, onde as variáveis $Z_d$ são mutuamente independentes e dadas por $Z_d \sim \mathcal{N}(0, 1)$. Como $D$ é enumerável, podemos considerar o conjunto $\Omega = \mathbb{R}^D$ como espaço amostral, e por $\mathcal{A}$ a $\sigma$-álgebra gerada por $\pi_d^{-1}(\mathcal{E})$, onde $E$ é mensurável e $\pi_d : \Omega \rightarrow \mathbb{R}$ leva um caminho $x\in \Omega$ no elemento $\pi_d x = x(d)$, em $d\in D$. Para simplificar, escrevemos $Z_0 = 0$, já que queremos o processo de Wiener limite satisfaça $W_0 = Z_0 = 0$.

## Sequência de processos

Para cada $d\in D$, devemos ter $W_d = W_d - W_0 \sim \mathcal{N}(0, d)$. Então seria natural pensarmos em definir $W_d$ como $Z_d / \sqrt{d}$ (já que $Z_d \sim \mathcal{N}(0, 1)$, de modo que $Z_d/\sqrt{d} \sim \mathcal{N}(0, d)$) e interpolar, de alguma forma, para $t\in I \setminus D$. Apesar disso convergir para um processo, este não terá as propridades desejadas. Mas uma variação disso funciona.

Para cada $n\in \mathbb{N}$, definimos o processo discreto $\{W_d^n\}_{d\in D_n}$, na malha finita $D_n$, da seguinte forma.

Primeiramente, sendo $D_1 = \{0, 1\}$, definimos
$$
W_0^1 = 0, \quad W_1^1 = Z_1.
$$
Para $n = 2$, temos $D_2 = \{0, 1/2, 1\}$. A ideia é estender $\{W_d^1\}_{d\in D_1}$ para um $\{W_d^2\}_{d\in D_2}$, em $D_2\supset D_1$, mantendo os processos $W_0^1, W_1^1$ em $d = 0, 1$ e adicionando uma fração de $Z_{1/2}$ à interpolação linear de $W_0^1 = 0$ e $W_1^1 = Z_1$, em $d = 1/2$. Mais precisamente, fazemos
$$
W_0^2 = W_0^1, \quad W_1^2 = W_1^1, \quad W_{1/2}^2 = \frac{W_0^1 + W_1^1}{2} + \frac{Z_{1/2}}{2}.
$$

Agora, continuamos por indução, estendendo o processo $\{W_d^n\}_{d\in D_n}$, em $D_n$, para um processo $\{W_d^{n+1}\}_{d\in D_{n+1}}$, em $D_{n+1}$. Para isso, começamos fazendo
$$
W_d^{n+1} = W_d^n, \qquad \forall d\in D_n.
$$
Agora, para $d \in D_{n+1} \setminus D_n$, tomamos a média em relação aos valores adjacentes $d \pm 1/2^n$ e somamos uma fração apropriada de $Z_d$:
$$
W_d^{n+1} = \frac{W_{d - 1/2^n}^n + W_{d + 1/2^n}^n}{2} + \frac{Z_d}{2^{(n + 1)/2}}.
$$

Observe que, com $n = 1$, esta fórmula coincide com a fórmula acima dada explicitamente para $\{W_d^2\}_{d\in D_2}$.

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
        plot(ttn, Wn, title = "Caminhos amostrais de Wⁿ, n = 1, ..., $(2j)", titlefont = 10, xaxis = "t", yaxis = "W", ylims = (-3, 3), marker = :circle, markersize = 3, label = false)
    )
end
plot(plts..., layout = (2, 2), size = (800, 600))
savefig(joinpath(@OUTPUT, "sequenciaWn.svg"))
```
\fig{sequenciaWn}

## Independência e distribuição dos incrementos

Observe que cada $W_d^n$ só depende das variáveis $\{Z_d\}_{d\in D_n}$, que são independentes de $\{Z_d\}_{d \in D \setminus D_n}$. Portanto, os processos $(W_d^n)_{d\in D_n}$ e $\{Z_d\}_{d \in D \setminus D_n}$ são independentes.

Agora, vamos ver que os incrementos de cada processo $\{W_d^n\}_{d\in D_n}$ são independentes. Para $n = 1$, isso é vácuo, já que só há um incremento, $W_1^1 - W_0^0 = Z_1$. Para $n = 2$, temos apenas dois incrementos,
$$
\Delta_{1/2}^2 = W_1^2 - W_{1/2}^2 = W_1^1 - \frac{W_0^1 + W_1^1}{2} - \frac{Z_{1/2}}{2} = \frac{W_1^1 - W_0^1}{2} - \frac{Z_{1/2}}{2} = \frac{Z_1}{2} - \frac{Z_{1/2}}{2}
$$
e
$$
\Delta_0^2 = W_{1/2}^2 - W_0^2 = \frac{W_0^1 + W_1^1}{2} + \frac{Z_{1/2}}{2} - W_0^2 = \frac{W_1^1 - W_0^1}{2} + \frac{Z_{1/2}}{2} = \frac{Z_1}{2} + \frac{Z_{1/2}}{2}.
$$
Aparentemente, esses incrementos poderiam não ser independentes, mas são. Como $Z_1$ e $Z_{1/2}$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1)$, então $Z_1/2$ e $Z_{1/2}/2$ são independentes e são normais identicamente distribuídas com distribuição $\mathcal{N}(0,1/4)$. Assim, a soma e a diferença de $Z_1/2$ e $Z_{1/2}/2$, que são exatamente os incrementos, são, também, normais independentes e identicamente distribuídas, com distribuição $\mathcal{N}(0, 1/2)$. Além disso, também são independentes de $\{Z_d\}_{d \in D \setminus D_2}$.

Agora, vamos assumir, em um argumento de indução, que os incrementos de $\{W_d^n\}_{d \in D_n}$ são independentes e identicamente distribuídos, com, em particular, 
$$
W_{d + 1/2^{n-1}}^n - W_d^n \sim \mathcal{N}\left(0, \frac{1}{2^{n-1}}\right).
$$
Além disso, assumimos que são independentes de $\{Z_d\}_{d\in D \setminus D_n}$.

Vamos mostrar que o mesmo vale para $\{W_d^{n+1}\}_{d\in D_{n+1}}$, com incrementos consecutivos sendo normais independentes com média zero, variância $1/2^n$ e independentes de $\{Z_d\}_{d\in D \setminus D_{n+1}}$.

Considere $d \in D_{n+1}\setminus D_n$, lembremos que
$$
W_d^{n+1} = \frac{W_{d - 1/2^n}^n + W_{d + 1/2^n}^n}{2} + \frac{Z_d}{2^{(n+1)/2}}.
$$
Os dois incrementos consecutivos com ponto comum $d$ são
$$
W_d^{n+1} - W_{d - 1/2^n}^{n+1} = \frac{W_{d + 1/2^n}^n - W_{d - 1/2^n}^n}{2} + \frac{Z_d}{2^{(n+1)/2}}
$$
e
$$
W_{d + 1/2^n}^{n+1} - W_d^{n+1} = \frac{W_{d + 1/2^n}^n - W_{d - 1/2^n}^n}{2} - \frac{Z_d}{2^{(n+1)/2}}.
$$

Observe que $W_{d + 1/2^n}^n - W_{d - 1/2^n}^n$ é um passo consecutivo do processo $\{W_d^n\}_{d\in D_n}$. Assim, usando a hipótese de indução, temos que $W_{d + 1/2^n}^n - W_{d - 1/2^n}^n$ e $Z_d$ são independentes e que $W_{d + 1/2^n}^n - W_{d - 1/2^n}^n \sim \mathcal{N}(0, 1/2^n)$. Assim, temos
$$
\frac{W_{d + 1/2^n}^n - W_{d - 1/2^n}^n}{2} \quad \text{e} \quad \frac{Z_d}{2^{(n+1)/2}} \sim \mathcal{N}\left(0, \frac{1}{2^{n+1}}\right).
$$

Portanto, as suas somas e diferenças, que são exatamente os dois passos consecutivos, também são independentes e identicamente distribuídos, com distribuição $\mathcal{N}(0, 1/2^{n+1})$.

Isso mostra que dois passos consecutivos de $\{W_d^{n+1}\}_{d\in D_{n+1}}$, com ponto em comum $d$ em $d \in D_{n+1}\setminus D_n$, são independentes e a distribuição dada como na indução. Agora, se $d \in D_n\setminus$, então $d \pm 1/2^n \in D_{n+1} \setminus D_n$. Nesse caso, os passos consecutivos envolvem um estêncil de cinco pontos diádicos:
$$
W_d^{n+1} - W_{d - 1/2^n}^{n+1} = W_d^n - \frac{W_{d}^n + W_{d - 1/2^{n-1}}^n}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}} = \frac{W_{d}^n - W_{d - 1/2^{n-1}}^n}{2} - \frac{Z_{d-1/2^n}}{2^{(n+1)/2}}
$$
e
$$
W_{d + 1/2^n}^{n+1} - W_d^{n+1} = \frac{W_{d + 1/2^{n-1}}^n - W_d^n}{2} + \frac{Z_{d+1/2^n}}{2^{(n+1)/2}}.
$$
Observe que os dois incrementos no lado direito das duas expressões acima são incrementos consecutivos do processo $\{W_d^n\}_{d\in D_n}$ e que os termos restantes são variáveis distintas de $\{Z_d\}_{d\in D\setminus D_n}$. Pela hipótese de indução, todas essas variáveis são mutuamente independentes. Portanto, os dois incrementos acima de $\{W_d^{n+1}\}_{d\in D_{n+1}}$ também são independentes entre si. Além disso, como esses termos do lado direito tem distribuição normal $\mathcal{N}(0, 1/2^{n+1})$, então os incrementos tem distribuição normal $\mathcal{N}(0, 1/2^n)$.

Provamos que quaisquer dois incrementos consecutivos de $\{W_d^{n+1}\}_{d\in D_{n+1}}$ são independentes dois a dois e com a mesma distribuição normal. Como a distribuição conjunta é normal, segue, da independência dois a dois, que todos os incrementos consecutivos são mutuamente independentes.

Disso segue, também, que passos "largos" disjuntos $W_{d_2}^{n+1} - W_{d_1}^{n+1}$, $W_{d_3}^{n+1} - W_{d_2}^{n+1}$, ..., com $d_1 < d_2 < d_3 < \ldots < d_n$ em $D_{n+1}$, também são independentes.

Finalmente, como eles não envolvem $\{Z_d\}_{d\in D \setminus D_n}$, os incrementos e esses processos são mutuamente independentes.

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

A partir disso, obtemos a seguinte estimativa para cada subprocesso $\{Z_d\}_{d\in D_n}$:
$$
\mathbb{P}(\{\omega; \;\exists d \in D_n, \;|Z_d(\omega)| \geq c\sqrt{n}\}) \leq \sum_{d\in D_n} \mathbb{P}(|Z_d| \geq n) \leq \frac{2^{n-1}}{\pi} e^{-\frac{c^2 n}{2}}.
$$

Finalmente, obtemos, para $c^2 > 2\ln(2)$, que
$$
\sum_{n\in \mathbb{N}} \mathbb{P}(\exists d \in D_n, \;|Z_d| \geq c\sqrt{n}) \leq \frac{1}{\pi}\sum_{n\in \mathbb{N}}2^{n-1} e^{-\frac{c^2 n}{2}} = \frac{1}{2\pi}\sum_{n\in \mathbb{N}}e^{n\ln 2} e^{-\frac{c^2 n}{2}} = \frac{1}{2\pi}\sum_{n\in \mathbb{N}}e^{-\frac{\left(c^2 - 2\ln(2)\right)n}{2}} < \infty
$$
Com essa estimativa, segue, do Lema de Borel-Cantelli, que
$$
\mathbb{P}(\limsup_{n\rightarrow \infty} \{\exists d \in D_n, \;|Z_d| \geq c\sqrt{n}\}) = 0.
$$
Isso implica em que, para $N\in \mathbb{N}$ aleatório suficientemente grande,
$$
\mathbb{P}(|Z_d| \leq c\sqrt{n}, \forall d\in D_n) = 1, \qquad \forall n \geq N.
$$

Portanto,
$$
sup_{t\in [0,1]} \|F_n(t)\| \leq c\frac{\sqrt{n}}{2^{n/2}}, \qquad \forall n \geq N.
$$

## Convergência

Com a estimativa acima, vemos que a série
$$
W(t) = \sum_n F_n(t)
$$
é absolutamente, uniformemente convergente (em probabilidade) no intervalo $[0, 1]$.

## Incrementos


## Extensão para a semireta

Construímos um processo $\{W_t\}_{t\in [0, 1]}$ com todas as propriedades de um processo de Wiener, exceto que só está definido no intervalo $[0, 1]$. Podemos construir um processo de Wiener, em $[0, \infty)$, concatenando processos em $[0, 1]$.

Sejam, então, $\{W_t^n\}_{t \in [0, 1]}$, $n\in \mathbb{N}$, processos independentes em $[0, 1]$ com as propriedades de um processo de Wiener. (Podem ser construídos, de forma que sejam independentes, a partir de processos $\{Z_d\}_{d \in D^\mathbb{N}}$).

Definimos
$$
W_t = W_{t - [t]}^{[t]} + \sum_{j = 0}^{[t]-1} W_1^j, \qquad \forall t \geq 0,
$$
onde $[t] = \max\{n \leq t, n \in \mathbb{Z}\}$ é o maior inteiro menor do que $t \geq 0$.

Isso define um processo estocástico contínuo com todos as condições necessárias para ser um processo de Wiener.
