@def title = "Existência de soluções em casos particulares"

# {{ get_title }}

Estamos considerando equações diferenciais estocásticas da forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

No momento, vamos considerar alguns casos particulares, com funções $f$ e $g$ de formas especiais e obter um resultado local de existência, ou seja, em um intervalo de tempo suficientemente pequeno. Em seguida, trataremos do caso mais geral.

## Hipóteses iniciais

Para os resultados de existência e unicidade locais nesses casos particular, vamos assumir que $f = f(t, x)$, $g = g(t, x)$ são funções contínuas $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ com a propriedade de serem localmente Lipschitz contínuas na variável $x.$

Mais precisamente, assumimos que existem funções contínuas não-decrescentes $L_f=L_f(R), L_g=L_g(R) > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f(R)|x - y|, \qquad \forall x, y \in \mathbb{R}, |x|, |y| \leq R, \\
|g(t, x) - g(t, y)| \leq L_g(R)|x - y|, \qquad \forall x, y \in \mathbb{R}, |x|, |y| \leq R.
\end{align*}
$$

Lembremos que uma hipótese semelhante é usualmente feita para o resultado de existência de solução particular local na teoria de equações diferenciais determinísticas.

## Existência local no caso de equações com difusão determinística

Vamos começar com um caso particular, com difusão constante $g(t, X_t) = g(t) \in \mathbb{R}$, ou seja
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t)\mathrm{d}W_t, \qquad t \geq 0.
$$

A forma integral equivalente é
$$
X_t = X_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t g(t)\mathrm{d}W_s.
$$
A segunda integral não envolve a incógnita $X_t$ e pode ser estimada independentemente, para cada caminho amostral. Isso nos libera da necessidade de usar a isometria de Itô e a estimativa em média quadrática, o que nos levaria a precisar de condições globais de continuidade Lipschitz, como feito no caso geral.

Assumimos, então, que $f=f(t, x)$ seja contínua nas duas variáveis e localmente Lipschitz contínua na coordenada $x$, conforme explicitado acima, e que $g=g(t)$ seja contínua.

A ideia é resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos, para todo $t \geq 0$,
$$
\begin{align*}
X_t^0 & = X_0, \\
X_t^m & = X_0 + \int_0^t f(s, X_s^{m-1})\mathrm{d}s + \int_0^t g(s)\mathrm{d}W_s, \quad m\in \mathbb{N}.
\end{align*}
$$

Vamos mostrar que a família $\{X_t^m\}_{0 \leq t \leq T}$ de processos converge, em probabilidade, para um processo que é solução da equação integral.

Considere, para isso, os processos estocásticos
$$
D_t^m = \max_{0 \leq s \leq t} |X_s^{m+1} - X_s^m|, \quad m = 0, 1, 2, \ldots.
$$
Para quase todo $\omega\in \Omega$, temos que a integral
$$
\int_0^t g(t)\mathrm{d}W_s
$$
existe e é contínua em $t$ e, portanto, limitada em $[0, T]$ e que $X_0(\omega)\in \mathbb{R}$. Considere, então, a variável aleatória $R=R(\omega) \geq 0 $ dada por
$$
R(\omega) = 2(|X_0(\omega)| + \max_{t\in [0, T]}|\int_0^t g(s) \;\mathrm{d}W_s(\omega)|).
$$

Além disso, $f(t, X_0(\omega))$ é limitado em $[0, T]$, já que $f$ é contínua. Assim, podemos, também, definir a variável aleatória
$$
C(\omega) = \max_{0 \leq t \leq T} |f(t, X_0(\omega))|.
$$

A ideia, como no caso de equações diferenciais ordinárias, é mostrar que, para $0 < t_1 \leq T$ suficientemente pequeno, as aproximações obtidas pelas iterações do método de Picard estão dentro dessa bola maior de raio $R(\omega)$, no intervalo $[0, t_1]$, e na qual podemos estimar a constante de Lipschitz de maneira uniforme nessa bola.

Temos
$$
D_t^0(\omega) \leq \left| \int_0^t f(s, X_0(\omega))\mathrm{d}s + \sigma  W_t(\omega) \right| \leq C(\omega)t + \frac{R(\omega)}{2}, \quad \forall 0 \leq t \leq T.
$$

Escolhemos $t_1 > 0$ tal que 
$$
C(\omega)t_1 \leq R(\omega)/2, \qquad L(R(\omega))t_1 \leq 1,
$$
de modo que
$$
D_t^0(\omega) \leq R(\omega), \quad \forall 0 \leq t \leq T.
$$

Como no método de Picard clássico, vamos mostrar que
$$
D_t^m \leq R \frac{L(R)^m}{m!} t^m \leq R,
$$
para $0\leq t \leq t_1$. A estimativa acima mostra que isso é verdade para $m = 0$. Procedemos, agora, por indução, assumindo verdadeiro para $m-1$, onde $m\in \mathbb{N}$, e analisando $D_t^m$. Temos,
$$
\begin{align*}
D_t^m(\omega) & = \max_{0 \leq s \leq t} |X_s^{m+1}(\omega) - X_s^m(\omega)| \\
& = \max_{0 \leq s \leq t} \left| \int_0^t f(s, X_s^m)\mathrm{d}s - \int_0^t f(s, X_s^{m-1})\mathrm{d}s\right| \\
& \leq \max_{0 \leq s \leq t} \int_0^t L(R(\omega)) |X_s^m(\omega) - X_s^{m-1}(\omega)|\mathrm{d}s \\
& \leq L(R(\omega))\max_{0 \leq s \leq t} \int_0^t D_s^{m-1}(\omega) \;\mathrm{d}s \\
& \leq L(R(\omega)) \int_0^t D_s^{m-1}(\omega) \;\mathrm{d}s \\
& \leq L(R(\omega)) \int_0^t R(\omega) \frac{L(R(\omega))^{m-1}}{(m-1)!} s^{m-1} \;\mathrm{d}s \\
& \leq R(\omega) \frac{L(R(\omega))^m}{(m-1)!}\int_0^t s^{m-1} \;\mathrm{d}s \\
& = R(\omega) \frac{L(R(\omega))^m}{m!} t^{m}.
\end{align*}
$$
Isso completa a demonstração por indução da estimativa para $D_t^m(\omega).$

Agora, para termos não necessariamente consecutivos, i.e. para inteiros quaisquer $k \geq j \geq 1$,
$$
\max_{0 \leq s \leq t} |X_s^k - X_s^j| \leq \sum_{m = j}^{k-1} D_t^m \leq \sum_{m = j}^\infty C \frac{L^m}{m!} t^m.
$$
Como o somatório é o "rabo" da série de Taylor da função exponencial $Ce^{Lt}$, o lado direito converge para zero, quando $j \rightarrow \infty$. Ou seja, quase certamente, temos $X_t^m$ convergindo uniformemente em um intervalo $[0, t_1].$ No limite, temos um processo $\{X_t\}_{0 \leq t \leq t_1}$ satisfazendo, quase certamente, a equação integral desejada:
$$
X_t = x_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t g(s) \mathrm{d}W_s, \quad 0 \leq t \leq t_1.
$$

## Existência local no caso autônomo com condição inicial determinística e drift positivo

Consideramos, agora, uma equação com termo de difusão não determinístico, mas com difusão e *drift* autônomos, condição inicial determinística e *drift* positivo, i.e.
$$
\mathrm{d}X_t = f(X_t)\mathrm{d}t + g(X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com
$$
\left.X_t\right|_{t = 0} = x_0,
$$
e
$$
f(x) > 0, \qquad \forall x.
$$

Assumimos que $f$ e $g$ são, também, globalmente Lipschitz contínuos.

A ideia é transformar essa equação em uma equação diferencial estocástica com difusão determinística. Para isso, considere $u:\mathbb{R} \rightarrow \mathbb{R}$ duas vezes continuamente diferenciável. Vamos procurar uma solução $\{X_t\}_{t \geq 0}$ da forma
$$
X_t = u(Y_t),
$$
onde $\{Y_t\}_{t \geq 0}$ é solução de
$$
\mathrm{d}Y_t = h(Y_t)\mathrm{d}t + \mathrm{d}W_t, \qquad t \geq 0,
$$
com
$$
Y_t|_{t = 0} = y_0.
$$
Ou seja, desejamos encontrar uma mudança de variáveis $y \mapsto x = u(y)$ que transforme a equação em $Y_t$ na equação em $X_t$.

Pela a fórmula de Itô, temos
$$
\mathrm{d}X_t = u'(Y_t)\;\mathrm{d}Y_t + \frac{1}{2}u''(Y_t)\;\mathrm{d}W_t.
$$
Usando a equação diferencial em $Y_t$, obtemos
$$
\begin{align*}
\mathrm{d}X_t & = u'(Y_t)\left(h(Y_t)\mathrm{d}t + \mathrm{d}W_t\right) + \frac{1}{2}u''(Y_t)\;\mathrm{d}t \\
& = \left(u'(Y_t)h(Y_t) + \frac{1}{2}u''(Y_t)\right)\mathrm{d}t + u'(Y_t)\mathrm{d}W_t.
\end{align*}
$$

Para que $\{X_t\}_{t \geq 0}$ definido através de $X_t = u(Y_t)$ seja solução da equação diferencial estocástica desejada, devemos ter
$$
\begin{cases}
u'(Y_t)h(Y_t) + \frac{1}{2}u''(Y_t) = f(u(Y_t)), \\
u'(Y_t) = g(u(Y_t)),
\end{cases}
$$
com
$$
u(y_0) = x_0.
$$

Para isso, primeiro resolvemos a equação diferencial ordinária
$$
\begin{cases}
\frac{\mathrm{d}u}{\mathrm{d}y} = f(u(y)), \\
u(y_0) = x_0.
\end{cases}
$$
Sendo $f$ globalmente Lipschitz contínuo, podemos escolher $y_0\in\mathbb{R}$ arbitrário que obtemos uma solução global única da equação acima (i.e. para todo $y\in \mathbb{R}$).

Uma vez encontrada essa função $u$, definimos $h$ por
$$
h(y) = \frac{1}{f(u(y))}\left( u'(y)h(y) + \frac{1}{2}u''(y)\right), \qquad y\in \mathbb{R}.
$$
Sendo $f(u(y)) > 0$ para todo $y$, a função acima está bem definida e é contínua.

Assim, a equação em $Y_t$ tem solução global e a transformação $u$ nos dá uma solução global para a equação em $X_t$.
