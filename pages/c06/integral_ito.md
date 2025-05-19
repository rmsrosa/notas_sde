@def title = "Integral de Itô via processos uniformemente contínuos em média quadrática"

# {{ get_title }}

Bom, já vimos como integrar processos em relação à variável independente (Seção {{link_section pages/c06/integral_riemann}}), em relação a processos de variação limitada (Seção {{link_section pages/c06/integral_riemannstieltjes}}) e como integrar certas classes de funções em relação a processos que não são de variação limitada (Seção {{link_section pages/c06/integral_dualidade}}). Também vimos como as somas parciais de Riemann-Stieltjes não convergem quando tentamos integrar um processo de Wiener em relação a si mesmo (Seção {{link_section pages/c06/riemann_wiener}}). Vamos agora ver como podemos especificar as somas parciais de forma a obter uma noção de integral que esteja bem definida nesse último caso.

No que se segue, vamos buscar definir uma integral cujo integrando é um processo estocástico $\{H_t\}_{t\geq 0}$ e a integral é em relação a um processo de Wiener $\{W_t\}_{t\geq 0}$:
$$
\int_0^T H_t \;\mathrm{d}W_t.
$$

Observe que se $\{X_t\}_t$ é um processo estocástico e $g = g(t, x)$ é uma função contínua, então $\{g(t, X_t)\}_t$ define um processo estocástico, de modo que podemos considerar a integral
$$
\int_0^T g(t, X_t)\;\mathrm{d}W_t
$$
simplesmente definindo $H_t = g(t, X_t).$ Ou seja, basta considerarmos integrais de um processo $\{H_t\}_t.$

## Definição da integral de Itô

A ideia inicial é definir a integral de Itô como limite de somas de Riemann-Stieltjes calculadas com o ponto mais à esquerda de cada intervalo da malha, i.e. através de
$$
    \int_0^T H_t \;\mathrm{d}W_t = \lim_{\|M\| \rightarrow 0} \sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}),
$$
onde $M$ são malhas temporais particionando o intervalo $[0, T],$
$$
    M = \{0 = t_0 < t_1 < \ldots < t_n = T; \;n\in\mathbb{N}\},
$$
e
$$
    \|M\| = \max_{j=1, \ldots, n} |t_j - t_{j-1}|.
$$

Vamos ver condições em $\{H_t\}_{t\geq 0}$ para que esse limite exista em média quadrática e como modificar essa definição no caso geral em que esse limite não esteja propriamente definido.

## Integrandos permitidos

Uma condição essencial pode ser posta do seguinte modo informal:

> A cada instante $t \geq 0,$ o integrando $H_t$ deve ser independente da evolução futura $s \geq t$ do processo de Wiener.

Independente da *evolução futura* significa que, para cada $t\geq 0,$ $H_t$ é independente de $W_{t + \tau} - W_t,$ para todo $\tau > 0.$ Chamamos essa condição de *não antecipativa* *("non-antecipating")* ou *adaptada* ao processo $\{W_t\}_t.$ Uma definição mais formal envolve o conceito de *filtração:*

Lembramos que uma **filtração** é uma família $\{\mathcal{F}_t\}_{t\geq 0}$ de sub $\sigma$-álgebras com a propriedade de que $\mathcal{F}_s \subset \mathcal{F}_t,$ para $0 \leq s \leq t.$ A **filtração natural** é a menor filtração possível que torna cada $W_t$ mensurável em relação a $\mathcal{F}_s,$ para todo $s \geq t.$ Uma filtração é dita **não antecipativa** ou **adaptada** em relação a um processo $\{W_t\}_{t\geq 0}$ quando $W_t$ é mensurável em relação a $\mathcal{F}_s,$ para todo $s \geq t.$ Dizemos, então, que $\{H_t\}_{t\geq 0}$ é **não antecipativa** ou **adaptada** ao processo $\{W_t\}_{t\geq 0}$ quando, para cada $t\geq 0,$ $H_t$ é mensurável em relação à filtração natural de $\{W_t\}_{t\geq 0}.$

Em relação à mensurabilidade, pedimos, também, que $\{H_t\}_{t\geq 0}$ seja **progressivamente mensurável** em relação a uma filtração $\mathcal{F}_t,$ ou seja, que para cada $T > 0,$ a função $(t, \omega) \mapsto H_t(\omega)$ definida em $[0, T] \times \Omega$ seja mensurável em relação à $\sigma$-álgebra produto $\mathcal{B}(0, T) \times \mathcal{F}_{T},$ onde $\mathcal{B}(0, T)$ é a $\sigma$-álgebra de Borel do intervalo $[0, T].$

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

As condições acima de $\{H_t\}_{t\geq 0}$ ser não-antecipativo e de quadrado integrável são suficientes para a definição da integral estocástica, mas a construção é um pouco elaborada e a definição via limites das somas finitas de Riemann-Stieljes requer hipóteses adicionais. Assim, em um primeiro momento, vamos assumir uma hipótese um pouco mais restritiva.

## Convergência para integrandos localmente uniformemente contínuous em média quadrática

Inicialmente vamos assumir uma condição de continuidade no sentido de média quadrática, para ilustrar os pontos principais que garantem a convergência, em média quadrática, das somas de Riemann-Stieltjes, com uma demonstração análoga à comumente feita para as integrais de Riemann e de Riemann-Stieltjes. Como dito acima, consideramos esse caso particular a título de uma demonstração mais simples e direta da convergência das somas de Riemann-Stieljes para se definir a integral de Itô. Em seguida, faremos uma outra construção, mais elaborada, para processos que não sejam necessariamente uniformemente contínuos no sentido acima. 

### Processos localmente uniformemente contínuos em média quadrática

Mais precisamente, vamos supor que, além de $\{H_t\}_{t\geq 0}$ ser de quadrado integrável e progressivamente mensurável em relação ao processo de Wiener, também seja localmente uniformemente contínua no sentido de média quadrática, i.e. dados quaisquer $T > 0$ e $\eta > 0,$ existe $\delta > 0$ tal que
$$
    \mathbb{E}\left[ |H_{t +\tau} - H_t|^2 \right] < \eta, \qquad \forall 0 < \tau < \delta, \; 0 \leq t \leq t + \tau \leq T.
$$
O termo "uniforme" se refere à estimativa ser uniforme em $t\in [0, T],$ enquanto que "local" se refere a $T$ ser finito.

Observe que o processo de Wiener tem a propriedade de que $W_{t+\tau} - W_t \sim \mathcal{N}(0, \tau),$ de forma que
$$
    \mathbb{E}\left[ |W_{t+\tau} - W_t|^2 \right] = \tau,
$$
que implica trivialmente na condição acima. Qualquer potência do processo de Wiener também pode ser adequadamente estimada de acordo com a condição acima.

Observe, ainda, que a condição acima não exige que os caminhos sejam, quase certamente, contínuos. De fato, basta considerar $\Omega = [0, 1]$ com probabilidade uniforme e definir $H_t(\omega) = \chi_{[\omega, 1]}(t),$ que é descontínuo em $t = \omega.$ Com isso, os caminhos são, todos, descontínuos em algum ponto. No entanto, $\mathbb{E}[|H_{t+\tau} - H_t|^2] = \mathbb{P}(|H_{t+\tau} - H_t| > \eta) = \tau,$ para todo $0< \eta < 1,$ mostrando que a condição de continuidade uniforme em média quadrática é valida.

Um exemplo clássico de caminhos descontínuos em um conjunto enumerável de pontos é o de um processo de Poisson composto, $H_t = \sum_{i=1}^{N_t} D_i,$ onde $\{N_t\}_{t\geq 0}$ é um processo de contagem de Poisson em taxa $\lambda > 0$ e $\{D_i\}_{i\in\mathbb{N}}$ é um processo independente e identicamente distribuído com distribuições $D$ com $\mathbb{E}[D^2] < \infty.$ Nesse caso, é possível mostrar que
$$
    \mathbb{E}[|H_{t + \tau} - H_t|^2] = \mathbb{E}[H_{t + \tau} - H_t]^2 + \operatorname{Var}(H_{t+\tau} - H_t) = \lambda^2 t^2\mathbb{E}[D]^2 + \lambda t \mathbb{E}[D^2],
$$
de modo que a condição de continuidade uniforme em média quadrática também é válida.

Observe que esses exemplos mostram a importância da hipótese do Teorema da Continuidade de Kolmogorov ter uma potência $\tau^{1 + \varepsilon}$ no lado direito da condição, com $\varepsilon$ estritamente positivo. Nos exemplos acima, temos a estimativa com $\varepsilon = 0$ e os caminhos não são nem contínuos.

Como dito acima, usamos essa condição a título de uma demonstração mais simples e direta da convergência das somas de Riemann-Stieljes para se definir a integral de Itô.

### Somas finitas de Riemann-Stieltjes

Consideremos, então, as somas finitas de Riemann-Stieltjes
$$
    S_M = \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}),
$$
onde $M = \{t_j\}_{j=1}^n$ é uma malha formada por $0 = t_0 < t_1 < \ldots < t_n = T,$ com $n\in \mathbb{N}$ arbitrário, como definido acima. Vamos mostrar que $\{S_M\}_{M}$ é (uma rede) de Cauchy, em $L^2(\Omega).$
$$
    \lim_{\|M_1\|, \|M_2\| \rightarrow 0} \mathbb{P}(|S_{M_1} - S_{M_2}| \geq \varepsilon) = 0,
$$
lembrando que, para uma malha $M,$
$$
    \|M\| = \max_{j=1, \ldots, n} |t_j - t_{j-1}|.
$$
Uma vez feito isso, obtemos que existe uma variável aleatória limite $S,$ tal que $S_M \rightarrow S$ em em média quadrática, i.e.
$$
    \lim_{\|M\|\rightarrow 0} \mathbb{E}(|S_M - S|^2) = 0.
$$
Com isso, $S_M$ converge, em média quadrática, para um limite $S,$ que definimos como sendo a integral de $\{H_t\}_{t\geq 0}$ em relação a $\{W_t\}_{t\geq 0},$ no intervalo $[0, T]:$
$$
    \int_0^T H_t\;\mathrm{d}t = S = \lim_{\|M\|\rightarrow 0} S_M = \lim_{\|M\|\rightarrow 0} \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}).
$$

### Média quadrática entre duas malhas

Dadas duas malhas $M_1$ e $M_2,$ podemos fazer uma triangulação com o refinamento das duas malhas, $M = M_1 \cup M_2.$ Naturalmente,
$$
    \|M\| \leq \min\{M_1, M_2\}.
$$
Vamos comparar $M_1$ e $M_2$ com $M.$ Denotando os pontos da malha mais grossa $M_1$ por $t_i',$ $i = 1, \ldots, n_1,$ e os pontos da malha mais fina $M$ por $t_j,$ $j=1, \ldots, n,$ com $M\subset M_1$ e $n \geq n_1,$ podemos escrever
$$
    S_M = \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})
$$
e
$$
    S_{M_1} = \sum_{i=1}^{n_1} H_{t_{i-1}'}(W_{t_i'} - W_{t_{i-1}'}),
$$
onde, para cada $j=0, \ldots, n,$ existe um único $i_j$ tal que
$$
    t_{i_j}' \leq t_j < t_{i_j+1}.
$$
Assim, somando e subtraindo os passos intermediários se necessário, podemos escrever
$$
    S_{M_1} = \sum_{j=1}^{n} H_{t_{i_{j-1}}}(W_{t_j} - W_{t_{j-1}}).
$$
Com isso,
$$
    S_{M_1} - S_M = \sum_{j=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}).
$$
Elevando ao quadrado,
$$
    \begin{align*}
        (S_{M_1} - S_M)^2 & = \left(\sum_{j=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})\right)^2 \\
        & = \sum_{j=1}^{n} \sum_{k=1}^{n} (H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}}).
    \end{align*}
$$
Logo,
$$
    \mathbb{E}[|S_{M_1} - S_M|^2] = \sum_{j=1}^{n} \sum_{k=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})(H_{t_{i_{j-1}}} - H_{t_{k-1}})(W_{t_k} - W_{t_{k-1}})\right]
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
    \mathbb{E}[|S_{M_1} - S_M|^2] = \sum_{j=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right].
$$
Como $\{H_t\}_{t\geq 0}$ é não antecipativo, cada termo $H_{t_{i_{j-1}}} - H_{t_{j-1}}$ é independente de $W_{t_j} - W_{t_{j-1}},$ de modo que
$$
    \mathbb{E}[|S_{M_1} - S_M|^2] = \sum_{j=1}^{n} \mathbb{E}\left[(H_{t_{i_{j-1}}} - H_{t_{j-1}})^2\right]\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right].
$$
Dado $\eta > 0,$ existe $\delta > 0$ tal que, para $\|M_1\|, \|M_2\| < \delta,$ cada $t_{j-1} - t_{i_{j-1}}$ está limitado pela malha mais grossa $M_1,$ de modo que $0 \leq t_{j-1} - t_{i_{j-1}} < \delta$ e, com isso,
$$
\mathbb{E}\left[|H_{t_{i_{j-1}}} - H_{t_{j-1}}|^2\right] < \eta.
$$

Usando, ainda, que $\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] = t_j - t_{j-1},$ obtemos
$$
\mathbb{E}[|S_{M_1} - S_M|^2] \leq \sum_{j=1}^{n} \eta (t_j - t_{j-1}) = \eta T.
$$
Idem para $M_2.$ Logo,
$$
\mathbb{E}[|S_{M_1} - S_{M_2}|^2] \leq 2\eta T.
$$
Como podemos tomar $\eta > 0$ arbitrariamente pequeno, bastando refinar cada vez mais a malha, obtemos que
$$
    \lim_{\|M_1\|, \|M_2\| \rightarrow 0} \mathbb{E}(|S_{M_1} - S_{M_2}|^2) = 0.
$$
Logo, existe uma variável aleatória $R=R(\omega)$ de quadrado integrável tal que
$$
    \lim_{\|M\|\rightarrow 0} \mathbb{E}(|S_M - R|^2) = 0,
$$
ou seja, existe o limite
$$
    R = \lim_{\|M\|\rightarrow 0} S_M
$$
e podemos definir a integral de $\{H_t\}_{t\geq 0}$ em relação a $\{W_t\}_{t\geq 0},$ no intervalo $[0, T],$ por
$$
    \int_0^T H_t\;\mathrm{d}W_t = R = \lim_{\|M\|\rightarrow 0} S_M = \lim_{\|M\|\rightarrow 0} \sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}).
$$

Essa definição nos dá a **integral de Itô,** em relação a um processo de Wiener $\{W_t\}_{t\geq 0},$ de um processo estocástico $\{H_t\}_{t\geq 0}$ com as propriedades de ser progressivamente mensurável em relação à filtração natural do processo de Wiener, ter quadrado integrável em $[0, T]\times \Omega$ e ser localmente uniformemente contínuo em média quadrática.

## Valor esperado da integral estocástica

Temos
$$
    \mathbb{E}\left[ S_M \right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right].
$$
Como $\{H_t\}_{t\geq 0}$ é não antecipativo, temos que cada $H_{t_{j-1}}$ é independente de $W_{t_j} - W_{t_{j-1}}.$ Logo,
$$
    \mathbb{E}\left[ S_M \right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[W_{t_j} - W_{t_{j-1}}\right] = 0,
$$
visto que cada passo $W_{t_j} - W_{t_{j-1}}$ tem valor esperado nulo. Portanto,
$$
    \mathbb{E}[S_M] = 0,
$$
para qualquer malha $M.$ No limite, como $S_M \rightarrow S$ em média quadrática, segue que
$$
    \mathbb{E}\left[\int_0^T H_t\;\mathrm{d}t\right] = \mathbb{E}[S] = \lim_{\|M\|\rightarrow 0}\mathbb{E}[S_M] = 0.
$$

## Isometria de Itô

Sabendo que $S_M$ converge para $R$ em média quadrádica, segue que 
$$
    \mathbb{E}[S_M^2] \rightarrow \mathbb{E}[S^2],
$$
quando a malha é refinada ao limite $\|M\| \rightarrow 0.$ Vamos calcular o limite de $\mathbb{E}[S_M^2]$ e ver que isso nos dá uma importante identidade conhecida como *isometria de Itô.*

Primeiramente, temos
$$
    \begin{align*}
        \mathbb{E}[S_M^2] & = \mathbb{E}\left[\left(\sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right)^2\right] \\
        & = \mathbb{E}\left[\sum_{i=1}^n \sum_{j=1}^n H_{t_{i-1}}(W_{t_i} - W_{t_{i-1}})H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right] \\
        & = \sum_{i=1}^n \sum_{j=1}^n \mathbb{E}\left[H_{t_{i-1}}(W_{t_i} - W_{t_{i-1}})H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right].
    \end{align*}
$$
De maneira análoga à feita acima para o cálculo de $\mathbb{E}[|S_{M_1} - S_{M_2}|^2],$ os termos com $i\neq j$ se anulam, restando
$$
    \begin{align*}
        \mathbb{E}[S_M^2] & = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}^2(W_{t_j} - W_{t_{j-1}})^2\right] \\
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
    \mathbb{E}[S^2] = \lim_{\|M\|\rightarrow 0} \mathbb{E}[S_M] = \int_0^T \mathbb{E}[H_t^2]\;\mathrm{d}t.
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

## Extensão para processos não-antecipativos de quadrado integrável

Para definir a integral de Itô de maneira mais geral, o caminho clássico é definir a integral para processos não-antecipativos do tipo escada e estender essa definição aproximando um processo não-antecipativo de quadrado integrável por processos não-antecipativos do tipo escada. Como já definimos a integral de Itô para processos não-antecipativos que são localmente uniformemente contínuos em média quadrática, podemos usar esse tipo de processos para fazer essa extensão. Ou seja, basta aproximarmos um processo não-antecipativo de quadrado integrável por processos não-antecipativos que sejam localmente uniformemente contínuos em média quadrática.

### Aproximação por processos contínuos

Dada uma função de quadrado integrável $f:\mathbb{R} \rightarrow \mathbb{R},$ uma maneira clássica de aproximá-la por funções contínuas é através da convolução $t \mapsto \int_\mathbb{R} f(s) \varphi_\varepsilon(t-s) \;\mathrm{d}t$ com aproximações da identidade $\varphi_\varepsilon.$ Essa convolução, no entanto, envolve, tipicamente, olhar para o "passado" e para o "futuro" da função. O mesmo acontece com processos estocásticos. No entanto, para a integral de Itô, queremos preservar a propriedade de não antecipação do processo. Para isso, usamos aproximações da identidade que considerem apenas o passado da função, por exemplo,
$$
\varphi_\varepsilon(t) = \begin{cases}
\displaystyle \frac{1}{\varepsilon} e^{-t/\varepsilon}, & t \geq 0, \\
0, & t < 0.
\end{cases}
$$

```julia:aprox_id_exp
#hideall
using Plots
theme(:ggplot2)
N = 3
tt = -4:0.01:4
xx = [
    m * ifelse.(tt .≥  0, exp.( -m * tt), 0) for m in 1:N
]
plot(tt, xx, title = "aproximações da identidade \$t \\rightarrow m e^{m t}\$", titlefont = 10, xaxis = "\$t\$", yaxis = "\$x\$", label=reshape("m = " .* string.(1:N), 1, :))
savefig(joinpath(@OUTPUT, "aprox_id_exp.svg"))
```
\fig{aprox_id_exp}

Mais especificamente, dado um processo $\{H_t\}_{t \geq 0}$ de quadrado integrável e progressivamente mensurável em relação a $\{W_t\}_{t \geq 0},$ estendemos $H_t = 0,$ para $t \leq 0$ e definimos
$$
H_t^m = \varphi_{1/m} \star H_t = \int_0^t m e^{-m(t - s)} H_s \;\mathrm{d}s.
$$
Como $H_t^m$ só envolve $H_s,$ para $0\leq s \leq t,$ então $H_t^m$ continua sendo não antecipativo. Além disso, para $t \geq 0$ e $\tau > 0,$
$$
\begin{align*}
H_{t+\tau}^m - H_t^m & = \int_0^{t+\tau} m e^{-m(t + \tau - s)} H_s \;\mathrm{d}s - \int_0^t m e^{-m(t - s)} H_s \;\mathrm{d}s \\
& = \int_t^{t+\tau} m e^{-m(t + \tau - s)} H_s \;\mathrm{d}s + \int_0^t m \left(e^{-m(t + \tau - s)} - e^{-m(t - s)}\right) H_s \;\mathrm{d}s
\end{align*}
$$

Usando que $e^{-m(t + \tau - s)} \leq 1$ e
$$
\left|e^{-m(t + \tau - s)} - e^{-m(t - s)}\right| = \int_{t - s}^{t + \tau - s} m e^{-m\eta}\;\mathrm{d}\eta \leq m \tau,
$$
obtemos
$$
\begin{align*}
\left|H_{t+\tau}^m - H_t^m \right| & \leq \int_t^{t+\tau} m |H_s| \;\mathrm{d}s - \int_0^t m^2 \tau |H_s| \;\mathrm{d}s \\
& = (m + m^2\tau)\int_0^{t+\tau} |H_s|\;\mathrm{d}s \\
& \leq (m + m^2\tau)\sqrt{\tau}\left(\int_0^{t+\tau} |H_s|^2\;\mathrm{d}s\right)^{1/2}.
\end{align*}
$$

Como $\{H_t\}_{t\geq 0}$ é de quadrado integrável em intervalos finitos, segue que, para quase todo caminho amostral,
$$
\int_0^t H_s(\omega)^2 \;\mathrm{d}s < \infty,
$$
de modo que
$$
H_{t + \tau}^m(\omega) \rightarrow H_t^m(\omega), \quad \tau \rightarrow 0,
$$
mostrando a continuidade quase certamente das aproximações $\{H_t^m\}_{t \geq 0}.$

Para a continuidade uniforme em média quadrática, podemos estimar diretamente
$$
\mathbb{E}[(H_{t+\tau}^m - H_t^m)^2] \leq (m + m^2\tau)^2\tau\left(\int_0^{t+\tau} |H_s|^2\;\mathrm{d}s\right) \rightarrow 0,
$$
quando $\tau \rightarrow 0,$ uniformemente em $0 \leq t \leq T,$ para $T>0$ qualquer.

### Convergência das aproximações contínuas

Um outro passo fundamental é mostrar que, de fato, $\{H_t^m\}_{t\geq 0}$ converge para $\{H_t\}_{t\geq 0},$ em média quadrática. Isso é feito da seguinte forma. Primeiro, escrevemos
$$
\begin{align*}
H_t - H_t^m & = H_t - \int_0^\infty m e^{-m s} H_{t - s}\;\mathrm{d}s \\
  & = H_t \int_0^\infty m e^{-m s} \;\mathrm{d}s - \int_0^\infty m e^{-m s} H_{t - s}\;\mathrm{d}s \\
  & = \int_0^\infty m e^{-m s} (H_t - H_{t - s})\;\mathrm{d}s.
\end{align*}
$$
Com isso, usando a desigualdade de Cauchy-Schwarz, quebrando o termo da exponencial em $e^{-m s} = e^{-m s/2}e^{-m s/2},$
$$
\begin{align*}
|H_t - H_t^m|^2 & = \left(\int_0^\infty m e^{-m s} (H_t - H_{t - s})\;\mathrm{d}s\right)^2 \\
  & \leq \left(\int_0^\infty m e^{-m s} (H_t - H_{t - s})^2\;\mathrm{d}s\right)\left(\int_0^\infty m e^{-m s} \;\mathrm{d}s\right) \\
  & = \int_0^\infty m e^{-m s} (H_t - H_{t - s})^2\;\mathrm{d}s.
\end{align*}
$$
Fazendo uma mudança de variáveis, obtemos
$$
|H_t - H_t^m|^2 \leq \int_0^\infty e^{-s} (H_t - H_{t - s/m})^2\;\mathrm{d}s.
$$
Assim,
$$
\begin{align*}
    \int_0^T \mathbb{E}\left[\left|H_t - H_t^m\right|^2\right] \;\mathrm{d}t \leq \int_0^T \int_0^\infty e^{-s} \mathbb{E}\left[(H_t - H_{t - s/m})^2\right]\;\mathrm{d}s\;\mathrm{d}t
\end{align*}
$$
Trocando a ordem de integração e usando a continuidade em média quadrática de processos com média quadrática finita, obtemos a convergência desejada.

### Extensão da definição de integral de Itô

Vimos acima como definir a integral de Itô, em relação a um processo de Wiener, de um processo não-antecipativo localmente uniformemente contínuo em média quadrática. Também vimos como aproximar um processo não-antecipativo com média quadrática finita por processos não-antecipativos que sejam localmente uniformemente contínuos em média quadrática. Usando, agora, a linearidade da integral de Itô e a isometria de Itô para estes tipos de processos, podemos estender essa definição para processos não-antecipativos com média quadrática finita.

Mais precisamente, seja $\{H_t\}_{t\geq 0}$ um processo não-antecipativo com média quadrática finita. Como visto acima, podemos aproximar um tal processo por processos $\{H_t^m\}_{t\geq 0}$ que sejam não-antecipativos e localmente uniformemente contínuos em média quadrática,
$$
\int_0^T \mathbb{E}[|H_t - H_t^m|^2] \;\mathrm{d}t \rightarrow 0, \quad m \rightarrow \infty.
$$
Também vimos como definir a integral de Itô de tais processos,
$$
\int_0^T H_t^m\;\mathrm{d}W_t.
$$
Agora, usando a isometria de Itô válida para tais processos, temos
$$
\mathbb{E}\left[ \left|\int_0^T H_t^{m_1}\;\mathrm{d}W_t - \int_0^T H_t^{m_2}\;\mathrm{d}W_t \right|^2\right] = \int_0^T \mathbb{E}\left[ |H_t^{m_1} - H_t^{m_2}|^2\right] \;\mathrm{d}t \rightarrow 0, \quad m_1, m_2 \rightarrow \infty.
$$
Logo, o limite das integrais de Itô dos processos aproximadas existe. Definimos a integral de Itô de $\{H_t\}_{t\geq 0}$ por esse limite,
$$
\int_0^T H_t\;\mathrm{d}W_t = \lim_{m\rightarrow \infty} \int_0^T H_t^m;\mathrm{d}W_t.
$$
Na construção acima, usamos a molificação com $\varphi_{1/m}$ para definir $\{H_t^m\}_{t\geq 0}$ mas isso pode ser feito com qualquer outra aproximação. Ou seja, usando, do mesmo jeito, a isometria de Itô, o limite independende da escolha das aproximações de $\{H_t\}_{t \geq 0}.$ Mais precisamente, se $\{G_t^m\}_{t \geq 0}$ é uma outra aproximação de $\{H_t\}_{t \geq 0}$, no sentido de média quadrática, por processos não-antecipativos e localmente uniformemente contínuos em média quadrática, então necessariamente
$$
    \int_0^T \mathbb{E}[|G_t^m - H_t^m|^2]\;\mathrm{d}t \rightarrow 0, \quad m\rightarrow \infty
$$
e
$$
\mathbb{E}\left[ \left|\int_0^T G_t^m\;\mathrm{d}W_t - \int_0^T H_t^m\;\mathrm{d}W_t \right|^2\right] = \int_0^T \mathbb{E}\left[ |G_t^m - H_t^m|^2\right] \;\mathrm{d}t \rightarrow 0, \quad m \rightarrow \infty,
$$
provando a independência do limite tem termos da sequência aproximante.

## Exercícios

1. Suponha $f=f(x)$ localmente Hölder/Lipschitz contínua em $\mathbb{R},$ satisfendo uma estimativa da forma
$$
    |f(y) - f(x)| \leq \left(c_0 + c_1\max\{|x|^p, |y|^p\}\right)|y - x|^\theta,
$$
para todo $x, y\in\mathbb{R},$ onde $c_0, c_1 \geq 0,$ $p\geq 1,$ e $0 < \theta \leq 1$ (na verdade basta que $p$ e $\theta$ sejam positivos). Considere o processo estocástico $\{H_t\}_{t\geq 0}$ definido por
$$
    H_t = f(W_t),
$$
onde $\{W_t\}_{t\geq 0}$ é um processo de Wiener. Usando a desigualdade maximal
$$
    \mathbb{E}[\max_{0\leq t \leq T} |W_t|^2] \leq 4\mathbb{E}[W_T^2],
$$
mostre que $\{H_t\}_{t \geq 0}$ é uniformemente contínuo em média quadrática.