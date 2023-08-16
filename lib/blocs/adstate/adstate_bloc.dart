/* import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:justthelyrics/ad_state.dart';
import 'package:meta/meta.dart';

part 'adstate_event.dart';
part 'adstate_state.dart';

class AdstateBloc extends Bloc<AdstateEvent, AdstateState> {
  AdstateBloc(AdState adState) : super(AdstateInitial()) {
    int _interstitialLoadAttempts = 0;
    int maxFailedLoadAttempts = 3;

    Future<void> _getInterstitial(Emitter<AdstateState> emit) async {
      try {
        adState.initialization.then((status) {
          InterstitialAd.load(
              adUnitId: adState.insterstitalAdUnitId,
              request: const AdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(
                onAdLoaded: (InterstitialAd ad) {
                  _interstitialLoadAttempts = 0;
                  emit(InterstitialLoaded(ad));
                },
                onAdFailedToLoad: (LoadAdError error) {
                  _interstitialLoadAttempts += 1;
                  if (_interstitialLoadAttempts <= maxFailedLoadAttempts) {
                    on<InterstitialInitialized>((event, emit) {});
                  } else {
                    emit(InterstitialFailedToLoad(error.toString()));
                  }
                },
              ));
        });
      } catch (e) {
        emit(AdstateError(e.toString()));
      }
    }

    on<InterstitialInitialized>((event, emit) => _getInterstitial(emit));
  }
}
 */