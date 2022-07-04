@def title = "Soluções de equações diferenciais estocásticas"

# {{ get_title }}

Vamos considerar, agora, equações diferenciais estocásticas da forma
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + g(t, X_t)\mathrm{d}W_t, \qquad t \geq 0,
$$
onde $T > 0$, $\{W_t\}_{t\geq 0}$ é um processo de Wiener e $f:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ e $g:[0, T]\times \mathbb{R} \times\mathbb{R} \rightarrow \mathbb{R}$ são globalmente Lipschitz contínuos.

Junte-se à essa equação uma condição inicial
$$
\left.X_t\right|_{t = 0} = C,
$$
onde $C$ é uma variável aleatória real.

O termo $f = f(t, x)$ é chamado de *drift* e $g = g(t, x)$, de *difusão.*

## Significado da equação

Os termos $\mathrm{d}X_t$ e $\mathrm{d}W_t$ não têm significado por si só. A equação conforme escrita acima é uma maneira de se escrever a equação integral correspondente:
$$
X_t = X_0 + \int_0^t f(s, X_s\mathrm{d}s + \int_0^t g(s, X_s)\mathrm{d}W_s.
$$
Sob condições apropriadas em $f$, $g$ e na solução $X_t$, a primeira integral é uma integral de Riemann ou de Lebesgue de um processo definido por $H_t = f(t, X_t)$ e a segunda integral é uma integral de Itô de um processo definido por $G_t = g(t, X_t)$, em relação ao processo $\{W_t\}_{t\geq 0}$. Buscamos condições que garantam a existência de um processo apropriado $\{X_t\}_{t \geq 0}$ que satisfaça essa equação integral.

## Sobre as condições de continuidade Lipschitz global

Como dito acima, supomos que $f$ e $g$ são globalmente Lipschitz contínuas, i.e. existem $L_f, L_g > 0$ tais que
$$
\begin{align*}
|f(t, x) - f(t, y)| \leq L_f|x - y|, \qquad \forall x, y \in \mathbb{R}, \\
|g(t, x) - g(t, y)| \leq L_g|x - y|, \qquad \forall x, y \in \mathbb{R}.
\end{align*}
$$

Lembremos que uma hipótese semelhante é usualmente feita para o resultado de existência de solução particular na teoria de equações diferenciais determinísticas. A diferença é que a continuidade Lipschitz assumida é apenas local, ou seja, para $x, y$ numa vizinhança da condição inicial.

No entanto, aqui, por conta do processo de Wiener, os caminhos amostrais podem se afastar rapidamente da condição inicial e perdemos esse controle local. Essa condição pode ser relaxada desde que se possa explorar alguma outra propriedade mais estrutural do processo de Wiener e da equação. Em geral, no entanto, conseguimos a existência apenas sob essa condição global.

## Existência e unicidade no caso de equações com difusão constante

Vamos começar com um caso particular, com difusão constante $g(t, X_t ) = \sigma \in \mathbb{R}$, ou seja
$$
\mathrm{d}X_t = f(t, X_t)\mathrm{d}t + \sigma\mathrm{d}W_t, \qquad t \geq 0.
$$
Também assumimos uma condição inicial determinística, digamos $X_0 = x_0 \in \mathbb{R}$

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

A ideia é resolver a equação integral via método de Picard, ou seja, via iterações sucessivas. Definimos $X_t^0 = x_0$, para todo $t \geq 0$, e, para $m \in \mathbb{N}$,
$$
X_t^m = x_0 + \int_0^t f(s, X_s^{m-1})\mathrm{d}s + \sigma W_t.
$$

Vamos mostrar que a família $\{X_t^m\}_{0 \leq t \leq T}$ de processos converge, em média quadrática, para um processo que é solução da equação integral.

Considere os processos estocásticos
$$
D_t^m = \max_{0 \leq s \leq t} |X_s^m - X_s^{m-1}|, \quad m = 1, 2, \ldots.
$$
Para cada $\omega\in \Omega$, temos que $W_t(\omega)$ é limitado em $[0, T]$. Além disso, $|f(t, x_0)|$ é limitado em $[0, T]$, já que $f$ é contínua. Assim,
$$
D_t^1(\omega) \leq \left| \int_0^t f(s, X_s^{m-1})\mathrm{d}s + \sigma  W_t \right| \leq C(\omega), \quad \forall 0 \leq t \leq T,
$$
para algum $C(\omega) \geq 0.$

Como no método de Picard clássico, vamos mostrar que
$$
D_t^m \leq C \frac{L^m}{m!} t^m.
$$
A estimativa acima mostra que isso é verdade para $m = 1$. Procedemos, agora, por indução, assumindo verdadeiro para $m \in \mathbb{N}$ qualquer, e analisando o termo correspondente a $m + 1.$ Temos, de fato,
$$
\begin{align*}
D_t^{m+1} & = \max_{0 \leq s \leq t} |X_s^{m+1} - X_s^m| \\
& = \max_{0 \leq s \leq t} \left| \int_0^t f(s, X_s^m)\mathrm{d}s - \int_0^t f(s, X_s^{m-1})\mathrm{d}s\right| \\
& \leq \max_{0 \leq s \leq t} \int_0^t L |X_s^m - X_s^{m-1}|\mathrm{d}s \\
& \leq L\max_{0 \leq s \leq t} \int_0^t D_s^m \;\mathrm{d}s \\
& \leq L \int_0^t D_s^m \;\mathrm{d}s \\
& \leq L \int_0^t C \frac{L^m}{m!} s^m \;\mathrm{d}s \\
& = C \frac{L^{m+1}}{(m+1)!} t^{m+1}.
\end{align*}
$$

Agora, para termos não necessariamente consecutivos, i.e. para inteiros quaisquer $k \geq m \geq 1$,
$$
\max_{0 \leq s \leq t} |X_s^k - X_s^m| \leq \sum_{j = m+1}^k D_t^j \leq \sum_{j = m}^\infty C \frac{L^j}{j!} t^j.
$$
Como o somatório é o "rabo" da série de Taylor da função exponencial, o lado direito converge para zero, quando $m \rightarrow \infty$. Ou seja, quase certamente, temos $X_t^m$ convergindo uniformemente em $[0, T]$. No limite, temos um processo $\{X_t\}_{t \geq 0}$ satisfazendo, quase certamente, a equação integral desejada:
$$
X_t = x_0 + \int_0^t f(s, X_s)\mathrm{d}s + \int_0^t \sigma \mathrm{d}W_s.
$$
