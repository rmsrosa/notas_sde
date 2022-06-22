@def title = "Integral de Itô"

# {{ get_title }}

Bom, já vimos como integrar processos em relação ao tempo (Seção {{link_section pages/c05/integral_riemann}}), em relação a processos de variação limitada (Seção {{link_section pages/c05/integral_riemannstieltjes}}) e como integrar certas classes de funções em relação a processos que não são de variação limitada (Seção {{link_section pages/c05/integral_dualidade}}). Também vimos como as somas de Riemann-Stieltjes não convergem quando tentamos integrar funções mais gerais (Seção {{link_section pages/c05/riemann_wiener}}). Vamos agora ver como podemos especificar somas parciais e obter uma noção de integral que esteja bem definida.

No que se segue, vamos buscar definir uma integral cujo integrando é um processo estocástico $\{H_t\}_{t\geq 0}$ e a integral é em relação a um processo de Wiener $\{W_t\}_{t\geq 0}$:
$$
\int_0^T H_t \;\mathrm{d}W_t.
$$

Observe que se $\{X_t\}_t$ é um processo estocástico e $g = g(t, x)$ é uma função contínua, então $\{g(t, X_t)\}_t$ define um processo estocástico, de modo que podemos considerar a integral
$$
\int_0^T g(t, X_t)\;\mathrm{d}W_t
$$
simplesmente definindo $H_t = g(t, X_t)$. Ou seja, basta considerarmos integrais de um processo $\{H_t\}_t$.

## Integrandos permitidos

Não vamos, nesse momento, definir, de forma muito rigorosa, as condições necessárias para que a integral de Itô esteja bem definida. Os detalhes são bastante técnicos. Mas uma condição essencial pode ser posta do seguinte modo informal:

> A cada instante $t \geq 0$, o integrando $H_t$ deve ser independente dos valores futuros $s \geq t$ do processo de Wiener.

Vamos chamar essa condição de **não-antecipativa** *("non-antecipating")*. Uma definição mais formal envolve uma *filtração* das $\sigma$-álgebras e, nesse caso, dizemos que $\{H_t\}_t$ está *adaptado* ao processo $\{W_t\}_t$.

Sob essa condição, a integral de Itô possui boas propriedades, como veremos a seguir.

## Incrementos

No que se segue, para simplificar a notação, dada uma partição $t_0 < t_1 < \ldots < t_n$, escrevemos
$$
\Delta W_j = W_{t_j} - W_{t_{j-1}}, \qquad j = 1, \ldots, n.
$$

## Valor esperado das integrais de Itô

Calculemos a esperança das somas de Riemann associadas à integral de Itô. Temos
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\Delta W_j\right]
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo, temos $H_{t_{j-1}}$ independente de $\Delta_j = W_{t_j} - W_{t_{j-1}}$, de modo que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[\Delta W_j\right].
$$
Como o processo de Wiener tem valor esperado nulo, segue que $\mathbb{E}\left[\Delta W_j\right] = 0$, de maneira que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = 0.
$$

No limite, obtemos que a integral de Itô de um processo não-antecipativo tem valor esperado nulo:
$$
\mathbb{E}\left[\int_0^T H_t \;\mathrm{d}W_t\right] = 0.
$$

## Isometria de Itô

Calculemos, agora, o momento de ordem dois das somas de Riemann associadas à integral de Itô:
$$
\begin{align*}
\mathbb{E}\left[\left(\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right)^2\right] & = \mathbb{E}\left[\left(\sum_{i=1}^n H_{t_{i-1}}\Delta W_i\right)\left(\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right)\right] \\
& = \sum_{i,j=1}^n\mathbb{E}\left[H_{t_{i-1}}H_{t_{j-1}}\Delta W_i\Delta W_j\right] \\
& = 2 \sum_{i < j} \mathbb{E}\left[H_{t_{i-1}}H_{t_{j-1}}\Delta W_i\Delta W_j\right] + \sum_j \mathbb{E}\left[H_{t_{j-1}}^2\Delta W_j^2\right]
\end{align*}
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo e com $i < j$, temos $H_{t_{i-1}}$, $H_{t_{j-1}}$ e $\Delta W_i$ independente de $\Delta W_j$, de modo que
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

No limite quando a malha é refinada, o somatório no lado direito converge para uma integral de Riemann do processo $\{H_t^2\}_t$, nos dando a seguinte identidade, conhecida como **isometria de Itô:**
$$
\mathbb{E}\left[ \left( \int_0^T H_t \;\mathrm{d}W_t\right)^2\right] = \mathbb{E}\left[ \int_0^T H_t^2 \;\mathrm{d}t\right].
$$

## Propriedade de Martingale

Considerando o processo $\{S_t\}_{t\geq 0}$ definido por
$$
S_t = \int_0^t H_s \;\mathrm{d}W_s,
$$
segue que $\{S_t\}_{t\geq 0}$ é um Martingale.

De fato, sejam $t \geq 0$, $\tau > 0$, $\{\mathcal{F}_t\}_{t\geq 0}$ a filtração natural do processo de Wiener $\{W_t\}_{t \geq 0}$ e $\{H_t\}_{t\geq 0}$ adaptado a essa filtração. Então,
$$
\begin{align*}
\mathbb{E}\left[S_{t + \tau} | \mathcal{F}_t\right] & = \mathbb{E}\left[S_t + \int_t^{t+\tau}H_s\;\mathrm{d}W_s | \mathcal{F}_t\right] \\
& = \mathbb{E}\left[S_t | \mathcal{F}_t\right] + \int_t^{t+\tau}\mathbb{E}\left[H_s\;\mathrm{d}W_s | \mathcal{F}_t\right].
\end{align*}
$$
Como $H_s$ é independente de $\mathrm{d}W_s$, temos
$$
\mathbb{E}\left[H_s\;\mathrm{d}W_s | \mathcal{F}_t\right] = \mathbb{E}[H_s | \mathcal{F}_t]\;\mathbb{E}[\mathrm{d}W_s | \mathcal{F}_t].
$$
Como $\mathcal{F}_t$ é a filtração natural de $\{W_t\}_t$, então, para $s \geq t$, temos $\mathbb{E}[\mathrm{d}W_s | \mathcal{F}_t] = 0$, de modo que
$$
\int_t^{t+\tau}\mathbb{E}[H_s | \mathcal{F}_t]\;\mathbb{E}[\mathrm{d}W_s | \mathcal{F}_t] = 0.
$$
Por outro lado,
$$
\mathbb{E}\left[S_t | A_t\right] = S_t.
$$
Portanto,
$$
\mathbb{E}\left[S_{t + \tau} | \mathcal{F}_t\right]
= S_t, \qquad \forall t \geq 0,
$$
mostrando que $\{S_t\}_{t\geq 0}$ é uma Martingale.

## Relação com a definição via dualidade

Na Seção {{link_section pages/c05/integral_dualidade}}, definimos a integral de uma função determinística $g=g(t)$ continuamente diferenciável em relação a um processo estocástico como o processo de Wiener, cujos caminhos amostrais são quase certamente contínuos, através da dualidade
$$
\int_0^T g(t)\;\mathrm{d}W_t = g(T)W_T - g(0)W_0 - \int_0^t g'(t)W_t \;\mathrm{d}t.
$$

Por outro lado, podemos considerar $g(t)$ como um processo estocástico $H_t = g(t)$ e interpretar a integral como uma integral de Itô. Sendo $H_t = g(t)$ determinístico, segue que $\{H_t\}_{t\geq 0}$ é não antecipativo. Assim, como integral de Itô, temos
$$
\int_0^T g(t)\;\mathrm{d}W_t = \lim_{\max_j\{t_j - t_{j-1}\} \rightarrow 0} \sum_{j=1}^n g(t_{j-1}) (W_{t_j} - W_{t_{j-1}}).
$$

Agora, observe que, para cada malha,
$$
\begin{align*}
\sum_{j=1}^n g(t_{j-1}) (W_{t_j} - W_{t_{j-1}}) & = \sum_{j=1}^n g(t_{j-1}) W_{t_j} - \sum_{j=0}^{n-1} g(t_j) W_{t_j} \\
& = g(t_{n-1})W_{t_n} - g(0)W_0 - \sum_{j=1}^{n-1} W_{t_j} (g(t_j) - g(t_{j-1})) \\
& = g(T)W_T - g(0)W_0 - (g(t_n)- g(t_{n-1}))W_{T} - \sum_{j=1}^{n} W_{t_j} (g(t_j) - g(t_{j-1})).
\end{align*}
$$
No limite do refinamento da malha, temos
$$
(g(t_n)- g(t_{n-1}))W_{T} \rightarrow 0
$$
e
$$
\sum_{j=1}^{n} W_{t_j} (g(t_j) - g(t_{j-1})) \rightarrow \int_0^T W_t \;\mathrm{d}g = \int_0^T g'(t) W_t \;\mathrm{d}t
$$

Portanto, obtemos também para a integral de Itô que
$$
\int_0^T g(t)\;\mathrm{d}W_t = g(T)W_T - g(0)W_0 - \int_0^t g'(t)W_t \;\mathrm{d}t.
$$

Isso mostra que a integral de Itô, definida para processos mais gerais, coincide com a integral definida via dualidade.
