@def title = "Continuidade dos caminhos amostrais"

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

Sob as mesmas condições (continuidade em $t$ e $x$ e continuidade Lipschitz global em $x$, uniformemente em $t$), vamos mostrar que cada caminho amostral é limitado em intervalos finitos $[0, T]$ e contínuo no tempo.

## Limitação dos caminhos

Primeiramente, lembremos das estimativas
$$
|f(t, x)| \leq C_f + L_f|x|,
$$
onde $C_f = \max_{t\in [0, T]}|f(t, 0)|$, e
$$
|g(t, x)| \leq C_g + L_g|x|,
$$
onde $C_g = \max_{t\in [0, T]}|g(t, 0)|$.

Com isso,

## Continuidade temporal dos caminhos

Agora, escrevemos
$$
X_{t + \Delta t} - X_t = \int_t^{t+\Delta t} f(s, X_s)\;\mathrm{d}s + \int_t^{t+\Delta t} g(s, X_s)\;\mathrm{d}W_s.
$$
Usando a isometria de Itô,
$$
\mathbb{E}\left[\left|X_{t + \Delta t} - X_t\right|\right] \leq \int_t^{t+\Delta t} |f(s, X_s)|\;\mathrm{d}s + \left(\int_t^{t+\Delta t} g(s, X_s)^2\;\mathrm{d}s\right)^{1/2}.
$$
