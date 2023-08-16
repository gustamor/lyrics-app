import 'package:justthelyrics/global.dart';

class ImagesUri {
  final Map<String, String> kSettingsIcon = {
    'dark': 'assets/icons/settingswhite.svg',
    'light': 'assets/icons/settingsblack.svg',
  };
  final Map<String, String> kDeleteAllIcon = {
    'dark': 'assets/icons/trashwhite.svg',
    'light': 'assets/icons/trashblack.svg',
  };
  final Map<String, String> kBackArrowIcon = {
    'dark': 'assets/icons/backarrowwhite.svg',
    'light': 'assets/icons/backarrowblack.svg',
  };

  final kHeart = 'assets/icons/heart.svg';

  int icon;
  ImagesUri(
    this.icon,
  );

  String getIcon() {
    late String _iconUri = "";
    if (icon == TheIcon().settings) {
      return 'assets/icons/preferenceswhite.svg';
    } else if (icon == TheIcon().deleteAll) {
      return 'assets/icons/heartbroken.svg';
    } else if (icon == TheIcon.backarrow) {
      return 'assets/icons/backarrow.svg';
    } else if (icon == TheIcon.heartLine) {
      return 'assets/icons/heart.svg';
    } else if (icon == TheIcon.heartSolid) {
      return 'assets/icons/heartSolid.svg';
    } else if (icon == TheIcon.menuSharp) {
      return 'assets/icons/menusharp.svg';
    } else if (icon == TheIcon.home) {
      return 'assets/icons/home.svg';
    } else if (icon == TheIcon.close) {
      return 'assets/icons/close.svg';
    }else if (icon == TheIcon.copy) {
      return 'assets/icons/copy.svg';
    }
    return _iconUri;
  }
}
