@def title = "Apresentação"

# {{ get_title }}

> "For over two millennia, Aristotle's logic has ruled over the thinking of western intellectuals. All precise theories, all scientific models, even models of the process of thinking itself, have in principle conformed to the straight-jacket of logic. But from its shady beginnings devising gambling strategies and counting corpses in medieval London, probability theory and statistical inference now emerge as better foundations for scientific models, especially those of the process of thinking and as essential ingredients of theoretical mathematics, even the foundations of mathematics itself. We propose that this sea change in our perspective will affect virtually all of mathematics in the next century" - David Mumford, in *The Dawning of the Age of Stochasticity* (Classe di Scienze Fisiche, Matematiche e Naturali. Rendiconti Lincei. Matematica e Applicazioni, 2000).

## Motivação

![Falling Apple](/assets/images/falling_apple.svg)

A lei da gravitação de Newton é impiedosa. Se uma maçã cair do pé, é bom você não estar dormindo embaixo dela. Mas se a macieira estiver  na encosta de um morro e você estiver descansando lá embaixo no vale, há boas chances da maçã rolar e não lhe atingir. E quais seriam as chances dela parar, apetitosamente, bem ao seu lado?

Modelar a queda da maçã até o chão não é difícil. Por outro lado, modelar a maçã rolando da encosta é bem mais delicado. É extremamente difícil, pra não dizer impossível, levar em consideração todos os detalhes que afetam o rolar da maçã, como as imperfeições no terreno (grama, terra, pedras) e outros obstáculos ainda mais intangíveis (pequenos e grandes animais, chuvas, umidade no terreno, etc.).

Nesses e em diversos outros fenômenos é fundamental levar em consideração fatores aleatórios. Sejam fenômenos quânticos ou não; sejam microscópicos ou macroscópicos; sejam em fenômenos biológicos complexos, em problemas dependendo de fatores sociais, ou mesmo em problemas essencialmente mecânicos como esse.

Ao levarmos em conta fatores aleatórios nas equações de movimento, chegamos a equações diferencias que podem ser estocásticas ou aleatórias, por exemplo. Essas equações têm sido usadas com sucesso em uma ampla gama de fenômenos naturais e sociais e em diversas áreas, incluindo mecânica, química, biologia, epidemiologia, eletrônica, economia e finanças.

E qual é o custo de se considerar esses fatores aleatórios nas equações? Bom, não esperamos mais uma descrição exata do fenômeno. Em particular, não esperamos mais uma descrição exata da evolução de algum fenômeno de ordem temporal. Não esperamos mais prever o local exato em que a maçã vai parar. O que se obtém são probabilidades. Graus de certeza/incerteza de certos eventos acontecerem. Podemos obter, por exemplo, as chances da maçã lhe atingir ou não. Ou as chances dela parar em um determinado lugar, ou passar por este ou outro lugar. É isso que vamos buscar.

## Equações diferenciais estocásticas e equações diferenciais aleatórias

Equações diferenciais estão presentes em uma infinidade de modelos. Isso é natural, já que diversos fenômenos envolvem a taxa de variação de uma determinada quantidade em relação a outra, ou outras. Ao agregarmos fatores aleatórios a equações diferenciais obtemos as chamadas equações diferenciais estocásticas e as equações diferenciais aleatórias. A diferença entre elas está na forma com que a aleatoriedade entra na equação, como veremos a seguir.

Vale ressaltar que, assim como no caso determinístico, há vários tipos de equações estocásticas e aleatórias, dependendo delas envolverem uma ou mais variáveis independentes (ordinárias ou parciais), terem apenas uma variável dependente ou várias (escalares ou sistemas), terem memória ou não (equações com retardamento), envolverem também integrais ou não (equações integro-diferenciais), etc.

Naturalmente, como esse é um curso introdutório, vamos considerar aleatoriedades essencialmente em equações diferenciais ordinárias, podendo ser escalares ou sistemas. Mais adiante, veremos se cabe considerar outros tipos de equações.

## Implementações numéricas

Por experiência própria, considero que implementações numéricas são de grande valia no entendimento de equações estocásticas. Isso é verdade em uma série de problemas, mas é especialmente válido no estudo de equações estocásticas/aleatórias, dada a grande mudança de paradigma, se comparado com o pensamento determinístico que muitos de nós estamos mais acostumados.

Sendo assim, o objetivo, aqui, ao estudarmos métodos numéricos para essas equações, é duplo. Um, naturalmente, é por conta da importância de dominarmos as técnicas computacionais para a resolução desses modelos, dada a importância desses modelos em si e dada a demanda por profissionais hábeis tanto na parte teórica quanto na parte computacional, para a implementação e o estudo de modelos diversos. Sejam em Engenharia, em Biologia, em Finanças ou em diversas outras áreas. O outro objetivo é didático, de fortalecer o entendimento da teoria, contribuindo para a obtenção de uma melhor intuição sobre os conceitos e os fenômenos envolvidos.

## Bibliografia

Quanto às referências bibliográficas, não vamos seguir nenhum referência específica, mas vamos nos inspirar, essencialmente, no livro de Higham & Kloeden (2021), em conjunto com o livro de Han & Kloeden (2017), complementando com alguns pontos de outras referências, especialmente o do Evans (2013) e o do Øksendal (2011).

O livro de Han & Kloeden (2017) trata tando de RODEs quanto de SDEs. Já o de Higham & Kloeden (2021) trata apenas de SDEs. Ambos são acessíveis em nível de graduação, para quem já viu Equações Diferencias e Probabilidades. O do Higham & Kloeden tem um estilo bastante inspirador.

Os livros do Evans (2013) e o Øksendal (2011) são mais avançados e rigorosos e nos serão úteis para algumas demonstrações que iremos detalhar.

Um outro bom livro sobre RODEs é o de Neckel & Rupp (2013), que tem a vantagem de estar disponível on-line. Mas ele é um pouco mais avançado. Allen (2007) também é um outro bom livro de SDE, tendo vários modelos interessantes que podemos aproveitar. A tese de Yusuke Asai (2016), disponível online, é, também, uma boa referência tanto para SDEs quanto para RODEs, tratando tanto da parte teórica quanto numérica, e com vários exemplos interessantes. Há diversos outros livros um pouco mais avançados, como Zhang & Karniadakis (2017), Mörters & Peres (2010), entre outros listados nas referências.
