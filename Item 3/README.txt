#Item 3 content

An Eclipse/Maven project that fulfils the requirements in project “Acme Rookies”.
The project must include a functional test suite with at least one positive test case
and one negative test case per use case (including the use cases in the previous ver-
sion of the project). Every test case must be documented in the code using the fol-
lowing information: 
a) requirements tested; 
b) in the case of negative tests, the business rule that is intended to be broken;
c) analysis of sentence coverage;
d) analysis of data coverage.

# Comments

Se ha considerado que se al solicitar un procedimiento de notificacion de renombramiento del sistema, tiene que existir implicitamente un procedimiento de renombramiento. Para ello se ha creado un Rebranding o renombramiento que cambia el nombre del sistema tanto en la aplicacion como en todas las ocurrencias del archivo de terminos y condiciones de uso, y al realizar ese rebranding, automaticamente se envia un mensaje al notification box de todos los usuarios del sistema menos al administrador en cuestion, notificando que se ha llevado un proceso de renombramiento del sistema.

A colación de la propuesta inmediatamente anterior, se diseña un procedimiento que solo sirva para la notificación del sistema, ya que al comentarle dicho procedimiento a Inma Hernández en la revisión le pareció interesante, pero no suficiente para cubrir la necesidad de notificar el cambio de nombre del sistema, por lo que en "Notify rebranding" dentro de "System actions" podemos encontrar que se lleva a cabo una notificación a todos los usuarios del sistema de que se ha producido un rebranding. Si esta notificación se lleva a cabo, el procedimiento inmediatamente anterior no se podrá ejecutar más y viceversa. Es decir, entre el proceso de Rebranding y de Notify rebranding, solo se pueden ejecutar una vez entre los dos, o se ejecuta uno u otro, pero solo una vez.  
