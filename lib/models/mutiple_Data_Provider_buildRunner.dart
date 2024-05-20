import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mutiple_Data_Provider_buildRunner.g.dart';

@riverpod
class UserStateNotifier extends _$UserStateNotifier {
  @override
  UserStateBuildRunner build() {
    return UserStateBuildRunner(iD: 123, age: 15, name: "ak");
  }

  void updateID(int idValue) {
    state = state.copyWith(iD: idValue);
  }

  void updateAge(int ageValue) {
    state = state.copyWith(age: ageValue);
  }

  void updateName(String nameValue) {
    state = state.copyWith(name: nameValue);
  }

  // 添加一個方法來同時更新多個變量
  void updateAll({int? iD, int? age, String? name}) {
    state = state.copyWith(iD: iD, age: age, name: name);
  }
}

class UserStateBuildRunner {
  final int? iD;
  final int? age;
  final String? name;

  UserStateBuildRunner({
    this.iD,
    this.age,
    this.name,
  });

  UserStateBuildRunner copyWith({int? iD, int? age, String? name}) {
    return UserStateBuildRunner(
      iD: iD ?? this.iD,
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }
}
