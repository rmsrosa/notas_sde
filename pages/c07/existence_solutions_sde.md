@def title = "Existência de soluções"

# {{ get_title }}

Estamos considerando equações diferenciais estocásticas da forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Para os resultados de existência e unicidade, vamos assumir que $f = f(t, x)$, $g = g(t, x)$ são funções contínuas $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ com a propriedade de serem globalmente Lipschitz contínuas na variável $x$.

Mais precisamente, existem $L_f, L_g > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f|x - y|, \qquad \forall x, y \in \mathbb{R}, \\
|g(t, x) - g(t, y)| \leq L_g|x - y|, \qquad \forall x, y \in \mathbb{R}.
\end{align*}
$$

Lembremos que uma hipótese semelhante é usualmente feita para o resultado de existência de solução particular na teoria de equações diferenciais determinísticas. A diferença é que a continuidade Lipschitz assumida é apenas local, ou seja, para $x, y$ numa vizinhança da condição inicial.

No entanto, aqui, por conta do processo de Wiener, os caminhos amostrais podem se afastar rapidamente da condição inicial e perdemos esse controle local. A condição inicial, sendo um processo, também impede a localização espacial das propriedades dos coeficientes. 

Essa condição global pode ser relaxada desde que se possa explorar alguma outra propriedade mais estrutural do processo de Wiener e da equação. Em geral, no entanto, conseguimos a existência apenas sob essa condição global.

## Existência e unicidade no caso de equações com difusão constante e condição inicial determinística

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

A ideia é resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos,
para todo $t \geq 0$,
$$
\begin{align*}
X_t^0 & = x_0, \\
X_t^m & = x_0 + \int_0^t f(s, X_s^{m-1})\mathrm{d}s + \sigma W_t, \quad m\in \mathbb{N}.
\end{align*}
$$

Vamos mostrar que a família $\{X_t^m\}_{0 \leq t \leq T}$ de processos converge, em média quadrática, para um processo que é solução da equação integral.

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

## Existência e unicidade no caso de equações com difusão determinística

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
