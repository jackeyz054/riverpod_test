
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simple_Data_Provider_buildRunner.g.dart';

@riverpod
class SimpleDataBuildRunner extends _$SimpleDataBuildRunner{
  @override
  int build(){
    return 10;
  }

  void updateState(int value){
    state = value;
  }
}