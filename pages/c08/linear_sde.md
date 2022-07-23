@def title = "Resolução de equações lineares"

# {{ get_title }}

Sabemos que a equação diferencial ordinária linear homogênea
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = b(t)x
$$
tem as suas soluções da forma
$$
x(t) = x(0)e^{\int_0^t b(s)\;\mathrm{d}s}.
$$
Mais geralmente, a equação linear não homogênea
$$
\frac{\mathrm{d}x}{\mathrm{d}t} = a(t) + b(t)x
$$
tem as suas soluções da forma
$$
x(t) = x(0)e^{\int_0^t b(s)\;\mathrm{d}s} + \int_0^t e^{\int_s^t b(\tau) \;\mathrm{d}\tau}a(s)\;\mathrm{d}s.
$$

Vejamos, agora, como resolver versões estocásticas dessa equação linear.

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

Nas seções seguintes, veremos alguns modelos clássicos que tem essa forma linear. Aqui, nos limitaremos a encontrar as soluções dessas equações. 

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

## Exponencial estocástica

Um caso particular do anterior é o processo
$$
X_t = X_0 e^{\lambda W_t  - \frac{1}{2}\lambda^2 t},
$$
que faz um papel semelhante ao da função $x(t) = x_0e^{\lambda t}$, que é solução de
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
