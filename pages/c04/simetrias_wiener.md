@def title = "Simetrias de processos de Wiener"

# {{ get_title }}

Processos de Wiener possuem algumas simetrias interessantes.

## Invariância por rescalonamento

Considere um processo de Wiener padrão $\{W_t\}_{t\geq 0}$. Dado $a > 0$, defina o processo $\{V_t\}_{t\geq 0}$ por
$$
V_t = \frac{1}{a}W_{a^2t}, \quad t \geq 0.
$$
Então $\{V_t\}_{t\geq 0}$ também é um processo de Wiener padrão. Caso $\{W_t\}_{t\in [0, T]}$ só esteja definido em um intervalor $[0, T]$, $T > 0$, então obtemos um processo de Wiener $\{V_t\}_{t\in [0, a^2T]}$ em $[0, a^2T]$.

É imediato verificar que i) $V_0 = W_0 = 0$; ii) quase sempre os caminhos amostrais $t \mapsto V_t(\omega) = (1/a)W_{a^2 t}(\omega)$ são contínuos; e iii) os incrementos $V_{t_j} - V_{t_{j-1}} = (1/a)W_{a^2 t_j} - (1/a)W_{a^2 t_{j-1}}$, $j = 1, \ldots, n$, $0 \leq t_0 < t_1 < \ldots < t_n$, são independentes. Falta verificar a distribuição dos incrementos:
$$
V_{t + \tau} - V_t = (1/a)W_{a^2(t + \tau)} - (1/a)W_{a^2t} \sim (1/a)\mathcal{N}(0, a^2\tau) = \mathcal{N}(0, \tau).
$$
Isso completa a demonstração dessa simetria.

## Lei dos grandes números contínua

Seja $\{W_t\}_{t\geq 0}$ é um processo de Wiener. Então, quase sempre, vale
$$
\lim_{t \rightarrow \infty} \frac{W_t}{t} = 0.
$$

Observe que, para $t = n\in\mathbb{N}$, podemos escrever
$$
\frac{W_n}{n} = \sum_{j = 1}^n \frac{W_j - W_{j-1}}{n}.
$$
Como os incrementos $W_j - W_{j-1}$ são variáveis aleatórias i.i.d. com lei $\mathcal{N}(0, 1)$, então, pela lei dos grandes números, seque que essa média converge para o valor esperado das variáveis aleatórias, que é zero, ou seja
$$
\lim_{n\rightarrow \infty} \frac{W_n}{n} = \lim_{n\rightarrow \infty} \sum_{j = 1}^n \frac{W_j - W_{j-1}}{n} = 0.
$$

Agora, para um $t > 0$ qualquer, denotando por $[t]$ o maior inteiro menor do que $t$, temos
$$
\lim_{t \rightarrow \infty} \frac{W_t}{t} = \lim_{n\rightarrow \infty} \left(\frac{W_t - W_{[t]}}{t} + \frac{[t]}{t}\frac{W_{[t]}}{[t]} \right).
$$
Vimos, acima, que
$$
\frac{W_{[t]}}{[t]} \rightarrow 0.
$$
Claramente,
$$
\frac{t}{[t]} \rightarrow 1.
$$
Além disso
$$
\frac{W_t - W_{[t]}}{t} \rightarrow 0.
$$

Portanto,
$$
\lim_{t \rightarrow \infty} \frac{W_t}{t} = 0.
$$

## Inversão temporal

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

Para quase todo $\omega$, o caminho $t \mapsto W_t(\omega)$ é contínuo. Daí tiramos que $t \mapsto V_t(\omega) = t W_{1/t}(\omega)$ é contínuo em $(0, \infty)$. Além disso, segue da lei dos grandes números que, quase sempre,
$$
\lim_{t \rightarrow 0} V_t = \lim_{t \rightarrow 0} t W_{1/t} = \lim_{s \rigtharrow \infty} \frac{W_s}{s} = 0.
$$
Portanto, para quase todo $\omega$, vale $t W_{1/t}(\omega) \rightarrow 0$, quando $t \rightarrow 0$, mostrando que $t \mapsto V_t(\omega) = t W_{1/t}(\omega)$ é contínuo em $[0, \infty)$, para quase todo $\omega$. Isso mostra a continuidade quase sempre dos caminhos amostrais de $\{V_t\}_{t\geq 0}$.

### Independência dos incrementos

Quanto à independência dos incrementos, se $0 < t_0 < t_1 < \ldots < t_n$, então $1/t_n < \ldots < 1/t_1 < t/t_0$ e vemos que os incrementos $V_{t_j} - V_{t_{j-1}} = t_jW_{1/t_j} - t_{j-1}W_{1/t_{j-1}}$, $j = 1, \ldots, n$, são independentes.

Se $t_0 = 0$, tomamos uma sequência $\{t_0^k\}_{k \in \mathbb{N}}$ tal que $0 < t_0^k < t_1$ e $t_0^k \rightarrow t_0 = 0$. Usando que os incrementos $V_{t_1} - V_{t_0^k}, V_{t_2} - V_{t_1}, \ldots V_{t_n} - V_{t_{n-1}}$ são normais independentes, que a função de densidade de probabilidades de normais são contínuas, e que os caminhos amostrais são contínuos, podemos passar ao limite na identidade
$$
\mathbb{P}(V_{t_1} - V_{t_0^k} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n) = \mathbb{P}(W_{t_1} - W_{t_0^k} \in E_1) \times \cdots \times \mathbb{P}(W_{t_n} - W_{t_{n-1}} \in E_n)
$$
onde $E_1, \ldots, E_n$ são eventos mensuráveis, e obter
$$
\mathbb{P}(V_{t_1} - V_{t_0} \in E_1, \ldots, W_{t_n} - W_{t_{n-1}} \in E_n) = \mathbb{P}(W_{t_1} - W_{t_0} \in E_1) \times \cdots \times \mathbb{P}(W_{t_n} - W_{t_{n-1}} \in E_n)
$$
mostrando a independência dos incrementos.

## Distribuição de probabilidades dos incrementos

Sejam, agora, $t \geq 0$, $\tau > 0$.

Se $t = 0$, então
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


