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

De fato, vamos verificar, primeiro, o caso com condição inicial igual $1$,
$$
\left.X_t\right|_{t = 0} = 1.
$$
Nesse caso, vamos verificar que a solução tem a forma
$$
\hat X_t = e^{-\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s}.
$$
Usamos $\{\hat X_t\}_{t \geq 0}$ para representar a solução com a condição initial $\hat X_0 = 1$ e, assim, distinguir do caso mais geral.

Definindo
$$
Y_t = -\frac{1}{2}\int_0^t g_1(s)^2\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s,
$$
podemos escrever a solução como
$$
\hat X_t = e^{Y_t}.
$$
De outra forma, definindo a função $u(y) = e^y$, podemos escrever
$$
\hat X_t = u(Y_y).
$$

Veja que $Y_t$ é um processo de Itô, com
$$
\mathrm{d}Y_t = - \frac{1}{2}g_1(t)^2\;\mathrm{d}t + g_1(s)\;\mathrm{d}W_t.
$$
Assim, podemos aplicar a fórmula de Itô e obter
$$
\begin{align*}
\mathrm{d}\hat X_t & = u'(Y_t)\;\mathrm{d}Y_t + \frac{1}{2}u''(Y_t)g_1(t)^2\;\mathrm{d}t \\
& = e^{Y_t}\;\mathrm{d}Y_t + \frac{1}{2}e^{Y_t}g_1(t)^2\;\mathrm{d}t \\
& = \hat X_t\;\mathrm{d}Y_t + \frac{1}{2}g_1(t)^2\hat X_t\;\mathrm{d}t.
\end{align*}
$$
Cancelando o termo comum, chegamos a
$$
\mathrm{d}\hat X_t = g_1(t)\hat X_t\;\mathrm{d}W_t,
$$
mostrando que $\{\hat X_t\}_{t \geq 0}$ é, de fato, solução.

Agora, no caso da condição inicial ser uma variável aleatória,
$$
\left. X_t \right|_{t = 0} = X_0,
$$
escrevemos
$$
X_t = X_0 \hat X_t, \quad \hat X_t = u(Y_t).
$$
Como $\hat X_0 = 1$, segue que a condição inicial $X_t|_{t = 0} = X_0$ é satisfeita. Quanto à equação diferencial, temos
$$
\mathrm{d}X_t = X_0 \mathrm{d}\hat X_t = X_0 g_1(t)\hat X_t\;\mathrm{d}W_t = g_1(t) X_t\;\mathrm{d}W_t.
$$
Portanto, $\{X_t\}_{t \geq 0}$ é, de fato, a solução.

## Equação estocástica linear com drift determinístico e com ruído aditivo

Considere, agora,
$$
\mathrm{d}X_t = f_0(t) \;\mathrm{d}t + g_0(t) \;\mathrm{d}W_t.
$$
Novamente, a solução é puramente a "primitiva" do lado direito:
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
X_t = X_0 \hat X_t, \quad \hat X_t = e^{Y_t},
$$
com
$$
Y_t =  \int_0^t \left(f_1(s) -\frac{1}{2}g_1(s)^2\right)\;\mathrm{d}s + \int_0^t g_1(s)\;\mathrm{d}W_s.
$$

Como antes, $\{Y_t\}_{t \geq 0}$ é um processo de Itô, nesse caso satisfazendo
$$
\mathrm{d}Y_t = \left(f_1(t) - \frac{1}{2}g_1(t)^2\right)\;\mathrm{d}t + g_1(s)\;\mathrm{d}W_t.
$$

Novamente, usando a fórmula de Itô, chegamos ao resultado. Deixamos os detalhes par o leitor.

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

## Equação de Langevin

O modelo clássico (processo de Wiener) para o movimento Browniano de uma micro-partícula em um determinado meio é fundamentado na ação causada pelo bombardeamento aleatória das partículas do meio, mas não leva em consideração o momento da partícula. Uma alternativa a esse modelo é a **equação de Langevin**
$$
\mathbb{d}Y_t = - \nu Y_t\;\mathrm{d}t + \sigma \mathrm{d}W_t,
$$
onde $\{Y_t\}_{t \geq 0}$ é interpretado como sendo a velocidade da partícula e a equação é uma versão estocástica das equações de movimento de Newton. O primeiro termo do lado direito representa um termo viscoso, com uma resultante de forças proporcional à velocidade da partícula. O segundo termo do lado direito representa a ação aleatório causada pelo bombardeamento aleatório das partículas do meio. O termo viscoso representa um bombardeamento "médio" ordenado, condizente com a ideia de que a maior parte do bombardeamento ocorre à frente do objeto, conjugada com uma atração molecular das partículas que ficam para trás. Em cima desse bombardeamento médio, gerando a viscosidade, temos as flutuações desordenadas dos bombardeamentos.

A solução dessa equação é
$$
Y_t = e^{-\nu t}Y_0 + \sigma \int_0^t e^{-\nu(t - s)}\;\mathrm{d}W_t.
$$

De fato, escrevendo
$$
Y_t = e^{-\nu t}Y_0 + \sigma e^{-\nu t}\int_0^t e^{\nu s}\;\mathrm{d}W_t,
$$
vemos que
$$
\begin{align*}
\mathrm{d}Y_t & = -\nu e^{-\nu t}Y_0 \;\mathrm{d}t - \sigma \nu e^{-\nu t}\int_0^t e^{\nu s}\;\mathrm{d}W_t + \sigma \;\mathrm{d}W_t \\
& = -\nu Y_t + \sigma\;\mathrm{d}W_t.
\end{align*}
$$
