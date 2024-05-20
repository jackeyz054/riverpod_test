import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final int ID;
  final int age;
  final String name;

  UserState({
    required this.ID,
    required this.age,
    required this.name,
  });

  UserState copyWith({int? ID, int? age, String? name}) {
    return UserState(
      ID: ID ?? this.ID,
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(UserState(ID: 10, age: 18, name: "Jack"));

  void updateID(int value) {
    state = state.copyWith(ID: value);
  }

  void updateAge(int value) {
    state = state.copyWith(age: value);
  }

  void updateName(String value) {
    state = state.copyWith(name: value);
  }
}

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier();
});
