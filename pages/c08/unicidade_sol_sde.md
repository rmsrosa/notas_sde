@def title = "Unicidade de soluções"

# {{ get_title }}

Como visto anteriormente, um processo de Wiener não é único, assim como podemos ter várias variáveis aleatórias independentes, com a mesma distribuição.

Agora, uma vez definido um processo de Wiener $\{W_t\}_{t \geq 0},$ podemos ter, sob as devidas condições nos termos $f=f(t, x)$ e $g = g(t, x),$ a unicidade do processo estocástico $\{X_t\}_{t \geq 0}$ definido através da equação diferencial estocástica
$$
\mathrm{d}X_t = f(t, X_t)\;\mathrm{d}t + g(t, X_t)\;\mathrm{d}W_t, \qquad t \geq 0,
$$
com uma condição inicial
$$
\left.X_t\right|_{t = 0} = X_0.
$$

Assim como no caso de equações diferenciais ordinárias determinísticas, uma condição do tipo continuidade Lipschitz nos garante essa continuidade. No caso, a continuidade Lipschitz uniforme em $t$ e global em $x$ dos termos $f = f(t, x)$ e $g = g(t, x)$ que utilizamos para a demonstração de existência é, também, suficiente para a unicidade e para a dependência contínua nos dados iniciais.

A ideia é estimar a evolução temporal da média quadrática entre duas possíveis soluções no instante $t$ e aplicar o Lema de Gronwall para relacionar essa evolução com a média quadrática inicial.

## Continuidade em relação à condição inicial

Sejam $\{X_t\}_{t \geq 0}$ e $\{\tilde X_t\}_{t \geq 0}$ duas soluções da equação diferencial estocástica, com condições iniciais $X_0$ e $\tilde X_0,$ respectivamente. Posteriormente vamos considerar condições iniciais iguais, mas, no momento, permitimos que sejam diferentes.

Considere a média quadrática da diferença entre essas duas soluções, em cada instante $t \geq 0$:
$$
e(t) = \mathbb{E}\left[ |X_t - \tilde X_t|^2 \right]
$$

As formas integrais das equações diferenciais são
$$
X_t = X_0 + \int_0^t f(s, X_s)\;\mathrm{d}s + \int_0^t g(s, X_s)\;\mathrm{d}W_s
$$
e
$$
\tilde X_t = \tilde X_0 + \int_0^t f(s, \tilde X_s)\;\mathrm{d}s + \int_0^t g(s, \tilde X_s)\;\mathrm{d}W_s.
$$

Subtraindo, temos
$$
X_t - \tilde X_t = X_0 - \tilde X_0 + \int_0^t (f(s, X_s) - f(s, \tilde X_s))\;\mathrm{d}s + \int_0^t (g(s, X_s) - g(s, \tilde X_s))\;\mathrm{d}W_s.
$$

Usando que $f$ e $g$ são globalmente Lipschitz em $x,$ uniformemente em $t,$ obtemos
$$
\left| X_t - \tilde X_t \right| \leq \left| X_0 - \tilde X_0 \right| + \int_0^t L_f \left| X_s - \tilde X_s \right| \;\mathrm{d}s + \int_0^t L_g \left| X_s - \tilde X_s \right| \;\mathrm{d}W_s.
$$

Elevando ao quadrado e usando que $(a + b + c)^2 \leq 3a^2 + 3b^2 + 3c^2,$
$$
\left| X_t - \tilde X_t \right|^2 \leq 3\left| X_0 - \tilde X_0 \right|^2 + 3L_f^2\left(\int_0^t \left| X_s - \tilde X_s \right| \;\mathrm{d}s\right)^2 + 3L_g^2\left(\int_0^t \left| X_s - \tilde X_s \right| \;\mathrm{d}W_s\right)^2.
$$
A segunda integral pode ser estimada diretamente, consequência da desigualdade de Cauchy-Schwarz:
$$
\int_0^t \left| X_s - \tilde X_s \right| \;\mathrm{d}s \leq \left(\int_0^t \;\mathrm{d}s\right)^{1/2}\left(\int_0^t \left| X_s - \tilde X_s \right|^2 \;\mathrm{d}s\right)^{1/2},
$$
de modo que
$$
\left(\int_0^t \left| X_s - \tilde X_s \right| \;\mathrm{d}s\right)^2 \leq t\int_0^t \left| X_s - \tilde X_s \right|^2 \;\mathrm{d}s.
$$

Assim, para o valor esperado, obtemos
$$
\begin{align*}
\mathbb{E}\left[\left| X_t - \tilde X_t \right|^2\right] & \leq 3\mathbb{E}\left[\left| X_0 - \tilde X_0 \right|^2\right] \\
& \qquad + 3L_f^2 t \int_0^t \mathbb{E}\left[\left| X_s - \tilde X_s \right|^2\right] \;\mathrm{d}s \\
& \qquad + 3L_g^2\mathbb{E}\left[\left(\int_0^t \left| X_s - \tilde X_s \right| \;\mathrm{d}W_s\right)^2\right].
\end{align*}
$$

O último termo pode ser estimado via isometria de Itô:
$$
\mathbb{E}\left[\left(\int_0^t \left| X_s - \tilde X_s \right| \;\mathrm{d}W_s\right)^2\right] = 
\int_0^t \mathbb{E}\left[\left| X_s - \tilde X_s \right|^2\right] \;\mathrm{d}s.
$$

Dessa forma, obtemos
$$
\mathbb{E}\left[\left| X_t - \tilde X_t \right|^2\right] \leq 3\mathbb{E}\left[\left| X_0 - \tilde X_0 \right|^2\right] + 3(L_f^2 t + L_g^2) \int_0^t \mathbb{E}\left[\left| X_s - \tilde X_s \right|^2\right] \;\mathrm{d}s.
$$

Aplicando o Lema de Grownall, obtemos
$$
\mathbb{E}\left[\left| X_t - \tilde X_t \right|^2\right] \leq \mathbb{E}\left[\left| X_0 - \tilde X_0 \right|^2\right] e^{3(L_f^2 t + L_g^2)t}, \qquad t \geq 0.
$$

## Unicidade

A unicidade, agora, é consequência da estimativa acima, assumindo $X_0 = \tilde X_0$ quase sempre, de maneira que 
$$
\mathbb{E}[|X_0 - \tilde X_0|^2] = 0
$$
e, consequentemente,
$$
\mathbb{E}[|X_t - \tilde X_t|^2] = 0, \qquad t \geq 0.
$$

Como os caminhos $t \mapsto X_t(\omega)$ são contínuos, então
$$
\mathbb{P}\left(\max_{0\leq t \leq T} |X_t - \tilde X_t| > 0\right) = 0.
$$
Em outras palavras,
$$
\mathbb{P}\left(X_t = \tilde X_t, t \geq 0\right) = 1.
$$

## Exemplo de não unicidade

De maneira semelhante ao caso de equações diferenciais ordinárias, equações que envolvem potências de ordem $p$ com $0< p < 1$ são fortes candidatos a não unicidade. Mas por conta da fórmula de Itô, a equação pode ser um pouco mais complicada. Vamos, então, ver o caminho contrário. Considere $X_t = W_t^3$ e vamos ver que equação $\{X_t\}_t$ deve satisfazer. Pela fórmula de Itô com $X_t = h(W_t)$ e $h(w) = w^3,$ temos
$$
\mathrm{d}X_t = \frac{1}{2}h''(W_t)\;\mathrm{d}t + h'(W_t)\;\mathrm{d}W_t
$$
Usando que $h'(w) = 3w^2$ e $h''(w) = 6w$ e que $W_t = X_t^{1/3},$ obtemos
$$
\mathrm{d}X_t = 3X_t^{1/3}\;\mathrm{d}t + 2X_t^{2/3}\;\mathrm{d}W_t.
$$
Observe que
$$
X_0 = W_0^3 = 0.
$$

Por outro lado, definindo $\tilde X_t = 0,$ para todo $t \geq 0,$ vemos que $\{X_t\}_t$ satisfaz trivialmente a mesma equação e com a mesma condição inicial $\tilde X_0 = 0.$ Isso mostra a não unicidade de solução da equação acima.
