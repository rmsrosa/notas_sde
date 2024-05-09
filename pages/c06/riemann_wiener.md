@def title = "Limites de somatórios à la Riemann-Stieltjes"

# {{ get_title }}

Vimos uma maneira de definir a integral em relação a processos $\{Y_t\}_t$ cujos caminhos amostrais não são de variação limitada. Mas apenas integrandos da forma $g(t, Y_t)$, para certos tipos particulares de funções, são permitidos ($g = g(t)$ continuamente diferenciáveis ou $g=g(t, y) = \partial_y G(t, y)$). Queremos estender a noção de integral para funções mais gerais e com integrandos da forma $g(t, X_t)$, i.e. envolvendo processos $\{X_t\}_t$ diferentes daquele em relação ao qual estamos integrando. A motivação é prática: queremos integrar em relação a um processo de Wiener.

A integral definida anteriormente não foi feita diretamente em termos de somas de Riemann ou de integrais de funções simples. Foi definida na forma de dualidade (seja via fórmula de integração por partes, quando $g=g(t)$ é diferenciável, ou via fórmula de mudança de variáveis, quando $g=g(t, y) = \partial_y G(t, y)$). Aqui, por outro lado, vamos investigar um caminho semelhante ao feito em integrais de Riemann-Stieltjes.

Na integral de Riemann-Stieltjes, consideramos malhas cada vez mais finas e aproximamos a função por funções constantes por partes, mais precisamente constantes em cada subintervalo da malha, cuja integral se reduz a um somatório finito. O valor em cada subintervalo da malha é determinado pelo valor da função em um ponto escolhido arbitrariamente em cada subintervalo. O limite do somatório deve existir e ser único independentemente da escolha desse ponto em cada subintervalo. Isso é possível sempre que a função integrada é contínua ou tem descontinuidades em um conjunto de medida nula.

Veremos, a seguir, que esse limite pode não ser único, ou não existir, quando integramos em relação a um processo de Wiener e escolhemos os pontos de forma arbitrária. A regularidade do integrando não é o problema. Muitas vezes vamos integrar processos cujos caminhos são contínuos. O problema é a possível dependência entre o integrando $X_{\theta},$ em um ponto qualquer $t \leq \theta \leq t + \Delta t,$ e o passo $W_{t + \delta t} - W_t.$ Por conta disso o limite irá depender da escolha do ponto e pode não convergir se a escolha não for feita de forma sistemática.

Para ilustrar a complexidade desse problema, vamos considerar diferentes somas de Riemann associadas à seguinte integral envolvendo um processo de Wiener $\{W_t\}_{t\geq 0}$:
$$
\int_0^T W_t \;\mathrm{d}W_t.
$$

Observe que, via dualidade com a fórmula de mudança de variáveis, tomando $G(y) = y^2/2$, temos $g(y) = G'(y) = y$ e 
$$
\int_0^T W_t \circ \;\mathrm{d}W_t = G(W_T) - G(W_0) = \frac{W_T}{2}.
$$

O que acontece se, por outro lado, considerarmos as somas de Riemann-Stieltjes associada a essa integral?

## Somas de Riemann-Stieltjes

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

Vamos calcular, a seguir, o limite no caso $\lambda = 0$, depois no caso $\lambda = 1$, em seguida no caso $\lambda = 1/2$ e, finalmente, o caso geral $0 \leq \lambda \leq 1$.

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

Observe que, no limite,
$$
\mathbb{E}\left[ \frac{1}{2}W_T^2 - \frac{1}{2}T\right] = \frac{1}{2}\mathbb{E}[W_T^2] - \frac{1}{2}T = \frac{1}{2}T - \frac{1}{2}T = 0.
$$
Na verdade, o valor esperado do somatório já é nulo:
$$
\begin{align*}
\mathbb{E}\left[\sum_{j=1}^{n} W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}) \right] & = \sum_{j=1}^{n} \mathbb{E}\left[W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}})\right] \\
& = \sum_{j=1}^{n} \mathbb{E}\left[W_{t_{j-1}}W_{t_j}\right] -\sum_{j=1}^{n} \mathbb{E}\left[W_{t_{j-1}}^2\right] \\
& = \sum_{j=1}^{n} \min\{t_{j-1}, t_j\} -\sum_{j=1}^{n} t_{j-1} \\
& = 0.
\end{align*}
$$

### Caso $\lambda = 1$

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

### Caso geral $0 \leq \lambda \leq 1$

Vamos considerar, agora, o caso geral $R_M(\lambda).$ Somando e subtraindo $W_{t_{j-1}}$ no primeiro termo e, em seguida, somando e subtraindo $W_{\theta_j^\lambda}$ no segundo termo, obtemos
$$
\begin{align*}
    R_M(\lambda) & = \sum_{j=1}^{n} W_{\theta_j^\lambda} (W_{t_j} - W_{t_{j-1}}) \\
    & = \sum_{j=1}^{n} W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}) + \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})(W_{t_j} - W_{t_{j-1}}) \\
    & = \sum_{j=1}^{n} W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}) + \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})(W_{t_j} - W_{\theta_j^\lambda} + W_{\theta_j^\lambda} - W_{t_{j-1}}) \\
    & = \sum_{j=1}^{n} W_{t_{j-1}} (W_{t_j} - W_{t_{j-1}}) + \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})(W_{t_j} - W_{\theta_j^\lambda}) + \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})(W_{\theta_j^\lambda} - W_{t_{j-1}})
\end{align*}
$$
O primeiro termo é $R_M(0),$ de modo que podemos escrever
$$
R_M(\lambda) = R_M(0) + A_n + B_n,
$$
onde
$$
A_n = \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})(W_{t_j} - W_{\theta_j^\lambda}), \qquad B_n = \sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})(W_{\theta_j^\lambda} - W_{t_{j-1}}).
$$
Já sabemos que 
$$
R_M(0) \rightarrow \frac{W_T}{2} - \frac{T}{2},
$$
em probabilidade. Quanto aos outros termos, é possível mostrar que
$$
A_n \rightarrow \lambda T, \qquad B_n \rightarrow 0,
$$
em probabilidade. Para isso, basta mostrar que
$$
\mathbb{E}[A_n] \rightarrow \lambda T, \qquad \operatorname{Var}(A_n) \rightarrow 0,
$$
e
$$
\mathbb{E}[B_n] \rightarrow 0, \qquad \operatorname{Var}(B_n) \rightarrow 0.
$$
Essas demonstrações são semelhantes à de que
$$
\sum_{j=1}^{n} (W_{t_j} - W_{t_{j-1}})^2 \rightarrow T.
$$
Deixamos os detalhes a cargo do leitor.

Como resultado, obtemos que
$$
R_M(\lambda) \rightarrow \frac{1}{2}W_T^2 + \left(\lambda - \frac{1}{2}\right)T,
$$
em probabilidade.

## Considerações finais

No caso mais geral, ao considerarmos um integrando da forma $g(t, X_t, Y_t)$ em relação a um processo $\{Y_t\}_t$, a escolha $\lambda = 0$ nos levará à *integral de Itô*. Nesse caso, temos, como obtido acima,
$$
\int_0^T W_t \;\mathrm{d}W_t = \frac{1}{2}W_T - \frac{1}{2}T.
$$
Observe que isso **não** coincide com o resultado pela definição via dualidade, vista em na Seção {{link_section pages/c05/integral_dualidade}}. A definição via dualidade coincide com a escolha $\lambda = 1/2$, que nos levará à *integral de Stratonovich*. Para evitar confusões, denotamos essa integral de forma diferente e essa, sim, coincide com a definição via dualidade, nos casos em que aquela está definida:
$$
\int_0^T W_t \circ\mathrm{d}W_t = \frac{1}{2}W_T.
$$

## Exercícios

1. No caso geral $0\leq \lambda \leq 1$, mostre que, ao refinarmos a malha, os seguintes limites valem em probabilidade:
$$
\begin{align*}
\sum_{j=1}^{n} (W_{\theta_j^\lambda} - W_{t_{j-1}})^2 & \rightarrow \lambda T\\
\sum_{j=1}^{n} (W_{t_j} - W_{\theta_j^\lambda})(W_{\theta_j^\lambda} - W_{t_{j-1}}) & \rightarrow 0.
\end{align*}
$$
2. Pensando na integral $\int_0^T t \;\mathrm{d}W_t,$ mostre que
$$
\int_0^T t\;\mathrm{d}W_t = \lim_{\substack{0\leq t_0 < \ldots < t_n \leq t, \;n\in \mathbb{N} \\ \max_{i=1, \ldots, n}|t_i - t_{i-1}| \rightarrow 0}} \sum_{j=1}^n t_{j-1}(W_{t_j} - W_{t_{j-1}}) \rightarrow TW_T - \int_0^T W_t \;\mathrm{d}t,
$$
(dica, soma e subtraia $\Delta t_j = t_j - t_{j-1}$ ao termos $t_{j-1}$)
de modo que essa definição via limite coincide com a definição via dualidade,
$$
\int_0^T g(t) \;\mathrm{d}W_t = g(T)W_T - \int_0^T g'(t)W_t\;\mathrm{d}t.
$$
3. Deduza, usando tanto a fórmula acima quanto as somas de Riemann-Stieljes que
$$
\int_0^T t\;\mathrm{d}W_t \sim \mathcal{N}\left(0, \frac{T^3}{3}\right).
$$
