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

Mais precisamente, vamos ver que, fixando $0 \leq \lambda \leq 1$ e escolhendo $\theta_j$ como
$$
\theta_j^\lambda = (1 - \lambda) t_{j-1} + \lambda t_j,
$$
o limite acima existe e depende de $\lambda$.

Para vermos isso, dada uma partição $M = \{t_j\}_{j=0}^n$ como acima e $\lambda$ satisfazendo $0 \leq \lambda \leq 1$, definimos
$$
R_M(\lambda) = \sum_{j=1}^{n} W_{\theta_j^\lambda} (W_{t_j} - W_{t_{j-1}}).
$$

Vamos calcular, a seguir, o limite no caso $\lambda = 0$, depois no caso $\lambda = 1$ e, finalmente, o caso geral $0 \leq \lambda \leq 1$.

### Caso $\lambda = 0$

Nesse caso, temos
$$
R_M(0) = \sum_{j=1}^{n} W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}).
$$

Para cada $j$, escrevemos
$$
\begin{align*}
W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}) & = W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}) \pm \frac{1}{2}W_{t_j} (W_{t_j} - W_{t_{j-1}}) \\
& = \frac{1}{2}(W_{t_j} + W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) - \frac{1}{2}(W_{t_j} - W_{t_{j-1}})(W_{t_j }- W_{t_{j-1}}) \\
& = \frac{1}{2}(W_{t_j}^2 - W_{t_{j-1}}^2) - \frac{1}{2}(W_{t_j} - W_{t_{j-1}})^2.
\end{align*}
$$
Assim,
$$
R_M(0) = \frac{1}{2}\sum_{j=1}^{n}(W_{t_j}^2 - W_{t_{j-1}}^2) - \frac{1}{2}\sum_{j=1}^{n}(W_{t_j} - W_{t_{j-1}})^2.
$$

O primeiro somatório é uma soma telescópica, que nos dá
$$
\frac{1}{2}\sum_{j=1}^{n}(W_{t_j}^2 - W_{t_{j-1}}^2) = \frac{1}{2}(W_T^2 - W_0^2) = \frac{1}{2}W_T^2.
$$

O segundo somatório foi considerado na seção {{link_section pages/c04/variacao_ilimitada_wiener}}, onde mostramos, para uma malha qualquer, que o valor esperado satisfaz
$$
\mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right] = \sum_{j=1}^n (t_j - t_{j-1}) = t_n - t_0 = T
$$
e o momento de segunda ordem,
$$
\mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] = \sum_{i, j = 1}^n (t_i - t_{i-1})(t_j - t_{j-1}) + 2\sum_{j = 1}^n (t_j - t_{j-1})^2.
$$

Naquela seção, usamos, em seguida, que as malhas são diádicas, para obter a convergência, quase certamente, para $T$. Aqui, temos uma malha qualquer e vamos nos contentar com a convergência em probabilidades. De fato, podemos escrever, mesmo para uma malha qualquer, que
$$
\sum_{i, j = 1}^n (t_i - t_{i-1})(t_j - t_{j-1}) = \sum_{i = 1}^n (t_i - t_{i-1}) \sum_{j = 1}^n (t_j - t_{j-1}) = T^2
$$
e
$$
\left| \sum_{j=1}^{n} (t_j - t_{j-1})^2 \right| \leq \max_j\{|t_j - t_{j-1}|\}\sum_{j=1}^{n} (t_j - t_{j-1}) = T\max_j\{|t_j - t_{j-1}|\} \rightarrow 0.
$$
Dessa forma,
$$
\begin{align*}
\mathrm{Var}\left( \sum_{j=1}^n (W_{t_j} - W_{t_{j-1}})^2\right) & = \mathbb{E}\left[\left(\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right)^2\right] - \mathbb{E}\left[\sum_{j=1}^n \left(W_{t_j} - W_{t_{j-1}}\right)^2\right]^2 \\
& = 2\sum_{j = 1}^n (t_j - t_{j-1})^2 \rightarrow 0.
\end{align*}
$$

Como o valor esperado é igual à constante $T$ e a variância converge para zero, obtemos a convergência em probabilidade
$$
\sum_{j=1}^{n}(W_{t_j} - W_{t_{j-1}})^2 \rightarrow T.
$$

Juntando os resultados dos dois somatórios, obtemos, ao refinarmos a malha, a convergência em probabilidade
$$
R_M(0) \rightarrow \frac{1}{2}W_T^2 - \frac{1}{2}T,
$$
no limite $\max_{j=1, \ldots, n}\{t_j - t_{j-1}\} \rightarrow 0$.

## Caso $\lambda = 1$

Nesse caso, temos
$$
R_M(1) = \sum_{j=1}^{n} W_{t_j} (W_{t_j} - W_{t_{j-1}}).
$$

Escrevendo
$$
W_{t_j} = W_{t_{j-1}} + W_{t_j} - W_{t_{j-1}},
$$
vemos que
$$
R_M(1) = R_M(0) + \sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2.
$$
Acabamos de ver que
$$
R_M(0) \rightarrow \frac{1}{2}W_T^2 - \frac{1}{2}T
$$
e que
$$
\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow T.
$$

Portanto,
$$
R_M(1) \rightarrow \frac{1}{2}W_T^2 + \frac{1}{2}T.
$$

Aqui já vemos que o limite depende de $\lambda$.

### Caso $\lambda = 1/2$

Este é um caso significativo. Vamos fazê-lo em separado, também. Temos
$$
R_M(1/2) = \sum_{j=1}^{n} W_{(t_{j-1}+ t_j)/2} (W_{t_j} - W_{t_{j-1}}).
$$
Escrevemos
$$
\begin{align*}
W_{(t_{j-1}+ t_j)/2} & = W_{(t_{j-1}+ t_j)/2} \pm \frac{1}{2}\left(W_{t_{j-1}} + W_{t_j}\right) \\
& = \frac{1}{2}\left(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}}\right) - \frac{1}{2}\left(W_{t_j} - W_{(t_{j-1}+ t_j)/2}\right) + \frac{1}{2}\left(W_{t_{j-1}} + W_{t_j}\right)
\end{align*}
$$
e
$$
W_{t_j} - W_{t_{j-1}} = (W_{t_j} - W_{(t_{j-1}+ t_j)/2}) + (W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}}).
$$
Assim, temos
$$
\begin{align*}
R_M(1/2) = & \frac{1}{2}\sum_{j=1}^{n} (W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})(W_{t_j} - W_{(t_{j-1}+ t_j)/2})\\
& + \frac{1}{2}\sum_{j=1}^{n} (W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})\\
& - \frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{(t_{j-1}+ t_j)/2})(W_{t_j} - W_{(t_{j-1}+ t_j)/2})\\
& - \frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{(t_{j-1}+ t_j)/2})(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})\\
& + \frac{1}{2}\sum_{j=1}^{n} (W_{t_{j-1}} + W_{t_j})\left(W_{t_j} - W_{t_{j-1}}\right)\\
\end{align*}
$$
Observe que
$$
\begin{align*}
R_M(1/2) = & \frac{1}{2}\sum_{j=1}^{n} (W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2\\
& - \frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\\
& + \frac{1}{2}\sum_{j=1}^{n} \left(W_{t_j}^2 - W_{t_{j-1}}^2\right)\\
\end{align*}
$$


### Caso geral $0 \leq \lambda \leq 1$

Nesse caso, escrevemos
$$
W_{\theta_j^\lambda} = W_{\theta_j^\lambda} \pm (W_{t_j} + W_{t_{j-1}})
$$
de forma que
$$
W_{\theta_j^\lambda}(W_{t_j} - W_{t_{j-1}}) = W_{\theta_j^\lambda}(W_{t_j} - W_{t_{j-1}}) \pm (W_{t_j} + W_{t_{j-1}})
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
