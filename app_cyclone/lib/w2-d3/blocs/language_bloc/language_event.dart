abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String locale;

  ChangeLanguage(this.locale);
}
