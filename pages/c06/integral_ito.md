@def title = "Integral de Itô de processos uniformemente contínuos em média quadrática"

# {{ get_title }}

Bom, já vimos como integrar processos em relação a variações no tempo (Seção {{link_section pages/c05/integral_riemann}}), em relação a processos de variação limitada (Seção {{link_section pages/c05/integral_riemannstieltjes}}) e como integrar certas classes de funções em relação a processos que não são de variação limitada (Seção {{link_section pages/c05/integral_dualidade}}). Também vimos como as somas parciais de Riemann-Stieltjes não convergem quando tentamos integrar um processo de Wiener em relação a si mesmo (Seção {{link_section pages/c05/riemann_wiener}}). Vamos agora ver como podemos especificar as somas parciais de forma a obter uma noção de integral que esteja bem definida nesse último caso.

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

Independente da *evolução futura* significa que, para cada $t\geq 0,$ $H_t$ é independente de $W_{t + \tau} - W_t,$ para todo $\tau > 0.$ Chamamos essa condição de *não antecipativa* *("non-antecipating")* ou *adaptada* ao processo $\{W_t\}_t$. Uma definição mais formal envolve o conceito de *filtração:*

Lembramos que uma **filtração** é uma família $\{\mathcal{F}_t\}_{t\geq 0}$ de sub $\sigma$-álgebras com a propriedade de que $\mathcal{F}_s \subset \mathcal{F}_t$, para $0 \leq s \leq t$. A **filtração natural** é a menor filtração possível que torna cada $W_t$ mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$. Uma filtração é dita **não antecipativa** ou **adaptada** em relação a um processo $\{W_t\}_{t\geq 0}$ quando $W_t$ é mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$. Dizemos, então, que $\{H_t\}_{t\geq 0}$ é **não antecipativa** ou **adaptada** ao processo $\{W_t\}_{t\geq 0}$ quando, para cada $t\geq 0$, $H_t$ é mensurável em relação à filtração natural de $\{W_t\}_{t\geq 0}$.

Em relação à mensurabilidade, pedimos, também, que $\{H_t\}_{t\geq 0}$ seja **progressivamente mensurável** em relação a uma filtração $\mathcal{F}_t,$ ou seja, que para cada $\bar t \geq 0$, a função $(t, \omega) \mapsto H_t(\omega)$ definida em $[0, \bar t] \times \Omega$ seja mensurável em relação à $\sigma$-álgebra produto $\mathcal{B}(0, \bar t) \times \mathcal{F}_{\bar t}$, onde $\mathcal{B}(0, \bar t)$ é a $\sigma$-álgebra de Borel do intervalo $[0, \bar t].$

Em relação à integrabilidade, pedimos, ainda, que $\{H_t\}_{t\geq 0}$ seja de **quadrado integrável,** i.e.
$$
\int_0^T  \mathbb{E}\left[H_t^2\right] \;\mathrm{d}t  < \infty.
$$
Observe que, pelo Teorema de Fubini, essa condição garante que
$$
\int_{[0, T]\times \Omega} H_t(\omega)^2 \;\mathrm{d}(\lambda \times \mathbb{P})(t, \omega) = \mathbb{E}\left[\int_0^T H_t(\omega)^2 \;\mathrm{d}t\right] = \int_0^T \mathbb{E}\left[H_t^2\right] \;\mathrm{d}t < \infty,
$$
onde $\lambda \times \mathbb{P}$ denota a medida produto entre a medida de Lebesgue $\lambda$ e a medida de probabilidade $\mathbb{P}$ em $\Omega.$

Vale ressaltar que se $\{H_t\}_{t\geq 0}$ é adaptada a $\{W_t\}_{t\geq 0}$ e com caminhos amostrais quase certamente contínuous, então ele é progressivamente mensurável.

As condições acima são suficientes para a definição da integral estocástica
$$
    \int_0^T H_t\;\mathrm{d}t
$$
via limites, em $L^2(\Omega),$ das somas finitas de Riemann-Stieljes
$$
\sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}),
$$
onde $M = \{t_j\}_{j=1}^n$ é uma malha formada por $0 = t_0 < t_1 < \ldots < t_n = T,$ com $n\in \mathbb{N}$ arbitrário.

Inicialmente, no entanto, vamos assumir uma condição extra de continuidade uniforme no sentido de média quadrática. Mais precisamente, vamos pedir que $\{H_t\}_{t\geq 0},$ além de ser de quadrado integrável e progressivamente mensurável em relação ao processo de Wiener, também seja localmente (no tempo) uniformemente contínua no sentido de média quadrática, i.e. dados quaisquer $T > 0$ e $\eta > 0,$ existe $\delta > 0$ tal que
$$
    \mathbb{E}\left[ |H_{t +\tau} - H_t|^2 \right] < \eta, \qquad \forall 0 < \tau < \delta, \; 0 \leq t \leq t + \tau \leq T.
$$

Observe que o processo de Wiener tem a propriedade de que $W_{t+\tau} - W_t \sim \mathcal{N}(0, \tau),$ de forma que
$$
    \mathbb{E}\left[ |W_{t+\tau} - W_t|^2 \right] = \tau,
$$
que implica trivialmente na condição acima. Qualquer potência do processo de Wiener também pode ser adequadamente estimada de acordo com a condição acima.

Observe, ainda, que a condição acima não garante que os caminhos sejam, quase certamente, contínuos. De fato, basta considerar $\Omega = [0, 1]$ com probabilidade uniforme e definir $H_t(\omega) = \chi_{[\omega, 1]},$ de modo que $H_{t + \tau} - H_t = 1,$ para $t < \omega \leq t + \tau,$ se anulando fora desse intervalo, e portanto $\mathbb{E}[|H_{t+\tau} - H_t|^2] = \mathbb{P}(|H_{t+\tau} - H_t| > \eta) = \tau,$ para todo $0< \eta < 1.$  Observe que isso mostra a importância da hipótese do Teorema da Continuidade de Kolmogorov ter uma potência $\tau^{1 + \varepsilon}$ no lado direito da condição, com $\varepsilon$ estritamente positivo. 

Fazemos isso em nome de uma construção mais simples e direta da integral de Itô. Em seguida, faremos uma outra construção, mais elaborada, para processos que não sejam necessariamente uniformemente contínuos no sentido acima. 

## Somas finitas de Riemann-Stieltjes

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

### Média quadrática

Dadas duas malhas $M_1$ e $M_2,$ podemos fazer uma triangulação com o refinamento das duas malhas, $M = M_1 \cup M_2.$ Naturalmente,
$$
    \|M\| \leq \min\{M_1, M_2\}.
$$
Vamos comparar $M_1$ e $M_2$ com $M$. Denotando os pontos da malha mais grossa $M_1$ por $t_i',$ $i = 1, \ldots, n_1,$ e os pontos da malha mais fina $M$ por $t_j,$ $j=1, \ldots, n,$ com $M\subset M_1$ e $n \geq n_1,$ podemos escrever
$$
    R_M = \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})
$$
e
$$
    R_{M_1} = \sum_{i=1}^{n_1} H_{t_{i-1}'}(W_{t_i'} - W_{t_{i-1}'}),
$$
onde, para cada $j=0, \ldots, n,$ existe um único $i_j$ tal que
$$
    t_{i_j}' \leq t_j < t_{i_j+1}.
$$
Assim, somando e subtraindo os passos intermediários se necessário, podemos escrever
$$
    R_{M_1} = \sum_{j=1}^{n} H_{t_{i_{j-1}}}(W_{t_j} - W_{t_{j-1}}).
$$
Com isso,
$$
    R_{M_1} - R_M = \sum_{j=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}).
$$
Elevando ao quadrado,
$$
    \begin{align*}
        (R_{M_1} - R_M)^2 & = \left(\sum_{j=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})\right)^2 \\
        & = \sum_{j=1}^{n} \sum_{k=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}}).
    \end{align*}
$$
Logo,
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
Sobram, então, apenas os termos com $k=j,$ i.e.
$$
    \mathbb{E}[|R_{M_1} - R_M|^2] = \sum_{j=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right].
$$
Como $\{H_t\}_{t\geq 0}$ é não antecipativo, cada termo $H_{t_{i_{j-1}}} - H_{t_{j-1}}$ é independente de $W_{t_j} - W_{t_{j-1}},$ de modo que
$$
    \mathbb{E}[|R_{M_1} - R_M|^2] = \sum_{j=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})^2\right]\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right].
$$
Dado $\eta > 0,$ existe $\delta > 0$ tal que, para $\|M_1\|, \|M_2\| < \delta,$ cada $t_{j-1} - t_{i_{j-1}}$ está limitado pela malha mais grossa $M_1,$ de modo que $0 \leq t_{j-1} - t_{i_{j-1}} < \delta$ e, com isso,
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

Essa definição nos dá a **integral de Itô,** em relação a um processo de Wiener $\{W_t\}_{t\geq 0},$ de um processo estocástico $\{H_t\}_{t\geq 0}$ com as propriedades de ser progressivamente mensurável em relação à filtração natural do processo de Wiener, ter quadrado integrável em $[0, T]\times \Omega$ e ser localmente uniformemente contínuo em média quadrática.

### Valor esperado da integral estocástica

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
para qualquer malha $M.$ No limite, como $R_M \rightarrow R$ em média quadrática, segue que
$$
    \mathbb{E}\left[\int_0^T H_t\;\mathrm{d}t\right] = \mathbb{E}[R] = \lim_{\|M\|\rightarrow 0}\mathbb{E}[R_M] = 0.
$$

## Isometria de Itô

Sabendo que $R_M$ converge para $R$ em média quadrádica, segue que 
$$
    \mathbb{E}[R_M^2] \rightarrow \mathbb{E}[R^2],
$$
quando a malha é refinada ao limite $\|M\| \rightarrow 0.$ Vamos calcular o limite de $\mathbb{E}[R_M^2]$ e ver que isso nos dá uma importante identidade conhecida como *isometria de Itô.*

Primeiramente, temos
$$
    \begin{align*}
        \mathbb{E}[R_M^2] & = \mathbb{E}\left[\left(\sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right)^2\right] \\
        & = \mathbb{E}\left[\sum_{i=1}^n \sum_{j=1}^n H_{t_{i-1}}(W_{t_i} - W_{t_{i-1}})H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right] \\
        & = \sum_{i=1}^n \sum_{j=1}^n \mathbb{E}\left[H_{t_{i-1}}(W_{t_i} - W_{t_{i-1}})H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right].
    \end{align*}
$$
De maneira análoga à feita acima para o cálculo de $\mathbb{E}[|R_{M_1} - R_{M_2}|^2],$ os termos com $i\neq j$ se anulam, restando
$$
    \begin{align*}
        \mathbb{E}[R_M^2] & = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}^2(W_{t_j} - W_{t_{j-1}})^2\right] \\
        & = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}^2\right]\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] \\
        & = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}^2\right](t_j t_{j-1})
    \end{align*}
$$
Note, agora, que o último termo é uma soma de Riemann da função $\mathbb{E}[H_t^2].$ Com a hipótese de continuidade uniforme em média quadrática, segue que
$$
    t \mapsto \mathbb{E}[H_t^2]
$$
é uma função contínua, de modo que o soma de Riemann converge para a integral de Riemann
$$
    \mathbb{E}[R^2] = \lim_{\|M\|\rightarrow 0} \mathbb{E}[R_M] = \int_0^T \mathbb{E}[H_t^2]\;\mathrm{d}t.
$$

De outra forma, escrevemos
$$
    \mathbb{E}\left[\left(\int_0^T H_t \;\mathrm{d}W_t \right)^2\right] = \int_0^T \mathbb{E}[H_t^2]\;\mathrm{d}t.
$$
Essa identidade é chamada **isometria de Itô.**

Por exemplo,
$$
    \mathbb{E}\left[\left(\int_0^T W_t \;\mathrm{d}W_t \right)^2\right] = \int_0^T \mathbb{E}[W_t^2]\;\mathrm{d}t = \int_0^T t\;\mathrm{d}t = \frac{T^2}{2}.
$$
Por outro lado, já vimos que
$$
    \int_0^T W_t \;\mathrm{d}W_t = \lim_{\|M\|\rightarrow 0} \sum_{j=1}^n W_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}) = \frac{W_T^2}{2} - \frac{T}{2},
$$
o que nos leva a uma outra forma de calcular essa esperança, a saber
$$
    \begin{align*}
        \mathbb{E}\left[\left(\int_0^T W_t \;\mathrm{d}W_t\right)^2\right] & = \mathbb{E}\left[\frac{W_T^4}{4} - 2\frac{W_T^2}{2}\frac{T}{2} + \frac{T^2}{4}\right] \\
        & = \frac{\mathbb{E}[W_T^4]}{4} - 2\frac{\mathbb{E}[W_T^2]}{2}\frac{T}{2} + \frac{T^2}{4} \\
        & = \frac{3\mathbb{E}[W_T^2]^2}{4} - 2\frac{T}{2}\frac{T}{2} + \frac{T^2}{4} \\
        & = \frac{3T^2}{4} - 2\frac{T}{2}\frac{T}{2} + \frac{T^2}{4} \\
        & = \frac{3T^2}{4} - 2\frac{T^2}{4} + \frac{T^2}{4} \\
        & = \frac{T^2}{2},
    \end{align*}
$$
onde usamos que $W_T$ é uma normal e, portanto, $\mathbb{E}[W_T^4] = 3\mathbb{E}[W_T^2]^2.$