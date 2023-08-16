import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:justthelyrics/global.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    Future<void> _internetStatus(var event, Emitter<InternetState> emit) async {
      /* await event.connectivity.onConnectivityChanged
          .listen((connectivityResult) {
        if (connectivityResult == ConnectivityResult.wifi) {
          emit(InternetConnected(ConnectionType.WIFI));
        } else if (connectivityResult == ConnectivityResult.mobile) {
          emit(InternetConnected(ConnectionType.MOBILE));
        } else if (connectivityResult == ConnectivityResult.none) {
          emit(InternetDisconnected());
        }
      }); */
    }

    on<InternetInit>((event, emit) async {
      await _internetStatus(event, emit);
    });

    on<InternetDisconnectedEvent>((event, emit) async {});

    on<InternetStatusRequested>((event, emit) async {
      await _internetStatus(event, emit);
    });
  }
}
