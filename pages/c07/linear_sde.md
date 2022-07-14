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

Vejamos, agora, versões estocásticas lineares, semelhantes a essa equação.

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
\left.\hat X_t\right|_{t = 0} = 1.
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
Novamente, a solução é simplesmente a "primitiva" do lado direito:
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
Podemos chegar nessa fórmula via fator de integração, de maneira análoga a como é feito no caso determinístico. Faremos isso em dois exemplos específicos, abaixo. Aqui, vamos apenas verificar que tal processo é, de fato, a solução. Novamente, escrevemos
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

Como antes, usando a fórmula de Itô, chegamos ao resultado. Deixamos os detalhes para o leitor.

## Movimento Browniano geométrico e a preço de ações (stock prices)

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
Isso segue da fórmula geral acima, com $f_0 = 0$, $f_1 = \mu$, $g_0 = 0$ e $g_1 = \sigma$. Podemos, também, chegar nessa solução através de um fator de integração, visto que a equação é linear. Escrevemos
$$
\mathrm{d}P_t - \mu P_t \;\mathrm{d}t = \sigma P_t\;\mathrm{d}W_t.
$$
Analogamente ao caso determinístico (pense em $p' - \mu p = g(t)$), podemos considerar o fator de integração $e^{-\mu t}$. Observe que, derivando o produto $Y_t = P_t e^{-\mu t}$ pela fórmula de Itô, temos
$$
\begin{align*}
\mathrm{d}Y_t & = \mathrm{d}(P_t e^{-\mu t}) \\
& = -\mu P_t e^{-\mu t}\;\mathrm{d}t + e^{-\mu t}\;\mathrm{d}P_t \\
& = -\mu P_t e^{-\mu t}\;\mathrm{d}t + e^{-\mu t}(\mu P_t \;\mathrm{d}t + \sigma P_t\;\mathrm{d}W_t) \\
& = \sigma e^{-\mu t} P_t \;\mathrm{d}W_t \\
& = \sigma Y_t \;\mathrm{d}W_t.
\end{align*}
$$
Vimos, acima, que a solução da equação
$$
\mathrm{d}Y_t = \sigma Y_t \;\mathrm{d}W_t
$$
é
$$
Y_t = p_0 e^{-\frac{1}{2}\sigma^2 t + \sigma W_t}.
$$
Assim,
$$
P_t = e^{\mu t}Y_t = p_0 e^{\mu t} e^{-\frac{1}{2}\sigma^2 t + \sigma W_t} = p_0 e^{\left(\mu - \frac{1}{2} \sigma^2\right)t + \sigma W_t}.
$$

Vamos, agora, calcular o valor esperado de $P_t$. Para isso, escrevemos a equação integral associada à equação diferencial estocástica:
$$
P_t = p_0 + \mu \int_0^t P_s \;\mathrm{d}s + \sigma \int_0^t P_s\;\mathrm{d}W_s.
$$
Tomando o valor esperado, obtemos
$$
\mathbb{E}\left[P_t\right] = p_0 + \int_0^t \mathbb{E}[P_s]\;\mathrm{d}s.
$$
A solução dessa equação integral é a função exponencial:
$$
\mathbb{E}\left[P_t\right] = p_0e^{\mu t},
$$
que é, também, a solução da equação diferencial ordinária obtida eliminando o ruído da equação estocástica ($\sigma = 0$).

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
\mathrm{d}Y_t & = -\nu e^{-\nu t}Y_0 \;\mathrm{d}t - \sigma \nu e^{-\nu t}\;\mathrm{d}t \int_0^t e^{\nu s}\;\mathrm{d}W_t + \sigma \;\mathrm{d}W_t \\
& = -\nu Y_t\;\mathrm{d}t + \sigma\;\mathrm{d}W_t.
\end{align*}
$$

## Exponencial estocástica

Em particular, o processo
$$
X_t = X_0 e^{\lambda W_t  - \frac{1}{2}\lambda^2 t}
$$
faz um papel semelhante ao da função $x(t) = x_0e^{\lambda t}$, que é solução de
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = \lambda x,
$$
que pode ser escrita em forma diferencial como
$$
\mathrm{d}x = \lambda x \;\mathrm{d}t.
$$

Na versão estocástica, $\{X_t\}_{t \geq 0}$ é solução de
$$
\mathrm{d}X_t = \lambda X_t \;\mathrm{d}W_t.
$$

## Ponte Browniana (Brownian bridge)

Uma outra equação clássica é
$$
\mathrm{d}B_t = - \frac{B_t}{1-t}\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
com condição inicial
$$
B_0 = 0.
$$

A sua solução pode ser obtida, também, via fator de integração e tem a forma
$$
B_t = (1 - t)\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s, \quad 0 \leq t < 1.
$$

Isso pode ser verificado diretamente, já que a integral de Itô acima é explícita. De fato,
$$
\mathrm{d}B_t = - \int_0^t \frac{1}{1-s}\;\mathrm{d}W_s + (1 - t)\frac{\mathrm{d}W_t}{1 - t} = - \frac{1}{1-t}B_t + \;\mathrm{d}W_t.
$$

Para deduzir a solução via fator de integração, dividimos a equação por $1-t$:
$$
\frac{1}{1-t}\mathrm{d}B_t + \frac{B_t}{(1-t)^2}\;\mathrm{d}t = \frac{1}{1-t}\;\mathrm{d}W_t.
$$
O lado esquerdo é a derivada do termo $Y_t = B_t/(1-t)$, de modo que
$$
\mathrm{d}Y_t = \frac{1}{1-t}\;\mathrm{d}W_t.
$$
A solução é a primitiva do lado direito:
$$
Y_t = \int_0^t \frac{1}{1-s}\;\mathrm{d}W_s.
$$
Voltando para $B_t$, temos
$$
B_t = (1-t)Y_t = (1-t)\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s.
$$

O motivo do nome desse processo vem do fato de que
$$
\lim_{t \rightarrow 1} B_t = 0,
$$
quase certamente. Ou seja, o processo $\{B_t\}_{0 \leq t < 1}$ faz uma "ponte", saindo da origem e voltando à origem, com caminhos contínuos quase certamente. Para mostrar esse resultado, observe, primeiro, que
$$
\mathbb{E}[B_t] = (1-t)\mathbb{E}\left[\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s\right] = 0.
$$
Temos, também, pela isometria de Itô, que
$$
\begin{align*}
\mathrm{Var}(B_t) & = \mathbb{E}[B_t^2] \\
& = (1-t)^2\mathbb{E}\left[\left(\int_0^t \frac{1}{1-s}\;\mathrm{d}W_s\right)^2\right] \\
& = (1 - t)^2\int_0^t \frac{1}{(1-s)^2}\;\mathrm{d}s \\
& = (1 - t)^2 \left(-\frac{1}{(1 - t)} + 1 \right) \\
& = (1 - t)^2 - (1 - t) \\
& = t(t - 1).
\end{align*}
$$
Em particular,
$$
\lim_{t \rightarrow 0} \mathbb{E}\left[B_t^2\right] = 0, \qquad \lim_{t \rightarrow 1} \mathbb{E}\left[B_t^2\right] = 0.
$$
Portanto,
$$
\lim_{t \rightarrow 0} B_t = 0, \qquad \lim_{t \rightarrow 1} B_t = 0,
$$
em probabilidade. Como os caminhos amostrais são contínuos, obtemos a convergência quase certamente.

Observe, ainda, que a variância é simétrica em relação ao instante médio $t = 1/2$ e alcança o seu máximo exatamente nesse ponto.

Uma ponte browniana também tem outras representações, como 
$$
B_t = W_t - t W_1 =  (1-t)W_{t/(1-t)}.
$$
Por sua vez, um processo de Wiener também pode ser escrito em termos de pontes brownianas, como em 
$$
W_t = B_t + t N, \quad 0\leq t < 1,
$$
onde $N$ é uma variável aleatória normal e independente de $\{B_t\}_{t \geq 0}$, e
$$
W_t = (1 + t)W_{t/(1 + t)}, \quad t \geq 0.
$$
Mas deixamos isso a cargo do leitor mais interessado.

## Exercícios

1. Uma ponte browniana pode ser definida, mais geralmente, em um intervalo $[0, T)$, como solução da equação
$$
\mathrm{d}B_t = - \frac{B_t}{T-t}\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
com condição inicial $B_0 = 0$. Ache uma fórmula explíta para $B_t$ como uma integral de Itô e encontro a variância $\mathrm{V}(B_t)$, ao longo de $0 \leq t < T$.
