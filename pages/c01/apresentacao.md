@def title = "Apresentação"

# {{ get_title }}

> "It may very well be said that the best way to understand SDEs is to work with their numerical solutions." - Salih N. Neftci, in *An Introduction to the Mathematics of Financial Derivatives,* 2nd edition (Academic Press, 2000).

## Motivação

A lei da gravitação de Newton é impiedosa. Se uma maçã cair do pé, é bom você não estar dormindo embaixo dela. Mas se a macieira estiver lá em cima na encosta de um morro e você estiver descansando lá embaixo no vale, há boas chances da maça rolar e não lhe atingir. E quais seriam as chances dela parar, apetitosamente, bem ao seu lado?

Modelar a queda da maçã até o chão não é difícil, a menos que o vento esteja muito forte e mudando constantemente de direção. Por outro lado, modelar a maçã rolando da encosta é bem mais delicado. É extremamente difícil, pra não dizer impossível, levar em consideração todos os detalhes que afetam o rolar da maçã, como as imperfeições no terreno (grama, terra, pedras) e outros obstáculos ainda mais intangíveis (pequenos e grandes animais, chuvas, etc.).

Nesses e em diversos outros fenômenos é fundamental levar em consideração fatores aleatórios. Seja em fenômenos quânticos, seja em fenômenos biológicos complexos, seja em problemas dependendo de fatores sociais, ou mesmo em problemas essencialmente mecânicos como esse.

Ao levarmos em conta fatores aleatórios nas equações de movimento, chegamos a equações diferencias que podem ser estocásticas ou aleatórias, por exemplo. Essas equações têm sido usadas com sucesso em uma ampla gama de fenômenos naturais e sociais e em diversas áreas, incluindo mecânica, química, biologia, epidemiologia, eletrônica, economia e finanças.

E qual é o custo de se considerar esses fatores aleatórios nas equações? Bom, não esperamos mais uma descrição exata do fenômeno. Em particular, não esperamos mais uma descrição exata da evolução de alguma fenômeno de ordem temporal. Não esperamos mais prever o local exato em que a maçã vai parar. O que se obtém são probabilidades. Probabilidades de certos eventos acontecerem. Podemos obter, por exemplo, as chances da maçã lhe atingir ou não. Ou as chances dela parar em um determinado lugar, ou passar por este ou outro lugar. É isso que vamos buscar.

## Equações diferenciais estocásticas e equações diferenciais aleatórias

Equações diferenciais estão presentes em uma infinidade de modelos. Isso é natural, já que diversos fenômenos envolvem a taxa de variação de uma determinada quantidade em relação a outra, ou outras. Ao agregarmos fatores aleatórios a equações diferenciais obtemos as chamadas equações diferenciais estocásticas e as equações diferenciais aleatórias. A diferença entre elas está na forma com que a aleatoriedade entra na equação, como veremos a seguir.

Vale ressaltar que, assim como no caso determinísticos, há vários tipos de equações estocásticas e aleatórias, dependendo delas envolverem uma ou mais variáveis independentes (ordinárias x parciais), terem apenas uma variável dependente ou várias (escalares x sistemas), terem memória ou não (equações com retardamento ou não - *delay differential equations*), envolverem integrais ou não (equações integro-diferenciais), etc.

Naturalmente, como esse é um curso introdutório, vamos considerar aleatoriedades essencialmente em equações diferenciais ordinárias, podendo ser escalares ou sistemas. Mais adiante, veremos se cabe considerar outros tipos de equações.

## Implementações numéricas

Como a frase acima diz, considero, também, que implementações numéricas são de grande valia no entendimento de equações estocásticas. Isso é verdade em uma série de problemas, mas isso é especialmente significativo no estudo de equações estocásticas/aleatórias, dada a obscuridade e a complexidade do tema.

Sendo assim, o objetivo, aqui, ao estudarmos métodos numéricos para essas equações, tem duplo sentido. Um, naturalmente, é por conta da importância de dominarmos as técnicas computacionais para a resolução desses modelos, dada a imporância desses modelos em si e dada a demanda por profissionais hábeis tanto na parte teórica quanto na parte computacional, para a implementação e o estudo de modelos diversos. O outro é esse objetivo didático, de fortalecer o entendimento da teoria, contribuindo para uma melhor intuição dos fenômenos envolvidos.

## Bibliografia

Quanto às referências bibliográficas, vamos seguir, essencialmente, o livro de Han & Kloeden (2017), em conjunto com o de Higham & Kloeden (2021) e o de Neckel & Rupp (2013), complementando com alguns pontos de outras referências. Tanto o de Han & Kloeden (2017) quanto o de Neckel & Rupp (2013) discutem RODEs e SDEs, sendo o primeiro de nível mais acessível a quem cursou Equações Diferenciais e cursou ou está cursando Processos Estocásticos, enquanto que o segundo é um pouco mais técnico. Neckel & Rupp (2013) tem a vantagem de estar disponível on-line. O de Higham & Kloeden (2021) também é de nível bastante acessível, mas discute apenas equações diferenciais estocásticas.

Quanto às outras referências, Zhang & Karniadakis (2017) também foca em SDEs e é mais avançado, mas também têm discussões interessantes, e, portanto, vale tê-lo por perto. Allen (2007), por sua vez, tem vários modelos interessantes que devemos aproveitar.

Para uma boa seção de motivação/introdução, veja, por exemplo, a Seção 1.1 "Why random and Brownian motion (white noise)?", de Zhang & Karniadakis (2017). Esse será o ponto de partida.
