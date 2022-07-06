@def title = "Fórmula de Itô"

# {{ get_title }}

Uma outro propriedade fundamental da integral de Itô diz respeito a uma fórmula relacionada a mudanças de variáveis.

Considere um processo real $\{X_t\}_{t \geq 0}$ e uma função real contínua $u:\mathbb{R} \rightarrow \mathbb{R}$. Podemos definir um outro processo $\{Y_t\}_{t \geq 0}$ através de
$$
Y_t = u(X_t).
$$

A questão é sobre a relação entre $\mathrm{d}Y_t$ e $\mathrm{d}X_t$.

Caso $u$ e $\{X_t\}_{t \geq 0}$ fossem diferenciáveis, então $\mathrm{d}Y_t/\mathrm{d}t = u'(X_t)\mathrm{d}X_t/\mathrm{d}t$. Poderíamos, nesse caso, escrever $\mathrm{d}Y_t = u'(X_t)\mathrm{d}X_t$, no sentido da integral de Riemann-Stieltjes $\int H_t \mathrm{d}Y_t = \int H_t u'(X_t)\mathrm{d}X_t$, para um processo arbitrário $\{H_t\}_{t \geq 0}$.

No caso em que $u$ ainda é diferenciável mas $\{X_t\}_{t \geq 0}$ é apenas de variação limitada, então $\{Y_t\}_{t \geq 0}$ também é de variação limitada e ainda podemos dizer que $\mathrm{d}Y_t = u'(X_t)\mathrm{d}X_t$.

Mas e no caso em que $X_t$ não é nem de variação limitada? Nesse caso, podemos considerar a integral de Itô em relação a $\{X_t\}_{t \geq 0}$. (Assumindo que esse processo seja uma Martingale, então $\{Y_t\}_{t \geq 0}$ também é uma Martingale e a integral de Itô a seu respeito está bem definida). Porém, isso nos trará uma correção na fórmula acima.

Mais precisamente, isso nos dará uma fórmula útil, contendo um termo extra, no caso em que $\{X_t\}_{t\geq 0}$ tem uma forma especial, que o torna um tipo de processo conhecido como processo de Itô, que introduzimos a seguir.

Essa mesma análise pode ser feita no caso em que $u$ depende também da variável temporal, i.e. $u:[0, \infty) \times \mathbb{R} \rightarrow \mathbb{R}$. Nesse caso, temos
$$
Y_t = u(t, X_t).
$$
Denotamos o primeiro caso por *autônomo* e este, por *não-autônomo.*

## Processo de Itô

Um **processo de Itô** é um processo $\{X_t\}_{t \geq 0}$ satisfazendo uma equação estocástica da forma
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
onde $\{W_t\}_{t \geq 0}$ é um processo de Wiener e $\{A_t\}_{t \geq 0}$ e $\{B_t\}_{t \geq 0}$ são não-antecipativos em relação ao processo de Wiener.

## Fórmula de Itô no caso autônomo

Considere, então, um processo $\{H_t\}_{t \geq 0}$ com caminhos amostrais quase certamente contínuos. Aproximemos a sua integral de Itô em relação a $\{Y_t\}_{t \geq 0}$ por somas parciais, em relação a malhas temporais $0 = t_0 < t_1 < \cdots < t_n = T$ com $\max_{j=1, \ldots, n}\{t_j  - t_{j-1}\} \rightarrow 0$:
$$
\int_0^t H_t \;\mathrm{d}Y_t = \lim \sum_{j=1}^n H_{t_{j-1}} (Y_{t_j} - Y_{t_{j-1}}).
$$

Assumindo, agora, que $u$ é duas vezes continuamente diferenciável, podemos escrever
$$
\begin{align*}
Y_{t_j} - Y_{t_{j-1}} = u(X_{t_j}) - u(X_{t_{j-1}}) & = u'(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}}) + \int_{X_{t_{j-1}}}^{X_{t_j}} u''(x)(X_{t_j} - x) \;\mathrm{d}x \\
& = u'(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}}) \\
& \qquad + \frac{1}{2}u''(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}})^2 \\
&  \qquad + \int_{X_{t_{j-1}}}^{X_{t_j}} (u''(x) - u''(X_{t_{j-1}}))(X_{t_j} - x) \;\mathrm{d}x.
\end{align*}
$$
Assim, as somas parcias são dadas por
$$
\begin{align*}
\sum_{j=1}^n H_{t_{j-1}} (Y_{t_j} - Y_{t_{j-1}}) & = \sum_{j=1}^n H_{t_{j-1}} u'(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}}) \\
& \qquad + \frac{1}{2} \sum_{j=1}^n H_{t_{j-1}} u''(X_{t_{j-1}})(X_{t_j} - X_{t_{j-1}})^2 \\
& \qquad + \sum_{j=1}^n H_{t_{j-1}} \int_{X_{t_{j-1}}}^{X_{t_j}} (u''(x) - u''(X_{t_{j-1}}))(X_{t_j} - x) \;\mathrm{d}x.
\end{align*}
$$

No limite, o primeiro termo converge para uma integral de Itô; o último termo converge para zero, graças à continuidade da segunda derivada de $u = u(x)$; e o segundo podemos escrever informalmente como uma integral com $(\mathrm{d}X)^2$. Assim, obtemos
$$
\int_0^T H_t \;\mathrm{d}Y_t = \int_0^T H_t u'(X_t)\;\mathrm{d}X_t + \frac{1}{2}\int_0^T H_t u''(X_t)\;(\mathrm{d}X_t)^2.
$$

No caso em que $\{X_t\}_{t \geq 0}$ é o processo de Wiener $\{W_t\}_{t \geq 0}$, então "$(\mathrm{d}W_t) = dt$", de modo que $Y_t = u(W_t)$ é tal que
$$
\int_0^T H_t \;\mathrm{d}Y_t = \int_0^T H_t u'(W_t)\;\mathrm{d}W_t + \frac{1}{2}\int_0^T H_t u''(W_t)\;\mathrm{d}t.
$$
Mais precisamente, podemos obter isso, rigorosamente, das somas parciais, mostrando que
$$
\frac{1}{2} \sum_{j=1}^n H_{t_{j-1}} u''(W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}})^2 \rightarrow \frac{1}{2}\int_0^T H_t u''(W_t)\;\mathrm{d}t.
$$
Isso segue do fato de que $\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] = t_j - t_{j-1}$ e de que momentos de ordem mais alta dependem de potências também maiores de $t_j - t_{j-1}$. Mostra-se, então, que o valor esperado desse termo converge para a integral em $\mathrm{d}t$ e a variância converge para zero, nos dando a convergência em probabilidade.

Mais geralmente, se $\{X_t\}_{t \geq 0}$ é um processo de Itô satisfazendo
$$
\mathrm{d}X_t = A_t\;\mathrm{d}t + B_t\;\mathrm{d}W_t,
$$
então
$$
(\mathrm{d}X_t)^2 \sim A_t^2\;(\mathrm{d}t)^2 + 2A_tB_t\;\mathrm{d}t\;\mathrm{d}W_t + B_t^2\;(\mathrm{d}W_t)^2.
$$
como, no limite, no sentido integral, $(\mathrm{d}t)^2 = 0$, $\mathrm{d}t\;\mathrm{d}W_t = 0$ e $(\mathrm{d}W_t)^2 = \mathrm{d}t$, então
$$
\int_0^T H_t \;\mathrm{d}Y_t = \int_0^T A_t H_t u'(X_t) \;\mathrm{d}t + \int_0^T B_t H_t u'(X_t)\;\mathrm{d}W_t + \frac{1}{2}\int_0^T B_t^2 H_t u''(X_t)\;\mathrm{d}t.
$$
Ou seja, obtemos a **fórmula de Itô** no caso autônomo:
$$
\mathrm{d}Y_t = A_t u'(X_t) \;\mathrm{d}t + B_t u'(X_t)\;\mathrm{d}W_t + \frac{1}{2} B_t^2 u''(X_t)\;\mathrm{d}t. 
$$

Da mesma forma, uma demonstração rigorosa pode ser feita trabalhando-se diretamente com as somas parciais.

## Fórmula de Itô no caso não-autônomo

Quando $u = u(t, x)$ é duas vezes continuamente diferenciável e $\{X_t\}_{t\geq 0}$ é um processo de Itô satisfazendo
$$
\mathrm{d}X_t = A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t,
$$
então o processo $\{Y_t\}_{t\geq 0}$ definido por $Y_t = u(t, X_t)$ satisfaz a **fórmula de Itô** no caso não-autônomo, a saber
$$
\mathrm{d}Y_t = u_t(t, X_t)\;\mathrm{d}t + u_x(t, X_t)\;\mathrm{d}X_t + \frac{1}{2} u_{xx}\;\mathrm{d}t.
$$

Para lembrar dessa fórmula, pense nas seguintes identidades "informais" (ou seja, sem significado rigoroso)
$$
\begin{align*}
\mathrm{d}Y_t & = u_t\;\mathrm{d}t + u_x\;\mathrm{d}X_t + \frac{1}{2} u_{tt}\;(\mathrm{d}t)^2 + u_{tx} \;\mathrm{d}t \;\mathrm{d}X_t + \frac{1}{2} u_{xx}\;(\mathrm{d}X_t)^2, \\
(\mathrm{d}X_t)^2 & = \left(A_t \;\mathrm{d}t + B_t \;\mathrm{d}W_t\right)^2 = A_t^2\;(\mathrm{d}t)^2 + 2A_tB_t \;\mathrm{d}t\;\mathrm{d}W_t + B_t^2\;(\mathrm{d}W_t)^2,
\end{align*}
$$
junto com
$$
\begin{align*}
(\mathrm{d}t)^2 & = 0, \\
\mathrm{d}t\;\mathrm{d}W_t & = 0, \\
(\mathrm{d}W_t)^2 & = \mathrm{d}t.
\end{align*}
$$
Combinadas, chegamos na fórmula de Itô.
