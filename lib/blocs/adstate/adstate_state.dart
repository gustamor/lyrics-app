/* part of 'adstate_bloc.dart';

@immutable
abstract class AdstateState {}

class AdstateInitial extends AdstateState {}

class InterstitialLoaded extends AdstateState {
  final InterstitialAd interstitialAd;

  InterstitialLoaded(this.interstitialAd);
}

class InterstitialFailedToLoad extends AdstateState {
  final String error;

  InterstitialFailedToLoad(this.error);
}

class AdstateError extends AdstateState {
  final String error;

  AdstateError(this.error);
} */