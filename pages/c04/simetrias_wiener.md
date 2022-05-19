@def title = "Simetrias do processo de Wiener"

# {{ get_title }}

Processos de Wiener possuem algumas simetrias importantes.

## Invariância por rescalonamento

Considere um processo de Wiener padrão $\{W_t\}_{t\geq 0}$. Dado $a > 0$, defina o processo $\{V_t^a\}_{t\geq 0}$ por
$$
V_t^a = \frac{1}{a}W_{a^2t}, \quad t \geq 0.
$$
Então $\{V_t^a\}_{t\geq 0}$ também é um processo de Wiener padrão. Caso $\{W_t\}_{t\in [0, T]}$ só esteja definido em um intervalor $[0, T]$, $T > 0$, então obtemos um processo de Wiener $\{V_t^a\}_{t\in [0, a^2T]}$ em $[0, a^2T]$.

É imediato verificar que i) $V_0^a = W_0 = 0$; ii) quase sempre os caminhos amostrais $t \mapsto V_t^a(\omega) = (1/a)W_{a^2 t}(\omega)$ são contínuos; e iii) os incrementos $V_{t_j}^a - V_{t_{j-1}}^a = (1/a)W_{a^2 t_j} - (1/a)W_{a^2 t_{j-1}}$, $j = 1, \ldots, n$, $0 \leq t_0 < t_1 < \ldots < t_n$, são independentes. Falta verificar a distribuição dos incrementos:
$$
V_{t + \tau}^a - V_t^a = (1/a)W_{a^2(t + \tau)} - (1/a)W_{a^2t} \sim (1/a)\mathcal{N}(0, a^2\tau) = \mathcal{N}(0, \tau).
$$
Isso completa a demonstração dessa simetria.

## Crescimento sublinear

Seja $\{W_t\}_{t\geq 0}$ um processo de Wiener. Então vale, quase sempre,
$$
\lim_{t \rightarrow \infty} \frac{W_t}{t} = 0.
$$

## Invariância por inversão temporal

Considere um processo de Wiener padrão $\{W_t\}_{t\geq 0}$ e defina o processo $\{V_t\}_{t\geq 0}$ por
$$
V_t = \begin{cases}
0, & t = 0, \\
 tW_{1/t}, & t \in (0, \infty).
\end{cases}
$$
Então $\{V_t\}_{t\geq 0}$ também é um processo de Wiener padrão em $[0, \infty)$. Vamos verificar isso.

### Estado inicial

Por construção, temos $V_0 = W_0 = 0$.

### Continuidade quase sempre dos caminhos amostrais

Para quase todo $\omega$, o caminho $t \mapsto W_t(\omega)$ é contínuo. Daí tiramos que $t \mapsto V_t(\omega) = t W_{1/t}(\omega)$ é contínuo em $(0, \infty)$. Além disso, segue do crescimento sublinear dos caminhos amostrais que, quase sempre,
$$
\lim_{t \rightarrow 0} V_t = \lim_{t \rightarrow 0} t W_{1/t} = \lim_{s \rightarrow \infty} \frac{W_s}{s} = 0.
$$
Portanto, para quase todo $\omega$, vale $t W_{1/t}(\omega) \rightarrow 0$, quando $t \rightarrow 0$, mostrando que $t \mapsto V_t(\omega) = t W_{1/t}(\omega)$ é contínuo também em $t = 0$, portanto é contíno em $[0, \infty)$, para quase todo $\omega$. Isso mostra a continuidade quase sempre dos caminhos amostrais de $\{V_t\}_{t\geq 0}$.

### Independência dos incrementos

Quanto à independência dos incrementos, se $0 < t_0 < t_1 < \ldots < t_n$, então $1/t_n < \ldots < 1/t_1 < t/t_0$ e vemos que os incrementos $V_{t_j} - V_{t_{j-1}} = t_jW_{1/t_j} - t_{j-1}W_{1/t_{j-1}}$, $j = 1, \ldots, n$, também envolvem intervalos disjuntos, mas cada fator está multiplicado por um instante diferente, não sendo tão imediado deduzir a independência.

Vamos usar o fato de que esses incrementos formam uma normal multivariada e, com isso, a independência seque da independência dois a dois, que, por sua vez, segue se provarmos que as covariâncias são nulas.

Vamos, então, considerar quatro instantes distintos $0 < t_1 < t_2 < t_3 < t_4$ e olhar para as covariâncias de dois incrementos disjuntos:
$$
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) = \mathrm{Cov}(t_2 W_{1/t_2} - t_1 W_{1/t_1}, t_4 W_{1/t_4} - t_3 W_{1/t_3}).
$$
Escrevendo
$$
t_2 W_{1/t_2} - t_1 W_{1/t_1} = (t_2 - t_1) W_{1/t_2} + t_1 (W_{1/t_2} - W_{1/t_1}),
$$
obtemos
$$
\begin{align*}
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) & = \mathrm{Cov}((t_2 - t_1) W_{1/t_2}, t_4 W_{1/t_4} - t_3 W_{1/t_3}) + \mathrm{Cov}(t_1 (W_{1/t_2} - W_{1/t_1}), t_4 W_{1/t_4} - t_3 W_{1/t_3}) \\
& = \mathrm{Cov}((t_2 - t_1) W_{1/t_2}, t_4 W_{1/t_4}) - \mathrm{Cov}((t_2 - t_1) W_{1/t_2}, t_3 W_{1/t_3}) \\
& \quad + \mathrm{Cov}(t_1 (W_{1/t_2} - W_{1/t_1}), t_4 W_{1/t_4}) - \mathrm{Cov}(t_1 (W_{1/t_2} - W_{1/t_1}), t_3 W_{1/t_3})
\end{align*}
$$

Como $W_0 = 0$ e $1/t_4 < 1/t_3 < 1/t_2 < 1/t_1$, escrevemos
$$
\begin{align*}
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) & = t_4(t_2 - t_1)\mathrm{Cov}(W_{1/t_2}, W_{1/t_4}) - t_3(t_2 - t_1)\mathrm{Cov}(W_{1/t_2}, W_{1/t_3}) \\
& \quad - t_1t_4\mathrm{Cov}(t_1 (W_{1/t_1} - W_{1/t_2}), t_4 (W_{1/t_4} - W_0)) + t_1t_3\mathrm{Cov}((W_{1/t_1} - W_{1/t_2}), (W_{1/t_3} - W_0))
\end{align*}
$$
Os dois últimos termos envolvem incrementos em intervalos disjuntos, portanto independentes, de modo que
$$
\mathrm{Cov}(t_1 (W_{1/t_1} - W_{1/t_2}), t_4 (W_{1/t_4} - W_0)) = \mathrm{Cov}((W_{1/t_1} - W_{1/t_2}), (W_{1/t_3} - W_0)) = 0.
$$

Nos dois termos restantes, usamos a propriedade $\mathrm{Cov}(W_t, W_s) = \min\{t, s\}$ do processo de Wiener, que nos dá
$$
t_4(t_2 - t_1)\mathrm{Cov}(W_{1/t_2}, W_{1/t_4}) = t_4(t_2 - t_1)\min\{\frac{1}{t_2},\frac{1}{t_4}} = t_4(t_2 - t_1)\frac{1}{t_4} = t_2 - t_1
$$
e
$$
t_3(t_2 - t_1)\mathrm{Cov}(W_{1/t_2}, W_{1/t_3}) = t_3(t_2 - t_1)\min\{\frac{1}{t_2},\frac{1}{t_3}} = t_3(t_2 - t_1)\frac{1}{t_3} = t_2 - t_1.
$$

Portanto, os dois primeiros termos se cancelam e os dois últimos se anulam, resultando em
$$
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) = 0.
$$

Se $t_1 = 0$, então
$$
\begin{align*}
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) & = \mathrm{Cov}(t_2 W_{1/t_2}, t_4 W_{1/t_4} - t_3 W_{1/t_3}) = \mathrm{Cov}(t_2 W_{1/t_2}, t_4 W_{1/t_4}) - \mathrm{Cov}(t_2 W_{1/t_2}, t_3 W_{1/t_3}) \\
  & = t_2t_4\mathrm{Cov}(W_{1/t_2}, W_{1/t_4}) - t_2t_3\mathrm{Cov}(t_2 W_{1/t_2}, W_{1/t_3}) = \frac{t_2t_4}{t_4} - \frac{t_2t_3}{t_3} = t_2 - t_2 = 0.
\end{align*}
$$

Como os incrementos são normais, isso mostra que quaisquer dois incrementos disjuntos de $\{V_t\}_{t\geq 0}$ são independentes. Como dito acima, considerando $n$ incrementos consecutivos, o argumento acima mostra que eles são independentes dois a dois. E como são normais, isso implica neles serem mutuamente independentes.

## Distribuição de probabilidades dos incrementos

Sejam, agora, $t \geq 0$, $\tau > 0$. Se $t = 0$, então
$$
V_{t + \tau} - V_t = V_\tau = \tau W_{1/\tau} = \tau (W_{1/\tau} - W_0) \sim \tau \mathcal{N}(0, 1/\tau) = \mathcal{N}(0, \tau).
$$

Se $t > 0$, então
$$
V_{t + \tau} - V_t = (t + \tau)W_{1/(t + \tau)} - tW_{1/t}.
$$
Somando e subtraindo $t W_{1/(t + \tau)}$, obtemos
$$
V_{t + \tau} - V_t = (t + \tau)W_{1/(t + \tau)} - t W_{1/(t + \tau)} + t W_{1/(t + \tau)} - tW_{1/t} = \tau W_{1/(t + \tau)} + t (W_{1/(t + \tau)} - W_{1/t}).
$$
Como $W_0 = 0$, temos
$$
V_{t + \tau} - V_t  = \tau (W_{1/(t + \tau)} - W_0) - t (W_{1/t} - W_{1/(t + \tau)}).
$$
Vemos, com isso, que esse incremento é uma combinação linear das normais independentes
$$
W_{1/(t + \tau)} - W_0 \sim \mathcal{N}(0, 1/(t + \tau)), \quad W_{1/t} - W_{1/(t + \tau)} \sim \mathcal{N}(0, \tau/t(t + \tau)).
$$
Portanto, esse incremento é uma normal com média zero e variância
$$
\tau^2\frac{1}{t + \tau} + t^2\frac{\tau}{t(t + \tau)} = \frac{\tau^2t + t^2\tau}{t(t + \tau)} = \tau.
$$
Ou seja,
$$
V_{t + \tau} - V_t  \sim \mathcal{N}(0, \tau), \quad \forall t \geq 0, \;\tau > 0.
$$

Isso completa a demonstração dessa simetria.


