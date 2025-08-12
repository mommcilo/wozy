// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Wozy';

  @override
  String get onBoardingText => '🚗 Dobro došli u aplikaciju koja vam omogućava da na jednom mestu vodite evidenciju i primate obaveštenja za sva svoja vozila.\\n\\n📅 Podesite podsetnike za registraciju, servise, zamenu guma, proveru ulja — i još mnogo toga. Sami birate koje vas notifikacije zanimaju.\\n\\n💰 Pratite troškove i održavajte vozila bez stresa.\\n\\n📋 Vaš virtuelni vozni park.';

  @override
  String get addVehicle => 'Dodaj vozilo';
}
