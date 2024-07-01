@def title = "Propriedades de processos de Wiener"

# {{ get_title }}

Vejamos diversas propriedades de processos de Wiener.

## Processo Gaussiano

Um processo de Wiener é um exemplo de processo Gaussiano. Para ver isso, dados $t_1, \ldots, t_n \geq 0,$ podemos escrever cada $W_{t_1}, \ldots, W_{t_n}$ como combinação linear das normais independentes $W_{t_1} - W_{t_0},$ $W_{t_2} - W_{t_1},$ ..., $W_{t_n} - W_{t_{n-1}},$ onde $t_0 = 0,$ i.e.
$$
W_{t_j} = W_{t_j} - W_{t_{j-1}} + \cdots + W_{t_1} - W_{t_0}.
$$
Dessa forma, a distribuição conjunta de $W_{t_1}, \ldots, W_{t_n}$ é dada por
$$
\mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} \leq x_n) = \mathbb{P}(W_{t_1} - W_{t_0} \leq x_1, \ldots, W_{t_n} - W_{t_{n-1}} + \cdots + W_{t_1} - W_{t_0} \leq x_n)
$$
Isso pode ser reescrito na forma
$$
\mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} \leq x_n) = \mathbb{P}(W_{t_1} \leq x_1, \ldots, W_{t_n} - W_{t_{n-1}} \leq x_n - \cdots - x_1) = F(x_1, \ldots, x_n - \cdots - x_1),
$$
onde $F$ é a função de distribuição acumulada da normal multivariada associada às normais independentes $W_{t_1} - W_{t_0}, \ldots, W_{t_n} - W_{t_{n-1}}.$ Portanto, $\{W_t\}_{t\geq 0}$ é um processo Gaussiano.

Observe que não basta que cada marginal $W_{t_j}$ seja uma normal para que a vetor aleatório $(W_{t_1}, \ldots, W_{t_n})$ seja uma normal multivariada em $\mathbb{R}^n.$ Mas no caso acima, temos que os passos $W_{t_1} - W_{t_0}, \ldots, W_{t_n} - W_{t_{n-1}}$ são normais independentes, portanto o vetor aleatório
$$
    (W_{t_1} - W_{t_0}, \ldots, W_{t_n} - W_{t_{n-1}})
$$
é uma normal multivariada. Além disso, o vetor aleatório
$$
    (W_{t_1}, \ldots, W_{t_n})
$$
é uma transformação linear dessa normal multivariada,
$$
    \left( \begin{array}{c} W_{t_1} \\ \vdots \\ W_{t_n} \end{array} \right) = \left[ \begin{array}{cccc} 1 & 0 & \dots & 0 \\ 1 & 1 & \ddots & \vdots \\ \vdots & \ddots & \ddots & 0 \\ 1 & \dots & 1 & 1 \end{array} \right] \left( \begin{array}{c} W_{t_1} - W_{t_0} \\ \vdots \\ W_{t_n} - W_{t_{n-1}} \end{array} \right).
$$
Portanto, esse vetor aleatório também é uma normal multivariada.

## Esperança e variância

Como $W_0 = 0$ e $W_t - W_0 \sim \mathcal{N}(0, t),$ então
$$
\mathbb{E}[W_t] = \mathbb{E}[W_t - X_0] = 0
$$
e
$$
\mathrm{Var}(W_t) = \mathrm{Var}(W_t - W_0) = t.
$$

## Covariância

Para quaisquer $t \geq s \geq 0,$ como os *incrementos* são independentes e, portanto, tem correlação nula, segue que
$$
\begin{align*}
\mathrm{Cov}(W_t, W_s) & = \mathrm{Cov}(W_s + W_t - W_s, W_s) = \mathrm{Cov}(W_s, W_s) + \mathrm{Cov}(W_t - W_s, W_s) \\ & = \mathrm{Cov}(W_s - W_0, W_s - W_0) + \mathrm{Cov}(W_t - W_s, W_s - W_0) = \mathrm{Var}(W_s - W_0) = s, \quad \forall t \geq s \geq 0.
\end{align*}
$$
Observe que, se $t = s > 0,$ então o segundo termo se anula pois $W_t - W_s = 0.$ Já se $t \geq s = 0,$ então todos os termos se anulam, já que $W_s - W_0 = 0.$

Por simetria, como $\mathrm{Cov}(W_t, W_s) = \mathrm{Cov}(W_s, W_t),$ então, se, por outro lado, $s \geq t \geq 0,$ obtemos
$$
\mathrm{Cov}(W_t, W_s) = t, \qquad \forall s \geq t \geq 0.
$$

De qualquer forma, podemos escrever, para $t, s \geq 0$ quaisquer,
$$
\mathrm{Cov}(W_t, W_s) = \min\{t, s\}.
$$

## Correlação

Como o desvio padrão de $W_t$ é $\sigma(W_t) = \sqrt{t},$ temos, da covariância obtida acima, que
$$
    \mathrm{corr}(W_t, W_s) = \frac{\mathrm{Cov}(W_t, W_s)}{\sigma(W_t)\sigma(W_s)} = \frac{\min\{t, s\}}{\sqrt{t}\sqrt{s}} = \frac{1}{\max\{t, s\}}.
$$

## Não independência de incrementos em intervalos que se interceptam

Por definição, dois incrementos $W_{t_3} - W_{t_2}$ e $W_{t_1} - W_{t_0}$ são independentes quando $t_3 > t_2 = t_1 > t_0.$ Isso se estende ao caso em que $t_2 > t_1,$ pois basta acrescentar $W_{t_2} - W_{t_1}$ que teremos três incrementos independentes $W_{t_3} - W_{t_2},$ $W_{t_2} - W_{t_1}$ e $W_{t_1} - W_{t_0},$ e quaisquer dois deles também são independentes.

Contudo, os incrementos $W_{t_3} - W_{t_1}$ e $W_{t_2} - W_{t_0}$ não são independentes quando $t_1 \leq t_2 < t_3 \leq t_4,$ porque os intervalos $[t_0, t_2]$ e $[t_1, t_3]$ tem interseção não trivial. De fato, nesse caso, temos
$$
\begin{align*}
\mathbb{E}((W_{t_3} - W_{t_1})(W_{t_2} - W_{t_0})) & = \mathbb{E}(W_{t_3}W_{t_2} - W_{t_3}W_{t_0} - W_{t_1}W_{t_2} + W_{t_1}W_{t_0}) \\
& = \min\{t_3, t_2\} - \min\{t_3, t_0\} - \min\{t_1, t_2\} + \min\{t_1, t_0\} \\
& = t_2 - t_0 - t_1 + t_0 = t_2 - t_1 > 0,
\end{align*}
$$
que é exatamente o tamanho do intervalo de tempo em que os incrementos coincidem.

Novamente, vemos que, se $t_1 = t_2,$ então essa correlação se anula.

## Não é um processo estacionário

Um processo de Wiener não é estacionário, pois, em particular, os processos $W_t$ não tem a mesma lei de probabilidades. E também não é fracamente estacionário, já que, apesar de $\mathbb{E}[W_t] = 0$ ser constante, temos, para $t, s\geq 0$ e $\tau > 0,$ que
$$
\begin{align*}
\mathbb{E}[W_{t + \tau}W_{s + \tau}] & = \mathbb{E}[(W_{t + \tau} - \mathbb{E}[W_{t + \tau}])(W_{s + \tau} - \mathbb{E}[W_{s + \tau}])] \\
& = \mathrm{Cov}(W_{t + \tau}, W_{s + \tau}) = \min\{t + \tau, s + \tau\} = \min\{t, s\} + \tau,
\end{align*}
$$
Ou seja, $\mathbb{E}[W_{t + \tau}W_{s + \tau}]$ depende de $\tau.$

## Condição para um processo Gaussiano ser um processo de Wiener

Vamos concluir afirmando que um processo Gaussiano $\{W_t\}_{t\geq 0}$ com caminhos contínuous quase certamente e satisfazendo $\mathbb{E}[W_t] = 0$ e $\mathbb{E}[W_t W_s] = \min\{t, s\},$ para todo $t, s \geq 0,$ é um processo de Wiener.

De fato, temos, por definição, $W_0$ normal com
$$
\mathbb{E}[W_0] = 0, \qquad \mathbb{E}[W_0^2] = 0,
$$
de modo que
$$
    W_0 = 0.
$$

Para $t, \tau \geq 0,,$ temos o incremento $W_{t+\tau} - W_t$ como sendo uma normal com esperança e variância dadas por
$$
    \mathbb{E}[W_{t+\tau} - W_t] = \mathbb{E}[W_{t+\tau}] - \mathbb{E}[W_t] = 0 - 0 = 0
$$
e 
$$
    \mathbb{E}[(W_{t+\tau} - W_t)^2] = \mathbb{E}[W_{t+\tau}^2] - 2\mathbb{E}[W_{t+\tau}W_2] + \mathbb{E}[W_t^2] = t + \tau - 2t + t = \tau,
$$
portanto
$$
    W_{t+\tau} - W_t \sim \mathcal{N}(0, \tau).
$$

Por hipótese, os caminhos são quase certamente contínuos. Por fim, para a independência dos incrementos, como os incrementos são normais, basta mostrar a independência dois a dois. Assim, temos, para $0 \leq t_0 \leq t_1 \leq t_2 \leq t_3,$
$$
\begin{align*}
\mathbb{E}((W_{t_3} - W_{t_2})(W_{t_1} - W_{t_0})) & = \mathbb{E}(W_{t_3}W_{t_1} - W_{t_3}W_{t_0} - W_{t_2}W_{t_1} + W_{t_2}W_{t_0}) \\
& = \min\{t_3, t_1\} - \min\{t_3, t_0\} - \min\{t_2, t_1\} + \min\{t_2, t_0\} \\
& = t_1 - t_0 - t_1 + t_0 = 0.
\end{align*}
$$
Como as esperanças também são nulas, isso implica na covariância ser nula e, portanto, os incrementos são independentes.
