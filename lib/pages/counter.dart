import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_app/store/appstate.dart';
import '../store/actions.dart' as ReduxAction;

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StoreConnector<AppState, String>(
            converter: (store) => store.state.counter.toString(),
            builder: (context, viewModel) {
              return Text(viewModel, style: TextStyle(fontSize: 24));
            },
          ),
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(ReduxAction.Actions.increment);
            },
            builder: (context, callback) {
              return FlatButton(
                child: Text("Add 1", style: TextStyle(color: Colors.white)),
                color: Colors.blueAccent,
                onPressed: callback,
              );
            },
          ),
          StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(ReduxAction.Actions.decrement);
            },
            builder: (context, callback) {
              return FlatButton(
                child:
                    Text("Subtract 1", style: TextStyle(color: Colors.white)),
                color: Colors.blueAccent,
                onPressed: callback,
              );
            },
          ),
        ],
      ),
    );
  }
}
