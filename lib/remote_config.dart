class Remote {
  static bool? isAds = false;
  static String? adInterId;
  static String? adNativeBannerId;
  static int? nativeFrequency = 1;
  static String? exitMessage;
  static bool exitMessageEnabled = true;
  static bool interstitialInit = false;

  static bool? imagenSearchPage = true;
  static bool? imagenFavoritesPage = true;
  static bool? imagenNotFoundWidget = true;

  static bool? rampageIntersOn = false;
  static bool? toLyricsPageInterOn = false;
  static bool? fromSearchPageToLyricsPageInterOn = false;
  static bool? fromLyrycToAlbumInterOn = false;
  static bool? fromLyrycToTopAlbumsPageInterOn = false;

  static bool? fromTopAlbumItemToAlbumInterOn = false;
  static bool? fromTitleItemToLyricInterOn = false;
  static bool? fromFavoriteItemToLyricInterOn = false;
  static int? interFreq = 1;
  static int count = 1;

  static int rateMinDays = 4;
  static int rateMinLaunches = 4;
  static int rateRemindDays = 4;
  static int rateRemindLaunches = 4;
  static bool openAdEnabled = true;
  static String adOpenAdId = "";

  static int adNativeFreqInList = 6;

  add() {
    count++;
  }
}
