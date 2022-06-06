@def title = "Limites de somatórios de Riemann envolvendo o processo de Wiener"

# {{ get_title }}

Vimos uma maneira de definir a integral em relação a processos $\{Y_t\}_t$ cujos caminhos amostrais não são de variação limitada. Mas apenas integrandos da forma $g(t, Y_t)$, para certos tipos particulares de funções, são permitidos (continuamente diferenciáveis e da forma $g(t, y) = \partial_y G(t, y)$). Queremos estender a noção de integral para funções mais gerais e com integrandos da forma $g(t, X_t)$, i.e. envolvendo processos $\{X_t\}_t$ diferentes daquele em relação ao qual estamos integrando. A motivação é prática: queremos integrar em relação ao processo de Wiener.

A integral definida anteriormente não foi feita diretamente em termos de somas de Riemann ou de integrais de funções simples. Foi definida na forma de dualidade. Aqui, por outro lado, vamos investigar um caminho semelhante ao feito em integrais de Riemann.

Na integral de Riemann, consideramos malhas cada vez mais finas e aproximamos a função por funções constantes por partes, constantes em cada subintervalo da malha, cuja integral se reduz a um somatório finito. O valor em cada subintervalo da malha é determinado pelo valor da função em um ponto escolhido arbitrariamente em cada subintervalo. O limite do somatório deve existir e ser único independentemente da escolha desse ponto em cada subintervalo. Isso é possível sempre que a função integrada é contínua ou tem descontinuidades em um conjunto de medida nula.

Veremos, a seguir, que esse limite pode não ser único, ou não existir, quando integramos em relação a um processo de Wiener e escolhemos os pontos de forma arbitrária.

## Somas de Riemann do processo de Wiener

Para ilustrar a complexidade do problema, vamos considerar diferentes somas de Riemann associadas à seguinte integral envolvendo um processo de Wiener $\{W_t\}_{t\geq 0}$:
$$
\int_0^T W_t \;\mathrm{d}W_t.
$$

Se os caminhos fossem, quase certamente, de variação limitada, poderiamos definir, para quase todo $\omega$,
$$
\int_0^T W_t \;\mathrm{d}W_t = \lim_{\max\{t_j - t_{j-1}\} \rightarrow 0} \sum_{j=1}^{n} W_{\theta_j} (W_{t_j} - W_{t_{j-1}}),
$$
onde $0 = t_0 < t_1 < \ldots < t_n = T$ e cada $\theta_j$ é um número arbitrário em $t_{j-1} \leq \theta_j \leq t_j$, $j = 1, \ldots, n$.

Mas como $\{W_t\}_{t\geq 0}$ não é de variação limitada, esse limite pode não existir. De fato, vamos ver que esse limite não existe.

Mais precisamente, vamos ver que, fixando $0 \leq \lambda \leq 1$ e definindo $\theta_j$ como
$$
\theta_j^\lambda = (1 - \lambda) t_{j-1} + \lambda t_j,
$$
o limite acima existe e depende de $\lambda$.

Dada uma partição $M = \{t_j\}_{j=0}^n$ como acima e $\lambda$ satisfazendo $0 \leq \lambda \leq 1$, definimos
$$
R_M(\lambda) = \sum_{j=1}^{n} W_{\theta_j^\lambda} (W_{t_j} - W_{t_{j-1}}).
$$

Observe que
$$
\frac{1}{2}(b^2 - a^2) - \frac{1}{2}(b - a)^2 + (\theta - a)^2 + (b - \theta)(\theta - a) = \theta (b - a).
$$
Assim, para cada $j = 1, \ldots, n$, escrevemos
$$
R_M(\lambda) = \frac{1}{2}\sum_{j=1}^{n} \left(W_{t_j}^2 - W_{t_{j-1}}^2\right) - \frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 + \sum_{j=1}^{n} (W_{\theta_j} - W_{t_{j-1}})^2 + \sum_{j=1}^{n} (W_{t_j} - W_{\theta_j})(W_{\theta_j} - W_{t_{j-1}})
$$

Vamos analisar cada somatório acima.

### Primeiro somatório

O primeiro somatório é uma soma telescópica, resultando em
$$
\frac{1}{2}\sum_{j=1}^{n} \left(W_{t_j}^2 - W_{t_{j-1}}^2\right) = \frac{1}{2}W_T^2
$$

### Segundo somatório

O segundo somatório envolve a soma das variações quadráticas da malha, cujo limite pode ser calculado da seguinte maneira. O valor esperado dessa soma é
$$
\mathbb{E}\left[ \sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \right] = \sum_{j=1}^{n} \mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] = \sum_{j=1}^{n} (t_j - t_{j-1}) = T.
$$

A sua variância pode ser escrita na forma
$$
\begin{align*}
\mathrm{Var}\left( \sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \right) & = \mathbb{E}\left[ \left(\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 - T \right)^2\right] \\
& = \mathbb{E}\left[ \left(\sum_{j=1}^{n} \left((W_{t_j} - W_{t_{j-1}})^2 - (t_j - t_{j-1})\right)\right)^2 \right] \\
& = \sum_{i,j=1}^{n} \mathbb{E}\left[ \left((W_{t_i} - W_{t_{i-1}})^2 - (t_i - t_{i-1})\right)\left((W_{t_j} - W_{t_{j-1}})^2 - (t_j - t_{j-1})\right)\right] \\
& = \sum_{i,j=1}^{n} \left(\mathbb{E}\left[ (W_{t_i} - W_{t_{i-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right] - 2(t_i - t_{i-1})\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] + (t_i-t_{i-1})(t_j - t_{j-1}) \right) \\
& = \sum_{i,j=1}^{n} \mathbb{E}\left[ (W_{t_i} - W_{t_{i-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right] - T^2.
\end{align*}
$$

Para $i \neq j$, como os incrementos são independentes, temos
$$
\mathbb{E}\left[ (W_{t_i} - W_{t_{i-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right] = \mathbb{E}\left[ (W_{t_i} - W_{t_{i-1}})^2\right]\mathbb{E}\left[(W_{t_j} - W_{t_{j-1}})^2\right] = (t_i - t_{i-1})(t_j - t_{j-1}).
$$
Quando $i = j$, como $W_{t_j} - W_{t_{j-1}} \sim \mathcal{N}(0, t_j - t_{j-1})$, temos que o seu momento de ordem quatro é dado explicitamente por
$$
\mathbb{E}\left[ (W_{t_j} - W_{t_{j-1}})^4\right] = 3\mathbb{E}\left[ (W_{t_j} - W_{t_{j-1}})^2\right]^2 = 3(t_j - t_{j-1})^2.
$$
Assim,
$$
\begin{align*}
\sum_{i,j=1}^{n} \mathbb{E}\left[ (W_{t_i} - W_{t_{i-1}})^2(W_{t_j} - W_{t_{j-1}})^2\right] & = \sum_{i \neq j}(t_i - t_{i-1})(t_j - t_{j-1}) + 3 \sum_j (t_j - t_{j-1})^2 \\
& = \sum_{i,j} (t_i - t_{i-1})(t_j - t_{j-1}) + 2 \sum_j (t_j - t_{j-1})^2 \\
& = T^2 + 2 \sum_j (t_j - t_{j-1})^2.
\end{align*}
$$
Dessa forma,
$$
\begin{align*}
\mathrm{Var}\left( \sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \right) & = \sum_{j = 1}^{n} \mathbb{E}\left[ (W_{t_j} - W_{t_{j-1}})^4\right] - T^2 \\
& = 2 \sum_{j = 1}^{n} (t_j - t_{j-1})^2 \\
& \leq 2\max_j\{|t_j - t_{j-1}|\} \left( \sum_{j = 1}^{n} (t_j - t_{j-1})\right) \\
& = 2T\max_j\{|t_j - t_{j-1}|\}.
\end{align*}
$$

Conforme a malha é refinada, com $\max_j\{|t_j - t_{j-1}|\} \rightarrow 0$, vemos que o valor esperado do somatório permanece constante igual a $T/2$ e sua variância decresce para zero. Portanto, o somatório converge, em probabilidade, para a constante $T/2$:
$$
\frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow \frac{T}{2}.
$$

### Terceiro termo

### Quarto termo

### Limite
