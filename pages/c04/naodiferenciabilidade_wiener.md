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
quase sempre. Porém, isso não é verdade. Mais do que isso. Esse limite é infinito com probabilidade um. Em particular, com probabilidade um, os caminhos amostrais não são diferenciáveis em instante algum.

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

Ambos $\{W_t\}_{t \geq 0}$ e $\{V_t\}_{t\geq 0}$ são processos de Wiener padrão, com mesma lei de probabilidades $W_t, V_t \sim \mathcal{N}(0, t)$. Em particular,
$$
\mathbb{P}(|W_\tau| > r) = \mathbb{P}(|V_\tau^a| > r), \qquad \forall r \geq 0.
$$
Assim,
$$
\mathbb{P}(|W_\tau| > r) = \mathbb{P}(|V_\tau^a| > r) = \mathbb{P}\left(\frac{|W_{a^2\tau}|}{a} > r\right).
$$

Escolhendo $a = 1/\sqrt{\tau}$, temos
$$
\mathbb{P}(|W_\tau| > r) = \mathbb{P}\left(\sqrt{\tau}|W_{1}| > r\right).
$$
Podemos escrever isso na forma
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} > \frac{r}{\tau}\right) = \mathbb{P}\left(|W_{1}| > \frac{r}{\sqrt{\tau}}\right).
$$

Escolhendo, agora, $r = \tau^{3/4}$, obtemos
$$
\mathbb{P}\left(\frac{|W_\tau|}{\tau} > \frac{1}{\tau^{1/4}}\right) = \mathbb{P}\left(|W_{1}| > \tau^{1/4}\right).
$$

Fazendo $\tau \rightarrow 0$, vemos que
$$
\mathbb{P}\left( \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} > n \right) = \mathbb{P}\left(|W_{1}| > 0 \right) = 1,
$$
para todo $n \in \mathbb{N}$. Ou seja,
$$
\mathbb{P}\left( \limsup_{\tau \rightarrow 0} \frac{|W_\tau|}{\tau} = \infty \right) = 1.
$$
Em particular, com probabilidade um, os caminhos amostrais não são diferenciáveis em $t = 0$.
