@def title = "Integral de Itô via processos do tipo escada"

# {{ get_title }}

Vamos, agora, ver a integral de Itô da maneira clássica, via aproximação por processos escada, válida em geral, para quaisquer processos progressivamente mensuráveis de quadrado integrável.

Essa construção ainda pode ser estendida a integrais em relação a processos $\{Z_t\}_{t\geq 0}$ que sejam *martingales,* ou, mais geralmente ainda, *semi-martingales,* i.e. sendo $\{H_t\}_{t \geq 0}$ progressivamente mensurável em relação a uma semimartingale $\{Z_t\}_{t\geq 0}$ e de quadrado integrável em $(0, T),$ então a *integral de Itô*
$$
\int_0^T H_t \;\mathrm{d}Z_t
$$
está bem definida no sentido de média quadrática. Mas vamos fazer isso apenas no caso da integral de Itô com relação a $\{W_t\}_t.$

## Construção

No caso de $\{H_t\}_{t\geq 0}$ ser progressivamente mensurável e de quadrado integrável, a ideia é aproximar esse processo por processos $\{H_t^m\}_{t \geq 0}$ adaptados e do tipo escada. Essa aproximação passa antes por aproximá-lo por processos com caminhos contínuous, como feito anteriormente. Mas vamos tratar primeiro de processos do tipo escada.

### Processo escada e integral de Itô

Um processo $\{H_t\}_{t\geq 0}$ é do tipo escada quando é "constante por partes", i.e. quando existe uma partição $0 = t_0 < t_1 < \ldots < t_n = T$ tal que $H_t$ seja constante, $H_t = H_{t_{j-1}},$ em cada intervalo $t_{j-1} \leq t < t_j.$ Para esses processo, define-se, naturalmente, a integral de Itô por
$$
\int_0^T H_t \;\mathrm{d}W_t = \sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}).
$$

### Integral de Itô via aproximação por processo escada

Para um processo $\{H_t\}_{t \geq 0}$ que seja progressivamente mensurável e em $L^2((0, T)\times \Omega),$ aproximamos o processo por processos $\{H_t^m\}_{t \geq 0}$ do tipo escada e adaptados a $\{W_t\}_{t\geq 0}.$ Por serem processos escada, em particular contínuos à direita, esses processos são progressivamente mensuráveis também. Para estes processos, a integral de Itô está bem definida através do somatório.

O passo seguinte é mostrar que as integrais de Itô dos processos escada convergem em média quadrática. Isso é obtido graças a duas propriedades fundamentais da integral de Itô em relação a $\{W_t\}_{t \geq 0},$ a saber que o valor esperado é nulo e que a *isometria de Itô* vale para processos escada (veremos isso em seguida):
$$
\mathbb{E}\left[ \left(\int_0^T H_t^m \;\mathrm{d}W_t\right)^2 \right] = \mathbb{E}\left[ \int_0^T\left(H_t^m\right)^2 \;\mathrm{d}t\right]  = \int_0^T\mathbb{E}\left[ \left(H_t^m\right)^2 \right] \;\mathrm{d}t
$$

Como a combinação linear de processos escada também é um processo escada, temos
$$
\mathbb{E}\left[ \int_0^T H_t^m \;\mathrm{d}W_t - \int_0^T H_t^k \;\mathrm{d}W_t \right] = 0
$$
e
$$
\mathbb{E}\left[ \left(\int_0^T H_t^m \;\mathrm{d}W_t - \int_0^T H_t^k \;\mathrm{d}W_t\right)^2 \right] = \int_0^T \mathbb{E}\left[ \left(H_t^m - H_t^k\right)^2 \right] \;\mathrm{d}t
$$

Com a hipótese de que $\{H_t^m\}_{t \geq 0}$ converge em média quadrática para $\{H_t\}_{t \geq 0},$ o lado direito da expressão acima converge para zero:
$$
\mathbb{E}\left[ \left(\int_0^T H_t^m \;\mathrm{d}W_t - \int_0^T H_t^k \;\mathrm{d}W_t\right)^2 \right] \rightarrow 0.
$$

Isso mostra que a sequência
$$
\int_0^T H_t^m \;\mathrm{d}W_t
$$
converge em média quadrática e em probabilidade para um limite que independe da escolha da sequência de funções escada.

A integral de Itô é, então, definida como o limite das integrais de funções escada:
$$
\int_0^T H_t \;\mathrm{d}W_t = \lim \int_0^T H_t^m \;\mathrm{d}W_t.
$$

### Propriedades da integral de Itô de funções escada

Vamos ver aqui as duas propriedades fundamentais que utilizamos acima. Suponha que $\{H_t\}_{t\geq 0}$ seja um função escada adaptada a $\{W_t\}_{t \geq 0}$ e com o processo sendo constante nos intervalos de uma malha $0 = t_0 < t_1 < \ldots < t_n = T.$

Calculemos, primeiramente, a esperança da integral de Itô:
$$
\mathbb{E}\left[ \int_0^T H_t \;\mathrm{d}W_t \right] = \mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\Delta W_j\right]
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo, temos $H_{t_{j-1}}$ independente de $\Delta W_j = W_{t_j} - W_{t_{j-1}},$ de modo que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[\Delta W_j\right].
$$
Como um processo de Wiener tem valor esperado nulo, segue que $\mathbb{E}\left[\Delta W_j\right] = 0,$ de maneira que
$$
\mathbb{E}\left[ \int_0^T H_t \;\mathrm{d}W_t \right] = \mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = 0.
$$

Calculemos, agora, o momento de ordem dois da integral de Itô:
$$
\begin{align*}
\mathbb{E}\left[ \int_0^T H_t \;\mathrm{d}W_t \right] & = \mathbb{E}\left[\left(\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right)^2\right] \\
& = \mathbb{E}\left[\left(\sum_{i=1}^n H_{t_{i-1}}\Delta W_i\right)\left(\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right)\right] \\
& = \sum_{i,j=1}^n\mathbb{E}\left[H_{t_{i-1}}H_{t_{j-1}}\Delta W_i\Delta W_j\right] \\
& = 2 \sum_{i < j} \mathbb{E}\left[H_{t_{i-1}}H_{t_{j-1}}\Delta W_i\Delta W_j\right] + \sum_j \mathbb{E}\left[H_{t_{j-1}}^2\Delta W_j^2\right]
\end{align*}
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo e com $i < j,$ temos $H_{t_{i-1}},$ $H_{t_{j-1}}$ e $\Delta W_i$ independente de $\Delta W_j,$ de modo que
$$
\begin{align*}
\mathbb{E}\left[\left(\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right)^2\right] & = 2 \sum_{i < j} \mathbb{E}\left[H_{t_{i-1}}H_{t_{j-1}}\Delta W_i\right]\mathbb{E}\left[\Delta W_j\right] + \sum_j \mathbb{E}\left[H_{t_{j-1}}^2\right] \mathbb{E}\left[\Delta W_j^2\right]
\end{align*}
$$
Como
$$
\mathbb{E}\left[\Delta W_j\right] = 0, \qquad \mathbb{E}\left[\Delta W_j^2\right] = t_j - t_{j-1},
$$
temos
$$
\mathbb{E}\left[\left(\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right)^2\right] = \sum_j \mathbb{E}\left[H_{t_{j-1}}^2\right] (t_j - t_{j-1}) = \mathbb{E}\left[\sum_j H_{t_{j-1}}^2 (t_j - t_{j-1})\right].
$$

Lembrando que $\{H_t\}_{t \geq 0}$ é um processo escada, o somatório à direita é uma integral e obtemos a seguinte identidade para funções escada, conhecida como **isometria de Itô:**
$$
\mathbb{E}\left[ \left( \int_0^T H_t \;\mathrm{d}W_t\right)^2\right] = \mathbb{E}\left[ \int_0^T H_t^2 \;\mathrm{d}t\right].
$$

### Aproximação por processos contínuos

A aproximação por processos contínuos pode ser feito como antes, via molificação por uma função 
$$
\varphi_\varepsilon(t) = \begin{cases}
\displaystyle \frac{1}{\varepsilon} e^{-t/\varepsilon}, & t \geq 0, \\
0, & t < 0.
\end{cases}
$$

### Aproximação por processo escada

Assumindo $\{H_t\}_{t \geq 0}$ com caminhos contínuous e $T > 0,$ consideramos as malhas $\{t_j^n\}_j$ dadas por
$$
    t_j^n = \frac{j T}{2^n}, \quad j = 0, \ldots, 2^n,
$$
para $n\in \mathbb{N}.$ Em cada malha, consideramos o processo escada $\{H_t^n\}_t$ dado por
$$
    H_t^n = \begin{cases}
        H_{t_{j-1}^n}, & t_{j-1}^n \leq t < t_j^n, \; j = 1, \ldots, 2^n, \\
        H_{T}, & t \geq T.
    \end{cases} 
$$
Para quase todo $\omega\in\Omega,$ como $t\mapsto H_t(\omega)$ é um caminho contínuo, portanto uniformemente contínuo em $[0, T],$ temos
$$
    H_t^n(\omega) \rightarrow H_t(\omega)
$$
uniformemente em $t \in [0, T].$ Pelo Teorema da Convergência Dominada de Lebesgue,
$$
    H_t^n \rightarrow H_t
$$
em $L^2((0, T)\times \Omega),$ ou seja, $\{H_t^n\}_{0 \leq t \leq T}$ é uma aproximação, em média quadrática, por processos do tipo escada, do processo $\{H_t\}_{0 \leq t \leq T}.$ 

### Convergência da integral de Itô no caso de processos com caminhos contínuos

Obtivemos, acima, a convergência das integrais de Itô das aproximações $\{H_t^n\}_t$ de uma função progressivamente mensurável de quadrado integrável. Mas se os caminhos não forem contínuous, não podemos garantir que $H_t^n = H_{t_j^n}^n$ em pontos arbitrários $t_j^n$ das malhas das aproximações-escada do processo. Então, em geral, não podemos dizer que a integral de Itô de $\{H_t\}_t$ é o limite de somatórios
$$
    \sum_{j=1}^n H_{t_{j-1}^n}(W_{t_j^n} - W_{t_{j-1}^n}),
$$
nem no sentido de média quadrática.

Mas se os caminhos forem contínuous, ou quase certamente contínuous, então podemos aproximar, em média quadrática, o processo $\{H_t\}_t$ por $H_t^n$ obtido através de
$$
    H_t^n = \begin{cases}
        H_{t_{j-1}^n}, & t_{j-1}^n \leq t < t_j^n, \; j = 1, \ldots, 2^n, \\
        H_{T}, & t \geq T.
    \end{cases} 
$$
Nesse caso, $H_{t_{j-1}^n}^n = H_{t_{j-1}^n},$ ou seja, nos pontos da malha, os valores do processo aproximado são os valores do próprio processo. Assim, vale a convergência
$$
    \int_0^T H_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n H_{t_{j-1}^n}(W_{t_j^n} - W_{t_{j-1}^n}),
$$
no sentido de média quadrática. Isso para quaisquer sequências de malhas $\{t_j^n\}_{j}$ com
$$
    \max_{j=1, \ldots, n} (t_j^n - t_{j-1}^n) \rightarrow 0.
$$

Além disso, extraindo uma subsequência $n_k\rightarrow \infty$ tal que
$$
    \int_0^T\mathbb{E}\left[ H_t - H_t^{n_k} \right] < \epsilon_k^2,
$$
com
$$
    \sum_k \epsilon_k < \infty,
$$
então esse limite vale quase certamente. De fato, nesse caso, temos
$$
    \mathbb{P}\left( \left|\int_0^T H_t \;\mathrm{d}W_t - \int_0^T H_t^{n_k} \;\mathrm{d}W_t\right| \geq \sqrt{\epsilon_k} \right) \leq \frac{1}{\epsilon_k}\mathbb{E}\left[ \left(\int_0^T H_t \;\mathrm{d}W_t - \int_0^T H_t^{n_k} \;\mathrm{d}W_t\right)^2\right] = \frac{1}{\epsilon_k}\int_0^T\mathbb{E}\left[ (H_t - H_t^{n_k})^2 \right]\;\mathrm{dt} \leq \epsilon_k.
$$
Logo,
$$
    \sum_{k\in\mathbb{N}} \mathbb{P}\left( \left|\int_0^T H_t \;\mathrm{d}W_t - \int_0^T H_t^{n_k} \;\mathrm{d}W_t\right| \geq \sqrt{\epsilon_k} \right) \leq \sum_{k\in\mathbb{N}} \epsilon_k < \infty.
$$
Pelo Lema de Borel-Cantelli, isso implica em
$$
    \mathbb{P}\left( \limsup_{k\rightarrow \infty} \left|\int_0^T H_t \;\mathrm{d}W_t - \int_0^T H_t^{n_k} \;\mathrm{d}W_t\right| \geq \sqrt{\epsilon_k} \right) = 0,
$$
ou seja
$$
    \int_0^T H_t \;\mathrm{d}W_t = \lim \sum_{j=1}^{n_k} H_{t_{j-1}^{n_k}} (W_{t_j^{n_k}} - W_{t_{j-1}}^{n_k}),
$$
quase certamente.

### Integral de Itô do processo de Wiener

Como o processo de Wiener tem caminhos quase certamente contínuos, vale o limite
$$
    \int_0^T W_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n W_{t_{j-1}^n}(W_{t_j^n} - W_{t_{j-1}^n}),
$$
em média quadrática. Por outro lado, já calculamos que o limite do lado direito acima é $W_T/2 - T/2.$ Portanto, vale, de fato, para a integral de Itô, que
$$
    \int_0^T W_t \;\mathrm{d}W_t = \frac{W_T}{2} - \frac{T}{2}.
$$
