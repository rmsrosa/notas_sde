@def title = "Integral de Itô"

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

Vamos chamar essa condição de *não antecipativa* *("non-antecipating")* ou *adaptada* ao processo $\{W_t\}_t$. Uma definição mais formal envolve o conceito de *filtração*.

Lembramos que uma **filtração** é uma família $\{\mathcal{F}_t\}_{t\geq 0}$ de sub $\sigma$-álgebras com a propriedade de que $\mathcal{F}_s \subset \mathcal{F}_t$, para $0 \leq s \leq t$. Uma filtração é dita **não antecipativa** ou **adaptada** em relação a um processo $\{W_t\}_{t\geq 0}$ quando $W_t$ é mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$. Dizemos, então, que $\{H_t\}_{t\geq 0}$ é **não antecipativa** ou **adaptada** ao processo $\{W_t\}_{t\geq 0}$ quando, para cada $t\geq 0$, $H_t$ é mensurável em relação a $\mathcal{F}_t$, onde $\{\mathcal{F}_t\}_{t\geq 0}$ é a filtração natural de $\{W_t\}_{t\geq 0}$.

Sob a condição de $\{H_t\}_{t\geq 0}$ estar adaptada a $\{W_t\}_{t\geq 0}$ e dos caminhos amostrais de $\{H_t\}_{t\geq 0}$ serem quase certamente contínuos, a *integral de Itô* pode ser bem definida e possui boas propriedades, como veremos posteriormente.

Essa construção pode ser estendida a processos $\{H_t\}_{t\geq 0}$ adaptados a $\{W_t\}_{t\geq 0}$ que sejam *progressivamente mensuráveis* e de *quadrado integrável.* Mais precisamente, $\{H_t\}_{t\geq 0}$ é dito **progressivamente mensurável** em relação uma filtração $\mathcal{F}_t$ quando, para cada $t' \geq 0$, a função $(t, \omega) \mapsto H_t(\omega)$ definida em $[0, t'] \times \Omega$ é mensurável em relação à $\sigma$-álgebra produto $\mathcal{B}(0, t') \times \mathcal{F}_{t'}$, onde $\mathcal{B}(0, t')$ é a $\sigma$-álgebra de Borel do intervalo $[0, t'].$ Um tal processo progressivamente mensurável é dito de quadrado integrável quando
$$
\int_0^T  \mathbb{E}\left[H_t^2\right] \;\mathrm{d}t  < \infty.
$$
Observe que, pelo Teorema de Fubini, essa condição garante que
$$
\int_{[0, T]\times \Omega} H_t(\omega)^2 \;\mathrm{d}(\lambda \times \mathbb{P})(t, \omega) = \int_0^T \mathbb{E}\left[H_t^2\right] \;\mathrm{d}t = \mathbb{E}\left[\int_0^T H_t(\omega)^2 \;\mathrm{d}t\right] < \infty,
$$
onde $\lambda \times \mathbb{P}$ denota a medida produto entre a medida de Lebesgue $\lambda$ e a medida de probabilidade $\mathbb{P}$ em $\Omega.$

Vale observar que se $\{H_t\}_{t\geq 0}$ é adaptada a $\{W_t\}_{t\geq 0}$ e com caminhos amostrais quase certamente contínuous, então ele é progressivamente mensurável.

Essa construção pode ser estendida a integrais em relação a processos $\{Z_t\}_{t\geq 0}$ que sejam *martingales* (ou, mais geralmente ainda, semi-martingales), i.e. sendo $\{H_t\}_{t \geq 0}$ progressivamente mensurável em relação a $\{Z_t\}_{t\geq 0}$ e de quadrado integrável em $(0, T)$, então a *integral de Itô*
$$
\int_0^T H_t \;\mathrm{d}Z_t
$$
está bem definida no sentido de média quadrática, como veremos agora no caso da integral de Itô com relação a $\{W_t\}_t.$

## Construção

No caso de $\{H_t\}_{t\geq 0}$ ser progressivamente mensurável e de quadrado integrável, a ideia é aproximar o processo por processos $\{H_t^m\}_{t \geq 0}$ adaptados e do tipo escada. Essa aproximação passa antes por aproximá-lo por processos com caminhos contínuous. Mas vamos tratar primeiro de processos do tipo escada.

### Processo escada e integral de Itô

Um processo $\{H_t\}_{t\geq 0}$ é do tipo escada quando é "constante por partes", i.e. quando existe uma partição $0 = t_0 < t_1 < \ldots < t_n = T$ tal que $H_t$ seja constante, $H_t = H_{t_{j-1}}$, em cada intervalo $t_{j-1} \leq t < t_j$. Para esses processo, define-se, naturalmente, a integral de Itô por
$$
\int_0^T H_t \;\mathrm{d}W_t = \sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}).
$$

### Integral de Itô via aproximação por processo escada

Para um processo $\{H_t\}_{t \geq 0}$ que seja progressivamente mensurável e em $L^2((0, T)\times \Omega)$, aproximamos o processo por processos $\{H_t^m\}_{t \geq 0}$ do tipo escada e adaptados a $\{W_t\}_{t\geq 0}$. Por serem processos escada, em particular contínuos à direita, esses processos são progressivamente mensuráveis também. Para estes processos, a integral de Itô está bem definida através do somatório.

O passo seguinte é mostrar que as integrais de Itô dos processos escada convergem em média quadrática. Isso é obtido graças a duas propriedades fundamentais da integral de Itô em relação a $\{W_t\}_{t \geq 0}$, a saber que o valor esperado é nulo e que a *isometria de Itô* vale para processos escada (veremos isso em seguida):
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

Com a hipótese de que $\{H_t^m\}_{t \geq 0}$ converge em média quadrática para $\{H_t\}_{t \geq 0}$, o lado direito da expressão acima converge para zero:
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

Vamos ver aqui as duas propriedades fundamentais que utilizamos acima. Suponha que $\{H_t\}_{t\geq 0}$ seja um função escada adaptada a $\{W_t\}_{t \geq 0}$ e com o processo sendo constante nos intervalos de uma malha $0 = t_0 < t_1 < \ldots < t_n = T$.

Calculemos, primeiramente, a esperança da integral de Itô:
$$
\mathbb{E}\left[ \int_0^T H_t \;\mathrm{d}W_t \right] = \mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\Delta W_j\right]
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo, temos $H_{t_{j-1}}$ independente de $\Delta_j = W_{t_j} - W_{t_{j-1}}$, de modo que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[\Delta W_j\right].
$$
Como um processo de Wiener tem valor esperado nulo, segue que $\mathbb{E}\left[\Delta W_j\right] = 0$, de maneira que
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

Lembrando que $\{H_t\}_{t \geq 0}$ é um processo escada, o somatório à direita é uma integral e obtemos a seguinte identidade para funções escada, conhecida como **isometria de Itô:**
$$
\mathbb{E}\left[ \left( \int_0^T H_t \;\mathrm{d}W_t\right)^2\right] = \mathbb{E}\left[ \int_0^T H_t^2 \;\mathrm{d}t\right].
$$

### Aproximação por processos contínuos

Dada uma função de quadrado integrável $f:\mathbb{R} \rightarrow \mathbb{R}$, uma maneira clássica de aproximá-la por funções contínuas é através da convolução $t \mapsto \int_\mathbb{R} f(s) \varphi_\varepsilon(t-s) \;\mathrm{d}t$ com aproximações da identidade $\varphi_\varepsilon$. Essa convolução, no entanto, envolve, tipicamente, olhar para o "passado" e para o "futuro" da função. O mesmo acontece com processos. No entanto, para a integral de Itô, queremos preservar a propriedade de não antecipação do processo. Para isso, usamos aproximações da identidade que considerem apenas o passado da função, por exemplo,
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

Mais especificamente, dado um processo $\{H_t\}_{t \geq 0}$ de quadrado integrável e progressivamente mensurável em relação a $\{W_t\}_{t \geq 0}$, estendemos $H_t = 0,$ para $t \leq 0$ e definimos
$$
H_t^m = \varphi_{1/m} \star H_t = \int_0^t m e^{-m(t - s)} H_s \;\mathrm{d}s.
$$
Como $H_t^m$ só envolve $H_s$, para $0\leq s \leq t$, então $H_t^m$ continua sendo não antecipativo. Além disso, para $t \geq 0$ e $\tau > 0$,
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
& \leq m \sqrt{\tau} \int_t^{t+\tau} H_s^2 \;\mathrm{d}s + m^2 \tau \sqrt{t}\int_0^t H_s^2 \;\mathrm{d}s \\
& \leq m \sqrt{\tau}\left(1 + m\sqrt{\tau t}\right)\int_0^t H_s^2 \;\mathrm{d}s.
\end{align*}
$$

Para $0 \leq \tau < t$, obtemos, analogamente, a mesma estimativa.

Como $\{H_t\}_{t\geq 0}$ é de quadrado integrável em intervalos finitos, segue que, para quase todo caminho amostral,
$$
\int_0^t H_s(\omega)^2 \;\mathrm{d}s < \infty,
$$
de modo que
$$
H_{t + \tau}^m(\omega) \rightarrow H_t^m(\omega), \quad \tau \rightarrow 0,
$$
mostrando a continuidade quase certamente das aproximações $\{H_t^m\}_{t \geq 0}$.

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
Para quase todo $\omega\in\Omega$, como $t\mapsto H_t(\omega)$ é um caminho contínuo, portanto uniformemente contínuo em $[0, T],$ temos
$$
    H_t^n(\omega) \rightarrow H_t(\omega)
$$
uniformemente em $t \in [0, T].$ Pelo Teorema da Convergência Dominada de Lebesgue,
$$
    H_t^n \rightarrow H_t
$$
em $L^2((0, T)\times \Omega),$ ou seja, $\{H_t^n\}_{0 \leq t \leq T}$ é uma aproximação, em média quadrática, por processos do tipo escada, do processo $\{H_t\}_{0 \leq t \leq T}.$ 

### Aproximação no caso de processos com caminhos contínuos

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
Nesse caso, $H_{t_{j-1}^n}^n = H_{t_{j-1}^n}$, ou seja, nos pontos da malha, os valores do processo aproximado são os valores do próprio processo. Assim, vale a convergência
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
