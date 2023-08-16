
part of 'thememode_bloc.dart';

@immutable
abstract class ThememodeEvent {}

class ThememodeEventInit extends ThememodeEvent {
  final ThemeMode mode;
  
  ThememodeEventInit(this.mode);
}

class ThemeModeChanged extends ThememodeEvent {
  final ThemeMode mode;
  
  ThemeModeChanged(this.mode);

}

class ThemeModeLightPressed extends ThememodeEvent {}
class ThemeModeDarkPressed extends ThememodeEvent {}
class CurrentThemeRequested extends ThememodeEvent {}