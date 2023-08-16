part of 'thememode_bloc.dart';

@immutable
abstract class ThememodeState {}

class ThememodeInitial extends ThememodeState {}

class CurrentThemeMode extends ThememodeState {
  final ThemeMode themeMode;

  CurrentThemeMode(this.themeMode);
}

class ThemeModeDark extends CurrentThemeMode {
  ThemeModeDark() : super(ThemeMode.dark);
}

class ThemeModeLight extends CurrentThemeMode {
  ThemeModeLight() : super(ThemeMode.light);
}

class ThemeModeSystem extends CurrentThemeMode {
  ThemeModeSystem() : super(ThemeMode.system);
}