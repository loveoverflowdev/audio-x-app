import 'app_state.dart';

class ChangeTabAppEvent extends AppEvent {
  final AppTab tab;
  const ChangeTabAppEvent(this.tab);
}

abstract class AppEvent {
  const AppEvent();
}
