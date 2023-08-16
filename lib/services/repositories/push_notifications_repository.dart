import 'package:flutter/foundation.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

abstract class PushNotificationsRepository {
  void initialize(String apiKey);
}

class PushNotificationsRepositoryImpl implements PushNotificationsRepository {
  final OneSignal _onesignal;
  PushNotificationsRepositoryImpl(this._onesignal);

  @override
  void initialize(String apiKey) {
    if (kDebugMode) {
      _onesignal.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    }
    _onesignal.setAppId(apiKey);
  }
}
