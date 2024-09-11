import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<Map<String, String>> {
  DataCubit() : super({});

  void updateData(String key, String value) {
    state[key] = value;
    emit(Map.from(state));
  }
}
