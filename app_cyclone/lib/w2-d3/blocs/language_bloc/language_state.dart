class LanguageState {
  final String locale;

  LanguageState({required this.locale});

  factory LanguageState.initial() {
    return LanguageState(locale: "en");
  }
  factory LanguageState.english() {
    return LanguageState(locale: "en");
  }
  factory LanguageState.vietnam() {
    return LanguageState(locale: "vi");
  }
}
