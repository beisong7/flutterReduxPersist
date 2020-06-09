import 'package:flutter/material.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_app/pages/counter.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_app/store/appstate.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'store/reducer.dart';

void main() async {
  final persistor = Persistor<AppState>(
      storage: FlutterStorage(),
      serializer: JsonSerializer<AppState>(AppState.fromJson));

  WidgetsFlutterBinding.ensureInitialized(); //prevents error from initialState
  final initialState = await persistor.load();

  final store = Store<AppState>(reducer,
      initialState: initialState ?? AppState(),
      middleware: [persistor.createMiddleware()]);

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key key, this.store}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Redux State App"),
          ),
          body: Counter(),
        ),
      ),
    );
  }
}
