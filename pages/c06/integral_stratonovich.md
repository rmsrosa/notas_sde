@def title = "Integral de Stratonovich"

# {{ get_title }}

A integral de Itô de um processo $\{H_t\}_{t\geq 0}$ é baseada no limite dos somatórias da forma
$$
\sum_{j=1}^n H_{t_{j-1}}(W_{t_j} - W_{t_{j-1}}),
$$
ou seja, onde em cada termo o processo é tomado no instante $t_{j-1}$ à esquerda de cada subintervalo $[t_{j-1}, t_j]$ da malha. Conforme vimos na Seção {{link_section pages/c06/riemann_wiener}}, podemos ter limites diferentes se tomarmos outros pontos do subintervalo. E comentamos, também, que a escolha do ponto médio de cada subintervalo nos leva à *integral de Stratonovich.*

No que se segue, vamos formalizar essa definição e ver a relação dela com a integral de Itô.

## Integrandos permitidos

Como no caso da integral de Itô, pedimos que o integrando $\{H_t\}_{t\geq 0}$ seja *não antecipativo* *("non-antecipating"),* ou *adaptado,* ao processo $\{W_t\}_t.$

Em relação à mensurabilidade, pedimos, também, que $\{H_t\}_{t\geq 0}$ seja *progressivamente mensurável* em relação à filtração natural do processo de Wiener.

Em relação à integrabilidade, pedimos, ainda, que $\{H_t\}_{t\geq 0}$ seja de *quadrado integrável,* i.e.
$$
\int_0^T \mathbb{E}\left[H_t^2\right] \;\mathrm{d}t  < \infty.
$$

## Definição

Como no caso da integral de Itô, a ideia é aproximar o processo inicial por processos contínuos ou por processos do tipo escada e, para esses processos em particular, definir a integral de Stratonovich por
$$
    \int_0^T H_t\circ\mathrm{d}W_t = \lim_{\|M\|\rightarrow 0} \sum_{j=1}^n H_{(t_{j-1} + t_j)/2}(W_{t_j} - W_{t_{j-1}}),
$$
para malhas $0 = t_0 < t_1 < \ldots < t_n = T,$ com $\|M\|=\max_{j=1, \ldots, n}|t_j - t_{j-1}|.$

Observe a notação da integral de Stratonovich com o símbolo $\circ\mathrm{d}W_t,$ para distinguir da integral de Itô.

## Existência 

## Relação com a integral de Itô

Considere o caso em que $H_t = g(X_t)$ e $\{X_t\}_{t\geq 0}$ é um processo ...

Escrevendo
$$
    g(X_{(t_{j-1} + t_j)/2}) = g(X_{(t_{j-1} + t_j)/2} - X_{t_{j-1}} + X_{(t_{j-1} + t_j)/2} - H_{t_{j-1}})
$$
vemos que
