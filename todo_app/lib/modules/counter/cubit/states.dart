abstract class AppStates {}

class FirstState extends AppStates {}

class SecondState extends AppStates {

  late int counter ;
  SecondState(this.counter);
}