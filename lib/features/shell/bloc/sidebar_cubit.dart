import 'package:bloc/bloc.dart';

class SidebarCubit extends Cubit<bool> {
  SidebarCubit() : super(true);

  void toggleSidebar() => emit(!state);
}
