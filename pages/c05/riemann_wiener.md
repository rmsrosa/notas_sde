@def title = "Limites de somatórios à la Riemann-Stieltjes"

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

Este também é um caso significativo, pois corresponde à integral no sentido de Stratonovich, que veremos em seguida. Temos
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
& + \frac{1}{2}\sum_{j=1}^{n} \left(W_{t_j}^2 - W_{t_{j-1}}^2\right).
\end{align*}
$$
A última soma é uma soma telescópica, que nos leva a
$$
R_M(1/2) = \frac{1}{2}\sum_{j=1}^{n} \left\{(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right\} + \frac{1}{2}W_T^2.
$$

Vamos, agora, mostrar que o termo restante converge para zero. Primeiramente, temos o valor esperado
$$
\begin{align*}
\mathbb{E}&\left[\sum_{j=1}^{n} \left\{(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right\}\right] \\
& = \sum_{j=1}^{n} \left\{\mathbb{E}\left[(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2\right] - \mathbb{E}\left[(W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right]\right\} \\
& = \sum_{j=1}^{n} \left\{ ((t_{j-1}+ t_j)/2 - t_{j-1}) - (t_j - (t_{j-1}+ t_j)/2)\right\} \\
& = 0.
\end{align*}
$$
Agora, a variância pode ser escrita como
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& = \sum_{i,j=1}^{n}\mathbb{E}\left[\left((W_{(t_{i-1}+ t_i)/2} - W_{t_{i-1}})^2 - (W_{t_i} - W_{(t_{i-1}+ t_i)/2})^2\right) \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right] \\
& = \sum_{i,j=1}^{n}\mathbb{E}\left[(W_{(t_{i-1}+ t_i)/2} - W_{t_{i-1}})^2(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2\right] \\
& \quad - \sum_{i,j=1}^{n}\mathbb{E}\left[(W_{(t_{i-1}+ t_i)/2} - W_{t_{i-1}})^2(W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right] \\
& \quad - \sum_{i,j=1}^{n}\mathbb{E}\left[(W_{t_i} - W_{(t_{i-1}+ t_i)/2})^2(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2\right] \\
& \quad + \sum_{i,j=1}^{n}\mathbb{E}\left[(W_{t_i} - W_{(t_{i-1}+ t_i)/2})^2(W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right].
\end{align*}
$$
For $i \neq j$ in the first and last sums and for any $i, j$ in the second and third sums, the summands involve increments over disjoint intervals, hence independent. Thus,
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& = \sum_{i \neq j}\mathbb{E}\left[(W_{(t_{i-1}+ t_i)/2} - W_{t_{i-1}})^2\right]\mathbb{E}\left[(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2\right] \\
& \quad - \sum_{i,j=1}^n\mathbb{E}\left[(W_{(t_{i-1}+ t_i)/2} - W_{t_{i-1}})^2\right]\mathbb{E}\left[(W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right] \\
& \quad - \sum_{i,j=1}^n\mathbb{E}\left[(W_{t_i} - W_{(t_{i-1}+ t_i)/2})^2\right]\mathbb{E}\left[(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2\right] \\
& \quad + \sum_{i \neq j}\mathbb{E}\left[(W_{t_i} - W_{(t_{i-1}+ t_i)/2})^2\right]\mathbb{E}\left[(W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right] \\
& \quad + \sum_{j=1}^n\mathbb{E}\left[(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^4\right] \\
& \quad + \sum_{j=1}^n\mathbb{E}\left[(W_{t_j} - W_{(t_{j-1}+ t_j)/2})^4\right].
\end{align*}
$$
The second order moments are the variance of the corresponding increments, which is the length of the interval. The fourth order moments are given in terms of the second order moments, since the increments are normal. Thus,
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& = \sum_{i\neq j}((t_{i-1}+ t_i)/2 - t_{i-1})((t_{j-1}+ t_j)/2 - t_{j-1}) \\
& \quad - \sum_{i,j=1}^n((t_{i-1}+ t_i)/2 - t_{i-1})(t_j - (t_{j-1}+ t_j)/2) \\
& \quad - \sum_{i,j=1}^n(t_i - (t_{i-1} + t_i)/2)((t_{j-1}+ t_j)/2 - t_{j-1}) \\
& \quad + \sum_{i \neq j}(t_i - (t_{i-1} + t_i)/2)(t_j - (t_{j-1}+ t_j)/2) \\
& \quad + 3\sum_{j=1}^n((t_{j-1}+ t_j)/2 - t_{j-1})^2 \\
& \quad + 3\sum_{j=1}^n(t_j - (t_{j-1}+ t_j)/2)^2.
\end{align*}
$$
Isso pode ser reescrito como
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& = \sum_{i,j=1}^n((t_{i-1}+ t_i)/2 - t_{i-1})((t_{j-1}+ t_j)/2 - t_{j-1}) \\
& \quad - \sum_{i,j=1}^n((t_{i-1}+ t_i)/2 - t_{i-1})(t_j - (t_{j-1}+ t_j)/2) \\
& \quad - \sum_{i,j=1}^n(t_i - (t_{i-1} + t_i)/2)((t_{j-1}+ t_j)/2 - t_{j-1}) \\
& \quad + \sum_{i,j=1}^n(t_i - (t_{i-1} + t_i)/2)(t_j - (t_{j-1}+ t_j)/2) \\
& \quad + 2\sum_{j=1}^n((t_{j-1}+ t_j)/2 - t_{j-1})^2 \\
& \quad + 2\sum_{j=1}^n(t_j - (t_{j-1}+ t_j)/2)^2
\end{align*}
$$
Observe a simetria que nos permite ver que o primeiro e o quarto termo são idênticos, assim como o segundo e o terceiro. Assim,
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& = 2\sum_{i,j=1}^n((t_{i-1}+ t_i)/2 - t_{i-1})((t_{j-1}+ t_j)/2 - t_{j-1}) \\
& \quad - 2\sum_{i,j=1}^n((t_{i-1}+ t_i)/2 - t_{i-1})(t_j - (t_{j-1}+ t_j)/2) \\
& \quad + 2\sum_{j=1}^n((t_{j-1}+ t_j)/2 - t_{j-1})^2 \\
& \quad + 2\sum_{j=1}^n(t_j - (t_{j-1}+ t_j)/2)^2
\end{align*}
$$
Agora, observe que os dois primeiro termos se cancelam, de modo que
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& = 2\sum_{j=1}^n((t_{j-1}+ t_j)/2 - t_{j-1})^2 + 2\sum_{j=1}^n(t_j - (t_{j-1}+ t_j)/2)^2.
\end{align*}
$$
Esse somatório pode ser visto como um somatório dos quadrados dos incrementos de uma malha mais fina. Mas, para simplificar, podemos simplesmente estimar
$$
\begin{align*}
\mathrm{Var}&\left(\sum_{j=1}^{n} \left((W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right) \right) \\
& \leq 4\sum_{j=1}^n(t_j - t_{j-1})^2 \\
& \leq 4T\max_{j=1, \ldots, n}|t_j - t_{j-1}| \rightarrow 0.
\end{align*}
$$
Dessa forma, vemos que
$$
\frac{1}{2}\sum_{j=1}^{n} \left\{(W_{(t_{j-1}+ t_j)/2} - W_{t_{j-1}})^2 - (W_{t_j} - W_{(t_{j-1}+ t_j)/2})^2\right\} \rightarrow 0
$$
em probabilidade, de modo que
$$
R_M(1/2) \rightarrow \frac{1}{2}W_T^2.
$$

### Caso geral $0 \leq \lambda \leq 1$

Vimos, acima, que
$$
R_M(0) \rightarrow \frac{1}{2}W_T^2 - \frac{1}{2}T, \quad R_M(1/2) \rightarrow \frac{1}{2}W_T^2, \quad R_M(1) \rightarrow \frac{1}{2}W_T^2 + \frac{1}{2}T.
$$
Mais geralmente, para $0 \leq \lambda \leq 1$, vale
$$
R_M(\lambda) \rightarrow \frac{1}{2}W_T^2 + \left(\lambda - \frac{1}{2}\right)T,
$$
em probabilidade.

Pode-se verificar que
$$
\begin{align*}
W_{\theta_j^\lambda}(W_{t_j} - W_{t_{j-1}}) & = \frac{1}{2} (W_{t_j}^2 - W_{t_{j-1}}^2) - \frac{1}{2} (W_{t_j} - W_{t_{j-1}}) ^2 \\
& \quad + (W_{\theta_j^\lambda} - W_{t_{j-1}})^2 + (W_{t_j} - W_{\theta_j^\lambda})(W_{\theta_j^\lambda} - W_{t_{j-1}}).
\end{align*}
$$
De fato, isso segue de
$$
\begin{align*}
\frac{b^2 - a^2 - (b - a)^2}{2} + (c - a)^2 + (b - c)(c - a) &  = ab - a^2 + c^2 - 2ac + a^2 + bc - ab - c^2 + ac \\
& = bc - ac = c(b - a).
\end{align*}
$$
Assim,
$$
\begin{align*}
R_M(\lambda) & = \frac{1}{2}\sum_{j=1}^{n} (W_{t_j}^2 - W_{t_{j-1}}^2) - \frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \\
& \quad + \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})^2 + \sum_{j=1}^{n} (W_{t_j} - W_{\theta_j^\lambda})(W_{\theta_j^\lambda} - W_{t_{j-1}})
\end{align*}
$$

O primeiro termo é uma soma telescópica resultando em $W_T/2$. O segundo termo converge, em probabilidade, para $-T/2$. O terceiro termo, para $\lambda T$. E o último termo, para $0$. Isso demonstra o resultado. Deixamos os detalhes como exercício.

## Considerações finais

No caso mais geral, ao considerarmos um integrando da forma $g(t, X_t, Y_t)$ em relação a um processo $\{Y_t\}_t$, a escolha $\lambda = 0$ nos levará à *integral de Itô*. Nesse caso, temos, como obtido acima,
$$
\int_0^T W_t \;\mathrm{d}W_t = \frac{1}{2}W_T - \frac{1}{2}T.
$$
Observe que isso **não** coincide com o resultado pela definição via dualidade, vista em na Seção {{link_section pages/c05/integral_dualidade}}. A definição via dualidade coincide com a da escolha $\lambda = 1/2$, que nos levará à *integral de Stratonovich*. Para evitar confusões, denotamos essa integral de forma diferente e essa sim coincida com a definição via dualidade, nos casos em que aquela está definida:
$$
\int_0^T W_t \circ\mathrm{d}W_t = \frac{1}{2}W_T.
$$

## Exercícios

1. No caso geral $0\leq \lambda \leq 1$, mostre que, ao refinarmos a malha, os seguintes limites valem em probabilidade:
$$
\begin{align*}
- \frac{1}{2}\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 & \rightarrow -\frac{1}{2}T\\
\sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})^2 & \rightarrow \lambda T\\
\sum_{j=1}^{n} (W_{t_j} - W_{\theta_j^\lambda})(W_{\theta_j^\lambda} - W_{t_{j-1}}) & \rightarrow 0.
\end{align*}
$$
