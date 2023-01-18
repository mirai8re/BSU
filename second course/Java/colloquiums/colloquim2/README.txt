# colloquim
 
 Task:
Develop the loading screen of game that has the same exact steps.
However some of their implementations may vary: an example could be that while the code for creating and loading the various needed objects was entirely different in both cases. The code behind the deleting and the cleaning of temporary files was almost identical.

 Solving:
1.break down  algorithm into a series of steps or methods;
2.put a series of calls to these methods or steps inside a single template method;
3.he steps may either be abstract or have some default implementation inside the parent class;
4.now to use the algorithm defined by the series of steps;

The client must provide its own subclass.
Implement all abstract steps and if need be overwrite some of the optional ones, but not the template method itself.
We need to do is extract each logic into a separate method we can have the load local data the create objects the download additional files, methods.
Now we can choose to declare all these methods or steps as abstract hence forcing the subclasses created to implement all of them or we can choose to provide some of these methods with a default implementation in the base class.
The next step is to create a specific or concrete class for each loader we need and let it extend the base game loader class. We will have two subclasses.
These classes will share the same implementation of the clean method, but they will provide their own specific implementation for all remaining steps. By doing this each step will contain the actual behavior needed by this specific game.
