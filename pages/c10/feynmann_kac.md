@def title = "Fórmula de Feynman-Kac e a equação retrógrada de Kolmogorov"

# {{ get_title }}

Esta é uma fórmula útil para se calcular, por exemplo, esperanças de processos estocásticos. Veremos, em particular, como utilizar essa fórmula para estimar a convergência (fraca) de métodos numéricos para equações estocásticas.

## Fórmula

Em muitos casos práticos, conhecemos o valor atual $X_\tau = \xi$ de um de um processo estocástico e queremos estimar o valor esperado $\mathbb{E}[X_T; X_\tau = \xi]$ em um tempo futuro $T > \tau,$ ou, mais geralmente, $\mathbb{E}[\Phi(X_T); X_\tau = \xi],$ para algum momento $\Phi.$ O objetivo é fazer isso através de uma função $u=u(t, x)$ que seja solução de uma equação a derivadas parciais (EDP) apropriada.

Observe que, pela fórmula de Itô,
$$
\begin{align*}
u(T, X_T) & = u(\tau, X_\tau) + \int_\tau^T \left(u_t(t, X_t) + u_x(t, X_t)f(X_t) + \frac{1}{2}u_{xx}(t, X_t)g(X_t)^2\right)\;\mathrm{d}t \\
& \qquad + \int_\tau^T u_x(t, X_t)g(X_t)\;\mathrm{d}W_t.
\end{align*}
$$

Ao tomarmos o valor esperado, condicionada a $X_\tau = \xi$, e considerando que a integral estocástica tem esperança zero, obtemos
$$
\mathbb{E}[u(T, X_T); X_\tau = \xi] = u(\tau, \xi) + \int_\tau^T \mathbb{E}\left[ u_t(t, X_t) + u_x(t, X_t)f(X_t) + \frac{1}{2}u_{xx}(t, X_t)g(X_t)^2; X_\tau = \xi\right]\;\mathrm{d}t.
$$

A esperança no integrando acima é, em geral, de difícil cálculo. A ideia é considerar uma EDP em que esse termo se anule, ou seja, considerar $u(t, x)$ tal que
$$
u_t(t, x) + u_x(t, x)f(x) + \frac{1}{2}u_{xx}(t, x)g(x)^2 = 0.
$$
Para essa $u=u(t, x),$ obtemos
$$
\mathbb{E}[u(T, X_T); X_\tau = \xi] = u(\tau, \xi).
$$

Observe que a equação para $u$ parece uma equação do calor mas está com o sinal "trocado". Isso implica em ela ser mal posta. Mas isso no modo clássico de resolvê-la para a frente. Ela está bem posta ao buscarmos resolvê-la para trâs no tempo. Mais precisamente, ao fazermos a mudança de variável $t \mapsto -t,$ a equação se torna uma equação parabólica clássica. Esse tipo de equação com sinal "trocado" aparece comumente em problemas de otimização. É o problema dual ao de evolução para frente.

Bom, mas o que isso significa no nosso caso? A ideia é que podemos impor uma *condição final*
$$
u(T, x) = \Phi(x),
$$
para o momento desejado $\Phi$, em seguida resolver "para trás no tempo" para obter $u(\tau, \xi)$ e encontrar o desejado valor esperado
$$
\mathbb{E}[\Phi(X_T); X_\tau = \xi] = \mathbb{E}[u(T, X_T); X_\tau = \xi] = u(\tau, \xi).
$$

Em resumo, considerando a equação diferencial estocástica
$$
\mathrm{d}X_t = f(X_t)\;\mathrm{d}t + g(X_t)\;\mathrm{d}W_t,
$$
com condição inicial
$$
X_\tau = \xi
$$
dada em um instante $\tau\in\mathbb{R}$, podemos encontrar o momento
$$
\mathbb{E}[\Phi(X_T); X_\tau = \xi]
$$
em um instante futuro $T > \tau$, para alguma $\Phi$ dada, resolvendo a EDP
$$
u_t(t, x) + u_x(t, x)f(x) = - \frac{1}{2}u_{xx}(t, x)g(x)^2,
$$
no intervalo $\tau \leq t \leq T$, em $x\in \mathbb{R}$, dada a condição *final*
$$
u(T, x) = \Phi(x),
$$
em $x\in\mathbb{R},$ e encontrando
$$
\mathbb{E}[\Phi(X_T); X_\tau = \xi] = u(\tau, \xi).
$$

Essa é a **fórmula de Feynman-Kac.**

Esta foi a visão de Mark Kac, um probabilista americano. Feynman, por sua vez, buscava o caminho contrário, ou seja, resolver equações da mecânica quântica, através de caminhos, com suas integrais de caminho *(path integrals),* com o agravante dessas equações serem complexas. A formulação acima, de Feynman-Kac, é feita rigorosa no contexto real.

## Equação retrógrada de Kolmogorov

A fórmula de Feynman-Kac é baseada na equação
$$
u_t(t, x) + f(x)u_x(t, x) + \frac{1}{2}g(x)^2u_{xx}(t, x) = 0.
$$
Essa equação está diretamente relacionada à equação retrógrada de Kolmogorov, dada por
$$
v_t(t, x) = f(x)v_x(t, x) + \frac{1}{2}g(x)^2v_{xx}(t, x),
$$
com condição inicial
$$
v(0, x) = \Phi(x).
$$
Observe a diferença de sinal. Essa equação foi obtida por Kolmogorov (posteriormente e de maneira independente) para a função $v=v(t,x)$ definida por (considerando $\tau = 0$)
$$
v(t, x) = \mathbb{E}\left[ \Phi(X_t); X_0 = x\right]
$$
Note que
$$
v(0, x) = \mathbb{E}\left[\Phi(X_0); X_0 = x\right] = \Phi(x) = u(T, x).
$$
e que
$$
v(T, x) = \mathbb{E}\left[ \Phi(X_T); X_0 = x\right] = u(0, x).
$$
Pela EDP, vemos que
$$
v(t, x) = u(T - t, x).
$$
Ou seja, $v=v(t, x),$ em si, evolui para frente no tempo, mas representa uma evolução retrógrada. (Vale ressaltar que, em alguns textos, a equação denominada de equação retrógrada de Kolmogorov é aquela para $u$, mas a maioria a considera como sendo a equação para $v$.) Ou seja, é apenas uma outra maneira de ver a equação de Feynman-Kac.
