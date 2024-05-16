@def title = "Integral de Itô de processos uniformemente contínuos"

# {{ get_title }}

Bom, já vimos como integrar processos em relação ao tempo (Seção {{link_section pages/c05/integral_riemann}}), em relação a processos de variação limitada (Seção {{link_section pages/c05/integral_riemannstieltjes}}) e como integrar certas classes de funções em relação a processos que não são de variação limitada (Seção {{link_section pages/c05/integral_dualidade}}). Também vimos como as somas parciais de Riemann-Stieltjes não convergem quando tentamos integrar um processo de Wiener em relação a si mesmo (Seção {{link_section pages/c05/riemann_wiener}}). Vamos agora ver como podemos especificar as somas parciais de forma a obter uma noção de integral que esteja bem definida nesse último caso.

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

> A cada instante $t \geq 0$, o integrando $H_t$ deve ser independente da evolução futura $s \geq t$ do processo de Wiener.

Chamamos essa condição de *não antecipativa* *("non-antecipating")* ou *adaptada* ao processo $\{W_t\}_t$. Uma definição mais formal envolve o conceito de *filtração:*

Lembramos que uma **filtração** é uma família $\{\mathcal{F}_t\}_{t\geq 0}$ de sub $\sigma$-álgebras com a propriedade de que $\mathcal{F}_s \subset \mathcal{F}_t$, para $0 \leq s \leq t$. Uma filtração é dita **não antecipativa** ou **adaptada** em relação a um processo $\{W_t\}_{t\geq 0}$ quando $W_t$ é mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$. Dizemos, então, que $\{H_t\}_{t\geq 0}$ é **não antecipativa** ou **adaptada** ao processo $\{W_t\}_{t\geq 0}$ quando, para cada $t\geq 0$, $H_t$ é mensurável em relação a $\mathcal{F}_t$, onde $\{\mathcal{F}_t\}_{t\geq 0}$ é a filtração natural de $\{W_t\}_{t\geq 0}$. A **filtração natural** é a menor filtração possível que torna cada $W_t$ mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$.

Na presente discussão, vamos assumir, inicialmente, uma outra condição, de continuidade uniforme no sentido de média quadrática. Mais precisamente, vamos pedir que $\{H_t\}_{t\geq 0},$ além de ser não antecipativo em relação ao processo de Wiener, também seja localmente (no tempo) uniformemente contínua no sentido de média quadrática, i.e. dados quaisquer $T > 0$ e $\eta > 0,$ existe $\delta > 0$ tal que
$$
    \mathbb{E}\left[ |H_{t +\tau} - H_t|^2 \right] < \eta, \qquad \forall 0 < \tau < \delta, \; 0 \geq t \leq t + \tau \leq T.
$$
Com isso, a *integral de Itô* pode ser bem definida e possui boas propriedades.

Observe que o processo de Wiener tem a propriedade de que $W_{t+\tau} - W_t \sim \mathcal{N}(0, \tau),$ de forma que
$$
    \mathbb{E}\left[ |W_{t+\tau} - W_t|^2 \right] = \tau,
$$
que implica trivialmente na condição acima. Qualquer potência do processo de Wiener também pode ser adequadamente estimada de acordo com a condição acima.

## Somas finitas de Riemann-Stieltjs

Consideremos, então, as somas finitas de Riemann-Stieltjes
$$
    R_M = \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}),
$$
onde $M = \{t_j\}_{j=1}^n$ é uma malha formada por $0 = t_0 < t_1 < \ldots < t_n = T,$ com $n\in \mathbb{N}$ arbitrário. Vamos mostrar que $\{R_M\}_{M}$ é (uma rede) de Cauchy, em $L^2(\Omega).$
$$
    \lim_{\|M_1\|, \|M_2\| \rightarrow 0} \mathbb{P}(|R_{M_1} - R_{M_2}| \geq \varepsilon) = 0,
$$
lembrando que, para uma malha $M,$
$$
    \|M\| = \max_{j=1, \ldots, n} |t_j - t_{j-1}|.
$$
Uma vez feito isso, obtemos que existe uma variável aleatória limite $R,$ tal que $R_M \rightarrow R$ em em média quadrática, i.e.
$$
    \lim_{\|M\|\rightarrow 0} \mathbb{E}(|R_M - R|^2) = 0.
$$
Com isso, $R_M$ converge, em média quadrática, para um limite $R,$ que definimos como sendo a integral de $\{H_t\}_{t\geq 0}$ em relação a $\{W_t\}_{t\geq 0},$ no intervalo $[0, T]:$
$$
    \int_0^T H_t\;\mathrm{d}t = R = \lim_{\|M\|\rightarrow 0} R_M = \lim_{\|M\|\rightarrow 0} \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}).
$$

No caso de $\{H_t\}_{t\geq 0}$ ser progressivamente mensurável e de quadrado integrável, a ideia é aproximar o processo por processos $\{H_t^m\}_{t \geq 0}$ adaptados e do tipo escada. Essa aproximação passa antes por aproximá-lo por processos com caminhos contínuous. Mas vamos, antes, tratar primeiro de processos localmente uniformemente contínuos em média quadrática.

### Valor esperado das somas finitas

Temos
$$
    \mathbb{E}\left[ R_M \right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right].
$$
Como $\{H_t\}_{t\geq 0}$ é não antecipativo, temos que cada $H_{t_{j-1}}$ é independente de $W_{t_j} - W_{t_{j-1}}$. Logo,
$$
    \mathbb{E}\left[ R_M \right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[W_{t_j} - W_{t_{j-1}}\right] = 0,
$$
visto que cada passo $W_{t_j} - W_{t_{j-1}}$ tem valor esperado nulo. Portanto,
$$
    \mathbb{E}[R_M] = 0,
$$
para qualquer malha $M.$

### Média quadrática

Dadas duas malhas $M_1$ e $M_2,$ podemos fazer uma triangulação com o refinamento das duas malhas, $M = M_1 \cup M_2.$ Naturalmente,
$$
    \|M\| \leq \min\{M_1, M_2\}.
$$
Vamos comparar $M_1$ e $M_2$ com $M$. Denotando os pontos da malha $M_1$ por $t_i^1,$ $i = 1, \ldots, n_1,$ e os pontos da malha mais fina $M$ por $t_j,$ $j=1, \ldots, n,$ com $M\subset M_1$ e $n \geq n_1,$ podemos escrever
$$
    R_M = \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})
$$
e
$$
    R_{M_1} = \sum_{i=1}^{n_1} H_{t_{i-1}}(W_{t_i} - W_{t_{i-1}}).
$$
Para cada $j=0, \ldots, n,$ existe um único $i_j$ tal que
$$
    t_{i_j}^1 \leq t_j < t_{i_j+1}.
$$
Assim, somando e subtraindo os passos intermediários se necessário, podemos escrever
$$
    R_{M_1} = \sum_{j=1}^{n} H_{t_{i_{j-1}}}(W_{t_j} - W_{t_{j-1}}).
$$
Com isso,
$$
    R_{M_1} - R_M = \sum_{j=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}).
$$
Independentemente dessa nova formulação, já sabemos que $\mathbb{E}[R_{M_1} - R_M] = 0.$ Para a média quadrática, que nesse caso é a variância, escrevemos
$$
    \begin{align*}
        (R_{M_1} - R_M)^2 & = \left(\sum_{j=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})\right)^2 \\
        & = \sum_{j=1}^{n} \sum_{k=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}}).
    \end{align*}
$$
Com isso,
$$
    \mathbb{E}[|R_{M_1} - R_M|^2] = \sum_{j=1}^{n} \sum_{k=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}})\right]
$$
Para $j < k,$ temos $W_{t_k} - W_{t_{k-1}},$ que tem esperança nula, independente dos outros termos, de modo que
$$
    \begin{align*}
        & \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}})\right] \\
        & \qquad = \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})\right]\mathbb{E}\left[(W_{t_k} - W_{t_{k-1}})\right] \\
        & \qquad = 0.
    \end{align*}
$$
Por outro lado, para $k > j,$ temos $W_{t_j} - W_{t_{j-1}},$ que também tem esperança nula, independente dos outros termos. Logo,
$$
    \begin{align*}
        & \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}})\right] \\
        & \qquad = \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_k} - W_{t_{k-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})\right]\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})\right] \\
        & \qquad = 0.
    \end{align*}
$$
Sobram, então, apenas os termos com $j=k,$ i.e.
$$
    \mathbb{E}[|R_{M_1} - R_M|^2] = \sum_{j=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right].
$$
Como $\{H_t\}_{t\geq 0}$ é não antecipativo, cada termo $H_{t_{i_{j-1}}} - H_{t_{j-1}}$ é independente de $W_{t_j} - W_{t_{j-1}},$ de modo que
$$
    \mathbb{E}[|R_{M_1} - R_M|^2] = \sum_{j=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})^2\right]\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right].
$$
Dado $\eta > 0,$ existe $\delta > 0$ tal que, para $\|M_1\|, \|M_2\| < \delta,$ vale $\|M\| < \delta,$ de modo que
$$
\mathbb{E}\left[|H_{t_{i_{j-1}}} - H_{t_{j-1}}|^2\right] < \eta.
$$

Usando, ainda, que $\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] = t_j - t_{j-1},$ obtemos
$$
\mathbb{E}[|R_{M_1} - R_M|^2] \leq \sum_{j=1}^{n} \eta (t_j - t_{j-1}) = \eta T.
$$
Idem para $M_2.$ Logo,
$$
\mathbb{E}[|R_{M_1} - R_{M_2}|^2] \leq 2\eta T.
$$
Como podemos tomar $\eta > 0$ arbitrariamente pequeno, bastando refinar cada vez mais a malha, obtemos que
$$
    \lim_{\|M_1\|, \|M_2\| \rightarrow 0} \mathbb{E}(|R_{M_1} - R_{M_2}|^2) = 0.
$$
Logo, existe uma variável aleatória $R=R(\omega)$ de quadrado integrável tal que
$$
    \lim_{\|M\|\rightarrow 0} \mathbb{E}(|R_M - R|^2) = 0,
$$
ou seja, existe o limite
$$
    R = \lim_{\|M\|\rightarrow 0} R_M
$$
e podemos definir a integral de $\{H_t\}_{t\geq 0}$ em relação a $\{W_t\}_{t\geq 0},$ no intervalo $[0, T],$ por
$$
    \int_0^T H_t\;\mathrm{d}W_t = R = \lim_{\|M\|\rightarrow 0} R_M = \lim_{\|M\|\rightarrow 0} \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}).
$$
