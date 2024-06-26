@def title = "O método de Milstein"

# {{ get_title }}

Vimos que o método de Euler-Maruyama para equações estocásticas multiplicativas é de ordem forte $1/2$, ao contrário do método de Euler clássico, que é de ordem $1$. É natural buscarmos de métodos de ordem mais alta também para equações estocásticas. Vamos ver, aqui, o método de Milstein, que é de ordem forte $1$.

Para simplificar, vamos considerar equações diferenciais estocásticas *autônomas,* da forma
$$
\mathrm{d}X_t = f(X_t)\;\mathrm{d}t + g(X_t)\;\mathrm{d}W_t.
$$
Mas o caso não autônomo pode ser tratado de forma análoga. Vamos considerar, ainda, uma condição inicial
$$
\left. X_t \right|_{t = 0} = X_0.
$$

## Expansão de Taylor estocástica

A equação diferencial estocástica é interpretada como significando
$$
X_t = X_0 + \int_0^t f(X_s)\;\mathrm{d}s + \int_0^t g(X_s)\;\mathrm{d}W_s.
$$
A partir de um determinado ponto $t_0 \geq 0$, podemos escrever
$$
X_t = X_{t_0} + \int_{t_0}^t f(X_s)\;\mathrm{d}s + \int_{t_0}^t g(X_s)\;\mathrm{d}W_s.
$$

A ideia é usar a isometria de Itô para reescrever os integrandos acima e obter uma expansão da solução nos pontos da malha.

Pela isometria de Itô, temos
$$
\mathrm{d}f(X_t) = f'(X_t)\;\mathrm{d}X_t + \frac{1}{2}f''(X_t)\;\mathrm{d}t = f'(X_t)f(X_t)\;\mathrm{d}t + f'(X_t)g(X_t)\;\mathrm{d}W_t + \frac{1}{2}f''(X_t)g(X_t)^2\;\mathrm{d}t.
$$
e
$$
\mathrm{d}g(X_t) = g'(X_t)\mathrm{d}X_t + \frac{1}{2}g''(X_t)\;\mathrm{d}t = g'(X_t)f(X_t)\;\mathrm{d}t + g'(X_t)g(X_t)\;\mathrm{d}W_t + \frac{1}{2}g''(X_t)g(X_t)^2\;\mathrm{d}t.
$$

A partir do ponto $t_0$, obtemos
$$
f(X_s) = f(X_{t_0}) + \int_{t_0}^s f'(X_s)f(X_s)\;\mathrm{d}s + \int_{t_0}^s f'(X_s)g(X_s)\;\mathrm{d}W_s + \int_{t_0}^s \frac{1}{2}f''(X_s)g(X_s)^2\;\mathrm{d}s
$$
e
$$
g(X_s) = g(X_{t_0}) + \int_{t_0}^s g'(X_s)f(X_s)\;\mathrm{d}s + \int_{t_0}^s g'(X_s)g(X_s)\;\mathrm{d}W_s + \int_{t_0}^s \frac{1}{2}g''(X_s)g(X_s)^2\;\mathrm{d}s.
$$

Substituindo essas expressões para $f(X_s)$ e $g(X_s)$ na equação integral para $\{X_t\}_t$, obtemos
$$
X_t = X_{t_0} + \int_{t_0}^t f(X_{t_0})\;\mathrm{d}s + \int_{t_0}^t g(X_{t_0})\;\mathrm{d}W_s + R_{t_0, t},
$$
onde o resto $R_{t_0, t}$ é dado por
$$
R_{t_0, t} = R_{t_0, t}^f + R_{t_0, t}^g,
$$
com
$$
R_{t_0, t}^f = \int_{t_0}^{t} \left(\int_{t_0}^s \left(f'(X_\tau)f(X_\tau) + \frac{1}{2}f''(X_\tau)g(X_\tau)^2\right)\;\mathrm{d}\tau + \int_{t_0}^\tau f'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\right)\;\mathrm{d}s
$$
e
$$
R_{t_0, t}^g = \int_{t_0}^{t} \left(\int_{t_0}^s \left(g'(X_\tau)f(X_\tau) + \frac{1}{2}g''(X_\tau)g(X_\tau)^2\right)\;\mathrm{d}\tau + \int_{t_0}^s g'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\right)\;\mathrm{d}W_s.
$$

Cada termo tem uma determinada ordem de grandeza em termos de $\mathrm{d}t$ e $\mathrm{d}W_t$. Como $\mathrm{d}W_t \sim \sqrt{\mathrm{d}t}$, as diferentes integrais presentes na expansão não têm a mesma ordem. Podemos dizer que, em uma aproximação com passo $\Delta t = t - t_0$, as integrais simples tem ordem
$$
\int_{t_0}^t f(X_s)\;\mathrm{d}s \sim \Delta t
$$
e
$$
\int_{t_0}^t g(X_s)\;\mathrm{d}W_s \sim \Delta t^{1/2}.
$$

Por sua vez, as integrais duplas presentes na expansão desses dois termos têm ordem
$$
\begin{align*}
& \int_{t_0}^t \int_{t_0}^s F(X_\tau) \;\mathrm{d}\tau \;\mathrm{d}s \sim \Delta t^2. \\
& \int_{t_0}^t \int_{t_0}^s F(X_\tau) \;\mathrm{d}W_\tau \;\mathrm{d}s \sim \Delta t^{3/2} \\
& \int_{t_0}^t \int_{t_0}^s F(X_\tau) \;\mathrm{d}W_\tau \;\mathrm{d}W_s \sim \Delta t.
\end{align*}
$$
Assim, podemos, de acordo com o objetivo, expandir $F(X_\tau)$ apenas em alguns termos, de ordem mais baixa, começando pela integral estocástica dupla.

## Expansão nos pontos da malha

Em pontos $t_j = jT/n$, $j = 0, 1, \ldots, n$, podemos escrever
$$
X_{t_j} = X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_s)\;\mathrm{d}s + \int_{t_{j-1}}^{t_j} g(X_s)\;\mathrm{d}W_s.
$$

Substituindo $f(X_s)$ e $g(X_s)$ de acordo com a fórmula de Itô a partir de um ponto $t_{j-1}$ da malha, obtemos
$$
X_{t_j} = X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_{t_{j-1}})\;\mathrm{d}s + \int_{t_{j-1}}^{t_j} g(X_{t_{j-1}})\;\mathrm{d}W_s + R_j,
$$
onde o resto $R_j$ é dado por
$$
\begin{align*}
R_j & = \int_{t_{j-1}}^{t_j} \left(\int_{t_{j-1}}^s \left(f'(X_\tau)f(X_\tau) + \frac{1}{2}f''(X_\tau)g(X_\tau)^2\right)\;\mathrm{d}\tau + \int_{t_{j-1}}^s f'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\right)\;\mathrm{d}s \\
& \qquad + \int_{t_{j-1}}^{t_j} \left(\int_{t_{j-1}}^s \left(g'(X_\tau)f(X_\tau) + \frac{1}{2}g''(X_\tau)g(X_\tau)^2\right)\;\mathrm{d}\tau + \int_{t_{j-1}}^s g'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\right)\;\mathrm{d}W_s.
\end{align*}
$$

## Revisitando o método de Euler-Maruyama

Observe que a aproximação para o método de Euler-Maruyama é obtida ao descartarmos completamente o resto $R_j$, ficando, apenas
$$
X_{t_j} \approx X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_{t_{j-1}})\;\mathrm{d}s + \int_{t_{j-1}}^{t_j} g(X_{t_{j-1}})\;\mathrm{d}W_s = X_{t_{j-1}} + f(X_{t_{j-1}})\Delta t + g(X_{t_{j-1}}) \Delta W_{j-1},
$$
onde $\Delta W_{j-1} = W_{t_j} - W_{t_{j-1}}$.

Isso nos leva ao **método de Euler-Maruyama**
$$
X_j = X_{j-1} + f(X_{j-1}) \Delta t + g(X_{j-1})\Delta W_{j-1}, \qquad j = 1, \ldots, n,
$$
com $X_0$ dado.

Em termos da aproximação, podemos escrever
$$
\int_{t_0}^t f(X_s)\;\mathrm{d}s = f(X_{t_0})\Delta t + \mathcal{O}(\Delta t^{3/2})
$$
e
$$
\int_{t_0}^t g(X_s)\;\mathrm{d}W_s = g(X_{t_0})\Delta t^{1/2} + \mathcal{O}(\Delta t)
$$

A integral em $f$ tem uma ordem mais alta do que a em $g$, mas não podemos descartá-la por completo, pois a aproximação em $f$ cairia para ordem zero, na verdade (Pense em aproximar a função $f(t) = t = \int_0^t \;\mathrm{d}s$ por zero, $\tilde f(t) = 0$, em que cada passo $\int_t^{\Delta t} \;\mathrm{d}s = \Delta t$ mas, após a integração em um intervalo $0\leq t \leq 1,$ o erro é $f(1) - \tilde f(1) = 1 - 0 = 1$). Temos que aproximar os dois termos até uma ordem mínima desejada.

## O método de Milstein

Para o método de Milstein, vamos reter o termo de ordem mais baixa do resto $R_j$, que é o termo com a integral estocástica dupla:
$$
\int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s g'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\;\mathrm{d}W_s.
$$

Considerando $u(x) = g'(x)g(x)$ e aplicando a isometria de Itô a $\{u(X_t)\}_{t \geq 0}$, obtemos
$$
g'(X_\tau)g(X_\tau) = g'(X_{t_{j-1}})g(X_{t_{j-1}}) + \int_{t_{j-1}}^\tau \mathrm{d}u(X_\eta),
$$
com
$$
\begin{align*}
\mathrm{d}u(X_t) & = u'(X_t)\;\mathrm{d}X_t + \frac{1}{2}u''(X_t)g(X_t)^2\;\mathrm{d}t \\
& = (g''(X_t)g(X_t) + g'(X_t)^2)f(X_t)\;\mathrm{d}t \\
& \qquad + (g''(X_t)g(X_t) + g'(X_t)^2)g(X_t)\;\mathrm{d}W_t \\
& \qquad + \frac{1}{2}(g'''(X_t)g(X_t) + 3g''(X_t)g'(X_t) + g'(X_t)^3)g(X_t)^2\;\mathrm{d}t.
\end{align*}
$$
Isso implica em
$$
\int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s g'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\;\mathrm{d}W_s = \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s g'(X_{t_{j-1}})g(X_{t_{j-1}})\;\mathrm{d}W_\tau\;\mathrm{d}W_s + \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \int_{t_{j-1}}^\tau \;\mathrm{d}u(X_\eta)\;\mathrm{d}W_\tau\;\mathrm{d}W_s,
$$
que nos leva à expansão
$$
X_{t_j} = X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_{t_{j-1}})\;\mathrm{d}s + \int_{t_{j-1}}^{t_j} g(X_{t_{j-1}})\;\mathrm{d}W_s + g'(X_{t_{j-1}})g(X_{t_{j-1}})\int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \;\mathrm{d}W_\tau\;\mathrm{d}W_s + \tilde R_j,
$$
com um resto $\tilde R_j$ contendo a integral tripla no lugar da integral estocástica dupla. Descartando o resto $\tilde R_j$, obtemos o aproximação utilizada no método de Milstein
$$
\begin{align*}
X_{t_j} & \approx X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_{j-1})\;\mathrm{d}s + \int_{t_{j-1}}^{t_j} g(X_{j-1})\;\mathrm{d}W_s + \int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s g'(X_{t_{j-1}})g(X_{t_{j-1}})\;\mathrm{d}W_\tau\;\mathrm{d}W_s \\
& = X_{t_{j-1}} + f(X_{j-1})\Delta t + g(X_{j-1}) (W_{t_j} - W_{t_{j-1}}) + g'(X_{t_{j-1}})g(X_{t_{j-1}})\int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \;\mathrm{d}W_\tau\;\mathrm{d}W_s.
\end{align*}
$$

Nesse caso em particular, a integral estocástica dupla pode ser calculada mais explicitamente. De fato, a integral interior é simplesmente
$$
\int_{t_{j-1}}^s \;\mathrm{d}W_\tau = W_s - W_{t_{j-1}}.
$$
Assim,
$$
\int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \;\mathrm{d}W_\tau\;\mathrm{d}W_s = \int_{t_{j-1}}^{t_j} (W_s - W_{t_{j-1}})\;\mathrm{d}W_s.
$$
Podemos usar a propriedade de invariância por translação dos processos de Wiener, que diz que $\{\tilde W_\tau\}_{\tau \geq 0}$ dado por $\tilde W_\tau = W_{t_{j-1} + \tau} - W_{t_{j-1}}$ também é um processo de Wiener, para escrever
$$
\int_{t_{j-1}}^{t_j} (W_s - W_{t_{j-1}})\;\mathrm{d}W_s = \int_{0}^{\Delta t} \tilde W_\tau\;\mathrm{d}\tilde W_\tau = \frac{\tilde W_{\Delta t}^2}{2} - \frac{\Delta t}{2} = \frac{(W_{t_j} - W_{t_{j-1}})^2}{2} - \frac{\Delta t}{2}.
$$
Ou, mais diretamente,
$$
\begin{align*}
\int_{t_{j-1}}^{t_j} \int_{t_{j-1}}^s \;\mathrm{d}W_\tau\;\mathrm{d}W_s & = \int_{t_{j-1}}^{t_j} (W_s - W_{t_{j-1}})\;\mathrm{d}W_s \\
& = \int_{t_{j-1}}^{t_j} W_s \;\mathrm{d}W_s - \int_{t_{j-1}}^{t_j} W_{t_{j-1}}\;\mathrm{d}W_s \\
& = \frac{1}{2}\left(W_{t_j}^2 - W_{t_{j-1}}^2 - t_j + t_{j-1} \right) - W_{t_{j-1}}\left(W_{t_j} - W_{t_{j-1}}\right) \\
& = \frac{1}{2}\left((W_{t_j} + W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) - t_j + t_{j-1} \right) - W_{t_{j-1}}\left(W_{t_j} - W_{t_{j-1}}\right) \\
& = \frac{1}{2}\left((W_{t_j} + W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) - 2W_{t_{j-1}}\left(W_{t_j} - W_{t_{j-1}}\right) \right) - \frac{\Delta t}{2} \\
& = \frac{1}{2}\left(W_{t_j} - W_{t_{j-1}}\right)^2 - \frac{\Delta t}{2}
\end{align*}
$$
De um jeito ou de outro, podemos escrever
$$
\int_{t_{j-1}}^{t_j} (W_s - W_{t_{j-1}})\;\mathrm{d}W_s = \frac{\Delta W_{j-1}^2}{2} - \frac{\Delta t}{2},
$$
onde $\Delta W_{j-1} = W_{t_j} - W_{t_{j-1}}$. Dessa forma, obtemos aproximação
$$
X_{t_j} \approx X_{t_{j-1}} + f(X_{j-1})\Delta t + g(X_{j-1}) \Delta W_{j-1} + \frac{1}{2}g'(X_{t_{j-1}})g(X_{t_{j-1}})\left(\Delta W_{j-1}^2 - \Delta t\right),
$$
Isso nos leva ao **método de Milstein**
$$
X_j = X_{j-1} + f(X_{j-1}) \Delta t + g(X_{j-1})\Delta W_{j-1} + \frac{1}{2}g'(X_{j-1})g(X_{j-1})\left(\Delta W_{j-1}^2 - \Delta t\right), \qquad j = 1, \ldots, n,
$$
com $X_0$ dado. Mais explicitamente, como $\Delta W_{j-1} \sim \sqrt{\Delta t} \mathcal{N}(0, 1)$, escrevemos
$$
X_j = X_{j-1} + f(X_{j-1}) \Delta t + g(X_{j-1})Z_{j-1}\sqrt{\Delta t} + \frac{1}{2}g'(X_{j-1})g(X_{j-1})\left(Z_{j-1}^2 - 1 \right)\Delta t, \qquad j = 1, \ldots, n,
$$
onde $Z_i \sim \mathcal{N}(0, 1)$ são independentes.

## Ordem de convergência do método de Milstein

Não faremos as estimativas rigorosas aqui, mas, como dito acima, pode-se mostrar que o método de Milstein tem ordem forte $1$ e ordem fraca $1$, também.
