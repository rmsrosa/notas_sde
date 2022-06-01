@def title = "Limites de somatórios de Riemann envolvendo o processo de Wiener"

# {{ get_title }}

Vimos uma maneira de definir a integral de uma função $g(t, Y_t)$ em relação a processos $\{Y_t\}_t$ cujos caminhos amostrais não são de variação limitada. Mas apenas de certos tipos particulares de funções, que sejam continuamente diferenciáveis e da forma $g(t, Y_t) = \partial_y G(t, Y_t)$. Queremos estender a noção de integral para funções mais gerais, da forma $g(t, X_t)$, com $g$ menos regular e envolvendo processos diferentes daquele em relação ao qual estamos integrando.

A integral definida anteriormente não foi feita diretamente em termos de somas de Riemann ou de integrais de funções simples. Foi definida na forma de dualidade. Aqui, vamos investigar um caminho semelhante ao feito em integrais de Riemann.

Na integral de Riemann, consideramos malhas cada vez mais finas e aproximamos a função por funções constantes por partes, constantes em cada subintervalo da malha, e cuja integral se reduz a um somatório finito. O valor em cada subintervalo da malha é determinado pelo valor da função em um ponto escolhido arbitrariamente em cada subintervalo. O limite do somatório deve existir e ser único independentemente da escolha desse ponto em cada subintervalo. Isso é possível sempre que a função integrada é contínua ou tem descontinuidades em um conjunto de medida nula.

Veremos, a seguir, que isso não acontece quando integramos em relação a um processo de Wiener.