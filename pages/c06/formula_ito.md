@def title = "Fórmula de Itô"

# {{ get_title }}

Uma outro propriedade fundamental da integral de Itô diz respeito a uma fórmula relacionada a mudanças de variáveis.

Considere um processo real $\{X_t\}_{t \geq 0}$ e uma função real contínua $u:\mathbb{R} \rightarrow \mathbb{R}$. Podemos definir um outro processo $\{Y_t\}_{t \geq 0}$ através de
$$
Y_t = u(X_t).
$$

A questão é sobre a relação entre $\mathrm{d}Y_t$ e $\mathrm{d}X_t$. Quando $u$ e $\{X_t\}_{t \geq 0}$ são diferenciáveis, temos simplesmente
$$
\frac{\mathrm{d}Y_t}{\mathrm{d}t} = u'(X_t)\frac{\mathrm{d}X_t}{\mathrm{d}t}.
$$

Mesmo quando os caminhos amostrais de $\{X_t\}_{t \geq 0}$ são apenas de variação limitada, ainda temos $\{Y_t\}_{t \geq 0}$ de variação limitada e ainda temos que $\mathrm{d}Y_t = u'(X_t)\mathrm{d}X_t$, no sentido de integral de Riemann-Stieltjes:
$$
    \int_a^b g(t) \;\mathrm{d}Y_t = \int_a^b u'(X_t)\;\mathrm{d}X_t.
$$

Mas e no caso em que $X_t$ não é nem de variação limitada? Por exemplo, se quiseremos calcular $X_t = \sin(W_t),$ para o processo de Wiener, ou qualquer outra $X_t = u(W_t)$? Podemos começar por aí e calcular $dX_t$ para funções de processos de Wiener. Mas e se quiseremos, em cima disso, consider $Y_t = v(X_t)$ e ainda $Z_t = w(Y_t)$, etc.

Por conta disso, consideramos uma classe de processos que é, em um certo sentido, fechada para composições. E então calcular a diferencial para processos nessa classe. Essa classe é a de *processos de Itô,* ou seja, processos $\{X_t\}_t$ satisfazendo uma equação da forma
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
para outros dados processos $\{A_t\}_t$ e $\{B_t\}_t$ adaptados a $\{W_t\}_t$.

Para esses processos, teremos uma correção na fórmula de mudança de variáveis, nos levando à *fórmula de Itô*, que, nesse caso autônomo, tem a forma:
$$
\mathrm{d}Y_t = u'(X_t) \;\mathrm{d}X_t + \frac{1}{2} B_t^2 u''(X_t)\;\mathrm{d}t. 
$$

Essa mesma análise pode ser feita no caso em que $u$ depende também da variável temporal, i.e. $u:[0, \infty) \times \mathbb{R} \rightarrow \mathbb{R}$. Nesse caso, temos
$$
Y_t = u(t, X_t).
$$
Denotamos o primeiro caso por *autônomo* e este por *não autônomo.*  No caso não autônomo, a *fórmula de Itô* se torna
$$
\mathrm{d}Y_t = u_t(t, X_t)\;\mathrm{d}t + u_x(t, X_t)\;\mathrm{d}X_t + \frac{1}{2} u_{xx} B_t^2\;\mathrm{d}t.
$$

Observe que, em ambos os casos, se $B_t = 0$, para todo $t$, então $\{X_t\}_{t \geq 0}$ se reduz a um processo com caminhos diferenciáveis (ou de variação limitada) e recuperamos a fórmula clássica.

## Fórmula de Itô no caso de um processo de Wiener

Para deixar as ideias claras, vamos considerar o caso mais simples em que $X_t=W_t$ é o próprio processo de Wiener e $u=u(x)$ é uma função duas vezes continuamente diferenciável definida para todo $x\in\mathbb{R}.$ Estamos interessados em obter uma fórmula para $\mathrm{d}Y_t$, onde $\{Y_t\}_{t\geq 0}$ é dado por
$$
    Y_t = u(W_t).
$$

Considere uma malha temporal $0 = t_0 < t_1 < \cdots < t_n = T$. Escrevemos
$$
Y_t = Y_0 + \sum_{j = 1}^n (Y_{t_j} - Y_{t_{j-1}}),
$$
que é uma soma telescópica. Como $u$ é duas vezes continuamente diferenciável, temos a fórmula de expansão de Taylor com resto
$$
\begin{align*}
    u(b) & = u(a) + \int_a^b u'(s) \;\mathrm{d}s \\
    & = u(a) + \int_a^b \left(u'(a) + \int_a^s u''(\xi)\;\mathrm{d}\xi \right)\mathrm{d}s \\
    & = u(a) + u'(a) (b - a) + \int_a^b \int_\xi^b u''(\xi);\mathrm{d}s \;\mathrm{d}\xi \\
    & = u(a) + u'(a) (b - a) + \int_a^b u''(\xi)(b - \xi)\;\mathrm{d}\xi.
\end{align*}
$$

Assim, podemos escrever, fazendo $a = W_{t_{j-1}}$ e $b=W_{t_j}$ em cada termo,
$$
\begin{align*}
Y_{t_j} - Y_{t_{j-1}} = u(W_{t_j}) - u(W_{t_{j-1}}) & = u'(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) + \int_{W_{t_{j-1}}}^{W_{t_j}} u''(\xi)(W_{t_j} - \xi) \;\mathrm{d}\xi \\
& = u'(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) \\
& \qquad + \frac{1}{2}u''(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})^2 \\
&  \qquad + \int_{W_{t_{j-1}}}^{W_{t_j}} (u''(\xi) - u''(W_{t_{j-1}}))(W_{t_j} - \xi) \;\mathrm{d}\xi.
\end{align*}
$$
Portanto,
$$
\begin{align*}
Y_T - Y_0 & = \sum_{j=1}^n u'(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) \\
& \qquad + \frac{1}{2} \sum_{j=1}^n u''(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})^2 \\
& \qquad + \sum_{j=1}^n \int_{W_{t_{j-1}}}^{W_{t_j}} (u''(\xi) - u''(W_{t_{j-1}}))(W_{t_j} - \xi) \;\mathrm{d}\xi.
\end{align*}
$$

No limite de refinamento da malha, o primeiro termo converge para a integral de Itô de $\{u'(W_t)\}_{t \geq 0},$ i.e.
$$
    \sum_{j=1}^n u'(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) \rightarrow \int_0^T u'(W_t)\;\mathrm{d}W_t.
$$

No segundo termo, usamos que $\mathbb{E}[(W_{t_j} - W_{t_{j-1}})^2] = (t_j - t_{j-1})$. É possível mostrar que
$$
\frac{1}{2}\sum_{j=1}^n u''(W_{t_{j-1}}) (W_{t_j} - W_{t_{j-1}})^2 \rightarrow \frac{1}{2}\int_0^T u''(W_t) \;\mathrm{d}t,
$$
em média quadrática.

O último termo converge para zero em média quadrática, graças à continuidade da segunda derivada de $u = u(x),$
$$
    \sum_{j=1}^n \int_{W_{t_{j-1}}}^{W_{t_j}} (u''(\xi) - u''(W_{t_{j-1}}))(W_{t_j} - \xi) \;\mathrm{d}\xi \rightarrow 0.
$$
Logo,
$$
    Y_T - Y_0 = \int_0^T u'(W_t)\;\mathrm{d}W_t + \frac{1}{2}\int_0^T u''(W_t) \;\mathrm{d}t.
$$
Em forma diferencial, escrevemos que
$$
    \mathrm{d}Y_t = u'(W_t)\;\mathrm{d}W_t + \frac{1}{2}u''(W_t)\;\mathrm{d}t,
$$
que é um caso particular da fórmula de Itô mencionada acima. Veremos agora a fórmula de Itô para processos de Itô.

Vamos ver as convergências acima em mais detalhes.

### Convergência do segundo termo

Nesse caso, não há nada de especial em ser a segunda derivada. Basta mostrar que
$$
\sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow \frac{1}{2}\int_0^T H_t \;\mathrm{d}t,
$$
para um processo qualquer $\{H_t\}_t$ progessivamente mensurável e de quadrado integrável (como o é $u''(W_t)$ quando $u$ é suave e $\{W_t\}_t$ é o processo de Wiener).

O primeiro passo é aproximar, no sentido de média quadrática, o processo $\{H_t\}_t$ por processos escada $\{H_t^m\}_t$ adaptados a $\{W_t\}_t$, conforme feito na parte de existência de integral de Itô. Cada $H_t^m$ é constante em uma partição $0 = a_0 < a_1 < \ldots < a_m = T$. Em cada subintervalo $A_k = [a_{k-1}, a_k)$, temos índices
$$
    J_k = \{t_j \in A_k\}
$$
da partição $\{t_j\}_j$ usada no cálculo da integral. Assim, basta mostrar que
$$
    \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow a_k - a_{k-1}.
$$
Uma vez mostrado isso,
$$
    \sum_{j=1}^n H_{t_{j-1}}^m (W_{t_j} - W_{t_{j-1}})^2 = \sum_{k=1}^n H_{a_{k-1}} \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow \sum_{k=1}^n H_{a_{k-1}}^m (a_k - a_{k-1}) = \int_0^T H_t^m \;\mathrm{d}t.
$$

Agora, passando ao limite em $m\rightarrow \infty,$ obtemos
$$
\sum_{j=1}^n H_{t_{j-1}} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow \int_0^T H_t \;\mathrm{d}t.
$$

Falta mostrar, então, que 
$$
    \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow a_k - a_{k-1}.
$$
em média quadrática. Isso é feito diretamente. Defina $\tau = a_k - a_{k-1}$ para facilitar a notação. Então
$$
    \mathbb{E}\left[ \left( \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2 - \tau \right)^2 \right] = \mathbb{E}\left[ \left( \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2\right)^2 \right]
    + 2\tau \mathbb{E}\left[ \left( \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})\right) \right] + \tau^2
$$
Temos
$$
  \begin{align*}
\mathbb{E}\left[ \left( \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2\right)^2 \right] & = \sum_{i, j} \mathbb{E}\left[(W_{t_i} - W_{t_{i-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right] \\
  & = \sum_{i \neq j}\mathbb{E}\left[(W_{t_i} - W_{t_{i-1}})^2\right] \mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] + \sum_j \mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^4\right] \\
  & = \sum_{i \neq j}\mathbb{E}\left[(W_{t_i} - W_{t_{i-1}})^2\right] \mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] + 3\sum_j \mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right]^2 \\
  & = \sum_{i \neq j} (t_i - t_{i-1})(t_j - t_{j-1}) + 3\sum_j (t_j - t_{j-1})^2 \\
  & = \sum_{i, j} (t_i - t_{i-1})(t_j - t_{j-1}) + 2\sum_j (t_j - t_{j-1})^2 \\
  & = \left(\sum_i (t_i - t_{i-1})\right)\left(\sum_j (t_j - t_{j-1})\right) + 2\sum_j (t_j - t_{j-1})^2 \\
  & = \tau^2 + 2\sum_j (t_j - t_{j-1})^2.
  \end{align*}
$$
Também temos
$$
2\tau \mathbb{E}\left[ \left( \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})\right) \right] = 2\tau \sum_{j\in J_k}\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2 \right] = 2\tau \sum_{j\in J_k} (t_j - t_{j-1}) = 2\tau^2.
$$
Assim, os termos com $\tau^2$ se cancelam e sobra
$$
\mathbb{E}\left[ \left( \sum_{j\in J_k} (W_{t_j} - W_{t_{j-1}})^2 - \tau \right)^2 \right] = 2\sum_j (t_j - t_{j-1})^2 \leq 2\max_{j\in J_k}(t_j - t_{j-1})\sum_j(t_j - t_{j-1}) = 2\tau \max_{j\in J_k}(t_j - t_{j-1}) \rightarrow 0.
$$
Isso completa a demonstração da convergência em média quadrática do segundo termo.

### Convergência do terceiro termo

Por densidade, basta mostrar no caso em que $u$ é três vezes continuamente diferenciável. Vamos assumir isso.

Quase todo caminho amostral de $\{W_t\}_t$ é H\"older contínou com expoente $\theta < 1/2$ e é limitado em $[0, T]$. Assim, fixado um caminho amostral, existe $C>0$ tal que
$$
|W_{t+\tau}(\omega) - W_t(\omega)| \leq C\tau ^\theta
$$
Em particular, como $W_0 = 0,$
$$
  |W_{t}(\omega)| \leq CT^\theta,
$$
para todo $t\in [0, T]$. Além disso, assumindo $u''$ continuamente diferenciável, dado $\epsilon > 0,$ existe $K > 0$ tal que
$$
  w_1, w_2 \leq CT^\theta \Rightarrow |u(w_2) - u(w_1)| \leq K|w_2 - w_1|.
$$
Assim, 
$$
\left|\int_{W_{t_{j-1}}}^{W_{t_j}} (u''(\xi) - u''(W_{t_{j-1}}))(W_{t_j} - \xi) \;\mathrm{d}\xi\right| \leq K |W_{t_j} - W_{t_{j-1}}|^3 \leq C^2K |t_j - t_{j-1}|^{3\theta}.
$$
Escolhendo $\theta < 1/2$ com $3\theta > 1,$ obtemos
$$
    \sum_{j=1}^n \int_{W_{t_{j-1}}}^{W_{t_j}} (u''(\xi) - u''(W_{t_{j-1}}))(W_{t_j} - \xi) \;\mathrm{d}\xi \leq C^2 K T \max_j |t_j - t_{j-1}|^{3\theta - 1} \rightarrow 0,
$$
quando a malha é refinada. Ou seja, obtemos a convergência quase certamente, que implica na convergência em média quadrática.

## Processo de Itô

Como dito acima, um **processo de Itô** é um processo $\{X_t\}_{t \geq 0}$ satisfazendo uma equação estocástica da forma
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
onde $\{W_t\}_{t \geq 0}$ é um processo de Wiener e $\{A_t\}_{t \geq 0}$ e $\{B_t\}_{t \geq 0}$ são não antecipativos em relação ao processo de Wiener.

## Fórmula de Itô no caso autônomo

Considere, novamente, uma malha temporal $0 = t_0 < t_1 < \cdots < t_n = T$ com $\max_{j=1, \ldots, n}\{t_j  - t_{j-1}\} \rightarrow 0$. Escrevemos
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

No limite de refinamento da malha, o primeiro termo converge para a integral de Itô de $\{u'(X_t)\}_{t \geq 0}$ com respeito $\{X_t\}_{t \geq 0}.$ O último termo converge para zero, graças à continuidade da segunda derivada de $u = u(x)$. Em relação ao segundo termo, temos
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

## Fórmula de Itô no caso não autônomo

Quando $u = u(t, x)$ é duas vezes continuamente diferenciável e $\{X_t\}_{t\geq 0}$ é um processo de Itô satisfazendo
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
então o processo $\{Y_t\}_{t\geq 0}$ definido por $Y_t = u(t, X_t)$ satisfaz a **fórmula de Itô** no caso não autônomo, a saber
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

3. Mostre a "regra do produto" para o produto entre uma função determinística $f=f(t)$ e um processo de Itô $\{X_t\}_t$:
$$
\mathrm{d}(f(t)X_t) = f'(t)X_t\;\mathrm{d}t + f(t)\;\mathrm{d}X_t.
$$
