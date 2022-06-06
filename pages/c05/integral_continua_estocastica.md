@def title = "Integrais de funções diferenciáveis com respeito a processos estocásticos"

# {{ get_title }}

Quando $\{Y_t\}_t$ é um processo estocástico continuamente diferenciável quase sempre, vimos que vale a fórmula
$$
Y_t = Y_0 + \int_0^t \frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Sendo os caminhos diferenciáveis, os mesmos são de variação limitada, de modo que podemos pensar no lado direito acima como uma integral de Riemann-Stieltjes e escrever
$$
Y_t = Y_0 + \int_0^t \mathrm{d}Y_s.
$$

Vamos estender isso para incluir a integral de funções $g(t, Y_t)$ continuamente diferenciáveis.

## Integrando funções diferenciáveis

Considere, primeiramente, uma função real $g:\mathbb{R} \rightarrow\mathbb{R}$ continuamente diferenciável. Temos que $\{g(t)Y_t\}_t$ também é um processo continuamente diferenciável, com derivada dada quase sempre por
$$
\frac{\mathrm{d}}{\mathrm{d}t} g(t)Y_t = g'(t)Y_t + g(t)\frac{\mathrm{d}Y_t}{\mathrm{d}t}.
$$
Assim, podemos considerar a integral
$$
g(t)Y_t = g(0)Y_0 + \int_0^t g'(s)Y_s + g(s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Como o processo $\{Y_t\}_t$ é continuamente diferenciável, os seus caminhos amostrais são de variação limitada e a integral do segundo termo pode ser vista como uma integral de Riemann-Stieltjes:
$$
\int_0^t g(s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s = \int_0^t g(s)\;\mathrm{d}Y_s.
$$

Dessa forma, podemos escrever
$$
\int_0^t g(s)\;\mathrm{d}Y_s = g(t)Y_t - g(0)Y_0 - \int_0^t g'(s)Y_s \;\mathrm{d}s.
$$

Observe, agora, que o lado direito não involve a derivada do processo $\{Y_t\}_t$ e faz sentido mesmo quando os seus caminhos amostrais são apenas contínuos. Com isso, podemos tomar o lado direito como a definição da integral à esquerda nesse caso mais geral.

Ou seja, para uma função real $g:\mathbb{R}\rightarrow \mathbb{R}$ continuamente diferencial e um processo $\{Y_t\}_t$ com caminhos amostrais contínuos quase sempre, definimos a integral de $g$ com respeito a esse processo por
$$
\int_0^t g(s)\;\mathrm{d}Y_s \stackrel{\mathrm{def}}{=} g(t)Y_t - g(0)Y_0 - \int_0^t g'(s)Y_s \;\mathrm{d}s.
$$

Essa definição de integral foi proposta por Paley, Wiener e Zygmund (veja Evans (2013)).

No caso de integrarmos com respeito a um processo de Wiener $\{W_t\}_{t\geq 0}$, temos que o valor esperado da integral é nulo:
$$
\mathbb{E}\left[\int_0^t g(s)\;\mathrm{d}Y_s\right] = g(t)\mathbb{E}[W_t] - g(0)\mathbb{E}[W_0] - \int_0^t g'(s)\mathbb{E}[W_s] \;\mathrm{d}s = 0, \quad \forall t \geq 0.
$$
E se $g(0) = g(t_1) = 0$, para algum $t_1 \geq 0$, então
$$
\begin{align*}
\mathrm{Var}\left(\int_0^{t_1} g(s)\;\mathrm{d}W_s\right) & = \mathbb{E}\left[\left(-\int_0^{t_1} g'(s)W_s\;\mathrm{d}s\right)^2\right] \\
& = \int_0^{t_1}\int_0^{t_1} g'(s)g'(t)\mathbb{E}[W_sW_t]\;\mathrm{d}s\;\mathrm{d}t \\
& = \int_0^{t_1}\int_0^{t_1} g'(s)g'(t)\min\{s,t\}\;\mathrm{d}s\;\mathrm{d}t \\
& = \int_0^{t_1}\left(\int_0^t g'(s)g'(t)s \;\mathrm{d}s + \int_t^{t_1}g'(s)g'(t)t \;\mathrm{d}s\right)\;\mathrm{d}t.
\end{align*}
$$
Observe que, na primeira integral,
$$
\int_0^t g'(s)g'(t)s \;\mathrm{d}s = g'(t)g(t)t - g'(t)\int_0^t g(s)\;\mathrm{d}s.
$$
Já na segunda integral,
$$
\int_t^{t_1}g'(s)g'(t)t \;\mathrm{d}s = g'(t)t(g(t_1) - g(t)) = - g'(t)g(t)t.
$$
Cancelando o termo $g'(t)g(t)t$, nos resta
$$
\mathrm{Var}\left(\int_0^{t_1} g(s)\;\mathrm{d}W_s\right) = -\int_0^{t_1} \int_0^t g'(t)g(s)\;\mathrm{d}s\;\mathrm{d}t = - \int_0^{t_1}\int_s^{t_1} g'(t)g(s) \;\mathrm{d}t\;\mathrm{d}s = \int_0^{t_1} g(s)^2\;\mathrm{d}s.
$$

## Composições diferenciáveis

Podemos adaptar essa ideia para o caso de uma composição com o processo $\{Y_t\}_t$. Para isso, considere, novamente, uma função real $g:\mathbb{R} \rightarrow\mathbb{R}$ continuamente diferenciável. Defina $G:\mathbb{R} \rightarrow\mathbb{R}$ como sendo uma primitiva qualquer de $g$. Temos que $\{G(Y_t)\}_t$ também é um processo continuamente diferenciável e vale
$$
G(Y_t) = G(Y_0) + \int_0^t g(Y_s)\frac{\mathrm{d}Y_s}{\mathrm{d}s} \;\mathrm{d}s.
$$

Novamente, podemos pensar nessa integral como uma integral de Riemann-Stieltjes e escrever
$$
G(Y_t) = G(Y_0) + \int_0^t g(Y_s) \;\mathrm{d}Y_s.
$$

Vamos ver, agora, como podemos estender essa integral ao caso em que o processo $\{Y_t\}_t$ não tenha caminhos de variação limitada, como é o caso do processo de Wiener. Para isso, vamos, no momento, continuar assumindo que os caminhos amostrais são continuamente diferenciáveis.

Assim, sendo $g$ continuamente diferenciável, podemos usar integração por partes (em cada caminho amostral) e escrever
$$
G(Y_t) = G(Y_0) + g(Y_t)Y_t - g(Y_0)Y_0 - \int_0^t g'(Y_s)Y_s \;\mathrm{d}s.
$$
Substituindo $G(Y_t)$, obtemos a identidade
$$
\int_0^t g(Y_s) \;\mathrm{d}Y_s = g(Y_t)Y_t - g(Y_0)Y_0 - \int_0^t g'(Y_s)Y_s \;\mathrm{d}s.
$$

Agora, observe que, caso $\{Y_t\}_t$ tenha caminhos amostrais apenas contínuos, o lado direito acima continua fazendo sentido. Isso nos leva a pensar em definir uma integral com respeito a esse processo através da fórmula a direita.

De fato, isso nos leva a definir
$$
\int_0^t g(Y_s)\;\mathrm{d}Y_s \stackrel{\mathrm{def}}{=} g(Y_t)Y_t - g(Y_0)Y_0 - \int_0^t g'(Y_s)Y_s \;\mathrm{d}s.
$$
Essa definição vale no caso de $g:\mathbb{R}\rightarrow \mathbb{R}$ ser continuamente diferenciável e $\{Y_t\}_t$ ser um processo com caminhos amostrais contínuos quase sempre.

No caso de $g$ ser constante igual a $1$, recuperamos a identidade inicial, mas válida agora em um sentido um pouco mais geral, já que os caminhos amostrais do processo bastam ser contínuos:
$$
Y_t - Y_0 = \int_0^t \;\mathrm{d}Y_s.
$$

Já se $g$ for a identidade, então podemos tomar $G(y) = y^2/2$ e obter
$$
\int_0^t Y_s \;\mathrm{d}Y_s = \frac{1}{2}Y_t^2 - \frac{1}{2}Y_0^.
$$

No caso particular de um processo de Wiener, temos
$$
\int_0^t W_s \;\mathrm{d}W_s = \frac{1}{2}W_t^2.
$$

## Composição não-autônoma

Considere, agora, uma função real $g:\mathbb{R}^2 \rightarrow\mathbb{R}$ continuamente diferenciável que seja a derivada parcial de uma função duas vezes continuamente diferenciável $G:\mathbb{R}^2 \rightarrow \mathbb{R}$:
$$
g(t, y) = \partial_y G(t, y).
$$

Temos que $\{G(t, Y_t)\}_t$ é um processo continuamente diferenciável, com derivada dada quase sempre por
$$
\frac{\mathrm{d}}{\mathrm{d}t} G(t, Y_t) = \partial_t G(t, Y_t) + \partial_y G(t, Y_t)\frac{\mathrm{d}Y_t}{\partial t} = \partial_t G(t, Y_t) + g(t, Y_t)\frac{\mathrm{d}Y_t}{\partial t}.
$$

Dessa forma, temos
$$
G(t, Y_t) = G(0, Y_0) + \int_0^t \left(\partial_s G(s, Y_s) + g(s, Y_s)\frac{\mathrm{d}Y_s}{\partial s}\right) \;\mathrm{d}s.
$$

Mais uma vez, como $\{Y_t\}_t$ é continuamente diferenciável, podemos reescrever a segunda integral como sendo de Riemann-Stieltjes:
$$
G(t, Y_t) = G(0, Y_0) + \int_0^t \partial_s G(s, Y_s) \;\mathrm{d}s + \int_0^t g(s, Y_s)\;\mathrm{d}Y_s.
$$

Como antes, assumindo $\{Y_t\}_t$ com caminhos amostrais apenas contínuos, podemos definir
$$
\int_0^t g(s, Y_s)\;\mathrm{d}Y_s = G(t, Y_t) - G(0, Y_0) - \int_0^t \partial_s G(s, Y_s) \;\mathrm{d}s.
$$

## E agora?

As construções acima já englobam uma boa parte de funções que podem ser integradas. No entanto, em várias aplicações, precisamos integrar, em relação a um dado processo $\{Y_t\}_t$, uma função de outro processo $\{X_t\}_t$, da forma $g(t, X_t)$. De fato, muitas vezes $\{X_t\}_t$ é um processo desconhecido, dado como solução de uma equação estocástica cuja lei de evolução envolve um dado processo $\{Y_t\}_t$. Veremos como fazer isso a seguir. Veremos, em particular, um caminho em que a integral de $\int_0^t W_t \;\mathrm{d}W_t$, do processo de Wiener, coincide com o valor $W_t^2/2$ obtido acima (integral de Stratonovich); e outro caminho em que o resultado é diferente (integral de Itô).

## Exercícios

1. Seja $\{Y_t\}_{t \in [a,b]}$, $a < b$, um processo com caminhos amostros contínuos quase certamente. Seja $g:\mathbb{R}\rightarrow \mathbb{R}$ uma função continuamente diferenciável. Considere a integral de $g$ em relação a $\{Y_t\}_{t\in [a,b]}$ como definida acima:
$$
\int_a^b g(s)\;\mathrm{d}Y_s \stackrel{\mathrm{def}}{=} g(b)Y_b - g(a)Y_a - \int_a^b g'(s)Y_s \;\mathrm{d}s.
$$

Mostre que essa integral possui as seguintes propriedades:

a) Para qualquer constante $c\in\mathbb{R}$ e qualquer função continuamente diferenciável $g:\mathbb{R}\rightarrow\mathbb{R}$, vale
$$
\int_a^b c g(s)\;\mathrm{d}Y_s = c\int_a^b g(s)\;\mathrm{d}Y_s.
$$

b) Para quaisquer funções continuamente diferenciáveis $g_1, g_2:\mathbb{R} \rightarrow \mathbb{R}$, vale
$$
\int_a^b (g_1(s) + g_2(s)) \;\mathrm{d}Y_s = \int_a^b g_1(s) \;\mathrm{d}Y_s + \int_a^b g_2(s) \;\mathrm{d}Y_s.
$$
