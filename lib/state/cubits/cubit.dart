import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setup/state/app_state.dart';

class CounterBloc extends Cubit<AppState> {
  CounterBloc() : super(AppState.init());

  void onCounterIncrementPressed() => emit(state.copyWith(counter: state.counter + 1));
  void onCounterDecrementPressed() => emit(state.copyWith(counter: state.counter - 1));
}
