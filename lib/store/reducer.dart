import 'package:redux_persist_app/store/actions.dart';
import 'package:redux_persist_app/store/appstate.dart';
import './reducer.dart';

class IncrementCounterAction {}

AppState reducer(AppState state, dynamic action) {
  if (action == Actions.increment) {
    // Increment
    return state.copyWith(counter: state.counter + 1);
  }

  if (action == Actions.decrement) {
    // Increment
    return state.copyWith(counter: state.counter - 1);
  }

  return state;
}
