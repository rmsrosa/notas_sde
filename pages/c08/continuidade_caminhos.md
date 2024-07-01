@def title = "Limitação e continuidade das soluções"

# {{ get_title }}

Acabamos de ver condições que garantem a existência e a unicade de solução de uma equação diferencial estocástica
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Essa equação diferencial é interpretada como a equação integral
$$
X_t = X_0 + \int_0^t f(s, X_s)\;\mathrm{d}s + \int_0^t g(s, X_s)\;\mathrm{d}W_s.
$$

Sob as mesmas condições (continuidade em $t$ e $x$ e continuidade Lipschitz global em $x,$ uniformemente em $t$), vamos mostrar que cada caminho amostral é limitado em intervalos finitos $[0, T]$ e contínuo no tempo.

## Limitação dos caminhos

Primeiramente, lembremos das estimativas
$$
|f(t, x)| \leq C_f + L_f|x|,
$$
onde $C_f = \max_{t\in [0, T]}|f(t, 0)|,$ e
$$
|g(t, x)| \leq C_g + L_g|x|,
$$
onde $C_g = \max_{t\in [0, T]}|g(t, 0)|.$

Com isso,
$$
\mathbb{E}\left[X_t^2\right] \leq 3\mathbb{E}\left[X_0^2\right] + 3\mathbb{E}\left[ \left(\int_0^t f(s, X_s)\;\mathrm{d}s\right)^2\right] + 3\mathbb{E}\left[ \left(\int_0^t g(s, X_s)\;\mathrm{d}W_s\right)^2 \right].
$$
Usando a desigualdade de Cauchy-Schwartz na segunda integral e a isometria de Itô na terceira, obtemos
$$
\mathbb{E}\left[X_t^2\right] \leq 3\mathbb{E}\left[X_0^2\right] + 3t \int_0^t \mathbb{E}\left[f(s, X_s)^2 \right]\;\mathrm{d}s + 3\int_0^t \mathbb{E}\left[ g(s, X_s)^2 \right]\;\mathrm{d}s.
$$
Usando as estimativas acima, temos
$$
\mathbb{E}\left[X_t^2\right] \leq 3\mathbb{E}\left[X_0^2\right] + 3t \int_0^t \mathbb{E}\left[2C_f^2 + 2L_f^2 X_s^2 \right]\;\mathrm{d}s + 3\int_0^t \mathbb{E}\left[ 2C_g^2 + 2L_g^2 X_s^2 \right]\;\mathrm{d}s.
$$
Isso nos dá
$$
\mathbb{E}\left[X_t^2\right] \leq 3\mathbb{E}\left[X_0^2\right] + 6(tC_f^2 + C_g^2) + 6(tL_f^2 + L_g^2) \int_0^t \mathbb{E}\left[X_s^2 \right]\;\mathrm{d}s.
$$
Pela desigualdade de Gronwall, obtemos, finalmente, a limitação da média quadrática da solução:
$$
\mathbb{E}\left[X_t^2\right] \leq \left(3\mathbb{E}\left[X_0^2\right] + 6(tC_f^2 + C_g^2) \right)e^{3(t^2L_f^2 + 2tL_g^2)},
$$
para $0\leq t \leq T.$

## Continuidade temporal em média quadrática

De maneira semelhante, como, para $0\leq t \leq t + \tau \leq T,$
$$
X_{t+\tau} - X_t = \int_t^{t+\tau} f(s, X_s)\;\mathrm{d}s + \int_t^{t+\tau} g(s, X_s)\;\mathrm{d}W_s,
$$
temos
$$
\mathbb{E}\left[ |X_{t+\tau} - X_t|^2\right] \leq 2\tau\int_t^{t+\tau}\mathbb{E}\left[f(s, X_s)^2\right]\;\mathrm{d}s + 2\int_t^{t+\tau}\mathbb{E}\left[g(s, X_s)^2\right]\;\mathrm{d}s,
$$
o que nos dá
$$
\mathbb{E}\left[ |X_{t+\tau} - X_t|^2\right] \leq 2\tau\int_t^{t+\tau}\mathbb{E}\left[2C_f^2 + 2L_f^2 X_s^2\right]\;\mathrm{d}s + 2\int_t^{t+\tau}\mathbb{E}\left[2C_g^2 + 2L_g^2 X_s^2\right]\;\mathrm{d}s.
$$
Portanto, sabendo que a média quadrática é limitada, podemos escrever,
$$
\mathbb{E}\left[ |X_{t+\tau} - X_t|^2\right] \leq 4\tau^2\left(C_f^2 + 2L_f^2 \max_{t\leq s \leq t+\tau}\mathbb{E}\left[X_s^2\right]\right) + 4\tau\left(C_g^2 + 2L_g^2 \max_{t\leq s \leq t+\tau}\mathbb{E}\left[X_s^2\right]\right).
$$
Com isso, vemos que $\mathbb{E}\left[ |X_{t+\tau} - X_t|^2\right]$ é Lipschitz contínuo. Mas observe que essa é a média quadrática. Considerando a norma forte, temos
$$
\mathbb{E}\left[ |X_{t+\tau} - X_t|\right] \leq \mathbb{E}\left[ |X_{t+\tau} - X_t|^2\right]^{1/2} \leq C_T\tau^{1/2},
$$
para $0\leq t \leq t + \tau \leq T,$ para uma constante $C_T > 0$ apropriada.

## Continuidade temporal dos caminhos
