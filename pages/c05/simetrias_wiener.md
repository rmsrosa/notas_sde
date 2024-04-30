@def title = "Simetrias de processos de Wiener"

# {{ get_title }}

Processos de Wiener possuem algumas simetrias importantes.


## Invariância por reflexão

Considere um processo de Wiener padrão $\{W_t\}_{t\geq 0}$. Então o processo $\{V_t\}_{t \geq 0}$ definido por $V_t = - W_t$ também é um processo de Wiener padrão. De fato, observe, inicialmente, que $V_0 = -W_0 = 0$. Agora, se $0 \leq t_0 \leq \cdots \leq t_k$ então os passos $\{W_{t_j} - W_{t_{j-1}}\}_{j=1}^k$ são independentes. Como $V_{t_j} - V_{t_{j-1}} =  - (W_{t_j} - W_{t_{j-1}})$, então os passos $\{V_{t_j} - V_{t_{j-1}}\}_{j=1}^k$ também são independentes. Além disso, $V_{t + \tau} - V_t = - (W_{t+\tau} - W_t) \sim -\mathcal{N}(0, \tau) = \mathcal{N}(0, \tau).$ Finalmente, como os caminhos amostrais $t \mapsto W_t$ são continuos, então $t \mapsto V_t = -W_t$ também os são.

Observe que, por conta dessa simetria,
$$
    \mathbb{P}(|W_t| \geq r) = 2\mathbb{P}(W_t \geq r),
$$
para todo $r \geq 0.$

## Invariância por rescalonamento

Considere um processo de Wiener padrão $\{W_t\}_{t\geq 0}$. Dado $a > 0$, defina o processo $\{V_t^a\}_{t\geq 0}$ por
$$
V_t^a = \frac{1}{a}W_{a^2t}, \quad t \geq 0.
$$
Então $\{V_t^a\}_{t\geq 0}$ também é um processo de Wiener padrão. Caso $\{W_t\}_{t\in [0, T]}$ só esteja definido em um intervalor $[0, T]$, $T > 0$, então obtemos um processo de Wiener $\{V_t^a\}_{t\in [0, a^2T]}$ em $[0, a^2T]$.

É imediato verificar que

  (i) $V_0^a = W_0 = 0$;

  (ii) quase sempre os caminhos amostrais $t \mapsto V_t^a(\omega) = (1/a)W_{a^2 t}(\omega)$ são contínuos; e
  
  (iii) os incrementos $V_{t_j}^a - V_{t_{j-1}}^a = (1/a)W_{a^2 t_j} - (1/a)W_{a^2 t_{j-1}}$, $j = 1, \ldots, n$, $0 \leq t_0 < t_1 < \ldots < t_n$, são independentes.

Quando à lei de distribuição dos incrementos, temos

  (iv) Para todo $\tau>0$, vale
$$
V_{t + \tau}^a - V_t^a = \frac{1}{a}\left(W_{a^2(t + \tau)} - W_{a^2t}\right) \sim \frac{1}{a}\mathcal{N}(0, a^2\tau) = \mathcal{N}(0, \tau).
$$

Isso completa a demonstração dessa simetria.

## Crescimento sublinear

Seja $\{W_t\}_{t\geq 0}$ um processo de Wiener padrão. Então vale, quase certamente,
$$
\lim_{t \rightarrow \infty} \frac{W_t}{t} = 0.
$$

### Convergência em probabilidade

É fácil mostrar que a convergência ocorre em probabilidade. De fato, temos
$$
\mathbb{E}\left[ \frac{W_t}{t} \right] = \frac{\mathbb{E}\left[W_t\right]}{t} = 0,
$$
para todo $t > 0,$ e
$$
\mathrm{Var}\left(\frac{W_t}{t}\right) = \mathbb{E}\left[ \left(\frac{W_t}{t}\right)^2 \right] = \frac{\mathbb{E}\left[W_t^2\right]}{t^2} = \frac{t}{t^2} = \frac{1}{t} \rightarrow 0, \quad t\rightarrow \infty.
$$
Portanto,
$$
\frac{W_t}{t} \rightarrow 0
$$
em probabilidade.

### Convergência quase certamente

A demonstração de que a convergência ocorre quase certamente requer um pouco mais de trabalho. Observe, primeiro, que $W_t/t \rightarrow 0$ quase certamente é equivalente a
$$
    \mathbb{P}\left(\limsup_{t\rightarrow \infty} \left|\frac{W_t}{t}\right| \geq \varepsilon\right) = 0,
$$
para $\varepsilon > 0$ arbitrário. Isso, por sua vez, é equivalente a
$$
    \mathbb{P}\left(\limsup_{n\rightarrow \infty} \max_{n-1 \leq t \leq n}\left|\frac{W_t}{t}\right| \geq \varepsilon\right) = 0,
$$
onde $n \rightarrow \infty$ ao longo dos números naturais. (Lembramos que, quase certamente, os caminhos amostrais são contínuous, de modo que podemos considerar o máximo acima, ao invés do supremo.) Pelo Lema de Borel-Cantelli, isso seque se mostrarmos que
$$
    \sum_{n\in\mathbb{N}} \mathbb{P}\left(\max_{n-1 \leq t \leq n}\left|\frac{W_t}{t}\right| \geq \varepsilon\right) < \infty.
$$
Para isso, precisamos de uma estimativa para cada termo da série. Observe que
$$
\begin{align*}
    \mathbb{P}\left(\max_{n-1 \leq t \leq n}\left|\frac{W_t}{t}\right| \geq \varepsilon\right) & = \mathbb{P}\left(\max_{n-1 \leq t \leq n}|W_t| \geq t\varepsilon\right) \\
    & \leq \mathbb{P}\left(\max_{n-1 \leq t \leq n}|W_t| \geq n\varepsilon\right) \\
    & \leq \mathbb{P}\left(\max_{0 \leq t \leq n}|W_t| \geq n\varepsilon\right).
\end{align*}
$$

Agora, um resultado essencial para a estimativa do termo acima é a estimativa maximal
$$
    \mathbb{P}\left(\max_{0 \leq t \leq T}|W_t| \geq r \right) \leq \frac{2}{r^p}\mathbb{E}\left[ W_T^p \right],
$$
para $T > 0,$ $r > 0$ e $p\in \mathbb{N}$ arbitrários. Esta é uma versão contínua e estendida da desigualdade maximal de Kolmogorov, correspondente ao caso $p=2.$ Essa desigualdade se aplica, mais geralmente, a qualquer Martingale e é conhecida como *desigualdade maximal de Doob.* O caso $p = 4$ é suficiente para o nosso propósito. Mas antes vamos assumir que o resultado vale e concluir a demonstração de convergência. De fato, nesse caso, temos
$$
    \mathbb{P}\left(\max_{n-1 \leq t \leq n}\left|\frac{W_t}{t}\right| \geq \varepsilon\right) \leq \frac{1}{n^4\varepsilon^4}\mathbb{E}\left[W_n^4\right].
$$
Como $W_n/\sqrt{n} \sim \mathcal{N}(0, 1),$ podemos estimar
$$
    \mathbb{P}\left(\max_{n-1 \leq t \leq n}\left|\frac{W_t}{t}\right| \geq \varepsilon\right) \leq \frac{2}{n^2\varepsilon^4}\mathbb{E}\left[\left(\frac{W_n}{\sqrt{n}}\right)^4\right] = \frac{6}{n^2\varepsilon^4}\mathbb{E}\left[\left(\frac{W_n}{\sqrt{n}}\right)^2\right] = \frac{6}{n^2\varepsilon^4}.
$$
Desse modo,
$$
    \sum_{n\in\mathbb{N}} \mathbb{P}\left(\max_{n-1 \leq t \leq n}\left|\frac{W_t}{t}\right| \geq \varepsilon\right) \leq \frac{6}{\varepsilon^4}\sum_{n\in\mathbb{N}} \frac{1}{n^2} = \frac{12}{\varepsilon^4} < \infty.
$$
Portanto, como desejado, segue pelo Lema de Borel Cantelli que
$$
    \mathbb{P}\left(\limsup_{t\rightarrow \infty} \left|\frac{W_t}{t}\right| \geq \varepsilon\right) = 0,
$$
para $\varepsilon > 0$ arbitrário, de modo que, quando $t\rightarrow \infty,$, obtemos  $W_t/t \rightarrow 0$ quase certamente.

### Desigualdade maximal

Para completar, vamos mostrar que
$$
    \mathbb{P}\left(\max_{0 \leq t \leq T}|W_t| \geq r \right) \leq \frac{2}{r^4}\mathbb{E}\left[ W_T^4 \right],
$$
para $T > 0$ e $r > 0$.

Pela simetria por reflexão $W_t \mapsto -W_t,$ segue que
$$
    \mathbb{P}\left(\max_{0 \leq t \leq T}|W_t| \geq r \right) = 2 \mathbb{P}\left(\max_{0 \leq t \leq T} W_t \geq r \right).
$$

Pela continuidade dos caminhos amostrais, temos
$$
    \mathbb{P}\left(\max_{0 \leq t \leq T} W_t \geq r \right) = \mathbb{P}\left(\sup_{t \in D} W_t \geq r \right),
$$
onde $D = \cup_{k\in\mathbb{N}}D_k$ é o conjunto de pontos da forma $jT/2^k,$ $j=0, \ldots, 2^k,$ $k\in\mathbb{N},$ com
$$
    D_k = \left\{ \frac{jT}{2^k}; \; j = 0, \ldots, 2^k\right\},
$$
ou seja, $D$ é uma dilatação dos pontos diádicos. Esse conjunto $D$ é denso em $[0, T]$ e a sequência $\{D_k\}_{k\in\mathbb{N}}$ é monótona crescente. Assim,
$$
    \mathbb{P}\left(\sup_{t \in D} W_t \geq r \right) = \mathbb{P}\left(\lim_{k\rightarrow \infty} \sup_{t \in D_k} W_t \geq r \right).
$$
Logo, basta mostrarmos que
$$
    \mathbb{P}\left(\sup_{t \in D_k} W_t \geq r \right) \leq \frac{1}{r^4}\mathbb{E}\left[ W_T^4 \right],
$$
para todo $k\in\mathbb{N}.$ Para isso, fazemos como na demonstração da desigualdade maximal de Kolmogorov. Dado $D_k$, escrevemos $t_j^k = jT/2^k,$ $j=0, \ldots, 2^k,$ de modo que
$$
    W_T = \sum_{j=1}^{2^k} (W_{t_j} - W_{t_{j-1}}).
$$
Os passos $X_j = W_{t_j} - W_{t_{j-1}}$ são independentes e com valor esperado nulo. Estamos, portanto, no contexto da desigualdade maximal de Kolmogorov, que nos dá
$$
    \mathbb{P}\left(\sup_{t \in D_k} W_t \geq r\right) \leq \frac{1}{r^2}\mathbb{E}\left[W_t^2\right].
$$
No entanto, essa potência quadrática não é suficiente. Observamos, então, que $X_j$ e $-X_j$ têm a mesma distribuição $\mathcal{N}(0, t_j - t_{j-1})$ e todos os $X_j$ têm momentos finitos. Assim, vale
$$
    \mathbb{P}\left(\sup_{t \in D_k} W_t \geq r\right) \leq \frac{1}{r^m}\mathbb{E}\left[W_T^m\right]
$$
para qualquer potência $m\in\mathbb{N}.$ Escolhendo $m=4,$ obtemos
$$
\mathbb{P}\left(\sup_{t \in D} |W_t| \geq r \right) = 2\mathbb{P}\left(\lim_{k\rightarrow \infty} \sup_{t \in D_k} W_t \geq r \right) \leq \frac{2}{r^4}\mathbb{E}\left[W_T^4\right],
$$
como desejado.

## Invariância por inversão temporal

Considere um processo de Wiener padrão $\{W_t\}_{t\geq 0}$ e defina o processo $\{V_t\}_{t\geq 0}$ por
$$
V_t = \begin{cases}
0, & t = 0, \\
 tW_{1/t}, & t > 0.
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

Vamos usar o fato de que esses incrementos formam uma normal multivariada e, com isso, a independência segue da independência dois a dois, que, por sua vez, segue se provarmos que as covariâncias são nulas.

Vamos, então, considerar quatro instantes distintos $0 \leq t_1 < t_2 < t_3 < t_4$ e olhar para as covariâncias de dois incrementos disjuntos. Se $t_1 > 0$, temos
$$
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) = \mathrm{Cov}(t_2 W_{1/t_2} - t_1 W_{1/t_1}, t_4 W_{1/t_4} - t_3 W_{1/t_3}).
$$
Distribuindo os termos e usando a propriedade $\mathrm{Cov}(W_t, W_s) = \min\{t, s\}$ de processos de Wiener, obtemos
$$
\begin{align*}
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) & = t_2t_4\min\left\{\frac{1}{t_2}, \frac{1}{t_4}\right\} - t_2t_3\min\left\{\frac{1}{t_2}, \frac{1}{t_3}\right\} \\
& \qquad - t_1t_4\min\left\{\frac{1}{t_1}, \frac{1}{t_4}\right\} + t_1t_3\min\left\{\frac{1}{t_1}, \frac{1}{t_3}\right\} \\
& = t_2t_4\frac{1}{t_4} - t_2t_3\frac{1}{t_3} - t_1t_4\frac{1}{t_4} + t_1t_3\frac{1}{t_3} \\ 
& = t_2 - t_2 - t_1 + t_1 = 0.
\end{align*}
$$

Se $t_1 = 0$, então
$$
\begin{align*}
\mathrm{Cov}(V_{t_2} - V_{t_1}, V_{t_4} - V_{t_3}) & = \mathrm{Cov}(t_2 W_{1/t_2} - 0, t_4 W_{1/t_4} - t_3 W_{1/t_3}) \\
  & = \mathrm{Cov}(t_2 W_{1/t_2}, t_4 W_{1/t_4}) - \mathrm{Cov}(t_2 W_{1/t_2}, t_3 W_{1/t_3}) \\
  & = t_2t_4\mathrm{Cov}(W_{1/t_2}, W_{1/t_4}) - t_2t_3\mathrm{Cov}(t_2 W_{1/t_2}, W_{1/t_3}) \\
  & = \frac{t_2t_4}{t_4} - \frac{t_2t_3}{t_3} \\
  & = t_2 - t_2 = 0.
\end{align*}
$$

Como os incrementos são normais, isso mostra que quaisquer dois incrementos disjuntos de $\{V_t\}_{t\geq 0}$ são independentes. Agora, considerando $n$ incrementos consecutivos, o argumento acima mostra que eles são independentes dois a dois. E como são normais, isso implica neles serem mutuamente independentes.

### Distribuição de probabilidades dos incrementos

Sejam, agora, $t \geq 0$, $\tau > 0$. Se $t = 0$, então
$$
V_{t + \tau} - V_t = V_\tau = \tau W_{1/\tau} = \tau (W_{1/\tau} - W_0) \sim \tau \mathcal{N}(0, 1/\tau) = \mathcal{N}(0, \tau).
$$

Se $t > 0$, então
$$
    \mathbb{E}[V_{t + \tau} - V_t] = 0
$$
e
$$
    \begin{aligned*}
        \mathbb{E}\left[(V_{t+\tau} - V_t)^2\right] & = \mathbb{E}\left[\left((t + \tau)W_{1/(t+\tau)} - tW_{1/t}\right)^2\right] \\
        & = \mathbb{E}\left[(t + \tau)^2W_{1/(t+\tau)}^2 -2(t+\tau)tW_{1/(t+\tau)}W_{1/t} + t^2W_{1/t}^2\right] \\
        & = (t+\tau)^2\frac{1}{t + \tau} - 2(t+\tau)t\min\left\{\frac{1}{t + \tau}, \frac{1}{t}\right\} + t^2\frac{1}{t} \\
        & = (t + \tau) - 2(t + \tau)t \frac{1}{t+\tau} + t \\
        & = (t + \tau) - 2t + t \\
        & = \tau.
    \end{aligned*}
$$
Como o passo é uma normal, tendo média zero e variância $\tau,$ temos
$$
    V_{t + \tau} - V_t \sim \mathcal{N}(0, \tau).
$$

De outra forma, podemos escrever
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

## Invariância por translações

Considere, novamente, um processo de Wiener padrão $\{W_t\}_{t\geq 0}$. Seja $s > 0$ e defina o processo $\{V_t^s\}_{t\geq 0}$ por
$$
V_t^s = W_{s + t} - W_s, \qquad t \geq 0.
$$

Claramente,
$$
V_0^s = W_s - W_s = 0.
$$

Dados $t_0 < t_1 < \cdots < t_n$, temos
$$
V_{t_j}^s - V_{t_{j-1}}^s = W_{s + t_j} - W_s - W_{s + t_{j-1}} + W_s = W_{s + t_j} - W_{s + t_{j-1}},
$$
sendo evidente que os incrementos de $\{V_t^s\}_{t\geq 0}$ são independentes.

Agora, dado $\tau > 0$, temos
$$
V_{t + \tau}^s = W_{s + t + \tau} - W_s - W_{s + t} + W_s = W_{s + t + \tau} - W_{s + t} \sim \mathcal{N}(0, \tau).
$$

Finalmente, como, para quase todo $\omega$, o caminho amostral $t \mapsto W_t(\omega)$ é contínuo, temos, em particular, que
$$
t \mapsto V_t^s(\omega) = W_{s + t}(\omega) - W_s(\omega)
$$
é também contínuo. Isso completa a demonstração de que $\{V_t^s\}_{t\geq 0}$ é um processo de Wiener padrão.

## Exercício

1. Mostre que a combinação convexa $W_t = (1-\theta)W_t^{(1)} + \theta W_t^{(2)},$ $0\leq \theta \leq 1,$ entre dois processos de Wiener independentes $\{W_t^{(1)}\}_{t\geq 0}$ e $\{W_t^{(1)}\}_{t\geq 0}$ também é um processo de Wiener.

2. Seja $\{W_t\}_{t\geq 0}$ um processo de Wiener padrão. Mostre que o limite abaixo vale quase sempre, para qualquer $p > 1/2$.
$$
\lim_{t \rightarrow \infty} \frac{W_t}{t^p} = 0.
$$
