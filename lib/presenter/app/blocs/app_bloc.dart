import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.pure()) {
    on<ChangeTabAppEvent>(_changeAppTab);
  }

  void _changeAppTab(
    ChangeTabAppEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(
      tab: event.tab,
    ));
  }
}
