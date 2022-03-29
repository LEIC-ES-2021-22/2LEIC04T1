
## Requirements

In this section, you should describe all kinds of requirements for your module: functional and non-functional requirements.

### Use case model 

Create a use-case diagram in UML with all high-level use cases possibly addressed by your module, to clarify the context and boundaries of your application.

Give each use case a concise, results-oriented name. Use cases should reflect the tasks the user needs to be able to accomplish using the system. Include an action verb and a noun. 

Example:
 <p align="center" justify="center">
  <img src="/images/usecases.png"/>
</p>


Briefly describe each use case mentioning the following:

* **Actor**. Name only the actor that will be initiating this use case, i.e. a person or other entity external to the software system being specified who interacts with the system and performs use cases to accomplish tasks. 
* **Description**. Provide a brief description of the reason for and outcome of this use case, or a high-level description of the sequence of actions and the outcome of executing the use case. 
* **Preconditions and Postconditions**. Include any activities that must take place, or any conditions that must be true, before the use case can be started (preconditions). Describe also the state of the system at the conclusion of the use case execution (postconditions). 

* **Normal Flow**. Provide a detailed description of the user actions and system responses that will take place during execution of the use case under normal, expected conditions. This dialog sequence will ultimately lead to accomplishing the goal stated in the use case name and description. This is best done as a numbered list of actions performed by the actor, alternating with responses provided by the system. 
* **Alternative Flows and Exceptions**. Document other, legitimate usage scenarios that can take place within this use case, stating any differences in the sequence of steps that take place. In addition, describe any anticipated error conditions that could occur during execution of the use case, and define how the system is to respond to those conditions. 

|||
| --- | --- |
| *Name* | Inscrição nas Unidades Curriculares |
| *Actor* |  Utilizador | 
| *Description* | O utilizador tem a opção de poder inscrever-se nas Unidades Curriculares que vai ter nesse ano letivo. |
| *Preconditions* | - O utilizador está autenticado na app da UNI com a sua conta do Sigarra. <br> - O Utilizador tem ETCS disponíveis para se inscrever nas Unidades Curriculares. |
| *Postconditions* | - O utilizador fica inscrito nas Unidades Curriculares. <br> - As ETCS disponíveis do utilizador são atualizadas. <br> - A informação sobre as vagas das Unidades Curriculares são atualizadas. |
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br>4. O utilizador escolhe a opção de "Alteração da Unidade Curricular" <br> 5. O utilizador escolhe as Unidades Curriculares nas quais pretende se inscrever.<br> 6. O utilizador confirma as suas escolhas. |
| *Alternative flows and exceptions* | 1. [Data Expirada] Se a data destinada à inscrição das unidades curriculares expirar, o utilizador não conseguirá fazer a alteração.<br>2. [ETCS Insuficientes] Se o utilizador não tiver ETCS suficientes para se inscrever numa Unidade Curricular, o sistema permite ao utilizador alterar a sua opção para concluir a inscrição. |

|||
| --- | --- |
| *Name* | Alteração das unidades curriculares|
| *Actor* |  Utilizador | 
| *Description* | O utilizador tem a opção de poder alterar as unidades curriculares às quais se inscreveu. |
| *Preconditions* | - O utilizador necessita de estar inscrito na unidade curricular que deseja alterar. |
| *Postconditions* |  - O utilizador altera a Unidade Curricular. <br> - Os ETCS disponíveis do utilizador são atualizados. <br> - A informação sobre as vagas das Unidades Curriculares é atulizada.  |
| *Normal flow* | 1. 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br>3. O sistema mostra ao utilizador todas as opções disponiveis.<br> 4. O utilizador escolhe a opção de "Alteração da Unidade Curricular".<br> 5. O utilizador escolhe a unidade curricular pretendida.<br> 6. O sistema mostra ao utilizador todas as opções possíveis.<br> 7. O sistema notifica o utilizador caso a acção foi bem sucedida. |
| *Alternative flows and exceptions* | 1. [Data Expirada] Se a data destinada à alteração das unidades curriculares expirar, o utilizador não conseguirá fazer a alteração. |

|||
| --- | --- |
| *Name* | Escolha de Turmas |
| *Actor* |  Utilizador | 
| *Description* | O utilizador realiza a escolha de turmas, sendo esta apenas um sugestão que depois será tida em conta para a realização da atribuição de turmas por parte do sistema. |
| *Preconditions* | - O utilizador está autenticado na app da UNI com a sua conta do Sigarra. <br> - O utilizador tem vagas disponíveis nas turmas a que se está a tentar inscrever. <br> |
| *Postconditions* | - O utilizador fica à espera da confirmação da inscrição nas turmas. <br>|
| *Normal flow* | 1. O utilizador está autenticado na app da UNI com a sua conta do Sigarra.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra.<br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br> 4. O utilizador escolhe a opção "Escolha de Turmas".<br> 5. O sistema mostra ao utilizador todas as turmas possíveis a que o utilizador se pode candidatar.<br> 6. O sistema notifica o utilizador caso a acção foi bem sucedida.<br> |
| *Alternative flows and exceptions* | 1. [Não existem vagas disponíveis] Se o sistema não tiver vagas disponíveis para a turma que o utilizador pretende, este terá de escolher outra turma. |

|||
| --- | --- |
| *Name* | Visualização  do horário |
| *Actor* |  Utilizador | 
| *Description* | O utilizador pode visualizar o horario que foi atribuido pelo sistema. |
| *Preconditions* | - O utilizador está autenticado na app da UNI com a sua conta do Sigarra. <br>  |
| *Postconditions* | - O utilizador visualiza o seu horário.  |
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br>4. O utilizador escolhe a opção de "Visualizar Horáririo" <br> 4. O utilizador visualiza o horário que lhe foi atribuido pelo sistema |
| *Alternative flows and exceptions* |  1. [Horário Inexistente] O Utilizador ainda não realizou a inscrição no Sistema.<br> 2.[Horário Não Atribuido] O sistema ainda não atribui ao utilizador o horário. |

|||
| --- | --- |
| *Name* | Consulta do Horário de cada Unidade Curricular |
| *Actor* |  Utilizador | 
| *Description* | O utilizador pode visualizar o horário de cada Unidade Curricular antes mesmo da sua inscrição  |
| *Preconditions* | - O utilizador está autenticado na app da UNI com a sua conta do Sigarra. |
| *Postconditions* | - O utilizador visualiza o horário de cada unidade curricular. <br> - As ETCS disponíveis do utilizador são atualizadas. <br> - A informação sobre as vagas das Unidades Curriculares são atualizadas. |
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br>4. O utilizador escolhe a opção de "Consulta do Horário de cada Unidade Curricular" <br> 4. O utilizador escolhe a Unidade Curricular que deseja visualizar.<br> 5. O sistema mostra todas as aulas , quer teóricas , quer prática da unidade currilcar selecionada. |
| *Alternative flows and exceptions* | 1. [Sem Horário] O sistema não tem informação do horário  . |


|||
| --- | --- |
| *Name* | Atribuição de Turmas |
| *Actor* |  Sistema | 
| *Description* | Para atribuir as turmas/horário ao user, tendo em conta a sua escolha, realiza-se um processo de seleção de onde resultam as turmas onde o sistema irá, automaticamente, inscrever o user e atribuir-lhe um horário. |
| *Preconditions* | - O user submeteu a sua escolha de turmas.<br> - Todos os outros estudantes inscritos na mesmas unidades curriculares que o user também submeteram as suas escolhas.<br> - O número de vagas disponíveis em cada unidade curricular é igual ou superior ao número de estudantes que pretendem efetuar inscrição nas turmas de cada unidade curricular. |
| *Postconditions* | - O horário resultante fica disponível para visualização pelo user.<br> - O user fica inscrito em turmas (que podem ou não ser as selecionadas por ele) das suas unidades curriculares. |
| *Normal flow* | 1. O sistema recebe as opções do user e dos restantes estudantes.<br> 2. O sistema procede ao processo de seleção e distribuição das vagas de cada turma pelos estudantes, tendo em conta critérios de triagem e desempate.<br> 3. O sistema increve o user e os restantes estudantes nas turmas. <br> 4. O horário resultante é atualizado/exibido na aplicação.<br> |
| *Alternative flows and exceptions* | 1. [Vaga não disponível] Se o sistema no passo 2 não conseguir atribuir ao user uma vaga numa das turmas selecionadas, o sistema tenta inscrever o user em turmas de menor prioridade (também selecionadas pelo user) . Se mesmo assim, não for possível atribuir vaga ao user, este fica inscrito numa turma que ainda possui vagas disponíveis.|

|||
| --- | --- |
| *Name* | Notificação de vaga numa turma |
| *Actor* |  Sistema | 
| *Description* | Na eventualidade de abertura de uma vaga numa turma, que na escolha do user possui prioridade superior à turma em que está atualmente inscrito, o user é notificado da situação através das notificações do smartphone. |
| *Preconditions* | - O user encontra-se atualmente inscrito numa turma da Unidade curricular em questão.<br> - Uma vaga fica disponível numa turma de prioridade superior nas opções do user. |
| *Postconditions* | - O user é notificado desta abertura de vaga através das notificações do smartphone. |
| *Normal flow* | 1. O sistema é informado da abertura de uma vaga numa turma de prioridade superior nas opções do user.<br> 2. O sistema envia ao user uma notificação de smartphone a informar sobre a abertura da vaga.  |
| *Alternative flows and exceptions* | 1. [Abertura de mais vagas] Na possibilidade de abrir mais do que uma vaga na turma o user deve ser notificado apenas uma vez (quando o nº de vagas disponíveis é 1), de modo a evitar spam. |

### User stories
The user stories should be created as GitHub issues. Therefore, this section will *not* exist in your report, it is here only to explain how you should describe the requirements of the product as **user stories**. 

A user story is a description of desired functionality told from the perspective of the user or customer. A starting template for the description of a user story is 

*As a < user role >, I want < goal > so that < reason >.*

User stories should be created and described as [Issues](https://github.com/LEIC-ES-2021-22/templates/issues) in GitHub with the label "user story". See how to in the video [Creating a Product Backlog of User Stories for Agile Development using GitHub](https://www.youtube.com/watch?v=m8ZxTHSKSKE).

You should name the issue with the text of the user story, and, in the "comments" field, add any relevant notes, the image(s) of the user interface mockup(s) (see below) and the acceptance test scenarios (see below). 

**INVEST in good user stories**. 
You may add more details after, but the shorter and complete, the better. In order to decide if the user story is good, please follow the [INVEST guidelines](https://xp123.com/articles/invest-in-good-stories-and-smart-tasks/).

**User interface mockups**.
After the user story text, you should add a draft of the corresponding user interfaces, a simple mockup or draft, if applicable.

**Acceptance tests**.
For each user story you should write also the acceptance tests (textually in [Gherkin](https://cucumber.io/docs/gherkin/reference/)), i.e., a description of scenarios (situations) that will help to confirm that the system satisfies the requirements addressed by the user story.

**Value and effort**.
At the end, it is good to add a rough indication of the value of the user story to the customers (e.g. [MoSCoW](https://en.wikipedia.org/wiki/MoSCoW_method) method) and the team should add an estimation of the effort to implement it, for example, using t-shirt sizes (XS, S, M, L, XL).



### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module. 
Also provide a short textual description of each class. 

Example:
 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/templates/blob/main/images/DomainModel.png"/>
</p>
