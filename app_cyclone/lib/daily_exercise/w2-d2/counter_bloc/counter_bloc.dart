import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_event.dart';
import 'package:app_cyclone/daily_exercise/w2-d2/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) => emit(CounterState(state.count + 1)));
    on<DecrementEvent>((event, emit) => emit(CounterState(state.count - 1)));
    on<SetToZeroEvent>((event, emit) => emit(CounterState(0)));
  }
}
