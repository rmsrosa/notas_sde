@def title = "Convergência fraca do método de Euler-Maruyama"

# {{ get_title }}

Para a convergência fraca, buscamos mostrar que
$$
\max_{j=1, \ldots, n} |\mathbb{E}[\Phi(X_{t_j})] - \mathbb{E}[\Phi(X_j^n)]| \rightarrow 0,
$$
quando $n\rightarrow \infty,$ para uma classe apropriada de funções $\Phi.$ Mais ainda, buscamos estimar a ordem de convergência. Faremos isso no caso do método de Euler-Maruyama, mostrando a convergência de ordem 1, sob hipóteses adequadas nos termos da equação.

## Contexto

Para simplificar, consideramos uma equação estocástica autônoma, ou seja,
$$
\mathrm{d}X_t = f(X_t)\;\mathrm{d}t + g(X_t)\;\mathrm{d}W_t,
$$
com condição inicial determinística
$$
X_0 = x_0.
$$

## Convergência forte implica em convergência fraca

Suponha que tenhamos a convergência forte, em média quadrática, de ordem $p$, de alguma aproximação $\{X_j^n\}_j$ da solução $\{X_t\}_t$. Nesse caso,
$$
\max_{j=0, \ldots, n} \mathbb{E}[|X_{t_j} - X_j^n|^2] \leq C^2\Delta t^{2p},
$$
para $C, p \geq 0$ apropriados. Suponha ainda que $\Phi$ (ou uma classe de tais funções) satisfaça
$$
|\Phi(x) - \Phi(y)| \leq L(1 + |x|^k + |y|^k)|x - y|,
$$
para certos $L, k\geq 0$. Nesse caso, podemos estimar o erro fraco da seguinte forma.
$$
\begin{align*}
\left|\mathbb{E}[\Phi(X_{t_j})] - \mathbb{E}[\Phi(X_j^n)] \right| & \leq \mathbb{E}\left[|\Phi(X_{t_j}) -\Phi(X_j^n)|\right] \\
& \leq L\mathbb{E}\left[ (1 + |X_{t_j}|^k + |X_j^n|^k)|X_{t_j} - X_j^n|\right] \\
& \leq L\mathbb{E}\left[ (1 + |X_{t_j}|^k + |X_j^n|^k)^2\right]^{1/2}\mathbb{E}\left[|X_{t_j} - X_j^n|^2\right]^{1/2}
\end{align*}
$$
Supondo que os momentos de ordem $k$ da solução e da aproximação sejam limitados, obtemos um $K>0$ tal que
$$
\left|\mathbb{E}[\Phi(X_{t_j})] - \mathbb{E}[\Phi(X_j^n)] \right| \leq LK\mathbb{E}\left[|X_{t_j} - X_j^n|^2\right]^{1/2} \leq LKC \Delta t^p,
$$
mostrando a convergência fraca também de ordem $p$.

No entanto, é possível estimar a ordem fraca de maneira diferente e, em muitos casos, conseguir a convergência fraca com uma ordem de convergência melhor ou mesmo obter convergência fraca sem que haja convergência forte.

## Fórmula de Feynman-Kac

Em muitos casos práticos, conhecemos o valor atual de um $X_\tau = \xi$ de um processo estocástico e queremos estimar o valor esperado $\mathbb{E}[X_T]$ em um tempo futuro $T > \tau,$ ou, mais geralmente, $\mathbb{E}[\Phi(X_T)],$ para algum momento $\Phi.$ O objetivo é fazer isso através de uma função $u=u(t, x)$ que seja solução de uma equação a derivadas parciais (EDP) apropriada.

Observe que, pela fórmula de Itô,
$$
\begin{align*}
u(T, X_T) & = u(\tau, X_\tau) + \int_\tau^T \left(u_t(t, X_t) + u_x(t, X_t)f(X_t) + \frac{1}{2}u_{xx}(t, X_t)g(X_t)^2\right)\;\mathrm{d}t \\
& \qquad + \int_\tau^T u_x(t, X_t)g(X_t)\;\mathrm{d}W_t.
\end{align*}
$$

Ao tomarmos o valor esperado, usando que $X_\tau = \xi$ e que a integral estocástica tem esperança zero, obtemos
$$
\mathbb{E}[u(T, X_T)] = u(\tau, \xi) + \int_\tau^T \mathbb{E}\left[ u_t(t, X_t) + u_x(t, X_t)f(X_t) + \frac{1}{2}u_{xx}(t, X_t)g(X_t)^2\right]\;\mathrm{d}t.
$$

A esperança no integrando acima é, em geral, de difícil cálculo. A ideia é considerar uma EDP em que esse termo se anule, ou seja, considerar $u(t, x)$ tal que
$$
u_t(t, x) + u_x(t, x)f(x) + \frac{1}{2}u_{xx}(t, x)g(x)^2 = 0.
$$
Para essa $u=u(t, x),$ obtemos
$$
\mathbb{E}[u(T, X_T)] = u(\tau, \xi).
$$

Observe que a equação para $u$ parece uma equação do calor mas está com o sinal "trocado". Isso implica em ela ser mal posta. Mas isso no modo clássico de resolvê-la para a frente. Ela está bem posta ao buscarmos resolvê-la para trâs no tempo. Mais precisamente, ao fazermos a mudança de variável $t \mapsto -t,$ a equação se torna uma equação parabólica clássica. Esse tipo de equação com sinal "trocado" aparece comumente em problemas de otimização. É o problema dual ao de evolução para frente.

Bom, mas o que isso significa no nosso caso? A ideia é que podemos impor uma *condição final*
$$
u(T, x) = \Phi(x),
$$
para o momento desejado $\Phi$, em seguida resolver "para trás no tempo" para obter $u(\tau, \xi)$ e encontrar o desejado valor esperado
$$
\mathbb{E}[\Phi(X_T)] = \mathbb{E}[u(T, X_T)] = u(\tau, \xi).
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
\mathbb{E}[\Phi(X_T)]
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
\mathbb{E}[\Phi(X_T)] = u(\tau, \xi).
$$

Essa é a **fórmula de Feynman-Kac.**

Esta foi a visão de Mark Kac, um probabilista americano. Feynman, por sua vez, buscava o caminho contrário, ou seja, resolver equações da mecânica quântica, através de caminhos, com suas integrais de caminhos *(path integrals),* com o agravante dessas equações serem complexas. A formulação acima, de Feynman-Kac, é feita rigorosa no contexto real.

## Erro fraco

O que a fórmula de Feynman-Kac tem a ver com o erro fraco? No erro fraco, queremos estimar
$$
\max_{j=1, \ldots, n} |\mathbb{E}[\Phi(X_{t_j})] - \mathbb{E}[\Phi(X_j^n)]|.
$$
Para simplificar, podemos olhar para o erro fraco só no instante final, $j = n$, em que $t_j = t_n = T$ e o erro se torna
$$
|\mathbb{E}[\Phi(X_T)] - \mathbb{E}[\Phi(X_n^n)]|.
$$

A ideia é aplicar a fórmula de Itô à interpolação linear da aproximação definida por
$$
\hat X_t = X_0 + \int_0^t f(X_{\tau^n(s)}) \;\mathrm{d}s + \int_0^t g(X_{\tau^n(s)})\;\mathrm{d}W_s, \quad t \geq 0,
$$
onde $\tau^n$ é a função de malha
$$
\tau^n(s) = \max\{t_j \leq s, j = 0, \ldots, n\},
$$
definida para $s\geq 0.$ Para facilitar a notação, vamos considerar, também, a interpolação constante por partes
$$
\bar X_t = X_{\tau^n(t)}, \quad t \geq 0.
$$
Assim, podemos escrever
$$
\hat X_t = X_0 + \int_0^t f(\bar X_s) \;\mathrm{d}s + \int_0^t g(\bar X_s)\;\mathrm{d}W_s.
$$

Pela fórmula de Itô,
$$
\begin{align*}
u(T, \hat X_T) & = u(0, \hat X_0) + \int_0^T \left(u_t(t, \hat X_t) + u_x(t, \hat X_t)f(\bar X_t) + \frac{1}{2}u_{xx}(t, \hat X_t)g(\bar X_t)^2\right)\;\mathrm{d}t \\
& \qquad + \int_0^T u_x(t, \hat X_t)g(\bar X_t)\;\mathrm{d}W_t.
\end{align*}
$$

De acordo com a EDP,
$$
u_t(t, \hat X_t) = - u_x(t, \hat X_t)f(\hat X_t) - \frac{1}{2}u_{xx}(t, \hat X_t)g(\hat X_t)^2.
$$
Substituindo o primeiro termo do integrando por essa expressão do lado direito, obtemos
$$
\begin{align*}
u(T, \hat X_T) & = u(0, \hat X_0) + \int_0^T \left(u_x(t, \hat X_t)f(\bar X_t) - u_x(t, \hat X_t)f(\hat X_t)\right)\;\mathrm{d}t \\
& \qquad + \int_0^T \left(\frac{1}{2}u_{xx}(t, \hat X_t)g(\bar X_t)^2 - \frac{1}{2}u_{xx}(t, \hat X_t)g(\hat X_t)^2\right)\;\mathrm{d}t \\
& \qquad + \int_0^T u_x(t, \hat X_t)g(\bar X_t)\;\mathrm{d}W_t.
\end{align*}
$$

Tomando a valor esperado,
$$
\begin{align*}
\mathbb{E}[u(T, \hat X_T)] & = \mathbb{E}[u(0, \hat X_0)] + \int_0^T \mathbb{E}\left[u_x(t, \hat X_t)f(\bar X_t) - u_x(t, \hat X_t)f(\hat X_t)\right]\;\mathrm{d}t \\
& \qquad + \frac{1}{2}\int_0^T \mathbb{E}\left[u_{xx}(t, \hat X_t)g(\bar X_t)^2 - u_{xx}(t, \hat X_t)g(\hat X_t)^2\right]\;\mathrm{d}t
\end{align*}
$$

Por construção,
$$
u(T, \hat X_T) = \Phi(\hat X_T).
$$
Além disso, pela fórmula de Feynman-Kac, como a condição inicial é em $\tau = 0,$ temos
$$
u(0, X_0) = \mathbb{E}[\Phi(X_T)].
$$

Assim,
$$
\begin{align*}
\mathbb{E}[\Phi(\hat X_T)] - \mathbb{E}[\Phi(X_T)] & = \int_0^T \mathbb{E}\left[u_x(t, \hat X_t)f(\bar X_t) - u_x(t, \hat X_t)f(\hat X_t)\right]\;\mathrm{d}t \\
& \qquad + \frac{1}{2}\int_0^T \mathbb{E}\left[u_{xx}(t, \hat X_t)g(\bar X_t)^2 - u_{xx}(t, \hat X_t)g(\hat X_t)^2\right]\;\mathrm{d}t.
\end{align*}
$$

Agora precisamos estimar os erros do lado direito.

A estimativa aparentemente mais natural é usar, novamente, a hipótese de continuidade Lipschitz global de $f$ e $g$ e estimar esses termos em função de $\mathbb{E}[|\hat X_t - \bar X_t|^2]$. Mas, novamente, isso nos levará a mesma ordem da convergência forte, que no caso de Euler-Maruyama é 1/2. Queremos uma estimativa mais esperta, para obter uma estimativa mais precisa da ordem.

Isso é obtido aplicando-se novamente a fórmula de Itô, nesse caso aos integrandos
$$
u_x(t, \hat X_t)(f(\hat X_t) - f(\bar X_t)), \qquad u_{xx}(t, \hat X_t)(g(\hat X_t)^2 - g(\bar X_t)^2).
$$
Em cada subintervalo $[t_{j-1}, t_j]$, temos $\bar X_t = \bar X_{t_{j-1}} = X_{j-1}^n$ constante, de modo que podemos olhar para
$$
e_{j-1}(t, x) = u_x(t, x)(f(x) - f(X_{j-1}^n))
$$
e analogamente para o termo envolvendo $g$. Observe que
$$
e_{j-1}(t_{j-1}, \hat X_{t_{j-1}}) = u_x(t_{j-1}, \hat X_{t_{j-1}})(f(\hat X_{t_{j-1}}) - f(\bar X_{t_{j-1}})) = 0,
$$
já que $\hat X_{t_{j-1}} = \bar X_{t_{j-1}} = X_{j-1}^n$ coincidem. Assim, pela fórmula de Itô,
$$
e_{j-1}(t, \hat X_t) = \int_0^t L_0(s) e_{j-1}(s, \hat X_s) \;\mathrm{d}s + \int_0^t L_1(s) e_{j-1}(s, \hat X_s)\;\mathrm{d}W_s,
$$
onde $L_0(t)$ e $L_1(t)$ são operadores diferenciais definidos por
$$
L_0(t) = \partial_t + f(\hat X_t)\partial_x + \frac{1}{2}g(\hat X_t)^2 \partial_{xx}, \qquad L_1(t) = g(\hat X_t)^2\partial_x.
$$

Ao tomarmos o valor esperado, a integral de Itô, que é o termo problemático de ordem $\Delta t^{1/2}$, desaparece e ficamos apenas com
$$
\mathbb{E}[e_{j-1}(t, \hat X_t)] = \int_{t_{j-1}}^t \mathbb{E}\left[ L_0(s) e_{j-1}(s, \hat X_s)\right] \;\mathrm{d}s.
$$

Assumindo-se que o integrando seja limitado no intervalo $[0, T]$ por uma constante $K_{\Phi, T}$, obtemos a estimativa de ordem 1
$$
\left| \mathbb{E}[e_{j-1}(t, \hat X_t)] \right| \leq K_{\Phi, T} \Delta t.
$$
Idem para o termo em $g$, para o qual assumimos uma limitação com a mesma constante, para simplificar a notação. Isso nos dá, após a integração entre $0$ e $t$, que
$$
\left|\mathbb{E}[\Phi(\hat X_T)] - \mathbb{E}[\Phi(X_T)]\right| \leq 2K_{\Phi, T} \Delta t.
$$
Isso nos dá a convergência fraca do método de Euler-Maruyama.

A limitação uniforme passa por (i) mostrarmos que as normas $L^p$ solução da equação parabólica são controladas pela norma $L^p$ da "condição final" $\Phi$; (ii) por assumirmos que $\Phi$ tem um crescimento polinomial (apropriado para qualquer momento que queiramos estimar); (iii) por mostrarmos que, sob a hipótese de continuidade Lipschitz global de $f$ e $g$, os momentos tanto da solução da equação estocástica quando das aproximações numéricas são controlados pelo momento da condição inicial $X_0$; e, por fim, (iv) por assumirmos que os momentos da condição inicial são finitos. Não entraremos em detalhes nesses itens.
