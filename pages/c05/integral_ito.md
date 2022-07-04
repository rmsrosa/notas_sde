@def title = "Integral de Itô"

# {{ get_title }}

Bom, já vimos como integrar processos em relação ao tempo (Seção {{link_section pages/c05/integral_riemann}}), em relação a processos de variação limitada (Seção {{link_section pages/c05/integral_riemannstieltjes}}) e como integrar certas classes de funções em relação a processos que não são de variação limitada (Seção {{link_section pages/c05/integral_dualidade}}). Também vimos como as somas parciais de Riemann-Stieltjes não convergem quando tentamos integrar o processo de Wiener em relação a si mesmo (Seção {{link_section pages/c05/riemann_wiener}}). Vamos agora ver como podemos especificar as somas parciais de forma a obter uma noção de integral que esteja bem definida nesse último caso.

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

Vamos chamar essa condição de *não-antecipativa* *("non-antecipating")* ou *adaptada* ao processo $\{W_t\}_t$. Uma definição mais formal envolve o conceito de *filtração*.

Lembramos que uma **filtração** é uma família $\{\mathcal{F}_t\}_{t\geq 0}$ de $\sigma$-álgebras com a propriedade de que $\mathcal{F}_s \subset \mathcal{F}_t$, para $0 \leq s \leq t$. Uma filtração é dita **não-antecipativa** ou **adaptada** em relação a um processo $\{W_t\}_{t\geq 0}$ quando $W_t$ é mensurável em relação a $\mathcal{F}_s$, para todo $s \geq t$, e $W_t$ é independente das $\sigma$-álgebras geradas por $\Delta W_{t, s} = W_s - W_t$, para $s \geq t$. Dizemos, então, que $\{H_t\}_{t\geq 0}$ é **não-antecipativa** ou **adaptada** ao processo $\{W_t\}_{t\geq 0}$ quando, para cada $t\geq 0$, $H_t$ é mensurável em relação a $\mathcal{F}_t$, onde $\{\mathcal{F}_t\}_{t\geq 0}$ é uma filtração adaptada a $\{W_t\}_{t\geq 0}$.

Sob a condição de $\{H_t\}_{t\geq 0}$ estar adaptada a $\{W_t\}_{t\geq 0}$ e dos caminhos amostrais de $\{H_t\}_{t\geq 0}$ serem quase certamente contínuos, a *integral de Itô* está bem definida e possui boas propriedades, como veremos posteriormente.

Essa construção pode ser estendida a processos $\{H_t\}_{t\geq 0}$ adaptados a $\{W_t\}_{t\geq 0}$ que sejam de quadrado integrável, i.e.
$$
\mathbb{E}\left[ \int_0^T  H_t^2 \;\mathrm{d}t \right]  < \infty,
$$
e que sejam **progressivamente mensuráveis**, ou seja, que $(t, \omega) \mapsto H_t(\omega)$ seja mensurável em relação à $\sigma$-álgebra produto $\mathcal{B}(0, t) \times \mathcal{F}_t$, onde $\mathcal{B}(0, t)$ é a $\sigma$-álgebra de Borel do intervalo $[0, t]$.

Vale observar que se $\{H_t\}_{t\geq 0}$ é adaptada a $\{W_t\}_{t\geq 0}$ e com caminhos amostrais quase certamente contínuous, então ele é progressivamente mensurável.

Essa construção pode ser estendida a integrais em relação a processos $\{Z_t\}_{t\geq 0}$ que sejam *martingales* (ou, mais geralmente ainda, semi-martingales). Sendo $\{H_t\}_{t \geq 0}$ progressivamente mensurável em relação a $\{Z_t\}_{t\geq 0}$ e de quadrado integrável em $(0, T)$, então a *integral de Itô*
$$
\int_0^T H_t \;\mathrm{d}Z_t
$$
está bem definida.

## Construção

No caso de $\{H_t\}_{t\geq 0}$ ser adptada a $\{W_t\}_{t \geq 0}$ e com caminhos amostrais quase certamente contínuos, então a integral é definida via limite de somas parciais
$$
\int_0^T H_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n H_{t_{j-1}}\; (W_{t_j} - W_{t_{j-1}}),
$$
onde as partições satisfazem $0 = t_0 < t_1 < \ldots < t_n = T$ e o limite é tomado quando $\max_j\{t_j - t_{j-1}\} \rightarrow 0$.

No caso mais geral, de processos $\{H_t\}_{t\geq 0}$ progressivamente mensuráveis e de quadrado integrável, a ideia é aproximar o processo por processos $\{H_t^m\}_{t \geq 0}$ adaptados e com caminhos quase-certamente contínuos e tomar o limite das integrais de Itô definidas para estes.

Usualmente, começa-se, na verdade, considerando processos escada, i.e. processos $\{H_t\}_{t\geq 0}$ para os quais existe uma partição $0 = t_0 < t_1 < \ldots < t_n = T$ tal que $H_t$ seja constante, $H_t = H_{t_{j-1}}$, em cada intervalo $t_{j-1} \leq t < t_j$. Para esses processo, define-se, naturalmente, a integral de Itô por
$$
\int_0^T H_t \;\mathrm{d}W_t = \sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}).
$$

Em seguida, para um processo $\{H_t\}_{t \geq 0}$ que seja progressivamente mensurável e em $L^2(0, T)$, aproximamos o processo por processos $\{H_t^m\}_{t \geq 0}$ do tipo escada e adaptados a $\{W_t\}_{t\geq 0}$. Por serem processos escada, em particular contínuos à direita, esses processos são progressivamente mensuráveis também. Para estes processos, a integral de Itô está bem definida através do somatório.

O passo seguinte é mostrar que as integrais de Itô dos processos escada convergem. Isso é obtido graças a duas propriedades fundamentais da integral de Itô em relação a $\{W_t\}_{t \geq 0}$, a saber que o valor esperado é nulo e que a *isometria de Itô* vale para processos escada (veremos isso em seguida):
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
converge em probabilidade e para um limite que independe da escolha da sequência de funções escada.

A integral de Itô é, então, definida como o limite das integrais de funções escada:
$$
\int_0^T H_t \;\mathrm{d}W_t = \lim \int_0^T H_t^m \;\mathrm{d}W_t.
$$

Nesse caso mais geral de $\{H_t\}_{t \geq 0}$ progressivamente mensurável e em $L^2(0, T)$, assumindo ainda que os caminhos amostrais sejam, quase certamente, contínuos, então $\{H_t^m\}_{t \geq 0}$ pode ser construído com $H_t^m = H_{t_{j-1}^m}$, para $t_{j-1}^m \leq t < t_j^m$, em relação à partição $\{t_j^m\}$ de cada $\{H_t^m\}_{t \geq 0}$. Assim, recuperamos a fórmula mais direta
$$
\int_0^T H_t \;\mathrm{d}W_t = \lim \sum_{j=1}^n H_{t_{j-1}}\; (W_{t_j} - W_{t_{j-1}}),
$$
por partições arbitrárias $0 = t_0 < t_1 < \ldots < t_n = T$, com $\max_j\{t_j - t_{j-1}\} \rightarrow 0$. Mas caso os caminhos amostrais não sejam, quase certamente, contínuos, essa fórmula explícita pode não valer.

## Propriedades da integral de Itô de funções escada

Vamos ver aqui as duas propriedades fundamentais que utilizamos acima. Suponha que $\{H_t\}_{t\geq 0}$ seja um função escada adaptada a $\{W_t\}_{t \geq 0}$ e com o processo sendo constante nos intevalos de uma malha $0 = t_0 < t_1 < \ldots < t_n = T$.

Calculemos, primeiramente, a esperança da integral de Itô:
$$
\mathbb{E}\left[ \int_0^T H_t \;\mathrm{d}W_t \right] = \mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\Delta W_j\right]
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo, temos $H_{t_{j-1}}$ independente de $\Delta_j = W_{t_j} - W_{t_{j-1}}$, de modo que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[\Delta W_j\right].
$$
Como o processo de Wiener tem valor esperado nulo, segue que $\mathbb{E}\left[\Delta W_j\right] = 0$, de maneira que
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

## Aproximação por processos contínuos

Dada uma função de quadrado integrável $f:\mathbb{R} \rightarrow \mathbb{R}$, uma maneira clássica de aproximá-la por funções contínuas é através da convolução $t \mapsto \int_\mathbb{R} f(s) \varphi_\varepsilon(t-s) \;\mathrm{d}t$ com aproximações da identidade $\varphi_\varepsilon$. Essa convolução, no entanto, envolve, tipicamente, olhar para o "passado" e para o "futuro" da função. O mesmo acontece com processos. No entanto, para a integral de Itô, queremos preservar a propriedade de não-antecipação do processo. Para isso, usamos aproximações da identidade que considerem apenas o passado da função, por exemplo,
$$
\varphi_\varepsilon(t) = \begin{cases}
\displaystyle \frac{1}{\varepsilon} e^{-t/\varepsilon}, & t \leq 0, \\
0, & t > 0.
\end{cases}
$$

```julia:aprox_id_exp
#hideall
using Plots
theme(:ggplot2)
N = 3
tt = -4:0.01:4
xx = [
    m * ifelse.(tt .≤ 0, exp.( m * tt), 0) for m in 1:N
]
plot(tt, xx, title = "aproximações da identidade \$t \\rightarrow m e^{m t}\$", titlefont = 10, xaxis = "\$t\$", yaxis = "\$x\$", label=reshape("m = " .* string.(1:N), 1, :))
savefig(joinpath(@OUTPUT, "aprox_id_exp.svg"))
```
\fig{aprox_id_exp}

Mais especificamente, dado um processo $\{H_t\}_{t \geq 0}$ de quadrado integrável e progressivamente mensurável em relação a $\{W_t\}_{t \geq 0}$, definimos
$$
H_t^m = \int_0^t m e^{m(s - t)} H_s \;\mathrm{d}s.
$$
Como $H_t^m$ só envolve $H_s$, para $0\leq s \leq t$, então $H_t^m$ continua sendo não-antecipativo. Além disso, para $t \geq 0$ e $\tau > 0$,
$$
\begin{align*}
H_{t+\tau}^m - H_t^m & = \int_0^{t+\tau} m e^{m(s - t - \tau)} H_s \;\mathrm{d}s - \int_0^t m e^{m(s - t)} H_s \;\mathrm{d}s \\
& = \int_t^{t+\tau} m e^{m(s - t - \tau)} H_s \;\mathrm{d}s - \int_0^t m \left(e^{m(s - t)} - e^{m(s - t - \tau)}\right) H_s \;\mathrm{d}s
\end{align*}
$$

Usando que $e^{m(s - t - \tau)} \leq 1$ e
$$
e^{m(s - t)} - e^{m(s - t - \tau)} = \int_{s-t-\tau}^{s - t} m e^{m\eta}\;\mathrm{d}\eta \leq m \tau
$$
obtemos
$$
\begin{align*}
\left|H_{t+\tau}^m - H_t^m \right| & \leq \int_t^{t+\tau} m H_s \;\mathrm{d}s - \int_0^t m^2 \tau H_s \;\mathrm{d}s \\
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
H_{t + \tau}(\omega) \rightarrow H_t(\omega), \quad \tau \rightarrow 0,
$$
mostrando a continuidade quase certamente das aproximações $\{H_t^m\}_{t \geq 0}$.

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
