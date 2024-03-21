abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  static init() {
    print("init");
  }
}
