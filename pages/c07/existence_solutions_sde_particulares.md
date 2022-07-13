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

No momento, vamos considerar alguns casos particulares, com funções $f$ e $g$ de formas especiais. Em seguida, trataremos do caso mais geral.

## Hipóteses iniciais

Para os resultados de existência e unicidade, vamos assumir que $f = f(t, x)$, $g = g(t, x)$ são funções contínuas $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ com a propriedade de serem globalmente Lipschitz contínuas na variável $x$.

Mais precisamente, existem $L_f, L_g > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f|x - y|, \qquad \forall x, y \in \mathbb{R}, \\
|g(t, x) - g(t, y)| \leq L_g|x - y|, \qquad \forall x, y \in \mathbb{R}.
\end{align*}
$$

Lembremos que uma hipótese semelhante é usualmente feita para o resultado de existência de solução particular na teoria de equações diferenciais determinísticas. A diferença é que a continuidade Lipschitz assumida é apenas local, ou seja, para $x, y$ numa vizinhança da condição inicial.

No entanto, aqui, por conta da perturbação causada pelo ruído proveniente de um processo de Wiener, os caminhos amostrais podem se afastar rapidamente da condição inicial e perdemos esse controle local. A condição inicial, sendo um processo, também impede a localização espacial das propriedades dos coeficientes. 

Essa condição global pode ser relaxada desde que se possa explorar alguma outra propriedade mais estrutural da equação. Em geral, no entanto, conseguimos a existência apenas sob essa condição global.

## Existência no caso de equações com difusão constante e condição inicial determinística

Vamos começar com um caso particular, com difusão constante $g(t, X_t) = \sigma \in \mathbb{R}$, ou seja
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + \sigma\mathrm{d}W_t, \qquad t \geq 0.
$$
Também assumimos uma condição inicial determinística, digamos $X_0 = x_0 \in \mathbb{R}$.

A forma integral equivalente é
$$
X_t = x_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t \sigma\mathrm{d}W_s.
$$
A segunda integral é, simplesmente, o próprio $W_t$, ou seja, chegamos na equação mais simples
$$
X_t = x_0 + \int_0^t f(s, X_s)\mathrm{d}s + \sigma W_t.
$$
Essa equação não envolve a integral de Itô.

Assumimos que $f=f(t, x)$ seja contínua nas duas variáveis e globalmente Lipschitz contínua na coordenada $x$, uniformemente em cada intervalo limitado em $t$, i.e. para todo $T > 0$, existe $L_T > 0$ tal que
$$
|f(t, x) - f(t, y)| \leq L_T |x - y|, \qquad \forall \;0 \leq t \leq T, \;\forall x, y \in \mathbb{R}.
$$

A ideia é resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos, para todo $t \geq 0$,
$$
\begin{align*}
X_t^0 & = x_0, \\
X_t^m & = x_0 + \int_0^t f(s, X_s^{m-1})\mathrm{d}s + \sigma W_t, \quad m\in \mathbb{N}.
\end{align*}
$$

Vamos mostrar que a família $\{X_t^m\}_{0 \leq t \leq T}$ de processos converge, em probabilidade, para um processo que é solução da equação integral.

Considere, para isso, os processos estocásticos
$$
D_t^m = \max_{0 \leq s \leq t} |X_s^{m+1} - X_s^m|, \quad m = 0, 1, 2, \ldots.
$$
Para cada $\omega\in \Omega$, temos que $W_t(\omega)$ é limitado em $[0, T]$. Além disso, $f(t, x_0)$ é limitado em $[0, T]$, já que $f$ é contínua. Assim,
$$
D_t^0(\omega) \leq \left| \int_0^t f(s, x_0)\mathrm{d}s + \sigma  W_t \right| \leq C(\omega), \quad \forall 0 \leq t \leq T,
$$
para algum $C(\omega) \geq 0.$

Como no método de Picard clássico, vamos mostrar que
$$
D_t^m \leq C \frac{L^m}{m!} t^m.
$$
A estimativa acima mostra que isso é verdade para $m = 0$. Procedemos, agora, por indução, assumindo verdadeiro para $m-1$, onde $m\in \mathbb{N}$, e analisando $D_t^m$ Temos,
$$
\begin{align*}
D_t^m & = \max_{0 \leq s \leq t} |X_s^{m+1} - X_s^m| \\
& = \max_{0 \leq s \leq t} \left| \int_0^t f(s, X_s^m)\mathrm{d}s - \int_0^t f(s, X_s^{m-1})\mathrm{d}s\right| \\
& \leq \max_{0 \leq s \leq t} \int_0^t L |X_s^m - X_s^{m-1}|\mathrm{d}s \\
& \leq L\max_{0 \leq s \leq t} \int_0^t D_s^{m-1} \;\mathrm{d}s \\
& \leq L \int_0^t D_s^{m-1} \;\mathrm{d}s \\
& \leq L \int_0^t C \frac{L^{m-1}}{(m-1)!} s^{m-1} \;\mathrm{d}s \\
& \leq C \frac{L^m}{(m-1)!}\int_0^t s^{m-1} \;\mathrm{d}s \\
& = C \frac{L^m}{m!} t^{m}.
\end{align*}
$$

Agora, para termos não necessariamente consecutivos, i.e. para inteiros quaisquer $k \geq j \geq 1$,
$$
\max_{0 \leq s \leq t} |X_s^k - X_s^j| \leq \sum_{m = j}^{k-1} D_t^m \leq \sum_{m = j}^\infty C \frac{L^m}{m!} t^m.
$$
Como o somatório é o "rabo" da série de Taylor da função exponencial $Ce^{Lt}$, o lado direito converge para zero, quando $j \rightarrow \infty$. Ou seja, quase certamente, temos $X_t^m$ convergindo uniformemente em $[0, T]$. No limite, temos um processo $\{X_t\}_{t \geq 0}$ satisfazendo, quase certamente, a equação integral desejada:
$$
X_t = x_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t \sigma \mathrm{d}W_s.
$$

## Existência no caso de equações com difusão determinística

Com poucas modificações na demonstração acima, podemos mostrar a existência e unicidade globais da equação com difusão determinística e sem restrição na condição inicial (exceto que seja finita quase certamente).

Nesse caso, temos uma equação da forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t)\mathrm{d}W_t, \qquad t \geq 0.
$$
com condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Assumimos $f=f(t,x)$ contínua em $(t, x)\in [0, \infty]\times \mathbb{R}$ e globalmente Lipschitz contínua na variável $x$, em cada intervalo limitado $[0, T]$. Quando a $X_0$, assumimos, apenas, que seja finita quase certamente.

Deixamos os detalhes da demonstração como exercício.

## Existência no caso autônomo com condição inicial determinística e drift positivo

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
