@def title = "Não-diferenciabilidade quase sempre dos caminhos amostrais"

# {{ get_title }}

Caso os caminhos amostrais de um processo de Wiener $\{W_t\}_{t\geq 0}$ fossem diferenciáveis em um instante $t$, teríamos a existência, quase sempre, do limite
$$
\lim_{\tau \rightarrow 0} \frac{W_{t+\tau} - W_t}{\tau}.
$$
Em particular, teríamos
$$
\limsup_{\tau \rightarrow 0} \frac{|W_{t+\tau} - W_t|}{\tau} < \infty.
$$
quase sempre. Porém, isso não é verdade. Mais do que isso. Esse limite superior é infinito com probabilidade um. Em particular, com probabilidade um, os caminhos amostrais não são diferenciáveis em instante algum.

## Não diferenciabilidade na origem

Vamos começar ilustrando isso no instante $t = 0$. Temos
$$
\lim_{\tau\rightarrow 0} \frac{W_\tau - W_0}{\tau} = \lim_{\tau\rightarrow 0} \frac{W_\tau}{\tau}.
$$

Lembrando da propriedade de simetria por rescalonamento, considere os processos de Wiener definidos por
$$
V_t^a = \frac{1}{a}W_{a^2t}, \qquad t \geq 0,
$$
para $a > 0$.

Ambos $\{W_t\}_{t \geq 0}$ e $\{V_t\}_{t\geq 0}$ são processos de Wiener padrão, com mesma lei de probabilidades $W_t, V_t \sim \mathcal{N}(0, t)$. Portanto,
$$
\mathbb{P}(|W_\tau| \leq r) = \mathbb{P}(|V_\tau^a| \leq r), \qquad \forall r \geq 0.
$$
Assim,
$$
\mathbb{P}(|W_\tau| \leq r) = \mathbb{P}(|V_\tau^a| \leq r) = \mathbb{P}\left(\frac{|W_{a^2\tau}|}{a} \leq r\right).
$$

Escolhendo $a = 1/\sqrt{\tau}$, temos
$$
\mathbb{P}(|W_\tau| \leq r) = \mathbb{P}\left(\sqrt{\tau}|W_{1}| \leq r\right).
$$
Podemos escrever isso na forma
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} \leq \frac{r}{\tau}\right) = \mathbb{P}\left(|W_{1}| \leq \frac{r}{\sqrt{\tau}}\right).
$$

Escolhendo, agora, $r = \tau^{3/4}$, obtemos
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} \leq \frac{1}{\tau^{1/4}}\right) = \mathbb{P}\left(|W_{1}| \leq \tau^{1/4}\right).
$$

Como $W_1 \sim \mathcal{N}(0, 1)$, temos que
$$
\mathbb{P}(|W_1| \leq \tau^{1/4}) \rightarrow 0, \qquad \tau \rightarrow 0.
$$
Portanto, para qualquer $\varepsilon > 0$, existe $\tau > 0$ tal que
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} \leq \frac{1}{\tau^{1/4}}\right)\leq \varepsilon.
$$
Escolhemos uma sequência $\{\varepsilon_n\}_{n\in\mathbb{N}}$ tal que $\varepsilon_n > 0$ e $\sum_n \varepsilon_n < \infty.$ (Por exemplo, $\varepsilon_n = 2^{-n}$.) Agora, dado $M > 0$, escolhemos, para cada $n$, instantes $\tau_n$ tais que $0 < \tau_n \leq 1/M^4$ e
$$
\mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq \frac{1}{\tau_n^{1/4}}\right) \leq \varepsilon_n.
$$
Assim,
$$
\sum_{n=1}^\infty \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq M\right) \leq \sum_{n=1}^\infty \mathbb{P}\left(\frac{|W_{\tau_n}|}{\tau_n} \leq \frac{1}{\tau_n^{1/4}}\right) \leq \sum_n \varepsilon_n < \infty
$$

Segue, então, pelo Lema de Borel-Cantelli, que
$$
\mathbb{P}\left(\limsup_{n\rightarrow \infty} E_n^M\right) = 0,
$$
onde
$$
E_n^M = \left\{\frac{|W_{\tau_n}|}{\tau_n} \leq M \right\}.
$$
Temos
$$
\limsup_{n\rightarrow \infty} E_n^M = \bigcap_{n\in\mathbb{N}}\bigcup_{j\geq n} E_j^M = \left\{\omega; \;\forall n\in \mathbb{N}, \exists j \geq n, \;\frac{|W_{\tau_j}|}{\tau_j} \leq M \right\}
$$
Observe que
$$
\left\{\omega; \; \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} < M \right\} \subset \left\{\omega; \;\forall n\in \mathbb{N}, \exists j \geq n, \;\frac{|W_{\tau_j}|}{\tau_j} \leq M \right\} = \limsup_{n\rightarrow \infty} E_n^M.
$$
Portanto,
$$
\mathbb{P}\left(\limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} \leq M\right) = 0.
$$
Nesse momento, essa estimativa é válida para qualquer $M>0$. Como
$$
\left\{ \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} < \infty \right\} = \bigcup_{M\in \mathbb{N}} \left\{ \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} \leq M \right\},
$$
deduzimos que
$$
\mathbb{P}\left( \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} < \infty \right) = 0.
$$

Isso mostra que, com probabilidade um, os caminhos amostrais não são diferenciáveis em $t = 0$.

## Não diferenciabilidade em qualquer ponto

Como o processo de Wiener é invariante por translações, aplicando o resultado acima a $V_t^s = W_{s + t} - W_s$, para $s \geq 0$, segue que, para qualquer $t \geq 0$, quase todo caminho amostral é não diferenciável no instante $t$. Mas isso não é o mesmo que dizer que quase todo caminho amostral é não diferenciável em todos os instantes $t \geq 0$. Isso também é verdade, mas não segue diretamente do resultado acima.

## Quase todo caminho amostral não é diferenciável em quase todo ponto

O resultado anterior diz que, para todo $t \geq 0$ dado, os caminhos amostrais são quase todos não diferenciáveis em $t$. Um resultado mais forte é dizer que quase todo caminho amostral não é diferenciável em quase todo ponto. Isso também é verdade, mas a demonstração é mais delicada. Veja, por exemplo, Mörters & Peres (2010).
