abstract class ThemeEvent {}

class ChangeThemeEvent extends ThemeEvent {
  final String name;
  ChangeThemeEvent({required this.name});
  static init() {
    print("init");
  }
}
