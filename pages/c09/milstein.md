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

A equação diferencial estocástica é interpretada como sendo
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
\begin{align*}
R_{t_0, t} & = \int_{t_0}^{t} \left(\int_{t_0}^s \left(f'(X_\tau)f(X_\tau) + \frac{1}{2}f''(X_\tau)g(X_\tau)^2\right)\;\mathrm{d}\tau + \int_{t_0}^\tau f'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\right)\;\mathrm{d}s \\
& \qquad + \int_{t_0}^{t} \left(\int_{t_0}^s \left(g'(X_\tau)f(X_\tau) + \frac{1}{2}g''(X_\tau)g(X_\tau)^2\right)\;\mathrm{d}\tau + \int_{t_0}^s g'(X_\tau)g(X_\tau)\;\mathrm{d}W_\tau\right)\;\mathrm{d}W_s.
\end{align*}
$$

Expansões de ordem mais alta podem ser obtidas aplicando o mesmo procedimento aos integrandos no termo de resto $R_{t_0, t}$. Mas observe que, como $\mathrm{d}W_t \sim \sqrt{\mathrm{d}t}$, as diferentes integrais duplas presentes no termo de resto não têm a mesma ordem. Podemos dizer que, em uma aproximação com passo $\Delta t = t - t_0$, 
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
X_{t_j} \approx X_{t_{j-1}} + \int_{t_{j-1}}^{t_j} f(X_{t_{j-1}})\;\mathrm{d}s + \int_{t_{j-1}}^{t_j} g(X_{t_{j-1}})\;\mathrm{d}W_s = X_{t_{j-1}} + f(X_{t_{j-1}})\Delta t + g(X_{t_{j-1}}) \Delta W_j,
$$
onde $\Delta W_j = W_{t_j} - W_{t_{j-1}}$.

Isso nos leva ao **método de Euler-Maruyama**
$$
X_j = X_{j-1} + f(X_{j-1}) \Delta t + g(X_{j-1})\Delta W_j, \qquad j = 1, \ldots, n,
$$
com $X_0$ dado.

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

Nesse caso em particula, a integral estocástica dupla pode ser calculada mais explicitamente. De fato, a integral interior é simplesmente
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
\int_{t_{j-1}}^{t_j} (W_s - W_{t_{j-1}})\;\mathrm{d}W_s = \frac{\Delta W_j^2}{2} - \frac{\Delta t}{2},
$$
onde $\Delta W_j = W_{t_j} - W_{t_{j-1}}$. Dessa forma, obtemos aproximação
$$
X_{t_j} \approx X_{t_{j-1}} + f(X_{j-1})\Delta t + g(X_{j-1}) \Delta W_j + \frac{1}{2}g'(X_{t_{j-1}})g(X_{t_{j-1}})\left(\Delta W_j^2 - \Delta t\right),
$$
Isso nos leva ao **método de Milstein**
$$
X_j = X_{j-1} + f(X_{j-1}) \Delta t + g(X_{j-1})\Delta W_j + \frac{1}{2}g'(X_{j-1})g(X_{j-1})\left(\Delta W_j^2 - \Delta t\right), \qquad j = 1, \ldots, n,
$$
com $X_0$ dado.

## Ordem de convergência do método de Milstein

Não faremos as estimativas aqui, mas, como dito acima, pode-se mostrar que o método de Milstein tem ordem forte $1$ e ordem fraca $1$, também.
