@def title = "Propriedades da integral de Itô"

# {{ get_title }}

Vamos ver, aqui, algumas propriedades importantes da integral de Itô. No que se segue, vamos considerar a integral de Itô em relação a um processo de Wiener $\{W_t\}_{t \geq 0}$, de um processo $\{H_t\}_{t \geq 0}$ adaptado ao processo de Wiener e com caminhos amostrais quase certamente contínuos.

Para simplificar a notação, dada uma partição $t_0 < t_1 < \ldots < t_n$, escrevemos
$$
\Delta W_j = W_{t_j} - W_{t_{j-1}}, \qquad j = 1, \ldots, n.
$$

## Valor esperado das integrais de Itô

Como vimos antes, temos, para as somas de Riemann,
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\Delta W_j\right]
$$
Pela hipótese de $\{H_t\}_t$ ser não antecipativo, temos $H_{t_{j-1}}$ independente de $\Delta_j = W_{t_j} - W_{t_{j-1}}$, de modo que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = \sum_{j=1}^n \mathbb{E}\left[H_{t_{j-1}}\right]\mathbb{E}\left[\Delta W_j\right].
$$
Como um processo de Wiener tem valor esperado nulo, segue que $\mathbb{E}\left[\Delta W_j\right] = 0$, de maneira que
$$
\mathbb{E}\left[\sum_{j=1}^n H_{t_{j-1}}\Delta W_j\right] = 0.
$$

No limite, obtemos que a integral de Itô de um processo não antecipativo tem valor esperado nulo:
$$
\mathbb{E}\left[\int_0^T H_t \;\mathrm{d}W_t\right] = 0.
$$

## Linearidade

Primeiramente, observe que a integral de Itô é homogênea. Ou seja, sendo $\lambda$ constante, vale a relação, 
$$
\int_0^T \lambda H_t \;\mathrm{d}W_t = \lambda \int_0^T H_t \;\mathrm{d}W_t.
$$

Isso segue direto da homogeneidade das somas parciais:
$$
\begin{align*}
\int_0^T \lambda H_t \;\mathrm{d}W_t & = \lim \sum_{j=1}^n \lambda H_{t_{j-1}}\Delta W_j \\
& = \lim  \sum_{j=1}^n H_{t_{j-1}}\Delta W_j \\
& = \lambda \lim  \sum_{j=1}^n H_{t_{j-1}}\Delta W_j \\
& = \lambda \int_0^T H_t \;\mathrm{d}W_t.
\end{align*}
$$

Da mesma forma, se $\{G_t\}_{t\geq 0}$ e $\{H_t\}_{t\geq 0}$ são dois processos não antecipativos e $\mu$ e $\lambda$ são constantes, então
$$
\int_0^T \left(\mu G_t + \lambda H_t\right)\;\mathrm{d}W_t = \mu \int_0^T G_t \;\mathrm{d}W_t + \lambda \int_0^T H^2 \;\mathrm{d}W_t.
$$

## Isometria de Itô

Calculemos, agora, o momento de ordem dois das somas de Riemann associadas à integral de Itô. Como visto antes,
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

## Isometria com dois processos

Estendendo a propriedade de isometria para dois processos não antecipativos $\{G_t\}_{t\geq 0}$ e $\{H_t\}_{t\geq 0}$, usando que $ab = \frac{1}{2}((a + b)^2 - a^2 - b^2)$ e aplicando a isometria a cada termo, obtemos
$$
\mathbb{E}\left[ \left( \int_0^T G_t \;\mathrm{d}W_t\right)\left( \int_0^T H_t \;\mathrm{d}W_t\right)\right] = \mathbb{E}\left[ \int_0^T G_t H_t \;\mathrm{d}t\right].
$$

## Propriedade de Martingale

Considerando o processo $\{S_t\}_{t\geq 0}$ definido por
$$
S_t = \int_0^t H_s \;\mathrm{d}W_s,
$$
segue que $\{S_t\}_{t\geq 0}$ é um Martingale.

De fato, sejam $t \geq 0$, $\tau > 0$, $\{\mathcal{F}_t\}_{t\geq 0}$ a filtração natural de um processo de Wiener $\{W_t\}_{t \geq 0}$ e $\{H_t\}_{t\geq 0}$ um processo adaptado a essa filtração. Então,
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

## Não positividade

Uma propriedade clássica das integrais de Riemann e de Lebesgue que tanto a integral de Riemann-Stieltjes quanto a integral de Itô não têm é a de positividade. Na integral de Riemann, se $H_t \geq 0$ para todo $t$, então
$$
\int_0^T H_t \;\mathrm{d}t \geq 0.
$$

Porém, não é verdade que
$$
\int_0^T H_t \;\mathrm{d}W_t
$$
seja maior do que zero. De fato, se $H_t = 1$, por exemplo, então
$$
\int_0^T \;\mathrm{d}W_t = W_T \sim \mathcal{N}(0, T).
$$

Consequentemente, a integral de Itô não preserva ordem, i.e. se $G_t \leq H_t$, para todo $t$, não é verdade que
$$
\int_0^T G_t \;\mathrm{d}W_t
$$
seja menor ou igual a
$$
\int_0^T H_t \;\mathrm{d}W_t.
$$

Isso também acontece na integral de Riemann-Stieltjes. Por exemplo, se $g(t) = sin(t)$, que é de variação limitada, e $f(t) = 1$, então
$$
\int_0^T f(t) \;\mathrm{d}g(t) = g(t) - g(0) = sin(t),
$$
que não é positiva.

Para que a positividade valha na integral de Riemann-Stieltjes, é necessário impor condições extras, como $g$ ser não decrescente ou então $g$ ser positiva e $f$ ser estritamente uniformemente positiva.
