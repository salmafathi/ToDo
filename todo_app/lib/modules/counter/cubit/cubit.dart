import 'package:bloc/bloc.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(FirstState());
  static AppCubit getBloc (context) => BlocProvider.of(context);

  int counter = 0;
  void plusCounter() {
    counter++ ;
    emit(SecondState(counter));
  }
}
