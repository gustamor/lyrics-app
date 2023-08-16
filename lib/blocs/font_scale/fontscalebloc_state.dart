part of 'fontscalebloc_bloc.dart';

@immutable
abstract class FontScaleBlocState {}

class FontScaleInitial extends FontScaleBlocState {}

class FontScaleUpdated extends FontScaleBlocState {
  final double fontScale;

  FontScaleUpdated(this.fontScale);
}

class FontScaleBlocError extends FontScaleBlocState {
  final String error;

  FontScaleBlocError(this.error);
}
