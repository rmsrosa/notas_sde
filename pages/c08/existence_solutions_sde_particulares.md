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

Para os resultados de existência e unicidade locais nesses casos particular, vamos assumir que $f = f(t, x)$, $g = g(t, x)$ sejam funções contínuas $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ com a propriedade de serem localmente Lipschitz contínuas na variável $x.$

Mais precisamente, assumimos que existem funções contínuas não decrescentes $L_f=L_f(R), L_g=L_g(R) > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f(R)|x - y|, \qquad \forall x, y \in \mathbb{R}, |x|, |y| \leq R, \\
|g(t, x) - g(t, y)| \leq L_g(R)|x - y|, \qquad \forall x, y \in \mathbb{R}, |x|, |y| \leq R.
\end{align*}
$$

Lembremos que uma hipótese semelhante é usualmente feita para o resultado de existência de solução particular local na teoria de equações diferenciais determinísticas. Aqui, no entanto, ela não é suficiente.

Veremos que em certos casos particulares (ruído aditivo ou estritamente positivo) ela só nos garante a existência de soluções locais de caminhos amostrais em intervalos que dependem da amostra $\omega$ e que podem ser arbitrariamente curtos.

Veremos, no entanto, que sob condições extras de invariância, aí sim isso pode ser elevado a um resultado de existência local do processo todo, com um pequeno intervalo independente da amostra.

Em seguida, consideraremos, finalmente, a hipótese de continuidade Lipschitz global no espaço para garantir, de maneira mais geral, a existência de soluções globais no tempo.

## Existência de caminhos amostrais locais no caso de equações com ruído aditivo

Vamos começar com um caso particular, com ruído aditivo, onde o termo de difusão é da forma $g(t, X_t) = g(t) \in \mathbb{R}$, ou seja
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t)\mathrm{d}W_t, \qquad t \geq 0.
$$

A forma integral equivalente é
$$
X_t = X_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t g(t)\mathrm{d}W_s.
$$
A segunda integral não envolve a incógnita $X_t$ e pode ser estimada de maneira independente da solução, para cada caminho amostral. Isso nos libera da necessidade de usar a isometria de Itô e a estimativa em média quadrática, o que nos levaria a precisar de condições globais de continuidade Lipschitz, como feito no caso geral.

Assumimos, então, que $f=f(t, x)$ seja contínua nas duas variáveis e localmente Lipschitz contínua na coordenada $x$, conforme explicitado acima, e que $g=g(t)$ seja contínua. Com essa hipótese em $f,$ temos, ainda, que
$$
|f(t, x)| \leq |f(t, 0)| + |f(t, x) - f(t, 0)| \leq \max_{0\leq s \leq T}|f(s, 0)| + L_f(|x|)|x|.
$$
Assim, para todo $|x|\leq R,$ temos
$$
|f(t, x)| \leq |f(t, 0)| + |f(t, x) - f(t, 0)| \leq C_0 + L_f(R)R,
$$
onde
$$
C_0 = \max_{0\leq s \leq T}|f(s, 0)|.
$$
Seja, também,
$$
C_W(\omega) = \max_{0\leq t \leq T}\left|\int_0^t g(s)\mathrm{d}W_s(\omega)\right|.
$$

A ideia é resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos, para todo $t \geq 0$,
$$
\begin{align*}
X_t^0 & = X_0, \\
X_t^m & = X_0 + \int_0^t f(s, X_s^{m-1})\mathrm{d}s + \int_0^t g(s)\mathrm{d}W_s, \quad m\in \mathbb{N}.
\end{align*}
$$

A ideia, como no caso de equações diferenciais ordinárias, é mostrar que, para uma determinada variável aleatória $R(w)> 0$ e para uma função determinística $\tilde t=\tilde t(R)$ com $0 < \tilde t(R) \leq T$ suficientemente pequeno, as aproximações obtidas pelas iterações do método de Picard estão dentro da bola de raio $R(\omega)$, no intervalo $[0, \tilde t(R(\omega))]$, na qual podemos estimar a constante de Lipschitz de maneira uniforme e mostrar que a aproximação é uma sequência de Cauchy na norma uniforme, de modo que os caminhos amostrais da família $\{X_t^m(\omega)\}_{0 \leq t \leq \tilde(\omega)}$ convergem uniformemente para um caminho amostral que é solução da equação integral.

Observe, inicialmente, que
$$
\begin{align*}
|X_t^m(\omega)| & \leq |X_0(\omega)| + t \max_{0\leq \tau \leq t} |f(\tau, X_\tau^{m-1}(\omega))| + \max_{0\leq \tau \leq t}\left|\int_0^\tau g(s)\mathrm{d}W_s(\omega)\right| \\
& \leq |X_0(\omega)| + t(C_0 + L_f(\max_{0\leq \tau \leq t}|X_\tau^{m-1}(\omega)))|\max_{0\leq \tau \leq t}|X_\tau^{m-1}(\omega)| + C_W(\omega).
\end{align*}
$$

Sejam, então,
$$
\tilde t(R) = \frac{TC_0}{L_f(R)R},
$$
e
$$
R(\omega) = |X_0(\omega)| + 2TC_0 + C_W(\omega).
$$

Com isso,
$$
|X_t^0(\omega)| = |X_0(\omega)| \leq R(\omega),
$$
para todo $0\leq t \leq T.$ Assumindo, por indução, que
$$
|X_t^{m-1}(\omega)| \leq R(\omega), \quad 0\leq t \leq \tilde t(R(\omega)),
$$
então
$$
|X_t^m(\omega)| \leq |X_0(\omega)| + TC_0 + \tilde t(R(\omega))L_f(R(\omega))R(\omega) + C_W(\omega) \leq R(\omega),
$$
para todo $0\leq t \leq \tilde t.$ Isso mostra, então, que
$$
|X_t^m(\omega)| \leq R(\omega), \quad 0\leq t \leq \tilde t(R(\omega)), \;m = 0, 1, \ldots.
$$

Considere, agora, os processos estocásticos
$$
D_t^m = \max_{0 \leq \tau \leq t} |X_\tau^{m+1} - X_\tau^m|, \quad m = 0, 1, 2, \ldots.
$$

Temos
$$
D_t^0(\omega) \leq \max_{0 \leq \tau \leq t} \left| \int_0^\tau f(s, X_0(\omega))\mathrm{d}s + \int_0^\tau g(s)\;\mathrm{d}W_s \right| \leq C_0 t + t L_f(|X_0(\omega)|)|X_0(\omega)| + C_W(\omega) \leq R(\omega), \quad \forall 0 \leq t \leq \tilde t(R(\omega)).
$$

Como no método de Picard clássico, vamos mostrar que
$$
D_t^m \leq R \frac{L_f(R)^m}{m!} t^m \leq R,
$$
para $0\leq t \leq t(R)$. A estimativa acima mostra que isso é verdade para $m = 0$. Procedemos, agora, por indução, assumindo verdadeiro para $m-1$, onde $m\in \mathbb{N}$, e analisando $D_t^m$. Temos,
$$
\begin{align*}
D_t^m(\omega) & = \max_{0 \leq \tau \leq t} |X_\tau^{m+1}(\omega) - X_\tau^m(\omega)| \\
& = \max_{0 \leq \tau \leq t} \left| \int_0^\tau f(s, X_s^m)\mathrm{d}s - \int_0^\tau f(s, X_s^{m-1})\mathrm{d}s\right| \\
& \leq \max_{0 \leq \tau \leq t} \int_0^\tau L_f(R(\omega)) |X_s^m(\omega) - X_s^{m-1}(\omega)|\mathrm{d}s \\
& \leq L_f(R(\omega))\max_{0 \leq \tau \leq t} \int_0^\tau D_s^{m-1}(\omega) \;\mathrm{d}s \\
& \leq L_f(R(\omega)) \max_{0 \leq \tau \leq t}\int_0^\tau D_s^{m-1}(\omega) \;\mathrm{d}s \\
& \leq L_f(R(\omega)) \int_0^t R(\omega) \frac{L_f(R(\omega))^{m-1}}{(m-1)!} s^{m-1} \;\mathrm{d}s \\
& \leq R(\omega) \frac{L_f(R(\omega))^m}{(m-1)!}\int_0^t s^{m-1} \;\mathrm{d}s \\
& = R(\omega) \frac{L_f(R(\omega))^m}{m!} t^{m}.
\end{align*}
$$
Isso completa a demonstração por indução da estimativa para $D_t^m(\omega).$

Agora, para termos da sequência não necessariamente consecutivos, i.e. para inteiros quaisquer $k \geq j \geq 1$,
$$
\max_{0 \leq \tau \leq t} |X_\tau^k - X_\tau^j| \leq \sum_{m = j}^{k-1} D_t^m \leq \sum_{m = j}^\infty R(\omega) \frac{L_f(R(\omega))^m}{m!} t^m.
$$
Como o somatório é o "rabo" da série de Taylor da função exponencial $Re^{L_f(R)t}$, o lado direito converge para zero, quando $j \rightarrow \infty$. Ou seja, para quase toda amostra $\omega,$ temos $X_t^m(\omega)$ convergindo uniformemente no intervalo $[0, \tilde(R(\omega))].$ No limite, temos um caminho $X_t(\omega)$ satisfazendo a equação integral desejada:
$$
X_t(\omega) = X_0(\omega) + \int_0^t f(s, X_s(\omega))\mathrm{d}s + \int_0^t g(s) \mathrm{d}W_s(\omega), \quad 0 \leq t \leq \tilde t(R(\omega)).
$$

## Existência global no caso de ruído aditivo e região positivamente invariante

Agora, além das condições do ruído ser aditivo e do termo de *drift* ser localmente Lipschitz em $x,$ suponhamos que exista $R_f>0$ tal que
$$
f(t, x) \leq 0, \qquad x \geq R_f \quad \textrm{e} f(t, x) \geq 0, \qquad x \leq -R_f.
$$

Observe que
$$
\begin{align*}
X_t^m(\omega) & = X_0(\omega) + \int_0^t f(s, X_s^{m-1}(\omega))\;\mathrm{d}s + \int_0^t g(s)\;\mathrm{d}W_s \\
& \leq X_0(\omega) + t \max_{0\leq \tau \leq T, |x|\leq R_f} |f(\tau, x)| + \max_{0\leq \tau \leq t}\left|\int_0^\tau g(s)\mathrm{d}W_s(\omega)\right| \\
& \leq X_0(\omega) + t(C_0 + L_f(R_f)R_f) + C_W(\omega).
\end{align*}
$$
Analogamente,
$$
X_t^m(\omega) \geq X_0(\omega) - t(C_0 + L_f(R_f)R_f) - C_W(\omega),
$$
de modo que
$$
|X_t^m(\omega)| \geq |X_0(\omega)| + t(C_0 + L_f(R_f)R_f)+ C_W(\omega).
$$

Como, agora, o termo proveniente da integral determinística não depende do caminho amostral, podemos definir um $\tilde t$ uniforme, dado por
$$
\tilde t = \frac{TC_0}{L_f(R_f)R_f}.
$$
Assim, obtemos a estimativa
$$
|X_t^m(\omega)| \geq R(\omega) + 2TC_0 + C_W(\omega),
$$
para todo $m,$ todo $\omega$ e todo $0\leq t \leq \tilde t.$

Uma vez estabelecido um limite superior para $X_t^m(\omega)|$ em um intervalo $[0, \tilde t]$ independente de $\omega,$ prosseguimos como antes para mostrar que as aproximações de Picard formam uma sequência de Cauchy na norma uniforme e, portanto, convergem uniformemente, no intervalo $[0, \tilde t],$ para uma solução $X_t(\omega)$ da equação integral. Finalmente, isso nos dá um processo $\{X_t\}_{0\leq t \leq \tilde t}$ que é solução, para quase todo $\omega,$ da equação diferencial estocástica no intervalo $[0, \tilde t].$ 

Por exemplo, isso nos garante a existência local de solução da equação
$$
\mathrm{d}X_t = (\alpha X_t - \beta X_t^3)\;\mathrm{d}t + \sigma \;\mathrm{d}W_t.
$$
Observe que truncar a função $f(x) = \alpha x - \beta x^3$ em uma região de interesse e modificá-la para uma função globalmente Lipscthiz não é satisfatório, pois o termo de difusão pode nos levar arbitrariamente longe da origem (observe que $R=R(\omega)$ acima ainda depende da amostra $\omega;$ apenas $\tilde t$ é independente).

## Existência de caminhos amostrais locais no caso autônomo com difusão positiva

Consideramos, agora, uma equação com termo de difusão não determinístico, mas com difusão e *drift* autônomos e difusão positiva, i.e.
$$
\mathrm{d}X_t = f(X_t)\mathrm{d}t + g(X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com
$$
\left.X_t\right|_{t = 0} = X_0,
$$
e
$$
g(x) > 0, \qquad \forall x.
$$

Assumimos, ainda, que $f$ seja localmente Lipschitz contínua e que $g$ seja continuamente diferenciável com $g'$ localmente Lipscthiz.

A ideia é transformar essa equação em uma equação diferencial estocástica com ruído aditivo. Isso é obtido com a transformação
$$
Y_t = h(X_t)
$$
onde $h$ é uma primitiva de $1/g$, e.g.
$$
h(x) = \int_0^x \frac{1}{g(\xi)} \;\mathrm{d}\xi,
$$
o que é possível graças a hipótese de $g$ ser positiva. Além disso, como $h'(x) = 1/g(x) > 0,$ temos que $h$ é invertível e podemos, uma vez obtida a solução para $Y_t$ dada por $Y_t = h(X_t),$ recuperarmos $X_t = h^{-1}(Y_t).$

Como fica a equação para $Y_t?$ Para ver isso, usamos a fórmula de Itô. Observe que
$$
h'(x) = \frac{1}{g(x)} \quad h''(x) = - \frac{g'(x)}{g(x)^2}.
$$
Temos
$$
\mathrm{d}Y_t = h'(X_t)\;\mathrm{d}X_t + \frac{1}{2}h''(X_t)g(X_t)^2\;\mathrm{d}t,
$$
ou seja
$$
\mathrm{d}Y_t = \left(h'(X_t)f(X_t) + \frac{1}{2}h''(X_t)g(X_t)^2\right)\;\mathrm{d}t + h'(X_t)g(X_t)\;\mathrm{d}W_t.
$$
Note que $h'(x)g(x) = 1$ e $h''(x)g(x)^2 = -g'(x),$ de modo que
$$
\mathrm{d}Y_t = \left(\frac{f(X_t)}{g(X_t)} - \frac{1}{2}g'(X_t)\right)\mathrm{d}t + \mathrm{d}W_t,
$$
com condição inicial $Y_0 = h(X_0).$ Como essa é uma equação com ruído aditivo e com termos localmente Lipschitz, o resultado anterior se aplica e obtemos soluções locais para cada caminho amostral. Se for possível, explorando alguma estrutura extra da equação, mostrar que os caminhos amostrais estão definidos em um intervalo comum mínimo, então obtemos uma solução local $\{Y_t\}_{0\leq t \leq \tilde t},$ para algum $0\leq \tilde t \leq T.$ Nesse caso, conforme mencionado acima, como $h$ é suave e invertível, podemos verificar que $X_t = h^{-1}(Y_t)$ resolve, de fato, a equação original, no intervalo $[0, \tilde t].$

Vale notar que a forma da transformação $h(x)$ definida acima pode ser obtida buscando-se uma equação para $Y_t = h(X_t)$ que tenha ruído aditivo, ou seja, tal que o termo de difusão
$$
h'(X_t)g(X_t)
$$
seja independente de $X_t,$ ou seja, que o produto seja constante, por exemplo
$$
h'(x)g(x) = 1.
$$
Isso nos dá a relação acima.

## Existência de caminhos amostrais locais no caso não autônomo com difusão positiva

Com um pouco mais de trabalho, é possível considerar o caso não autônomo e encontrar condições para que a transformação $Y_t = h(t, X_t)$ com
$$
h(t, x) = \int_0^x \frac{1}{g(t, \xi)} \;\mathrm{d}\xi
$$
transforme a equação
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
em uma equação com ruído aditivo e com termos localmente Lipschitz contínuos, da forma
$$
\mathrm{d}Y_t = \left(\partial_t h(t, X_t) + \frac{f(t, X_t)}{g(t, X_t)} - \frac{1}{2}\partial_{x}g(t, X_t)\right)\;\mathrm{d}t + \;\mathrm{d}W_t,
$$
onde
$$
\partial_t h(t, x) = - \int_0^x \frac{\partial_t g(t, \xi)}{g(t, \xi)^2} \;\mathrm{d}\xi.
$$

## Exercícios

1. Considere o caso não autônomo com difusão positiva mencionado acima e verifique que, sob condições apropriadas em $f=f(t, x)$ e $g=g(t, x),$ a função $h=h(t, x)$ tal que $\partial_t h = 1/g$ transforma a equação diferencial estocástica em uma outra equação diferencial estocástica com ruído multiplicativo e com termos localmente Lipschitz contínuos.

