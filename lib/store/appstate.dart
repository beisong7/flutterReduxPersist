class AppState {
  final int counter;

  AppState({this.counter});

  AppState copyWith({int counter}) =>
      AppState(counter: counter ?? this.counter);

  static AppState fromJson(dynamic json) {
    if (json == null) {
      return new AppState(counter: 0);
    }

    return AppState(counter: json["counter"] as int);
  }

  dynamic toJson() => {'counter': counter};
}
