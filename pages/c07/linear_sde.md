@def title = "Equações lineares"

# {{ get_title }}

Sabemos que a equação diferencial ordinária linear homogênea
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = f(t)x
$$
tem as suas soluções da forma
$$
x(t) = x(0)e^{\int_0^t f(s)\;\mathrm{d}s}.
$$

Vejamos, agora, versões estocástico lineares, semelhantes a essa equação.

De maneira geral, vamos ver modelos da forma
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t, \qquad t \geq 0,
$$
com $f$ e $g$ lineares, ou seja,
$$
f(t, x) = f_0(t) + f_1(t)x, \quad g(t, x) = g_0(t) + g_1(t)x.
$$

Junto a isso, consideramos uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

## Equação estocástica linear sem drift e com ruído aditivo

Comecemos com a equação sem drift e com ruído "aditivo",
$$
\mathrm{d}X_t = g_0(t) \mathrm{d}W_t.
$$
Como $\{X_t\}_{t\geq 0}$ não aparece do lado direito, a solução é simplesmente a integral de $g$:
$$
X_t = X_0 + \int_0^t g_0(s) \;\mathrm{d}W_s.
$$

## Equação estocástica linear sem drift e com ruído multiplicativo

Mais interessante é o caso de ruído multiplicativo linear:
$$
\mathrm{d}X_t = g_1(t) X_t \;\mathrm{d}W_t.
$$

Nesse caso, a solução é dada por
$$
X_t = X_0 e^{-\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s}.
$$

De fato, é imediato ver que a condição inicial é satisfeita.

Agora, definindo
$$
Y_t = -\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s,
$$
e
$$
E_t = e^{Y_t},
$$
podemos escrever
$$
X_t = X_0 E_t.
$$

Veja que $Y_t$ é um processo de Itô, com
$$
\mathrm{d}Y_t = - \frac{1}{2}g_1(t)^2\;\mathrm{d}t + g_1(s)\;\mathrm{d}W_t.
$$
Assim, podemos aplicar a fórmula de Itô, com $u(y) = e^y$, e obter
$$
\begin{align*}
\mathrm{d}E_t & = u'(Y_t)\;\mathrm{d}Y_t + \frac{1}{2}u''(Y_t)g_1(t)^2\;\mathrm{d}t \\
& = e^{Y_t}\;\mathrm{d}Y_t + \frac{1}{2}e^{Y_t}g_1(t)^2\;\mathrm{d}t \\
& = E_t\;\mathrm{d}Y_t + \frac{1}{2}g_1(t)^2E_t\;\mathrm{d}t \\
& = g_1(t)E_t\;\mathrm{d}W_t.
\end{align*}
$$

Isso implica em
$$
\mathrm{d}X_t = X_0 \;\mathrm{d}E_t = g_1(t)X_0 E_t\;\mathrm{d}W_t = g_1(t)X_t \;\mathrm{d}W_t,
$$
mostrando que $\{X_t\}_{t \geq 0}$ é, de fato, solução.

## Equação estocástica linear com drift determinístico e com ruído aditivo

Considere, agora,
$$
\mathrm{d}X_t = f_0(t) \;\mathrm{d}t + g_0(t) \;\mathrm{d}W_t.
$$
Novamente, a solução é puramente a "primitiva"
$$
X_t = X_0 + \int_0^t f_0(s)\;\mathrm{d}s + \int_0^t g_0(s) \;\mathrm{d}W_s.
$$

## Equação estocástica linear com drift e com ruído multiplicativo

Mais interessante, é a equação
$$
\mathrm{d}X_t = f_1(t)X_t \;\mathrm{d}t + g_1(t) X_t\;\mathrm{d}W_t.
$$

Nesse caso, a solução tem a forma
$$
X_t = X_0 e^{\int_0^t \left(f_1(s) - \frac{1}{2} g_1(s)^2\right)\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s}.
$$

Novamente, escrevemos
$$
X_t = X_0 E_t, \quad E_t = e^{Y_t},
$$
com
$$
Y_t =  \int_0^t \left(f_1(s) -\frac{1}{2}g_1(s)^2\right)\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s.
$$

Como antes, $\{Y_t\}_{t \geq 0}$ é um processo de Itô, no caso com
$$
\mathrm{d}Y_t = \left(f_1(t) - \frac{1}{2}g_1(t)^2\right)\;\mathrm{d}t + g_1(s)\;\mathrm{d}W_t.
$$

Usando a fórmula de Itô, chega-se ao resultado.

## Preço de ações (stock prices)

Um modelo clássico para o preço $P_t$ de uma ação é que a mudança relativa (ou específica) de preço $\mathrm{d}P_t / P_t$ satisfaça
$$
\frac{\mathrm{d}P_t}{P_t} = \mu\;\mathrm{d}t + \sigma\;\mathrm{d}W_t,
$$
onde $\mu > 0$ é o *drift* (tendência?) e $\sigma$, a *volatilidade* da ação. Desse modo,
$$
\mathrm{d}P_t = \mu P_t \;\mathrm{d}t + \sigma P_t\;\mathrm{d}W_t,
$$
com condição inicial sendo o preço atual da ação:
$$
\left.P_t\right|_{t = 0} = p_0.
$$

Nesse caso, a solução é
$$
P_t = p_0 e^{\left(\mu - \frac{1}{2} \sigma^2\right)t + \sigma W_t}.
$$

Observe, ainda, que, da expressão integral
$$
P_t = p_0 + \mu \int_0^t P_s \;\mathrm{d}s + \sigma \int_0^t P_s\;\mathrm{d}W_s,
$$
temos
$$
\mathbb{E}\left[P_t\right] = p_0 + \int_0^t \mathbb{E}[P_s]\;\mathrm{d}s,
$$
ou seja,
$$
\mathbb{E}\left[P_t\right] = p_0e^{\mu t},
$$
que é a solução da equação diferencial ordinária obtida sem o ruído ($\sigma = 0$).