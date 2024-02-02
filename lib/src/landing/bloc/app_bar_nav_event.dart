part of 'app_bar_nav_bloc.dart';

@immutable
abstract class AppBarNavEvent {}

class InitializeLandingAppBar extends AppBarNavEvent {}

class RegisterAppBarNav extends AppBarNavEvent {
  RegisterAppBarNav({
    required this.icon,
    required this.content,
    this.index = 0,
    this.label,
  });

  final Widget icon;
  final Widget? label;
  final Widget content;
  final int index;
}
