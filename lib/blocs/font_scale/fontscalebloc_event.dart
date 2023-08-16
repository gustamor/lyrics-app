part of 'fontscalebloc_bloc.dart';

@immutable
abstract class FontScaleBlocEvent {}

class FontScaleChanged extends FontScaleBlocEvent {
  final double fontScale;

  FontScaleChanged({required this.fontScale});
}
