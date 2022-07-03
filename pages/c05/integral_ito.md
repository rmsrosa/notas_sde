@def title = "Integral de Itô"

# {{ get_title }}

Bom, já vimos como integrar processos em relação ao tempo (Seção {{link_section pages/c05/integral_riemann}}), em relação a processos de variação limitada (Seção {{link_section pages/c05/integral_riemannstieltjes}}) e como integrar certas classes de funções em relação a processos que não são de variação limitada (Seção {{link_section pages/c05/integral_dualidade}}). Também vimos como as somas de Riemann-Stieltjes não convergem quando tentamos integrar funções mais gerais (Seção {{link_section pages/c05/riemann_wiener}}). Vamos agora ver como podemos especificar as somas parciais de Riemann-Stieltjes de forma a obter uma noção de integral que esteja bem definida nesse último caso.

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

Uma condição essencial pode ser posta do seguinte modo informal:

> A cada instante $t \geq 0$, o integrando $H_t$ deve ser independente dos valores futuros $s \geq t$ do processo de Wiener.

Vamos chamar essa condição de *não-antecipativa* *("non-antecipating")* ou *adaptada* ao processo $\{W_t\}_t$. Uma definição mais formal envolve uma *filtração* das $\sigma$-álgebras.

Lembramos que uma **filtração** é uma família $\{\mathcal{F}_t\}_{t\geq 0}$ de $\sigma$-álgebras com a propriedade de que $\mathcal{F}_s \subset \mathcal{F}_t$, para $0 \leq s \leq t$. Uma filtração é dita **não-antecipativa** ou **adaptada** em relação a um processo $\{W_t\}_{t\geq 0}$ quando $W_t$ é mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$ e $W_t$ é independente das $\sigma$-álgebras geradas por $\Delta W_{t, s} = W_s - W_t$, para qualquer $s \geq t$. Dizemos, então, que $\{H_t\}_{t\geq 0}$ é **não-antecipativa** ou **adaptada** ao processo $\{W_t\}_{t\geq 0}$ quando, para cada $t\geq 0$, $H_t$ é mensurável em relação a $\mathcal{F}_t$, onde $\{\mathcal{F}_t\}_{t\geq 0}$ é uma filtração adaptada a $\{W_t\}_{t\geq 0}$.

Sob a condição de $\{H_t\}_{t\geq 0}$ estar adaptada a $\{W_t\}_{t\geq 0}$ e dos caminhos amostrais de $\{H_t\}_{t\geq 0}$ serem quase certamente contínuos, a integral de Itô está bem definida e possui boas propriedades, como veremos posteriormente.

Essa construção pode ser estendida a processos $\{H_t\}_{t\geq 0}$ adaptados a $\{W_t\}_{t\geq 0}$ que sejam de quadrado integrável, i.e.
$$
\mathbb{E}\left[ \int_0^T  H_t^2 \;\mathrm{d}t \right]  < \infty,
$$
e que sejam **progressivamente mensuráveis**, ou seja, que $(t, \omega) \mapsto H_t(\omega)$ seja mensurável em relação à $\sigma$-álgebra produto $\mathcal{B}(0, t) \times \mathcal{F}_t$, onde $\mathcal{B}(0, t)$ é a $\sigma$-álgebra de Borel do intervalo $[0, t]$.

Vale observar que se $\{H_t\}_{t\geq 0}$ é adaptada a $\{W_t\}_{t\geq 0}$ e com caminhos amostrais quase certamente contínuous, então ele é progressivamente mensurável.

## Construção

No caso de $\{H_t\}_{t\geq 0}$ ser adptada a $\{W_t\}_{t \geq 0}$ e com caminhos amostrais quase certamente contínuos, então a integral é definida via limite de somas parciais
$$
\int_0^T H_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n H_{t_{j-1}}\; (W_{t_j} - W_{t_{j-1}}),
$$
onde as partições satisfazem $0 = t_0 < t_1 < \ldots < t_n = T$ e o limite é tomado quando $\max_j\{t_j - t_{j-1}\} \rightarrow 0$.

No caso mais geral, de processos $\{H_t\}_{t\geq 0}$ progressivamente mensuráveis e de quadrado integrável, a ideia é aproximar o processo por processos $\{H_t^k\}_{t \geq 0}$ adaptados e com caminhos quase-certamente contínuos e tomar o limite das integrais de Itô definidas para estes.

Mais precisamente, começa-se considerando processos escada, i.e. processos $\{H_t\}_{t\geq 0}$ para os quais existe uma partição $0 = t_0 < t_1 < \ldots < t_n = T$ tal que $H_t$ é constante, $H_t = H_{t_{j-1}}$, em cada intervalo $t_{j-1} \leq t < t_j$. Para esses processo, define-se, naturalmente, a integral de Itô por
$$
\int_0^T H_t \;\mathrm{d}W_t = \sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}).
$$

Em seguida, para um processo $\{H_t\}_{t \geq 0}$ que seja progressivamente mensurável e em $L^2(0, T)$, ...


Segue, ainda, que, nesse caso, também vale a fórmula através do limite
$$
\int_0^T H_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n H_{t_{j-1}}\; (W_{t_j} - W_{t_{j-1}}),
$$
por partições arbitrárias $0 = t_0 < t_1 < \ldots < t_n = T$, com $\max_j\{t_j - t_{j-1}\} \rightarrow 0$.

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
