## Architecture and Design

Com a nossa aplicação PickUP, pretendemos otimizar o uso de certas funções relativas à inscrição dos alunos nas turmas e unidades curriculares em cada ano letivo.
No projeto, serão implementadas as funções de inscrição nas unidades curriculares, a possibilidade de alteração das unidades curriculares a que o aluno está inscrito, a escolha de turmas, a visualização do horário, assim como, a visualização do horário relativo a cada unidade curricular.

### Logical architecture

Example of _UML package diagram_ showing a _logical view_ of the PickUp App:

 <p align="center" justify="center">
  <img src="/images/Logical_View.png"/>
</p>


In this Logical View we can see several packages required for the architecture of PickUP:

1. Inside PickUP App package:

    - PickUP UI Interface: Package containing all the visual features of the app like Buttons, Menus, Webviews, etc...
    - PickUp Class Atribution Logic: Package containing all the code necessary to assigin classes to the user, it 	contains all the logic and procedures regarding this atribuition.
    - PickUP Curricular Units Logic:Package containing all the code necessary to assigin Curricular Units to the 	user, it contains all the logic and procedures regarding this atribuition.
    - PickUp DataBase schema: Package Refering to the UniApp that takes care of the backend features of the app like 
iteracting with Sigarra's DataBase

2. Inside Sigarra Platform package:
    
    - Sigarra Backend: package containg Sigarra's Databases needed for implementing the app, comunication with Data base is done by UniApp


### Physical architecture
The goal of this subsection is to document the high-level physical structure of the software system (machines, connections, software components installed, and their dependencies) using UML deployment diagrams (Deployment View) or component diagrams (Implementation View), separate or integrated, showing the physical structure of the system.

It should describe also the technologies considered and justify the selections made. Examples of technologies relevant for uni4all are, for example, frameworks for mobile applications (such as Flutter).

Example of _UML deployment diagram_ showing a _deployment view_ of the Eletronic Ticketing System (please notice that, instead of software components, one should represent their physical/executable manifestations for deployment, called artifacts in UML; the diagram should be accompanied by a short description of each node and artifact):

![DeploymentView](https://user-images.githubusercontent.com/9655877/160592491-20e85af9-0758-4e1e-a704-0db1be3ee65d.png)



### Vertical prototype
To help on validating all the architectural, design and technological decisions made, we usually implement a vertical prototype, a thin vertical slice of the system.

In this subsection please describe which feature you have implemented, and how, together with a snapshot of the user interface, if applicable.

At this phase, instead of a complete user story, you can simply implement a feature that demonstrates thay you can use the technology, for example, show a screen with the app credits (name and authors).
