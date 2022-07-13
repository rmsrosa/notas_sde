@def title = "Fórmula de Itô"

# {{ get_title }}

Uma outro propriedade fundamental da integral de Itô diz respeito a uma fórmula relacionada a mudanças de variáveis.

Considere um processo real $\{X_t\}_{t \geq 0}$ e uma função real contínua $u:\mathbb{R} \rightarrow \mathbb{R}$. Podemos definir um outro processo $\{Y_t\}_{t \geq 0}$ através de
$$
Y_t = u(X_t).
$$

A questão é sobre a relação entre $\mathrm{d}Y_t$ e $\mathrm{d}X_t$. Se $u$ e $\{X_t\}_{t \geq 0}$ fossem diferenciáveis, então teríamos
$$
\frac{\mathrm{d}Y_t}{\mathrm{d}t} = u'(X_t)\frac{\mathrm{d}X_t}{\mathrm{d}t}.
$$

Mesmo que $\{X_t\}_{t \geq 0}$ fosse apenas de variação limitada, então $\{Y_t\}_{t \geq 0}$ também seria de variação limitada e ainda poderíamos dizer que $\mathrm{d}Y_t = u'(X_t)\mathrm{d}X_t$, no sentido de integral de Riemann-Stieltjes.

Mas e no caso em que $X_t$ não é nem de variação limitada? Se supusermos que ele seja um *processo de Itô*, ou seja, que satisfaça uma equação da forma
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
então teremos uma correção na fórmula de mudança de variáveis, nos levando à *fórmula de Itô*, que, nesse caso autônomo, tem a forma:
$$
\mathrm{d}Y_t = u'(X_t) \;\mathrm{d}X_t + \frac{1}{2} B_t^2 u''(X_t)\;\mathrm{d}t. 
$$

Essa mesma análise pode ser feita no caso em que $u$ depende também da variável temporal, i.e. $u:[0, \infty) \times \mathbb{R} \rightarrow \mathbb{R}$. Nesse caso, temos
$$
Y_t = u(t, X_t).
$$
Denotamos o primeiro caso por *autônomo* e este, por *não-autônomo.*  No caso não-autônomo, a *fórmula de Itô* se torna
$$
\mathrm{d}Y_t = u_t(t, X_t)\;\mathrm{d}t + u_x(t, X_t)\;\mathrm{d}X_t + \frac{1}{2} u_{xx} B_t^2\;\mathrm{d}t.
$$

Observe que, em ambos os casos, se $B_t = 0$, para todo $t$, então $\{X_t\}_{t \geq 0}$ se reduz a um processo com caminhos diferenciáveis e recuperamos a fórmula clássica.

## Processo de Itô

Como dito acima, um **processo de Itô** é um processo $\{X_t\}_{t \geq 0}$ satisfazendo uma equação estocástica da forma
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
onde $\{W_t\}_{t \geq 0}$ é um processo de Wiener e $\{A_t\}_{t \geq 0}$ e $\{B_t\}_{t \geq 0}$ são não-antecipativos em relação ao processo de Wiener.

## Fórmula de Itô no caso autônomo

Considere, então, uma malha temporal $0 = t_0 < t_1 < \cdots < t_n = T$ com $\max_{j=1, \ldots, n}\{t_j  - t_{j-1}\} \rightarrow 0$. Escrevemos
$$
Y_t = Y_0 + \sum_{j = 1}^n (Y_{t_j} - Y_{t_{j-1}}).
$$

Assumindo, agora, que $u$ seja duas vezes continuamente diferenciável, podemos escrever
$$
\begin{align*}
Y_{t_j} - Y_{t_{j-1}} = u(X_{t_j}) - u(X_{t_{j-1}}) & = u'(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}}) + \int_{X_{t_{j-1}}}^{X_{t_j}} u''(x)(X_{t_j} - x) \;\mathrm{d}x \\
& = u'(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}}) \\
& \qquad + \frac{1}{2}u''(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}})^2 \\
&  \qquad + \int_{X_{t_{j-1}}}^{X_{t_j}} (u''(x) - u''(X_{t_{j-1}}))(X_{t_j} - x) \;\mathrm{d}x.
\end{align*}
$$
Assim,
$$
\begin{align*}
Y_T - Y_0 & = \sum_{j=1}^n u'(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}}) \\
& \qquad + \frac{1}{2} \sum_{j=1}^n u''(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}})^2 \\
& \qquad + \sum_{j=1}^n \int_{X_{t_{j-1}}}^{X_{t_j}} (u''(x) - u''(X_{t_{j-1}}))(X_{t_j} - x) \;\mathrm{d}x.
\end{align*}
$$

No limite de refinamento da malha, o primeiro termo converge para a integral de Itô de $\{X_t\}_{t \geq 0}$, com respeito a si mesmo. O último termo converge para zero, graças à continuidade da segunda derivada de $u = u(x)$. Em relação ao segundo termo, temos
$$
\begin{align*}
(X_{t_j} - X_{t_{j-1}})^2 & \approx \left(A_{t_{j-1}}(t_j - t_{j-1}) + B_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}) \right)^2 \\
& \approx A_{t_{j-1}}^2(t_j - t_{j-1})^2 + 2A_{t_{j-1}}B_{t_{j-1}}(t_j - t_{j-1})(W_{t_j} - W_{t_{j-1}}) + B_{t_{j-1}}^2(W_{t_j} - W_{t_{j-1}})^2
\end{align*}
$$
Ao somarmos e tomarmos o limite, os dois primeiros termos se anulam, pois contém um $\Delta t$ extra que converge para zero. Mais precisamente, no primeiro termo, vale, quase certamente,
$$
\left|\frac{1}{2}\sum_{j=1}^n u''(X_{t_{j-1}}) A_{t_{j-1}}^2(t_j - t_{j-1})^2\right| \leq \frac{1}{2}\max |u''| \max_j|t_j - t_{j-1}| \sum_{j=1}^n A_{t_{j-1}}^2(t_j - t_{j-1}) \rightarrow 0 \times \int_0^T A_t^2 \;\mathrm{d}t = 0.
$$
No segundo termo, em média quadrática, temos, como na isometria de Itô,
$$
\begin{align*}
\mathbb{E}\left[\left|\frac{1}{2}\sum_{j=1}^n u''(X_{t_{j-1}}) 2A_{t_{j-1}}B_{t_{j-1}}(t_j - t_{j-1})(W_{t_j} - W_{t_{j-1}})\right|^2 \right] & \leq \frac{1}{2}\max |u''| \max_j|t_j - t_{j-1}| \mathbb{E}\left[\left| 2A_{t_{j-1}}B_{t_{j-1}}(W_{t_j} - W_{t_{j-1}})\right|^2 \right] \\
& \leq \frac{1}{2}\max |u''| \max_j|t_j - t_{j-1}| \mathbb{E}\left[\left| 4A_{t_{j-1}}^2B_{t_{j-1}}^2(t_j - t_{j-1})\right|^2 \right] \\
& \rightarrow 0 \times \int_0^T 4A_t^2 B_t^2 \;\mathrm{d}t = 0.
\end{align*}
$$
No último termo, usando que $\mathbb{E}[(W_{t_j} - W_{t_{j-1}})^2] = (t_j - t_{j-1})$, obtemos
$$
\frac{1}{2}\sum_{j=1}^n u''(X_{t_{j-1}}) B_{t_{j-1}}^2(W_{t_j} - W_{t_{j-1}})^2 \rightarrow \frac{1}{2}\int_0^T u''(X_t) B_t^2 \;\mathrm{d}t.
$$

Informalmente, podemos escrever
$$
(\mathrm{d}X)^2 = A_t^2 \;(\mathrm{d}t)^2 + 2A_tB_t \;\mathrm{d}t\;\mathrm{d}W_t + B_t^2(\mathrm{d}W_t)^2 = B_t^2\;\mathrm{d}t,
$$
com
$$
(\mathrm{d}t)^2 = 0, \quad \mathrm{d}t\;\mathrm{d}W_t = 0, \quad (\mathrm{d}W_t)^2 = \mathrm{d}t.
$$

De qualquer forma, obtemos, no limite,
$$
Y_T = Y_0 + \int_0^T u'(X_t)\;\mathrm{d}X_t + \frac{1}{2}\int_0^T u''(X_t) B_t \;\mathrm{d}t.
$$

Ou seja, obtemos a **fórmula de Itô** no caso autônomo:
$$
\mathrm{d}Y_t = u'(X_t) \;\mathrm{d}X_t + \frac{1}{2} B_t^2 u''(X_t)\;\mathrm{d}t. 
$$

## Fórmula de Itô no caso não-autônomo

Quando $u = u(t, x)$ é duas vezes continuamente diferenciável e $\{X_t\}_{t\geq 0}$ é um processo de Itô satisfazendo
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
então o processo $\{Y_t\}_{t\geq 0}$ definido por $Y_t = u(t, X_t)$ satisfaz a **fórmula de Itô** no caso não-autônomo, a saber
$$
\mathrm{d}Y_t = u_t(t, X_t)\;\mathrm{d}t + u_x(t, X_t)\;\mathrm{d}X_t + \frac{1}{2} u_{xx}B_t^2\;\mathrm{d}t.
$$

Para lembrar dessa fórmula, pense primeiramente em uma expansão de segunda ordem
$$
\mathrm{d}Y_t = u_t\;\mathrm{d}t + u_x\;\mathrm{d}X_t + \frac{1}{2} u_{tt}\;(\mathrm{d}t)^2 + u_{tx} \;\mathrm{d}t \;\mathrm{d}X_t + \frac{1}{2} u_{xx}\;(\mathrm{d}X_t)^2.
$$
Em seguida, eleva-se ao quadrado a equação para $\{X_t\}_{t \geq 0}$:
$$
(\mathrm{d}X_t)^2 = \left(A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t\right)^2 = A_t^2\;(\mathrm{d}t)^2 + 2A_tB_t \;\mathrm{d}t\;\mathrm{d}W_t + B_t^2\;(\mathrm{d}W_t)^2.
$$
Substituindo $(\mathrm{d}X_t)^2$ na expansão de segunda ordem de $\mathrm{d}Y_t$, obtemos
$$
\begin{align*}
\mathrm{d}Y_t & = u_t\;\mathrm{d}t + u_x\;\mathrm{d}X_t \\
& \qquad + \frac{1}{2} u_{tt}\;(\mathrm{d}t)^2 \\
& \qquad + u_{tx} \;\mathrm{d}t \left(A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t\right) \\
& \qquad + \frac{1}{2} u_{xx}\left(A_t^2\;(\mathrm{d}t)^2 + 2A_tB_t \;\mathrm{d}t\;\mathrm{d}W_t + B_t^2\;(\mathrm{d}W_t)^2\right).
\end{align*}
$$
Usando que, sob uma integração simples,
$$
\begin{align*}
(\mathrm{d}t)^2 & = 0, \\
\mathrm{d}t\;\mathrm{d}W_t & = 0, \\
(\mathrm{d}W_t)^2 & = \mathrm{d}t,
\end{align*}
$$
chega-se à fórmula de Itô
$$
\mathrm{d}Y_t = u_t\;\mathrm{d}t + u_x\;\mathrm{d}X_t + \frac{1}{2} u_{xx} B_t^2 \;\mathrm{d}t.
$$

## Exercícios

1. Mostre que
$$
\mathrm{d}(W_t^2) = 2W_t\;\mathrm{d}W_t + \;\mathrm{d}t.
$$

2. Mostre que
$$
\mathrm{d}(tW_t) = W_t\;\mathrm{d}t + t\;\mathrm{d}W_t.
$$
