import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum DesktopLayoutType { line, column }

//TODO: mudar a forma de salvar essa preferencia para o drift

class LayoutPreferenceCubit extends Cubit<DesktopLayoutType> {
  final FlutterSecureStorage _storage;

  LayoutPreferenceCubit(this._storage) : super(DesktopLayoutType.line);

  Future<void> loadLayout() async {
    final savedValue = await _storage.read(key: 'desktop_layout');

    final layout = DesktopLayoutType.values.firstWhere(
      (value) => value.name == savedValue,
      orElse: () => DesktopLayoutType.line,
    );

    emit(layout);
  }

  Future<void> setLayout(DesktopLayoutType layout) async {
    await _storage.write(key: 'desktop_layout', value: layout.name);

    emit(layout);
  }
}
