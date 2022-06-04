
## Requirements

### Use case model  

Diagram:
 <p align="center" justify="center">
  <img src="/images/usecases.png"/>
</p>


Description of each use case:

|||
| --- | --- |
| *Name* | Inscrição nas Unidades Curriculares |
| *Actor* |  Utilizador | 
| *Description* | O utilizador tem a opção de poder inscrever-se nas Unidades Curriculares que vai ter nesse ano letivo. |
| *Preconditions* | - O utilizador está autenticado na app da UNI com a sua conta do Sigarra. <br> - O Utilizador tem ETCS disponíveis para se inscrever nas Unidades Curriculares. |
| *Postconditions* | - O utilizador fica inscrito nas Unidades Curriculares. <br> - As ETCS disponíveis do utilizador são atualizadas. <br> - As vagas disponíveis para as Unidades Curriculares são decrementadas. |
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br>4. O utilizador escolhe a opção de "Alteração da Unidade Curricular" <br> 5. O utilizador escolhe as Unidades Curriculares nas quais pretende se inscrever.<br> 6. O utilizador confirma as suas escolhas. |
| *Alternative flows and exceptions* | 1. [Data Expirada] Se a data destinada à inscrição das unidades curriculares expirar, o utilizador não conseguirá fazer a alteração.<br>2. [ETCS Insuficientes] Se o utilizador não tiver ETCS suficientes para se inscrever numa Unidade Curricular, o sistema permite ao utilizador alterar a sua opção para concluir a inscrição. |

|||
| --- | --- |
| *Name* | Alteração das unidades curriculares|
| *Actor* |  Utilizador | 
| *Description* | O utilizador tem a opção de poder alterar as unidades curriculares às quais se inscreveu. |
| *Preconditions* | - O utilizador necessita de estar inscrito na unidade curricular que deseja alterar. |
| *Postconditions* |  - O utilizador, caso deseje, pode desincrever-se à Unidade Curricular. <br> - Os ETCS disponíveis do utilizador são atualizados. <br> - As vagas disponíveis para as Unidades Curriculares são incrementadas.  |
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br>3. O sistema mostra ao utilizador todas as opções disponiveis.<br> 4. O utilizador escolhe a opção de "Alteração da Unidade Curricular".<br> 5. O utilizador escolhe a unidade curricular pretendida.<br> 6. O sistema mostra ao utilizador todas as opções possíveis.<br> 7. O sistema notifica o utilizador caso a acção foi bem sucedida. |
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
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br>4. O utilizador escolhe a opção de "Visualizar Horário" <br> 5. O utilizador visualiza o horário que lhe foi atribuido pelo sistema |
| *Alternative flows and exceptions* |  1. [Horário Inexistente] O Utilizador ainda não realizou a inscrição no Sistema.<br> 2.[Horário Não Atribuido] O sistema ainda não atribui ao utilizador o horário. |

|||
| --- | --- |
| *Name* | Consulta do Horário de cada Unidade Curricular |
| *Actor* |  Utilizador | 
| *Description* | O utilizador pode visualizar o horário de cada Unidade Curricular antes mesmo da sua inscrição  |
| *Preconditions* | - O utilizador está autenticado na app da UNI com a sua conta do Sigarra. |
| *Postconditions* | - O utilizador visualiza o horário de cada unidade curricular. <br> - As ETCS disponíveis do utilizador são atualizadas. <br> - A informação sobre as vagas das Unidades Curriculares são atualizadas. |
| *Normal flow* | 1. O utilizador acessa a app UNI no seu smartphone.<br> 2. O utilizador autentifica-se no sistema com a sua conta do Sigarra. <br> 3. O sistema mostra ao utilizador todas as opções disponiveis.<br>4. O utilizador escolhe a opção de "Consulta do Horário de cada Unidade Curricular" <br> 5. O utilizador escolhe a Unidade Curricular que deseja visualizar.<br> 6. O sistema mostra todas as aulas , quer teóricas , quer prática da unidade currilcar selecionada. |
| *Alternative flows and exceptions* | 1. [Sem Horário] O sistema não tem informação do horário  . |


|||
| --- | --- |
| *Name* | Atribuição de Turmas |
| *Actor* |  Sistema | 
| *Description* | Para atribuir as turmas/horário ao utilizador, tendo em conta a sua escolha, realiza-se um processo de seleção de onde resultam as turmas onde o sistema irá, automaticamente, inscrever o utilizador e atribuir-lhe um horário. |
| *Preconditions* | - O utilizador submeteu a sua escolha de turmas.<br> - Todos os outros estudantes inscritos na mesmas unidades curriculares que o utilizador também submeteram as suas escolhas.<br> - O número de vagas disponíveis em cada unidade curricular é igual ou superior ao número de estudantes que pretendem efetuar inscrição nas turmas de cada unidade curricular. |
| *Postconditions* | - O horário resultante fica disponível para visualização pelo utilizador.<br> - O user fica inscrito em turmas (que podem ou não ser as selecionadas por ele) das suas unidades curriculares. |
| *Normal flow* | 1. O sistema recebe as opções do utilizador e dos restantes estudantes.<br> 2. O sistema procede ao processo de seleção e distribuição das vagas de cada turma pelos estudantes, tendo em conta critérios de triagem e desempate.<br> 3. O sistema increve o utilizador e os restantes estudantes nas turmas. <br> 4. O horário resultante é atualizado/exibido na aplicação.<br> |
| *Alternative flows and exceptions* | 1. [Vaga não disponível] Se o sistema no passo 2 não conseguir atribuir ao utilizador uma vaga numa das turmas selecionadas, o sistema tenta inscrever o utilizador em turmas de menor prioridade (também selecionadas pelo utilizador) . Se mesmo assim, não for possível atribuir vaga ao utilizador, este fica inscrito numa turma que ainda possui vagas disponíveis.|

|||
| --- | --- |
| *Name* | Notificação de vaga numa turma |
| *Actor* |  Sistema | 
| *Description* | Na eventualidade de abertura de uma vaga numa turma, que na escolha do utilizador possui prioridade superior à turma em que está atualmente inscrito, o mesmo é notificado da situação através das notificações do smartphone. |
| *Preconditions* | - O utilizador encontra-se atualmente inscrito numa turma da Unidade curricular em questão.<br> - Uma vaga fica disponível numa turma de prioridade superior nas opções do utilizador. |
| *Postconditions* | - O utilizador é notificado desta abertura de vaga através das notificações do smartphone. |
| *Normal flow* | 1. O sistema é informado da abertura de uma vaga numa turma de prioridade superior nas opções do utilizador.<br> 2. O sistema envia ao utilizador uma notificação de smartphone a informar sobre a abertura da vaga.  |
| *Alternative flows and exceptions* | 1. [Abertura de mais vagas] Na possibilidade de abrir mais do que uma vaga na turma o utilizador deve ser notificado apenas uma vez (quando o nº de vagas disponíveis é 1), de modo a evitar spam. |

### Domain model

To better understand the context of the software system, it is very useful to have a simple UML class diagram with all the key concepts (names, attributes) and relationships involved of the problem domain addressed by your module. 
Also provide a short textual description of each class. 

Example:
 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC04T1/blob/main/images/Domain_Model.png"/>
</p>

