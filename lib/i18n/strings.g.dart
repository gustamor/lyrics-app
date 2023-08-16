
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 86 (43.0 per locale)
 *
 * Built on 2023-05-03 at 08:50 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	es, // 'es'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsEs _translationsEs = _StringsEs.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.es: return _translationsEs;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.es: return _StringsEs.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.es: return 'es';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.es: return const Locale.fromSubtags(languageCode: 'es');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'es': return AppLocale.es;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get exit => 'Exit';
	String get rateapp => 'Rate this app';
	String get rateappgoogleplay => 'Rate this app on Google Play';
	String get internetdisconnected => 'Internet disconnected';
	String get stayhere => 'Stay here';
	String get shareByEmail => 'Share by email';
	String get shareApp => 'Share app with others';
	String get about => 'About';
	String get settings => 'Settings';
	String get favorites => 'Favorites';
	String abouttext({required Object devname, required Object devemail}) => 'This app is developed by $devname.\n\nThe lyrics are provided by Lyrics.ovh(TM). The albums info is provided by Last.fm(TM). We are not affiliated with Lyrics.ovh(TM) or Last.fm(TM) and is only for educational purposes.\n\nThe images are downloaded with YAY permission (www.yayimages.com) and their copyright owns who took the image.\n\n$devemail';
	String get deleteallConfirmatiom => 'Should I remove all your items in the list?';
	String get deleteOneConfirmatiom => 'Should I remove such lyrics from your favorites list?';
	String get remove => 'Remove';
	String get share => 'Share';
	String get confirmation => 'Confirmation';
	String get yesPlease => 'Yes, please';
	String get yes => 'Yes';
	String get nothanks => 'No, thank you';
	String get lyricnotfound => 'The song`s lyrics are missing';
	String get exitConfirmation => 'Are you sure you want to exit?';
	String get historyOfAlbum => 'History of album';
	String get topalbums => 'Top albums of ';
	String get topalbumsartist => 'Top albums of the artist';
	String get bestLyrics => 'The Best Way to Get the Lyrics';
	String get copyToClipboard => 'Copied to the clipboard';
	String get itsnice => 'It\'s nice like this';
	String get exitMessage => 'Rate this app on Google Play';
	String get wantexit => 'Do you want to exit?';
	String get searchSong => 'Type the song you want the lyrics';
	String get darkmode => 'Mode';
	String get toggleonoff => 'Toggle off/on';
	String get ratingBodyText => 'Hey, thanks for using my app! If you could take a quick second to rate it in the Google Play store, that would be super helpful. Ratings help other users decide whether or not to download an app, so your feedback is really important. Thanks again!';
	String get rateButtonText => 'I want to rate it now';
	String get noButtonText => 'Thanks, don\'t ask me again';
	String get laterButtonText => 'May be I\'ll do it later';
	String get ratethisapp => 'Conversation';
	String get preferedstored => 'Preferred stored lyrics';
	String get preferredstoredsubtitle => 'I prefer to read favorite lyrics stored on the device.';
	String get morelyricsat => 'More lyrics at *Just the lyrics* for Android';
}

// Path: <root>
class _StringsEs implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEs.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsEs _root = this; // ignore: unused_field

	// Translations
	@override String get search => 'Búsqueda';
	@override String get ok => 'Ok';
	@override String get cancel => 'Cancel';
	@override String get exit => 'Salir';
	@override String get rateapp => 'Valora esta app';
	@override String get rateappgoogleplay => 'Valora esta app en Google Play';
	@override String get internetdisconnected => 'Internet sin conexión';
	@override String get stayhere => 'Quedarme aquí';
	@override String get shareByEmail => 'Compartir por correo electrónico';
	@override String get shareApp => 'Compartir la app';
	@override String get about => 'Acerca';
	@override String get settings => 'Preferencias';
	@override String get favorites => 'Favoritas';
	@override String abouttext({required Object devname, required Object devemail}) => 'Esta app la desarrolla $devname.\n\nLas letras las provee de Lyrics.ovh(TM). La información de los álbumes es proveida de Last.fm(TM). No estamos afiliados con estas marcas y es solo para uso justo\nLas imágenes tienen permiso YAY(www.yayimages.com) y su copyright pertenece a quien creó la imagen.\n\n$devemail';
	@override String get deleteallConfirmatiom => '¿Deseas quitar todos los favoritos?';
	@override String get deleteOneConfirmatiom => '¿Deseas quitar la canción de la lista?';
	@override String get remove => 'Eliminar';
	@override String get share => 'Compartir';
	@override String get confirmation => 'CONFIRMACIÓN';
	@override String get yesPlease => 'Sí, por favor';
	@override String get yes => 'Sí';
	@override String get nothanks => 'No, gracias';
	@override String get lyricnotfound => 'La letra no se encuentra';
	@override String get exitConfirmation => '¿Seguro que quieres salir?';
	@override String get historyOfAlbum => 'Historia del álbum';
	@override String get topalbums => 'Top álbums de ';
	@override String get topalbumsartist => 'Top álbums del artista';
	@override String get bestLyrics => 'La mejor app para conseguir las letras ';
	@override String get copyToClipboard => 'Copiado al portapapeles';
	@override String get itsnice => 'Me gusta este tamaño';
	@override String get exitMessage => 'Valora esta app en Google Play';
	@override String get wantexit => '¿Quieres salir?';
	@override String get searchSong => 'Escribe la canción para las letras';
	@override String get darkmode => 'Modo';
	@override String get toggleonoff => 'Cambia claro/oscuro';
	@override String get ratingBodyText => '¡Gracias por usar esta aplicación! Si quieres darnos un segundo para calificarla en la tienda de Google Play, sería de gran ayuda para nostros y para otros usuarios. Las valoraciones posicionan mejor la app en el buscador y ayuda a otros usuarios cuando deciden si se descargan o no una aplicación. Así que tu opinión es importante de verdad. Gracias otra vez.';
	@override String get rateButtonText => 'Quiero valorarla ahora';
	@override String get noButtonText => 'No vuelvas a preguntarme';
	@override String get laterButtonText => 'Tal vez lo haga después';
	@override String get ratethisapp => 'Valora esta app';
	@override String get preferedstored => 'Preferencia por local';
	@override String get preferredstoredsubtitle => 'Prefiero leer las letras favoritas almacenadas en el dispositivo (no usa Internet)';
	@override String get morelyricsat => 'Más letras en la aplicación *Las Letras de Canciones* para Android';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'search': 'Search',
			'ok': 'OK',
			'cancel': 'Cancel',
			'exit': 'Exit',
			'rateapp': 'Rate this app',
			'rateappgoogleplay': 'Rate this app on Google Play',
			'internetdisconnected': 'Internet disconnected',
			'stayhere': 'Stay here',
			'shareByEmail': 'Share by email',
			'shareApp': 'Share app with others',
			'about': 'About',
			'settings': 'Settings',
			'favorites': 'Favorites',
			'abouttext': ({required Object devname, required Object devemail}) => 'This app is developed by $devname.\n\nThe lyrics are provided by Lyrics.ovh(TM). The albums info is provided by Last.fm(TM). We are not affiliated with Lyrics.ovh(TM) or Last.fm(TM) and is only for educational purposes.\n\nThe images are downloaded with YAY permission (www.yayimages.com) and their copyright owns who took the image.\n\n$devemail',
			'deleteallConfirmatiom': 'Should I remove all your items in the list?',
			'deleteOneConfirmatiom': 'Should I remove such lyrics from your favorites list?',
			'remove': 'Remove',
			'share': 'Share',
			'confirmation': 'Confirmation',
			'yesPlease': 'Yes, please',
			'yes': 'Yes',
			'nothanks': 'No, thank you',
			'lyricnotfound': 'The song`s lyrics are missing',
			'exitConfirmation': 'Are you sure you want to exit?',
			'historyOfAlbum': 'History of album',
			'topalbums': 'Top albums of ',
			'topalbumsartist': 'Top albums of the artist',
			'bestLyrics': 'The Best Way to Get the Lyrics',
			'copyToClipboard': 'Copied to the clipboard',
			'itsnice': 'It\'s nice like this',
			'exitMessage': 'Rate this app on Google Play',
			'wantexit': 'Do you want to exit?',
			'searchSong': 'Type the song you want the lyrics',
			'darkmode': 'Mode',
			'toggleonoff': 'Toggle off/on',
			'ratingBodyText': 'Hey, thanks for using my app! If you could take a quick second to rate it in the Google Play store, that would be super helpful. Ratings help other users decide whether or not to download an app, so your feedback is really important. Thanks again!',
			'rateButtonText': 'I want to rate it now',
			'noButtonText': 'Thanks, don\'t ask me again',
			'laterButtonText': 'May be I\'ll do it later',
			'ratethisapp': 'Conversation',
			'preferedstored': 'Preferred stored lyrics',
			'preferredstoredsubtitle': 'I prefer to read favorite lyrics stored on the device.',
			'morelyricsat': 'More lyrics at *Just the lyrics* for Android',
		};
	}
}

extension on _StringsEs {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'search': 'Búsqueda',
			'ok': 'Ok',
			'cancel': 'Cancel',
			'exit': 'Salir',
			'rateapp': 'Valora esta app',
			'rateappgoogleplay': 'Valora esta app en Google Play',
			'internetdisconnected': 'Internet sin conexión',
			'stayhere': 'Quedarme aquí',
			'shareByEmail': 'Compartir por correo electrónico',
			'shareApp': 'Compartir la app',
			'about': 'Acerca',
			'settings': 'Preferencias',
			'favorites': 'Favoritas',
			'abouttext': ({required Object devname, required Object devemail}) => 'Esta app la desarrolla $devname.\n\nLas letras las provee de Lyrics.ovh(TM). La información de los álbumes es proveida de Last.fm(TM). No estamos afiliados con estas marcas y es solo para uso justo\nLas imágenes tienen permiso YAY(www.yayimages.com) y su copyright pertenece a quien creó la imagen.\n\n$devemail',
			'deleteallConfirmatiom': '¿Deseas quitar todos los favoritos?',
			'deleteOneConfirmatiom': '¿Deseas quitar la canción de la lista?',
			'remove': 'Eliminar',
			'share': 'Compartir',
			'confirmation': 'CONFIRMACIÓN',
			'yesPlease': 'Sí, por favor',
			'yes': 'Sí',
			'nothanks': 'No, gracias',
			'lyricnotfound': 'La letra no se encuentra',
			'exitConfirmation': '¿Seguro que quieres salir?',
			'historyOfAlbum': 'Historia del álbum',
			'topalbums': 'Top álbums de ',
			'topalbumsartist': 'Top álbums del artista',
			'bestLyrics': 'La mejor app para conseguir las letras ',
			'copyToClipboard': 'Copiado al portapapeles',
			'itsnice': 'Me gusta este tamaño',
			'exitMessage': 'Valora esta app en Google Play',
			'wantexit': '¿Quieres salir?',
			'searchSong': 'Escribe la canción para las letras',
			'darkmode': 'Modo',
			'toggleonoff': 'Cambia claro/oscuro',
			'ratingBodyText': '¡Gracias por usar esta aplicación! Si quieres darnos un segundo para calificarla en la tienda de Google Play, sería de gran ayuda para nostros y para otros usuarios. Las valoraciones posicionan mejor la app en el buscador y ayuda a otros usuarios cuando deciden si se descargan o no una aplicación. Así que tu opinión es importante de verdad. Gracias otra vez.',
			'rateButtonText': 'Quiero valorarla ahora',
			'noButtonText': 'No vuelvas a preguntarme',
			'laterButtonText': 'Tal vez lo haga después',
			'ratethisapp': 'Valora esta app',
			'preferedstored': 'Preferencia por local',
			'preferredstoredsubtitle': 'Prefiero leer las letras favoritas almacenadas en el dispositivo (no usa Internet)',
			'morelyricsat': 'Más letras en la aplicación *Las Letras de Canciones* para Android',
		};
	}
}
