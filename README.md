
# Motivation
Bloc is awsome, but its have to many boilerplate code.
So this package will help you pass the terious time by generate State, Event and Event the bloC for you.

##### Example
```dart
@fastBloc
abstract class GetTrivia{
  late Failure errorState;
  late List<Trivia> successState;

  GetListTriviaUseCase GetTriviaDataEvent(int value);
  DeleteTriviaUseCase DeleteTriviaDataEvent(int value);
}
```
### Guide
- ***Step 1***: create the abtract class and put the @fastBloc annotaion. You can get it from package(fast_bloc_annotations)

- ***Step 2***: declare 2 return types of the State. You need to change the Data Type but not the name.

- ***Step 3***: Create the function include:

        - GetListTriviaUseCase: name of the usecase(or any function)
        - GetTriviaDataEvent: name of the event 
        - int value: Event params

- ***Step 4***: To run the code generation, you need to add the build_runner in your pubspec.yaml and then run:
   ```dart
        dart run build_runner build
   ```
-***Step 5***: enjoy the result
### Injectable intergation
if you use https://pub.dev/packages/injectable in for app:
Try to add annotaion:
```dart
        @FastBloc(useInjectable: true)
   ```

## Want more detail, visit my example project:
https://github.com/ndkai/Bloc-Generator/tree/main/example


Happy coding <3


