## Architecture and Design

Com a nossa aplicação PickUP, pretendemos otimizar o uso de certas funções relativas à inscrição dos alunos nas turmas e unidades curriculares em cada ano letivo.
No projeto, serão implementadas as funções de inscrição nas unidades curriculares, a possibilidade de alteração das unidades curriculares a que o aluno está inscrito, a escolha de turmas, a visualização do horário, assim como, a visualização do horário relativo a cada unidade curricular.

### Logical architecture

Logical View Diagram:

 <p align="center" justify="center">
  <img src="/images/Logical_View.png"/>
</p>


In this Logical View we can see several packages required for the architecture of PickUP:

1. Inside PickUP App package:

    - PickUP UI Interface: Package containing all the visual features of the app like Buttons, Menus, Webviews, etc...
    - PickUp Class Atribution Logic: Package containing all the code necessary to assigin classes to the user, it 	contains all the logic and procedures regarding this atribuition.
    - PickUP Curricular Units Logic: Package containing all the code necessary to assigin Curricular Units to the 	user, it contains all the logic and procedures regarding this atribuition.
    - PickUp DataBase schema: Package that takes care of the backend features of the app like 
iteracting with Sigarra's DataBase

2. Inside Sigarra Platform package:
    
    - Sigarra Backend: package containg Sigarra's Databases needed for implementing the app, comunication with Data base is done by UniApp


### Physical architecture

Deployment View Diagram:

 <p align="center" justify="center">
  <img src="/images/physical architecture.png"/>
</p>

In this Deployment View we can see machines, connections, software components installed, and their dependencies.

1. Inside Student Machine (Mobile Phone):

    - Application: The student can download and use the PickUp App in his mobile phone.

2. Inside PickUp Server Machine:
    
    - PickUp UI Interface: Represents all the visual features of the app like Buttons, Menus, etc... 
    - Application Logical Services: Contains the code and procedures to all the functionalities that the student can use like, see schedule, enroll in new curricular units, etc...
    
3. Inside Sigarra Machine:

    - Sigarra Backend: Contains Sigarra's Databases needed for implementing the app and display proper information about the student that is logged into is account. The communication with the database is made by UniApp.


### Vertical prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe which feature you have implemented, and how, together with a snapshot of the user interface, if applicable.

At this phase, instead of a complete user story, you can simply implement a feature that demonstrates thay you can use the technology, for example, show a screen with the app credits (name and authors).

 <p align="center" justify="center">
  <img src="/images/Vertical_prototype_Text.png"/>
  <img src="/images/Vertical_prototype_button.png"/>
  <img src="/images/Vertical_prototype_webview.png"/>
</p>

