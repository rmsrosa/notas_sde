@def title = "Usando o ambiente SciML da linguagem Julia"

# {{ get_title }}

Estivemos, até agora, implementando diretamente os métodos numéricos, por motivos didáticos. Nas aplicações, porém, podemos utilizar pacotes numéricos que já têm esses e outros métodos implementados. Nos basta formular o problema de acordo com a interface de cada pacote (chamada de *api*, acrônimo de *"application programming interface"*).

Nesse sentido, o ambiente [SciML - The SciML Open Source Software Ecosystem](https://docs.sciml.ai/dev/) é um dos cavalos de força da linguagem [Julia](The SciML Open Source Software Ecosystem), com uma ampla gama de métodos implementados e otimizados. Há não apenas métodos para aproximar os caminhos amostrais de soluções de equações estocásticas e aleatórias, mas também para serem usados em conjunto com métodos de determinação de parâmetros, quantificação de incertezas, redes neurais e modelagem simbólica.

Vamos ilustrar aqui como usar esse ambiente para resolver as equações tratadas até agora. Nos capítulos seguintes, exploraremos esse ambiente na resolução de problemas mais complexos, envolvendo sistemas de equações.

O ambiente contém pacotes para a resolução de [equações diferenciais estocásticas](https://docs.sciml.ai/dev/modules/DiffEqDocs/solvers/sde_solve/), [equações estocástico-algébricas](https://docs.sciml.ai/dev/modules/DiffEqDocs/solvers/sdae_solve/), [equações estocásticas com retardamento/atraso](https://docs.sciml.ai/dev/modules/DiffEqDocs/solvers/sdde_solve/) e [equações diferenciais aleatórias](https://docs.sciml.ai/dev/modules/DiffEqDocs/solvers/rode_solve/), além de diversos métodos para equações determinísticas (veja [Domains of SciML](https://docs.sciml.ai/dev/#Domains-of-SciML)).
